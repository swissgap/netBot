═════════════════════════════════════════════════════════════════════════════
  VIRTUAL ENVIRONMENT SETUP GUIDE
  Multi-Vendor Network Monitor Installation
═════════════════════════════════════════════════════════════════════════════

⚠️  WHY VIRTUAL ENVIRONMENT?
══════════════════════════════

Modern Python (3.10+) prevents system-wide pip installs to avoid breaking
the system. Virtual environments are now **required** and are best practice.

Benefits:
✓ Isolates project dependencies (no system conflicts)
✓ Each project can use different versions
✓ Easy to remove (just delete the folder)
✓ Works on all operating systems
✓ Industry standard approach


═════════════════════════════════════════════════════════════════════════════
LINUX / macOS - QUICK START
═════════════════════════════════════════════════════════════════════════════

Option 1: Use the Setup Script (EASIEST)
───────────────────────────────────────────

```bash
# Make setup script executable
chmod +x setup.sh

# Run setup (creates venv + installs all dependencies)
./setup.sh

# This will:
# 1. Create virtual environment in ./venv
# 2. Activate it
# 3. Install all requirements
# 4. Show next steps
```

Option 2: Manual Setup
───────────────────────

```bash
# Create virtual environment
python3 -m venv venv

# Activate it
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install requirements
pip install -r requirements_multi_vendor.txt

# Verify installation
pip list
```

Now your prompt should show: `(venv) user@machine:~$`


═════════════════════════════════════════════════════════════════════════════
WINDOWS - QUICK START
═════════════════════════════════════════════════════════════════════════════

Option 1: Use the Setup Script (EASIEST)
──────────────────────────────────────────

```powershell
# Run setup script (creates venv + installs all dependencies)
.\setup.ps1

# This will:
# 1. Create virtual environment in .\venv
# 2. Activate it
# 3. Install all requirements
# 4. Show next steps

# If you get execution policy error, run:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Then try again
```

Option 2: Manual Setup
───────────────────────

```powershell
# Create virtual environment
python -m venv venv

# Activate it
.\venv\Scripts\Activate.ps1

# Upgrade pip
python -m pip install --upgrade pip

# Install requirements
pip install -r requirements_multi_vendor.txt

# Verify installation
pip list
```

Now your PowerShell prompt should show: `(venv) PS C:\...>`


═════════════════════════════════════════════════════════════════════════════
FILE STRUCTURE AFTER SETUP
═════════════════════════════════════════════════════════════════════════════

Your project directory should look like:

```
network-monitor/
├── venv/                               # Virtual environment (auto-created)
│   ├── bin/                           # Linux/Mac scripts
│   │   ├── activate
│   │   ├── python
│   │   └── pip
│   ├── Scripts/                       # Windows scripts
│   │   ├── Activate.ps1
│   │   ├── python.exe
│   │   └── pip.exe
│   ├── lib/                           # All installed packages
│   └── pyvenv.cfg
│
├── network_monitor_multi_vendor.py    # Main application
├── dashboard_multi_vendor.html        # Dashboard UI
├── requirements_multi_vendor.txt      # Dependency list
│
├── setup.sh                           # Linux/Mac setup script
├── setup.ps1                          # Windows setup script
├── MULTI_VENDOR_SETUP.md              # Configuration guide
└── README.md                          # This file
```

DO NOT edit or delete anything in `venv/` - it's auto-generated!


═════════════════════════════════════════════════════════════════════════════
USING THE VIRTUAL ENVIRONMENT
═════════════════════════════════════════════════════════════════════════════

Every time you want to run the monitor:

LINUX / macOS:
──────────────
```bash
# Navigate to project directory
cd /path/to/network-monitor

# Activate venv (required!)
source venv/bin/activate

# You should see: (venv) user@machine:~$

# Run the monitor
python network_monitor_multi_vendor.py

# To deactivate when done
deactivate
```

WINDOWS:
─────────
```powershell
# Navigate to project directory
cd C:\path\to\network-monitor

# Activate venv (required!)
.\venv\Scripts\Activate.ps1

# You should see: (venv) PS C:\...>

# Run the monitor
python network_monitor_multi_vendor.py

# To deactivate when done
deactivate
```


