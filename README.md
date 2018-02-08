# macOS setup script

<p align="center">
  <img 
    src="https://imgs.xkcd.com/comics/is_it_worth_the_time_2x.png" 
    alt="xkcd comic calculating how long you can spend on automating a routine before you're wasting your time"
    width="75%" 
  />
</p>

Configures macOS for web development and personal use

## Installation

**You need to be signed in to the App Store before running this**

```
sh -c "$(curl -fsSL https://github.com/ptibbetts/macOS/raw/master/install.sh)"
```

The script will install Homebrew and then use that to install Git and Ansible. 

After they've been installed you need to enter your sudo password* and Ansible will do the rest.

\* the sudo password is required by Ansible when it takes over so that it can enable the firewall

## Manual steps

After the install script has ran you will need to:

### Install browser plugins

#### Safari

- [1Password](https://agilebits.com/onepassword/extensions)
- [DuckDuckGo](https://duck.co/help/desktop/safari)

#### Firefox

- [1Password](https://agilebits.com/onepassword/extensions)
- [DuckDuckGo](https://addons.mozilla.org/en-US/firefox/addon/duckduckgo-for-firefox/)
- [Vue devtools](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/)
- [React devtools](https://addons.mozilla.org/en-US/firefox/addon/react-devtools/)
- [Redux devtools](https://addons.mozilla.org/en-US/firefox/addon/remotedev/)

### Misc.

- open flux once and enable it on startup
- open Suspicious Package once so the quicklook plugin will work
- log into 1Password
- log into everything else
- restore your SSH key or make a new one
- add Bluetooth to the menu bar
- add your [Sketch license](https://www.sketchapp.com/support/license-manager/)
- enable the [Dracula theme for iTerm](https://draculatheme.com/iterm/) which is installed to `~/.iterm2/dracula`