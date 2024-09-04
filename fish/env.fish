set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_CACHE_HOME $HOME/.cache
set -xg XDG_DATA_HOME $HOME/.local/share
set -xg XDG_STATE_HOME $HOME/.local/state
set -xg XDG_BIN_HOME $HOME/.local/bin

if test -d /usr/local/go
	set -xg GOROOT /usr/local/go
	fish_add_path $GOROOT/bin
end
set -xg GOPATH $XDG_DATA_HOME/go
set -xg GOBIN $GOPATH/bin
set -xg GOPROXY "https://goproxy.cn"
set -xg GOMODCACHE $XDG_CACHE_HOME/go/mod
set -xg RUSTUP_HOME $XDG_DATA_HOME/rustup
set -xg CARGO_HOME $XDG_DATA_HOME/cargo
set -xg PNPM_HOME $XDG_DATA_HOME/pnpm
set -xg HOMEBREW_NO_AUTO_UPDATE true
set -xg HOMEBREW_BOTTLE_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
set -xg HOMEBREW_API_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
set -xg HOMEBREW_BREW_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
set -xg HOMEBREW_CORE_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
set -xg NUGET_PACKAGES $XDG_CACHE_HOME/NuGetPackages
set -xg DOTNET_CLI_HOME $XDG_DATA_HOME/dotnet

fish_add_path $XDG_BIN_HOME
fish_add_path $GOPATH
fish_add_path $GOBIN
fish_add_path $PNPM_HOME/bin
fish_add_path $CARGO_HOME/bin

if test -d /usr/local/dotnet
	fish_add_path /usr/local/dotnet
end

if test -d $XDG_DATA_HOME/npm
	fish_add_path $XDG_DATA_HOME/npm/bin
end


