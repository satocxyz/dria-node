#!/bin/bash

echo "==================================="
echo " Script by Satocxyz "
echo " GitHub: github.com/satocxyz "
echo " X: x.com/satocxyz "
echo "==================================="

echo "[+] Checking if Ollama is installed..."
if ! command -v ollama &> /dev/null; then
    echo "[!] Ollama not found. Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
    echo "[✔] Ollama installed."
else
    echo "[✔] Ollama is already installed."
fi

echo "[+] Installing DKN Compute Launcher..."
curl -fsSL https://dria.co/launcher | bash
echo "[✔] Installation completed."

echo "[+] Creating systemd service..."
SERVICE_FILE="/etc/systemd/system/dkn-compute-launcher.service"
cat <<EOF > $SERVICE_FILE
[Unit]
Description=DKN Compute Launcher Service
After=network.target

[Service]
User=root
Group=root
ExecStart=/root/.dria/bin/dkn-compute-launcher start
Restart=always
RestartSec=5
WorkingDirectory=/root
Environment="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

[Install]
WantedBy=multi-user.target
EOF
echo "[✔] Systemd service created."

echo "[+] Reloading systemd daemon and enabling service..."
systemctl daemon-reload
systemctl enable dkn-compute-launcher
echo "[✔] Service enabled but not started."

echo "[✔] All steps completed successfully!"
echo "[+] To finalize setup, follow these steps:"
echo "1. Run 'dkn-compute-launcher start' manually."
echo "2. Fill in the required inputs (wallet private key, model selection, API key)."
echo "3. Once done, quit using Ctrl+C."
echo "4. Run 'systemctl reload dkn-compute-launcher' and then 'systemctl start dkn-compute-launcher'."
echo "5. You can monitor the service logs with 'journalctl -u dkn-compute-launcher.service -f'."

echo "==================================="
echo "You can use my referral code: 94gM5rG81UOuLkgjloEa"
