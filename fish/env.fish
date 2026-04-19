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
if test -d $XDG_DATA_HOME/rustup
    set -xg RUSTUP_HOME $XDG_DATA_HOME/rustup
end

if test -d $XDG_DATA_HOME/cargo
    set -xg CARGO_HOME $XDG_DATA_HOME/cargo
end
set -xg PNPM_HOME $XDG_DATA_HOME/pnpm
set -xg HOMEBREW_NO_AUTO_UPDATE true
set -xg HOMEBREW_BOTTLE_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles"
set -xg HOMEBREW_API_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles/api"
set -xg HOMEBREW_BREW_GIT_REMOTE "https://mirrors.ustc.edu.cn/brew.git"
set -xg HOMEBREW_CORE_GIT_REMOTE "https://mirrors.ustc.edu.cn/homebrew-core.git"
set -xg NUGET_PACKAGES $XDG_CACHE_HOME/NuGetPackages
set -xg DOTNET_CLI_HOME $XDG_DATA_HOME/dotnet
set -xg DOTNET_ROOT /usr/local/dotnet10
set -xg OPENCODE_PATH /Users/pujic/.opencode

fish_add_path $XDG_BIN_HOME
fish_add_path $GOPATH
fish_add_path $GOBIN
fish_add_path $PNPM_HOME/bin

if set -q CARGO_HOME
    if test -d $CARGO_HOME/bin
        fish_add_path $CARGO_HOME/bin
    end
end

fish_add_path $DOTNET_ROOT
fish_add_path $OPENCODE_PATH/bin

if test -d $XDG_DATA_HOME/npm
    fish_add_path $XDG_DATA_HOME/npm/bin
end

# fzf
set -gx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS \
    --color=fg:#cbccc6,bg:#1f2430,hl:#707a8c \
    --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66 \
    --color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6 \
    --color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff
