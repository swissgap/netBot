═════════════════════════════════════════════════════════════════════════════
  QUICK START - 3 MINUTEN SETUP
  Multi-Vendor Network Monitor
═════════════════════════════════════════════════════════════════════════════

⏱️  LINUX / macOS (3 Minuten)
═════════════════════════════

1. Navigate to project directory
   ─────────────────────────────
   
   ```bash
   cd /path/to/network-monitor
   ```


2. Run setup script
   ──────────────────
   
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```
   
   This automatically:
   ✓ Creates virtual environment
   ✓ Installs all dependencies
   ✓ Shows next steps


3. Configure your switches
   ────────────────────────
   
   ```bash
   nano network_monitor_multi_vendor.py
   ```
   
   Find lines 620-650 and update:
   ```python
   monitor.add_switch(CiscoCatalyst9300(
       ip="192.168.1.1",              # Change this
       username="admin",              # Change this
       password="your_password"       # Change this
   ))
   
   monitor.add_switch(HuaweiHN8255Ws(
       ip="192.168.1.2",              # Change this
       username="admin",              # Change this
       password="your_password"       # Change this
   ))
   
   monitor.add_switch(UniFiUCKG2Plus(
       ip="192.168.1.3",              # Change this
       username="ubnt",               # Change this
       password="your_password"       # Change this
   ))
   
   monitor.add_switch(UniFiUXGMax(
       ip="192.168.1.4",              # Change this
       username="admin",              # Change this
       password="your_password"       # Change this
   ))
   ```


4. Activate virtual environment
   ──────────────────────────────
   
   ```bash
   source venv/bin/activate
   ```
   
   You should see: `(venv) user@machine:~$`


5. Start the monitor
   ──────────────────
   
   ```bash
   python network_monitor_multi_vendor.py
   ```
   
   You should see:
   ```
   ======================================================================
   MULTI-VENDOR NETWORK MONITOR - PRODUCTION EDITION
   Supports: Cisco Catalyst 9300 | Huawei HN8255Ws | UniFi UCK G2+ | UXG Max
   ======================================================================
   ⚠️  DATA SOURCE: LIVE ONLY - NO SIMULATION
   ✓ Multi-vendor API integration enabled
   ✓ Real-time monitoring from all switches
   ✓ Unified API endpoint
   ======================================================================
   Starting Flask API on http://0.0.0.0:5000
   ```


6. Open dashboard in browser
   ───────────────────────────
   
   Visit: http://localhost:5000/dashboard_multi_vendor.html
   
   You should see 4 panels with your switch data!


═════════════════════════════════════════════════════════════════════════════

⏱️  WINDOWS (3 Minuten)
═══════════════════════

1. Open PowerShell as Administrator
   ────────────────────────────────
   
   Right-click PowerShell → Run as Administrator


2. Navigate to project directory
   ─────────────────────────────────
   
   ```powershell
   cd C:\path\to\network-monitor
   ```


3. Set execution policy (one-time only)
   ────────────────────────────────────
   
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
   
   Answer: Y


4. Run setup script
   ─────────────────
   
   ```powershell
   .\setup.ps1
   ```
   
   This automatically:
   ✓ Creates virtual environment
   ✓ Installs all dependencies
   ✓ Shows next steps


5. Configure your switches
   ────────────────────────
   
   ```powershell
   notepad network_monitor_multi_vendor.py
   ```
   
   Find lines 620-650 and update with your IPs & credentials
   (same as Linux/macOS step 3)


6. Activate virtual environment
   ──────────────────────────────
   
   ```powershell
   .\venv\Scripts\Activate.ps1
   ```
   
   You should see: `(venv) PS C:\...>`


7. Start the monitor
   ──────────────────
   
   ```powershell
   python network_monitor_multi_vendor.py
   ```


8. Open dashboard in browser
   ───────────────────────────
   
   Visit: http://localhost:5000/dashboard_multi_vendor.html
   
   You should see 4 panels with your switch data!


═════════════════════════════════════════════════════════════════════════════

✅ DONE! Your monitor is running!

═════════════════════════════════════════════════════════════════════════════

EVERY TIME YOU WANT TO RUN THE MONITOR:

Linux/macOS:
────────────
```bash
cd /path/to/network-monitor
source venv/bin/activate
python network_monitor_multi_vendor.py
```

Windows:
─────────
```powershell
cd C:\path\to\network-monitor
.\venv\Scripts\Activate.ps1
python network_monitor_multi_vendor.py
```

═════════════════════════════════════════════════════════════════════════════

TROUBLESHOOTING

❌ "Permission denied" on setup.sh
✅ chmod +x setup.sh


❌ "Module not found" errors
✅ Make sure venv is activated (check for (venv) in prompt)


❌ "Cannot find Python"
✅ Install Python 3.9+ from python.org


❌ "The system cannot find the path"
✅ Windows only: Run "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"


❌ Dashboard shows "Offline" for all switches
✅ Check that switch IPs and credentials are correct in the code


═════════════════════════════════════════════════════════════════════════════

MORE HELP?

📚 Detailed setup: MULTI_VENDOR_SETUP.md
📚 VirtualEnv guide: VENV_SETUP.md
📚 Troubleshooting: See specific guide above

═════════════════════════════════════════════════════════════════════════════
