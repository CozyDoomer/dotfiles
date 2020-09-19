import os
import re
import time
import json
import argparse
import subprocess


def parse_cli_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'wallpaper_path',
        nargs='?',
        type=str,
        default='~/.config/nitrogen/color_prisms.png',
        help='path to a wallpaper image'
    )
    args = parser.parse_args()
    return args


def set_colors_env_var(colors_config):
    colors_dict = colors_config['colors']
    for name, hex_color in colors_dict.items():
        os.environ[name] = hex_color

    os.environ['RAM_LABEL'] = '%{u' + list(colors_dict.values())[4] + '}%{F' + list(colors_dict.values())[4] + '}RAM%{F-}  %gb_used:4%/%gb_total:4%%{u-}'
    os.environ['CPU_LABEL'] = '%{u' + list(colors_dict.values())[6] + '}%{F' + list(colors_dict.values())[6] + '}CPU%{F-}  %percentage:3% %%{u-}'
    os.environ['TEMP_LABEL'] = '%{u' + list(colors_dict.values())[8] + '}%{F' + list(colors_dict.values())[8] + '}TEMP%{F-}  %temperature-c:3% °C%{u-}'
    os.environ['TEMP_LABEL_WARN'] = '%{u' + list(colors_dict.values())[8] + '}%{F' + list(colors_dict.values())[8] + '}TEMP%{F-}  %{F#f00}%temperature-c:3% °C%{F-}%{u-}'


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
            subprocess.Popen(f'MONITOR={monitor_name} polybar --reload main_bar', stdout=subprocess.PIPE, shell=True)
        else:
            subprocess.Popen(f'MONITOR={monitor_name} polybar --reload secondary_bar', stdout=subprocess.PIPE, shell=True)


def launch_rice(wallpaper_path, main_monitor_name='DVI-D-0'):
    # launch pywal to set colors and have access to them in cache
    os.system(f'wal -i {wallpaper_path}')

    # set colors in env
    home = os.path.expanduser('~')
    colors_config = json.load(open(f'{home}/.cache/wal/colors.json'))
    set_colors_env_var(colors_config)

    # restart_polybar polybar
    restart_polybar(main_monitor_name)


def main():
    args = parse_cli_arguments()
    launch_rice(args.wallpaper_path)


if __name__ == '__main__':
    main()
