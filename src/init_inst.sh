#!/usr/bin/env bash

common() {
  (basic)
  (config_sudo)
  (clone_config)

  (docker)
  (anaconda)
  (gtest)
  (awscli)

  (config_keys)
  (config_git)
  (config_terminal)
  (config_emacs)
  (config_vim)
  (config_conda)
}

ariseus_driver() {
  (update)
  (apt_cuda)
  (driver)

  (config_sys)
  (config_time)
}

ariseus() {
  (common)

  (apt_desktop)
  (sublime)

  (config_sublime)
  (config_vagrant)
  (gnome_themes)

  local app
  while read -r app; do
    ($app)
  done <"$EVA_ROOT"/optional_apps.txt
}

desktop() {
  (common)

  (apt_desktop)
  (sublime)

  (config_sublime)
  (gnome_themes)

  local app
  while read -r app; do
    ($app)
  done <"$EVA_ROOT"/optional_apps.txt
}

server() {
  (common)

  (config_shadowsocks_server)
}

wsl() {
  sudo apt remove -y --purge openssh-server
  (common)

  (config_wsl)
  (config_server)
}

vagrant() {
  (common)
  (config_server)
}
