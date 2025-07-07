# History settings
set -gx HISTSIZE 1000
set -gx HISTFILESIZE 2000

# Editor
set -gx EDITOR micro

# Rust
source ~/.cargo/env.fish

# Homebrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Go
set -gx GOPATH $HOME/go
set -gx GOROOT $HOME/.go
fish_add_path $GOPATH/bin

# Fly CLI
set -gx FLYCTL_INSTALL $HOME/.fly
fish_add_path $FLYCTL_INSTALL/bin

# PNPM
set -gx PNPM_HOME $HOME/.local/share/pnpm
fish_add_path $PNPM_HOME

# bun
set -gx BUN_INSTALL $HOME/.bun
fish_add_path $BUN_INSTALL/bin

# Volta
set -gx VOLTA_HOME $HOME/.volta
fish_add_path $VOLTA_HOME/bin

# conda
if test -x /home/thanadolps/miniconda3/bin/conda
    eval (/home/thanadolps/miniconda3/bin/conda shell.fish hook)
else if test -f /home/thanadolps/miniconda3/etc/profile.d/conda.sh
    source /home/thanadolps/miniconda3/etc/profile.d/conda.sh
else
    fish_add_path /home/thanadolps/miniconda3/bin
end

# Pulumi
fish_add_path $HOME/.pulumi/bin

# CUDA
fish_add_path /usr/local/cuda/bin
set -gx LD_LIBRARY_PATH /usr/local/cuda/lib64 $LD_LIBRARY_PATH

# Windsurf shell integration
if test "$TERM_PROGRAM" = "vscode"
    source (windsurf --locate-shell-integration-path fish)
end

# Interactive shell configuration
if status is-interactive
    # atuin
    atuin init fish --disable-up-arrow | source

    # starship prompt
    starship init fish | source

    # zoxide
    zoxide init fish | source

    # thefuck
    thefuck --alias | source
end
