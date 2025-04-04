# Dria-Node

This is an alternative to installing and running a Dria Node as a service if you don’t want to always open Screen to monitor the logs. However, you can also follow the standard installation tutorial via the following official FirstBatch link :<br> 
https://github.com/firstbatchxyz/dkn-compute-launcher
<br><br>
==========================================<br>

Run & Install the custom script :<br>
```
curl -fsSL https://raw.githubusercontent.com/satocxyz/dria-node/main/dria_node.sh | bash
```

Start the node to input required field like Wallet Private Key, Choose Models, and API key

```
dkn-compute-launcher start
```

After all done and node start testing the models, press CTRL+C to cancel it

Then run this to start the Node as service
```
systemctl daemon-reload
systemctl start dkn-compute-launcher
```

You can monitor your node with this command
```
journalctl -u dkn-compute-launcher.service -f
```

DONE
<br>
==========================================<br>
If you want to uninstall and remove service
```
dkn-compute-launcher uninstall
```

```
sudo systemctl disable dkn-compute.service
sudo rm /etc/systemd/system/dkn-compute.service
sudo systemctl daemon-reload
sudo journalctl --flush
sudo rm -rf /var/log/journal
sudo systemctl restart systemd-journald
```
==========================================<br>

This script is only for running the Dria Node as a service, so no commands are modified.

Check $DRIA points earned
```
dkn-compute-launcher points
```

Update Node
```
dkn-compute-launcher update
```
