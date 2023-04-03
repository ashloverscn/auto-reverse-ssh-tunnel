# auto-reverse-ssh-tunnel
reverse tunnel auto startup

# insert a crontab entry of the below with corntab -e command 
# and the tunnel should connect on ever reboot and stay perstant throughout the up time

### connect persistant revese ssh tunnel
@reboot /root/reverse-tunnel.sh
