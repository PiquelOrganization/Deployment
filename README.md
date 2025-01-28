# Deployment
Deploy VPS solution

## Setup

### Small setup elements for better use

- Add ```export EDITOR=vim``` in ```.bashrc```

### Harden SSH

- Open SSH configuration file ```sudo vim /etc/ssh/sshd_config```

- Modify the following in the file:
```
PermitRootLogin no # Disable root login
PasswordAuthentication no  # Disable password based auth
UsePAM no # Disable PAM authentication
```
- Check other files in the directory for similar settings

### Setup ```deploy``` user

- Generate ssh keys on local machine: ```ssh-keygen -t ed25519 -C "deploy@piquel.fr"```
- On VPS, change to ```deploy``` user: ```su - deploy```
- Copy the public key to clipboard: ```wl-copy < [file they were saved to].pub```
- Add it to the file on the VPS: ```echo 'command="docker system dial-studio" [insert key]' > .ssh/authorized_keys```
