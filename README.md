# dotfiles

Personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Install

```sh
# 1. Dependencies (macOS)
brew install stow fzf eza bat direnv

# 2. oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3. zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

# 4. Symlink the dotfiles
git clone https://github.com/davidhuh/dotfiles ~/Workspace/dotfiles
cd ~/Workspace/dotfiles
stow zsh vim scripts

# 5. Reload
exec zsh
```

## fzf-tab

Replaces zsh's default tab-completion menu with an [fzf](https://github.com/junegunn/fzf) fuzzy finder.

- Press `Tab` to complete — results open in fzf.
- Press `<` / `>` to switch between completion groups.
- `cd` completions show a directory preview via `eza`.

Load order matters: fzf-tab must come **after** `compinit` and **before**
`zsh-autosuggestions` / `zsh-syntax-highlighting` (both wrap ZLE widgets). In
`zsh/.zshrc` this is handled by the position of `fzf-tab` in the
`plugins=(...)` array, and by setting `fpath` before oh-my-zsh runs `compinit`.

## Inline autocomplete

`zsh-autosuggestions` shows a greyed-out completion ahead of the cursor as you
type, drawn from shell history (falling back to the completion system).

- `→` accepts the whole suggestion; `Ctrl+Space` does the same without moving
  to end-of-line first.
- `Alt+→` accepts one word at a time.

This replaces what Fig used to provide. Fig itself is discontinued — it became
Amazon CodeWhisperer, then Amazon Q, then Kiro CLI. The spec-driven popup menu
of subcommands and flags now lives in [Kiro CLI](https://kiro.dev), which needs
an AWS login and a background daemon; it is deliberately not set up here.
Between `fzf-tab` on `Tab` and history suggestions while typing, most of the
day-to-day Fig behaviour is covered without either.

## Layout

Each top-level directory is a stow package; its contents mirror `$HOME`.

| Package   | Contents    |
| --------- | ----------- |
| `zsh`     | `.zshrc`    |
| `vim`     | `.vimrc`    |
| `scripts` | `.scripts/` |
