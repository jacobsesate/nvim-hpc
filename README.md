Barebones HPC Neovim

A clean, modular Neovim configuration. It has all the nice vim stuff you're
probably used to and looks clean.

# Installation Instructions:
# Create the local bin directory if it doesn't exist
mkdir -p ~/.local/bin

# Download a stable Linux binary like the one below
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz

# Extract and move to local bin
tar -xzvf nvim-linux-x86_64.tar.gz
ln -sf $(pwd)/nvim-linux-x86_64/bin/nvim ~/.local/bin/nv

# Ensure ~/.local/bin is in your PATH
# Add this to your ~/.bashrc if you haven't:
export PATH="${PATH}:${HOME}/.local/bin"

# Clone this repo to your ~/.config/nvim directory:
git clone git@github.com:jacobsesate/nvim-hpc.git ~/.config/nvim

Layout:

~/.config/nvim
├── init.lua                # Entry point (loads Lazy.nvim and /lua modules)
├── lua/
│   ├── options.lua         # Standard editor settings (tabs, numbers, etc.)
│   ├── keymaps.lua         # Custom shortcuts (really useful)
│   ├── .lazy-config.lua    # Plugin manager bootstrap
│   ├── plugins/            # Active plugins (Lualine, Themes)
│   └── plugins/disabled/   # Useful plugins (add to your liking)
└── README.md

I would recommend looking at the options.lua and keymaps.lua files. You can
also add plugins if you want, but I've found them annoying to get working on
Gemini. This is honestly enough to get started.

The rest of my .bashrc is also pretty useful. The first line enables vim
keybinds in the terminal. I would definitely consider adding "fasd" to your
~/.local/bin as well. It's a really neat autobookmarking system that lets you
jump to any folder you've previously been to instantly (no tedious cd chains).
After the "fasd" stuff I also included a few useful alias that I use
specifically for the hpc to quickly spin up an interactive node with some
resources:

# .bashrc
set -o vi

alias n="nvim"

alias a="fasd -a" 	# any
alias d="fasd -d" 	# directory
alias f="fasd -f"	# file

alias fn="fasd -fe ~/.local/bin/nvim"

alias s="fasd -si"	# show / seach / select
alias sd="fasd -sid" 	# interactive directory selection
alias sf="fasd -sif" 	# interactive file selection

alias z="fasd_cd -d"	# cd
alias zz="fasd_cd -d -i" # cd with interactive selection

export SQUEUE_FULL_FORMAT="%.18i %.9P %.69j %.10u %.10T %.10M %.6D %.6C %.8m %R  %10L"
alias myjobs='squeue -u ${USER} -o "${SQUEUE_FULL_FORMAT}"'

alias cpu="srun -N 1 -n 1 -c 4 --mem 100GB --partition=compute --time=8:00:00 --pty bash -i"
alias gpu="srun --gres gpu:1 -N 1 -n 1 -c 4 --mem 100GB --partition=gpu-a100 --time=8:00:00 --pty bash -i"
alias dev="srun --gres gpu:1 -N 1 -n 1 -c 4 --mem 100GB --partition=gpu-v100-dev --time=2:00:00 --pty bash -i"

eval "$(fasd --init auto)"
