export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_BIN_HOME=$HOME/.local/bin

export PATH=$XDG_BIN_HOME:$PATH

# Rust
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo

# Go
if test -d /usr/local/bin; then
	export GOROOT=/usr/local/go
	export PATH=$GOROOT/bin:$PATH
fi
export GOPATH=$HOME/.local/share/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH
export GOPROXY="https://goproxy.cn"
export GOMODCACHE=$XDG_CACHE_HOME/go/mod

# npm && pnpm
export NPM_CONFIG_REGISTRY=https://registry.example.com
export NPM_CONFIG_PREFIX=$XDG_DATA_HOME/npm
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm

if test -d $NPM_CONFIG_PREFIX; then
	export PATH=$NPM_CONFIG_PREFIX/npm/bin:$PATH
fi

export PNPM_HOME=$XDG_DATA_HOME/pnpm
if test -d $PNPM_HOME; then
	export PATH=$PNPM_HOME/bin:$PATH
fi

# ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

# dotnet
export PATH=$PATH:/usr/local/dotnet
export NUGET_PACKAGES=$XDG_CACHE_HOME/NuGetPackages
export DOTNET_CLI_HOME=$XDG_DATA_HOME/dotnet
export PATH=$DOTNET_CLI_HOME/bin:$PATH

# homebrew
export HOMEBREW_NO_AUTO_UPDATE=true
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_NO_AUTO_UPDATE=true
