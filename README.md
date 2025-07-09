Used to setup my desktop environment

Linux:

```
sudo apt install -y git snapd
sudo snap install chezmoi --classic

chezmoi init https://github.com/chunkies/Desktop_Setup.git
chezmoi apply

cd "$(chezmoi source-path)"/scripts
chmod +x pre-setup.sh
./pre-setup.sh
```
