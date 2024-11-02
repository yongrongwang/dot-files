mkdir ~/Downloads/
wget https://github.com/apernet/hysteria/releases/download/app%2Fv2.6.3/hysteria-linux-amd64 ~/Downloads/
cd /usr/local/bin
sudo mv ~/Downloads/hysteria-linux-amd64 hysteria
sudo chmod 755 hysteria
sudo chown root:root hysteria
sudo mkdir /etc/hysteria
cd /etc/hysteria
sudo cp ~/.dot-files-dwm/deploy/hysteria-client.yaml config.yaml
sudo vim config.yaml
sudo cp -r ~/.dot-files-dwm/deploy/sv-hysteria /etc/sv/hysteria
sudo chown -R root:root /etc/sv/hysteria
sudo ln -s /etc/sv/hysteria /var/service/
sudo sv up hysteria
sudo svlogtail | grep hysteria
