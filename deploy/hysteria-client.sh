mkdir ~/Downloads/
wget https://github.com/apernet/hysteria/releases/download/app%2Fv2.6.3/hysteria-linux-amd64 ~/Downloads/
cd /usr/local/bin
sudo mv ~/Downloads/hysteria-linux-amd64 hysteria
sudo chmod 755 hysteria
sudo chown root:root hysteria
sudo mkdir /etc/hysteria
cd ~/.dot-files-dwm/deploy
sudo cp hysteria-client.yaml /etc/hysteria/config.yaml
sudo vim config.yaml
sudo cp -r sv-hysteria /etc/sv/hysteria
sudo chown -R root:root /etc/sv/hysteria