═════════════════════════════════════════════════════════════════════════════
TROUBLESHOOTING
═════════════════════════════════════════════════════════════════════════════

Problem 1: "python: command not found"
────────────────────────────────────────

Error:
```
bash: python: command not found
```

Solution:
```bash
# On Linux/Mac, use python3 instead
python3 -m venv venv
source venv/bin/activate
python3 -m pip install -r requirements_multi_vendor.txt
python3 network_monitor_multi_vendor.py
```

Or create alias:
```bash
alias python=python3
```


Problem 2: "ModuleNotFoundError: No module named 'flask'"
──────────────────────────────────────────────────────────

Error:
```
ModuleNotFoundError: No module named 'flask'
```

Cause: Virtual environment not activated!

Solution:
```bash
# Activate venv first
source venv/bin/activate  # Linux/Mac
# OR
.\venv\Scripts\Activate.ps1  # Windows

# Then run
python network_monitor_multi_vendor.py
```

Verify venv is active - your prompt should show `(venv)` prefix!


Problem 3: "Permission denied: './setup.sh'"
──────────────────────────────────────────────

Error:
```
bash: ./setup.sh: Permission denied
```

Solution:
```bash
# Make script executable
chmod +x setup.sh

# Then run
./setup.sh
```


Problem 4: "This environment is externally managed"
──────────────────────────────────────────────────────

Error:
```
error: externally-managed-environment
```

Cause: Trying to install packages outside of virtual environment

Solution:
```bash
# Create virtual environment first
python3 -m venv venv

# Activate it
source venv/bin/activate

# Then install
pip install -r requirements_multi_vendor.txt
```

NEVER use `sudo pip install` or `pip install --break-system-packages`!


Problem 5: Venv still not working after activation
────────────────────────────────────────────────────

Check if venv is actually active:
```bash
# Linux/Mac
which python
# Should show: /path/to/venv/bin/python

# Windows PowerShell
where.exe python
# Should show: C:\path\to\venv\Scripts\python.exe
```

If not showing venv path, try:
```bash
# Completely remove and recreate
rm -rf venv  # Linux/Mac
rmdir /s venv  # Windows

# Create fresh
python3 -m venv venv

# Activate
source venv/bin/activate  # Linux/Mac
# OR
.\venv\Scripts\Activate.ps1  # Windows

# Install
pip install -r requirements_multi_vendor.txt
```


Problem 6: "The system cannot find the path specified"
────────────────────────────────────────────────────────

Error on Windows:
```
The system cannot find the path specified
```

Cause: PowerShell execution policy blocks scripts

Solution:
```powershell
# Set execution policy (one-time)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Answer 'Y' to confirm

# Then run setup
.\setup.ps1
```


Problem 7: Old Python version
──────────────────────────────

Error:
```
Creating virtual environment...
Error: Python 3.9+ is required
```

Solution:
1. Install Python 3.9+ from python.org (Windows) or apt/brew (Linux/Mac)
2. Verify: `python3 --version` (should be 3.9+)
3. Retry venv creation


═════════════════════════════════════════════════════════════════════════════
REQUIREMENTS EXPLAINED
═════════════════════════════════════════════════════════════════════════════

The requirements_multi_vendor.txt file contains:

```
flask==2.3.0           → Web framework for REST API
flask-cors==4.0.0      → Allows browser access to API
paramiko==3.2.0        → SSH client (for Cisco Catalyst)
requests==2.31.0       → HTTP client (for Huawei, UniFi APIs)
pysnmp==4.4.12         → SNMP client (for additional metrics)
```

What these do:
- Flask: Serves the API and dashboard
- Paramiko: Connects to Catalyst via SSH
- Requests: Makes REST API calls to Huawei/UniFi
- SNMP: Optional additional querying

All are industry-standard, well-maintained packages.


═════════════════════════════════════════════════════════════════════════════
UPDATING REQUIREMENTS LATER
═════════════════════════════════════════════════════════════════════════════

