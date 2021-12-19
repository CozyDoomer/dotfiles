# setup for manjaro

- first make sure monitor resolution, monitor order etc. is correct -> fix in `nvidia-settings`
  - save output config to "/etc/X11/mhwd.d/nvidia.conf"

- run `setup_most_things.sh`

- run `setup_editor.sh`
  - run `lvim` and use `:PackerSync`
- run `replace_lvim_config.sh`
