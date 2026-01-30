#!/bin/bash

################################################################################
# MULTI-VENDOR NETWORK MONITOR - SETUP SCRIPT
# Cisco Catalyst 9300 | Huawei HN8255Ws | UniFi UCK G2+ | UniFi UXG Max
################################################################################

set -e  # Exit on error

echo "╔════════════════════════════════════════════════════════════════════════╗"
echo "║         MULTI-VENDOR NETWORK MONITOR - INSTALLATION SETUP              ║"
echo "║    Cisco Catalyst 9300 | Huawei HN8255Ws | UniFi UCK G2+ | UXG Max    ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"
echo ""

# Check Python version
echo "📋 Checking Python installation..."
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 not found! Please install Python 3.9+"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | awk '{print $2}')
echo "✓ Found Python $PYTHON_VERSION"
echo ""

# Create virtual environment
VENV_DIR="venv"

if [ -d "$VENV_DIR" ]; then
    echo "⚠️  Virtual environment already exists at ./$VENV_DIR"
    read -p "Do you want to remove and recreate it? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🗑️  Removing old venv..."
        rm -rf "$VENV_DIR"
    else
        echo "Using existing venv..."
    fi
fi

if [ ! -d "$VENV_DIR" ]; then
    echo "📦 Creating virtual environment in ./$VENV_DIR..."
    python3 -m venv "$VENV_DIR"
    echo "✓ Virtual environment created"
fi

echo ""

# Activate virtual environment
echo "🔌 Activating virtual environment..."
source "$VENV_DIR/bin/activate"
echo "✓ Virtual environment activated"
echo ""

# Upgrade pip
echo "📦 Upgrading pip..."
pip install --upgrade pip setuptools wheel > /dev/null 2>&1
echo "✓ pip upgraded"
echo ""

# Install requirements
echo "📥 Installing requirements from requirements_multi_vendor.txt..."
echo "   This may take a minute..."
echo ""

if [ -f "requirements_multi_vendor.txt" ]; then
    pip install -r requirements_multi_vendor.txt
    echo ""
    echo "✓ All dependencies installed successfully!"
else
    echo "❌ requirements_multi_vendor.txt not found!"
    echo "Please make sure you're in the correct directory."
    exit 1
fi

echo ""
echo "╔════════════════════════════════════════════════════════════════════════╗"
echo "║                    ✅ INSTALLATION COMPLETE                            ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"
echo ""

echo "📋 Next steps:"
echo ""
echo "1️⃣  Configure your switches:"
echo "   nano network_monitor_multi_vendor.py"
echo "   # Edit lines 620-650 with your switch IPs and credentials"
echo ""
echo "2️⃣  Start the monitor:"
echo "   source venv/bin/activate  # If not already active"
echo "   python network_monitor_multi_vendor.py"
echo ""
echo "3️⃣  Open dashboard in browser:"
echo "   http://localhost:5000/dashboard_multi_vendor.html"
echo ""
echo "📚 For detailed setup, see: MULTI_VENDOR_SETUP.md"
echo ""
echo "⚠️  To activate venv in future sessions:"
echo "   source venv/bin/activate"
echo ""
echo "🛑 To deactivate venv:"
echo "   deactivate"
echo ""

# Show installed packages
echo "📦 Installed packages:"
echo ""
pip list | grep -E "Flask|paramiko|requests|pysnmp|SNMP"
echo ""

echo "✅ Ready to configure and run!"
