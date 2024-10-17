# config

我已经从 ArchLinux + XServer + DWM 的环境迁移到了 NixOS + Wayland + Hyprland，目前很多软件还不支持 Wayland。尽管是使用 NixOS，但是我对于 DIY Linux 日常使用的可靠性仍然持有怀疑态度，不知道什么时候某个软件就停止维护的阴影从使用 Arch 时就一直伴随着我

我打算放弃使用 Linux PC ，我已经对为了让系统看起来好看而阅读各种文档这件事情感到疲惫，每次更换软件基本上都需要重新配置。在我的一段工作经历中，我在公司里面只能使用 Windows 电脑，我有非常长的一段时间都在使用 WSL ，感觉非常好，既能有稳定的日常软件使用，又有 Linux 的开发环境，当然我所做的工作是非常上层的，如果是底层软件我还是会考虑使用 Linux 服务器或者虚拟机

## 我的设备

- MacBook Air M2
- Surface Laptop 1 (NixOS)
- 一个性能还可以的Laptop (Win11+WSL)


## 我使用的一些软件

### 所有平台

- [Warp](https://warp.dev)
- [kitty](https://github.com/kovidgoyal/kitty)
- [neovim](https://github.com/neovim/neovim)
- [yazi](https://github.com/sxyazi/yazi)
- [fzf](https://github.com/junegunn/fzf)
- [Lazygit](https://github.com/jesseduffield/lazygit)
- [LocalSend](https://github.com/localsend/localsend)
- [PicGo](https://github.com/Molunerfinn/PicGo)
- [Visual Studio Code](https://code.visualstudio.com/)
- [1Password](https://1password.com/)
- Chrome
- zsh

### Mac

- [iina](https://github.com/iina/iina)
- [AppCleaner](https://freemacsoft.net/appcleaner/)
- [Permute3](https://software.charliemonroe.net/permute/)
- [Downie4](https://software.charliemonroe.net/downie/)
- [Transmit](https://panic.com/transmit/)
- [Maccy](https://github.com/p0deje/Maccy)
- [Itsycal](https://github.com/sfsam/Itsycal)
- [NetNewsWire](https://github.com/Ranchero-Software/NetNewsWire)
- [Keka](https://github.com/aonez/Keka)
- [Arc](https://arc.net/)
- [Microsoft Remote Desktop Beta](https://learn.microsoft.com/zh-cn/windows-server/remote/remote-desktop-services/clients/remote-desktop-mac)
- [Navicat Premium Lite](https://www.navicat.com/cht/products)
- [Hoppscotch](https://github.com/hoppscotch/hoppscotch)

## 使用

### NixOS

```shell
git clone https://github.com/pmnmq/dotfiles
cd dotfiles
git clone https://github.com/pmnmq/nvim
sudo nixos-rebuild switch --flake ".#nixos"
```

### WSL

```SHELL
git clone https://github.com/pmnmq/dotfiles
cd dotfiles
git clone https://github.com/pmnmq/nvim
sudo nixos-rebuild switch --flake ".#wsl"
```

### MacOS

```shell
curl -fsSL https://github.com/pmnmq/dotfiles/raw/refs/heads/main/mac_install.sh | bash
```

