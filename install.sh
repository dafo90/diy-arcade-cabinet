#! /bin/sh

set -e

echo "Installing shutdown signal...\n"
sudo cp scripts/shutdown-signal/shutdown-signal.py /usr/local/bin/
sudo chmod +x /usr/local/bin/shutdown-signal.py

echo "Installing fan manager...\n"
sudo cp scripts/fan-manager/fan-manager.py /usr/local/bin/
sudo chmod +x /usr/local/bin/fan-manager.py

echo "Starting shutdown signal...\n"
sudo cp scripts/shutdown-signal/shutdown-signal.sh /etc/init.d/
sudo chmod +x /etc/init.d/shutdown-signal.sh
sudo update-rc.d shutdown-signal.sh defaults
sudo /etc/init.d/shutdown-signal.sh start

echo "Starting fan manager...\n"
sudo cp scripts/fan-manager/fan-manager.sh /etc/init.d/
sudo chmod +x /etc/init.d/fan-manager.sh
sudo update-rc.d fan-manager.sh defaults
sudo /etc/init.d/fan-manager.sh start

echo "All scripts installed."