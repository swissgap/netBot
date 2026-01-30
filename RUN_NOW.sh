#!/bin/bash

# PYSNMP FIX - COPY & PASTE THIS

source venv/bin/activate
pip uninstall pysnmp -y
pip install flask flask-cors paramiko requests
python3 network_monitor_production.py

# DONE! 🎉
