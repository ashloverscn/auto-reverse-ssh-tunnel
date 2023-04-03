# auto-reverse-ssh-tunnel
reverse tunnel auto startup

# insert a crontab entry of the below with corntab -e command
### connect persistant revese ssh tunnel
@reboot /root/reverse-tunnel.sh
