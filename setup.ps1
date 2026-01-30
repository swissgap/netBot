################################################################################
# MULTI-VENDOR NETWORK MONITOR - WINDOWS SETUP SCRIPT
# Cisco Catalyst 9300 | Huawei HN8255Ws | UniFi UCK G2+ | UniFi UXG Max
################################################################################

# Check if running with admin privileges (recommended)
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "⚠️  Running without admin privileges. Some features may not work."
    Write-Host "    Recommended: Run PowerShell as Administrator"
}

Write-Host "╔════════════════════════════════════════════════════════════════════════╗"
Write-Host "║         MULTI-VENDOR NETWORK MONITOR - INSTALLATION SETUP              ║"
Write-Host "║    Cisco Catalyst 9300 | Huawei HN8255Ws | UniFi UCK G2+ | UXG Max    ║"
Write-Host "╚════════════════════════════════════════════════════════════════════════╝"
Write-Host ""

# Check Python version
Write-Host "📋 Checking Python installation..."
try {
    $PythonVersion = (python --version 2>&1)
    Write-Host "✓ Found $PythonVersion"
}
catch {
    Write-Host "❌ Python not found! Please install Python 3.9+ from python.org"
    Write-Host "   https://www.python.org/downloads/"
    exit 1
}

Write-Host ""

# Create virtual environment
$VenvDir = "venv"

if (Test-Path $VenvDir) {
    Write-Host "⚠️  Virtual environment already exists at .\$VenvDir"
    $Response = Read-Host "Do you want to remove and recreate it? (y/n)"
    
    if ($Response -eq "y" -or $Response -eq "Y") {
        Write-Host "🗑️  Removing old venv..."
        Remove-Item -Recurse -Force $VenvDir
    }
    else {
        Write-Host "Using existing venv..."
    }
}

if (-NOT (Test-Path $VenvDir)) {
    Write-Host "📦 Creating virtual environment in .\$VenvDir..."
    python -m venv $VenvDir
    Write-Host "✓ Virtual environment created"
}

Write-Host ""

# Activate virtual environment
Write-Host "🔌 Activating virtual environment..."
& ".\$VenvDir\Scripts\Activate.ps1"
Write-Host "✓ Virtual environment activated"
Write-Host ""

# Upgrade pip
Write-Host "📦 Upgrading pip..."
python -m pip install --upgrade pip setuptools wheel 2>&1 | Out-Null
Write-Host "✓ pip upgraded"
Write-Host ""

# Install requirements
Write-Host "📥 Installing requirements from requirements_multi_vendor.txt..."
Write-Host "   This may take a minute..."
Write-Host ""

if (Test-Path "requirements_multi_vendor.txt") {
    pip install -r requirements_multi_vendor.txt
    Write-Host ""
    Write-Host "✓ All dependencies installed successfully!"
}
else {
    Write-Host "❌ requirements_multi_vendor.txt not found!"
    Write-Host "Please make sure you're in the correct directory."
    exit 1
}

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════════════════╗"
Write-Host "║                    ✅ INSTALLATION COMPLETE                            ║"
Write-Host "╚════════════════════════════════════════════════════════════════════════╝"
Write-Host ""

Write-Host "📋 Next steps:"
Write-Host ""
Write-Host "1️⃣  Configure your switches:"
Write-Host "   notepad network_monitor_multi_vendor.py"
Write-Host "   # Edit lines 620-650 with your switch IPs and credentials"
Write-Host ""
Write-Host "2️⃣  Start the monitor:"
Write-Host "   .\venv\Scripts\Activate.ps1  # If not already active"
Write-Host "   python network_monitor_multi_vendor.py"
Write-Host ""
Write-Host "3️⃣  Open dashboard in browser:"
Write-Host "   http://localhost:5000/dashboard_multi_vendor.html"
Write-Host ""
Write-Host "📚 For detailed setup, see: MULTI_VENDOR_SETUP.md"
Write-Host ""
Write-Host "⚠️  To activate venv in future sessions:"
Write-Host "   .\venv\Scripts\Activate.ps1"
Write-Host ""
Write-Host "🛑 To deactivate venv:"
Write-Host "   deactivate"
Write-Host ""

# Show installed packages
Write-Host "📦 Installed packages:"
Write-Host ""
pip list | Select-String -Pattern "Flask|paramiko|requests|pysnmp|SNMP"
Write-Host ""

Write-Host "✅ Ready to configure and run!"
