#!/bin/bash

OS="$(uname)"

clone_config() {
	rm -rf $HOME/.config
	git clone -depth=1 https://github.com/pmnmq/.config $HOME/.config
}

install_rust_toolchain() {
	echo "Install Rust ToolChain"
	export RUSTUP_DIST_SERVER="https://rsproxy.cn"
	export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
	curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh

	if [ -e "~/.cargo/config" ]; then
		touch ~/.cargo/config
	fi

	echo "Config Cargo"
	cat >~/.cargo/config <<EOF
[source.crates-io]
replace-with = 'rsproxy-sparse'
[source.rsproxy]
registry = "https://rsproxy.cn/crates.io-index"
[source.rsproxy-sparse] registry = "sparse+https://rsproxy.cn/index/"
[registries.rsproxy]
index = "https://rsproxy.cn/crates.io-index"
[net]
git-fetch-with-cli = true
EOF
	rustup component add clippy
	rustup component add rustfmt
}

install_homebrew() {
	echo "Install Homebrew"
	export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
	export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
	export HOMEBREW_INSTALL_FROM_API=1
	/bin/bash -c "$(curl -fsSL https://gitee.com/pujichun/install-script/raw/master/homebrew-install.sh)"
	if test -x /opt/homebrew/bin/brew; then
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
	brew tap --custom-remote --force-auto-update homebrew/cask-fonts https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
	brew tap --custom-remote --force-auto-update homebrew/cask-versions https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-versions.git
	brew tap --custom-remote --force-auto-update homebrew/command-not-found https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-command-not-found.git
	brew tap --custom-remote --force-auto-update homebrew/services https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-services.git
	brew update
	brew install brew-cask
}

config_zsh() {
	# clone zi
	zi_home="${HOME}/.zi" && mkdir -p $zi_home
	git clone --depth=1 https://github.com/z-shell/zi.git "${zi_home}/bin"
	rm -rf $HOME/.zshrc $HOME/.zsh_history
	ln -sf $HOME/.config/zsh/zshrc $HOME/.zshrc
	ln -sf $HOME/.config/zsh/zsh_history $HOME/.zsh_history
	source $HOME/.zshrc
	# install oh-my-zsh
	sh -c "$(curl -fsSL https://gitee.com/pujichun/install-script/raw/master/oh-my-zsh.sh)"

	# clone oh-my-zsh theme
	curl https://raw.githubusercontent.com/pmnmq/nebula/main/nebula.zsh-theme >$HOME/.oh-my-zsh/custom/themes/nebula.zsh-theme
}

install_mac_base_soft() {
	brew install --cask iina
	brew install --cask appcleaner
	brew install --case devtoys
	brew install --case permute
	brwe install --case downie
	brew install --cask transmit
	brew install --cask maccy
	brew install --cask itsycal
	brew install --cask iterm2
	brew install --case netnewswire
	brew install 1password-cli
	brew install mas
	# 腾讯会议
	mas install 1484048379
	# 1Password for Safari
	mas install 1569813296
	mas install 985367838
	# localsend
	mas install 1661733229
}

brew_install_common_soft() {
	brew install yazi ffmpegthumbnailer sevenzip jq poppler ripgrep zoxide imagemagick font-symbols-only-nerd-font
	brew install --cask kitty
	brew install --cask warp
	brew install --cask picgo
	brew install --cask google-chrome
	brew install --cask visual-studio-code
	brew install --cask discord
	brew install --cask obs
	brew install --cask jetbrains-toolbox
	brew install --cask hoppscotch
	brew install neovim neofetch ruff lazygit glow hugo graphviz
	if test "$OS" != "Darwin"; then
		brew tap localsend/localsend
		brew install localsend
	fi
	brew install protobuf
	brew install protoc-gen-go
	brew install protoc-gen-go-grpc
	brew install bufbuild/buf/buf
	brew install fzf
}

start_install() {
	clone_config

	install_rust_toolchain

	install_homebrew

	config_zsh

	install_mac_base_soft

	brew_install_common_soft
}

start_install
