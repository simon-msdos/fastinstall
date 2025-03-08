#!/bin/bash

# Display the ASCII art
echo " ____ ___ __  __  ___  _   _           __  __ ____  ____   ___  ____  "
echo "/ ___|_ _|  \/  |/ _ \| \ | |         |  \/  / ___||  _ \ / _ \/ ___| "
echo "\___ \| || |\/| | | | |  \| |  _____  | |\/| \___ \| | | | | | \___ \ "
echo " ___) | || |  | | |_| | |\  | |_____| | |  | |___) | |_| | |_| |___) |"
echo "|____/___|_|  |_|\___/|_| \_|         |_|  |_|____/|____/ \___/|____/  "

echo ""
echo "-------------------------------------------------"
echo "Welcome to the Sys Admin Tool Installer"
echo "Please select the number of the tool you want to install:"
echo "1) htop"
echo "2) nmap"
echo "3) fail2ban"
echo "4) docker"
echo "5) git"
echo "6) ufw"
echo "7) vim"
echo "8) apache2"
echo "9) mysql"
echo "10) Install All"
echo "11) Exit"
echo "-------------------------------------------------"

# Function to install tools
install_tool() {
  tool_name=$1
  echo "Installing $tool_name..."
  if [[ $(which apt) ]]; then
    sudo apt update && sudo apt install -y $tool_name
  elif [[ $(which yum) ]]; then
    sudo yum install -y $tool_name
  elif [[ $(which dnf) ]]; then
    sudo dnf install -y $tool_name
  else
    echo "Unsupported package manager, please install $tool_name manually."
  fi
}

# Install all tools
install_all() {
  tools=("htop" "nmap" "fail2ban" "docker.io" "git" "ufw" "vim" "apache2" "mysql-server")
  for tool in "${tools[@]}"; do
    install_tool $tool
  done
}

# Read user input
read -p "Enter your choice: " choice

# Menu logic
case $choice in
  1)
    install_tool "htop"
    ;;
  2)
    install_tool "nmap"
    ;;
  3)
    install_tool "fail2ban"
    ;;
  4)
    install_tool "docker.io"
    ;;
  5)
    install_tool "git"
    ;;
  6)
    install_tool "ufw"
    ;;
  7)
    install_tool "vim"
    ;;
  8)
    install_tool "apache2"
    ;;
  9)
    install_tool "mysql-server"
    ;;
  10)
    install_all
    ;;
  11)
    echo "Exiting the script."
    exit 0
    ;;
  *)
    echo "Invalid option."
    ;;
esac

# End of script
