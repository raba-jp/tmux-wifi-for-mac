# tmux-wifi-for-mac

This plugin displays wifi strength and ssid and wifi rate above tmux status bar for macOS.

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'rabafea/tmux-wifi-for-mac'

Hit `prefix + I` to fetch the plugin and source it. You should now be able to
use the plugin.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/rabafea/tmux-wifi-for-mac ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/wifi-for-mac.tmux

Reload TMUX environment with: `$ tmux source-file ~/.tmux.conf`. You should now
be able to use the plugin.

### License
[MIT](https://github.com/rabafea/tmux-wifi-for-mac/blob/master/LICENSE)
