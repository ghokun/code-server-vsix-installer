# Code Server .vsix Installer
An extension installer script for code-server. Installs extensions from Microsoft Visual Studio Marketplace. Useful for extensions that are not found in code-server's extension listings.

## Usage
Open up a code-server instance. Inside your code-server open a terminal.

```bash
git clone https://github.com/ghokun/code-server-vsix-installer.git
cd code-server-vsix-installer
# Edit extensions.csv file as your needs, example contains extensios for a java development workspace
chmod +x installer.sh
./installer.sh
```

## TODO
- [ ] Check for aarch64 compability.
- [ ] Compare versions by their semver.