If you need to add more packages:

```bash
# Activate venv first
source venv/bin/activate  # Linux/Mac
# OR
.\venv\Scripts\Activate.ps1  # Windows

# Install individual package
pip install package_name

# Or update entire requirements file
pip install -r requirements_multi_vendor.txt --upgrade
```


═════════════════════════════════════════════════════════════════════════════
MOVING THE PROJECT
═════════════════════════════════════════════════════════════════════════════

Virtual environments are tied to their path. If you move the project:

Option 1: Delete and recreate venv (EASIEST)
─────────────────────────────────────────────
```bash
# Remove old venv
rm -rf venv  # Linux/Mac
rmdir /s venv  # Windows

# Navigate to new location
cd /new/path

# Create fresh venv
python3 -m venv venv

# Activate and install
source venv/bin/activate
pip install -r requirements_multi_vendor.txt
```

Option 2: Rebuild existing venv
──────────────────────────────────
```bash
# In new location, upgrade venv
python3 -m venv --upgrade venv
pip install -r requirements_multi_vendor.txt
```


═════════════════════════════════════════════════════════════════════════════
USING WITH IDEs
═════════════════════════════════════════════════════════════════════════════

Visual Studio Code
────────────────────
1. Install Python extension
2. Open project folder
3. Press Ctrl+Shift+` to open terminal
4. Terminal auto-activates venv
5. Run: `python network_monitor_multi_vendor.py`

PyCharm
─────────
1. File → Settings → Project → Python Interpreter
2. Add Interpreter → Add Local Interpreter → Existing environment
3. Select: `/path/to/venv/bin/python` (Linux/Mac) or `\venv\Scripts\python.exe` (Windows)
4. Run configuration will use venv automatically

Sublime Text
──────────────
1. Install: https://packagecontrol.io/packages/Anaconda
2. Configure to use: `/path/to/venv/bin/python`
3. Run with venv active in terminal


═════════════════════════════════════════════════════════════════════════════
DOCKER ALTERNATIVE
═════════════════════════════════════════════════════════════════════════════

If you prefer Docker (isolates everything):

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements_multi_vendor.txt .
RUN pip install -r requirements_multi_vendor.txt

COPY network_monitor_multi_vendor.py .
COPY dashboard_multi_vendor.html .

EXPOSE 5000

CMD ["python", "network_monitor_multi_vendor.py"]
```

Then:
```bash
docker build -t network-monitor .
docker run -p 5000:5000 network-monitor
```

No venv needed with Docker!


═════════════════════════════════════════════════════════════════════════════
CHEAT SHEET
═════════════════════════════════════════════════════════════════════════════

LINUX / macOS:

Create venv:
  python3 -m venv venv

Activate:
  source venv/bin/activate

Deactivate:
  deactivate

Install packages:
  pip install -r requirements_multi_vendor.txt

Run monitor:
  python network_monitor_multi_vendor.py


WINDOWS PowerShell:

Create venv:
  python -m venv venv

Activate:
  .\venv\Scripts\Activate.ps1

Deactivate:
  deactivate

Install packages:
  pip install -r requirements_multi_vendor.txt

Run monitor:
  python network_monitor_multi_vendor.py


═════════════════════════════════════════════════════════════════════════════
NEXT STEPS
═════════════════════════════════════════════════════════════════════════════

1. ✅ Run setup script:
   ./setup.sh              (Linux/Mac)
   .\setup.ps1             (Windows)

2. 📝 Configure switches:
   nano network_monitor_multi_vendor.py  (Linux/Mac)
   notepad network_monitor_multi_vendor.py  (Windows)
   # Edit lines 620-650 with your IPs and credentials

3. 🚀 Start monitor:
   source venv/bin/activate  (Linux/Mac)
   .\venv\Scripts\Activate.ps1  (Windows)
   python network_monitor_multi_vendor.py

4. 🌐 Open dashboard:
   http://localhost:5000/dashboard_multi_vendor.html

5. 📚 Read detailed setup:
   MULTI_VENDOR_SETUP.md

═════════════════════════════════════════════════════════════════════════════
