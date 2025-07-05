Used to setup my desktop environment

Linux:

```
sudo apt install -y git snapd
snap install chezmoi --classic

chezmoi init https://github.com/chunkies/Desktop_Setup.git
chezmoi apply
```
