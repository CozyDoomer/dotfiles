import os
import re
import json
import argparse
import subprocess

from wallpaper import wp_path


def set_colors_env_var(colors_config):
    colors_dict = colors_config['colors']
    for name, hex_color in colors_dict.items():
        os.environ[name] = hex_color

    color4 = list(colors_dict.values())[4]
    color6 = list(colors_dict.values())[6]
    color8 = list(colors_dict.values())[8]

    os.environ['RAM_LABEL'] = '%{u' + color4 + '}%{+u}%{F' + color4 + '}RAM%{F-}  %gb_used:4%/%gb_total:4%%{u-}'
    os.environ['CPU_LABEL'] = '%{u' + color6 + '}%{+u}%{F' + color6 + '}CPU%{F-}  %percentage:3% %%{u-}'
    os.environ['TEMP_LABEL'] = '%{u' + color8 + '}%{+u}%{F' + color8 + '}TEMP%{F-}  %temperature-c:3% °C%{u-}'
    os.environ['TEMP_LABEL_WARN'] = (
        '%{u' + color8 + '}%{+u}%{F' + color8 + '}TEMP%{F-}  %{F#f00}%temperature-c:3% °C%{F-}%{u-}'
    )


def restart_polybar(main_monitor_name):
    # kill polybar process if it's already running
    os.system('pkill polybar')

    # query monitor names by using subprocess to call xrandr
    monitor_names = []
    proc = subprocess.Popen(['xrandr', '--query'], stdout=subprocess.PIPE)
    out, err = proc.communicate()

    xrandr_str = out.decode('ascii')
    for line in xrandr_str.split('\n'):
        if re.search(' connected ', line):
            monitor_names.append(line.split()[0])

    # start polybar main_bar or secondary_bar depending on screen
    for monitor_name in monitor_names:
        print(monitor_name)
        if monitor_name == main_monitor_name:
            subprocess.Popen(
                f'MONITOR={monitor_name} polybar --reload main_bar', stdout=subprocess.PIPE, shell=True
            )
        else:
            subprocess.Popen(
                f'MONITOR={monitor_name} polybar --reload secondary_bar', stdout=subprocess.PIPE, shell=True
            )


def launch_rice(wallpaper_path, main_monitor_name='DP-4'):
    home = os.path.expanduser('~')

    # find wallpaper path in case partial filename / no extension is given
    wallpaper_path = wallpaper_path.replace('~', home)
    partial_wallpaper_name = os.path.basename(wallpaper_path)
    wallpaper_dir = os.path.dirname(wallpaper_path)
    for wallpaper_name in os.listdir(wallpaper_dir):
        if partial_wallpaper_name in wallpaper_name:
            wallpaper_path = f'{wallpaper_dir}/{wallpaper_name}'
            break

    # launch pywal to set colors and have access to them in cache
    os.system(f'wal -i {wallpaper_path} -n')

    # set colors in env
    colors_config = json.load(open(f'{home}/.cache/wal/colors.json'))
    set_colors_env_var(colors_config)

    # restart_polybar polybar
    restart_polybar(main_monitor_name)

    # Call 'feh' to set the wallpaper.
    os.system(f'/usr/bin/feh --bg-scale --no-xinerama {wallpaper_path}')


def parse_cli_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'wallpaper_path',
        nargs='?',
        type=str,
        default=wp_path,
        help='path to a wallpaper image'
    )
    args = parser.parse_args()
    return args


def main():
    args = parse_cli_arguments()
    launch_rice(args.wallpaper_path)


if __name__ == '__main__':
    main()
