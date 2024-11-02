# dot-files
### Install Arch and configure sway
1. Install arch
   ```bash
   bash -c "$(curl -fsSL https://raw.githubusercontent.com/yongrongwang/dot-files/refs/heads/main/deploy/arch-install.sh)"
   bash -c "$(curl -fsSL https://raw.githubusercontent.com/yongrongwang/dot-files/refs/heads/main/deploy/arch-configure.sh)"
   exit
   reboot
   ```
2. Configure sway
   ```bash
   bash -c "$(curl -fsSL https://raw.githubusercontent.com/yongrongwang/dot-files/refs/heads/main/deploy/sway-configure.sh)"
   reboot
   ```
3. Configure neovim
   ```bash
   nvim
   ```
4. Configure hysteria client (optional proxy client)
   ```bash
   bash ~/.dot-files/deploy/hysteria-client.sh
   ```
