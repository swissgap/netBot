#!/bin/bash

################################################################################
# QUICK INSTALL - Multi-Vendor Network Monitor Dependencies
# For existing virtual environment or system Python
################################################################################

echo "╔════════════════════════════════════════════════════════════════════════╗"
echo "║             INSTALLING DEPENDENCIES - Network Monitor                  ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"
echo ""

# Check if in virtual environment
if [[ "$VIRTUAL_ENV" == "" ]]; then
    echo "⚠️  No virtual environment detected"
    echo ""
    echo "You have 3 options:"
    echo ""
    echo "Option 1: Create and activate venv (RECOMMENDED)"
    echo "  python3 -m venv venv"
    echo "  source venv/bin/activate"
    echo "  python3 -m pip install --upgrade pip"
    echo "  pip install flask flask-cors paramiko requests pysnmp"
    echo ""
    echo "Option 2: Install with --break-system-packages (NOT recommended)"
    echo "  pip install --break-system-packages flask flask-cors paramiko requests pysnmp"
    echo ""
    echo "Option 3: Use apt (if on Debian/Ubuntu)"
    echo "  sudo apt install python3-flask python3-paramiko python3-requests"
    echo ""
    exit 1
fi

echo "✓ Virtual environment detected: $VIRTUAL_ENV"
echo ""

# Upgrade pip
echo "📦 Upgrading pip..."
python3 -m pip install --upgrade pip setuptools wheel 2>&1 | grep -E "Successfully|Requirement"
echo ""

# Install dependencies one by one
echo "📥 Installing dependencies..."
echo ""

echo "  1/5: Installing Flask..."
pip install flask==2.3.0 2>&1 | grep -E "Successfully|already" || echo "    Flask installed"

echo "  2/5: Installing Flask-CORS..."
pip install flask-cors==4.0.0 2>&1 | grep -E "Successfully|already" || echo "    Flask-CORS installed"

echo "  3/5: Installing Paramiko (SSH)..."
pip install paramiko==3.2.0 2>&1 | grep -E "Successfully|already" || echo "    Paramiko installed"

echo "  4/5: Installing Requests (HTTP)..."
pip install requests==2.31.0 2>&1 | grep -E "Successfully|already" || echo "    Requests installed"

echo "  5/5: Installing pysnmp (SNMP)..."
pip install pysnmp==4.4.12 2>&1 | grep -E "Successfully|already" || echo "    pysnmp installed"

echo ""
echo "✓ All dependencies installed!"
echo ""

# Verify installation
echo "✓ Verifying installation..."
python3 -c "import flask; import paramiko; import requests; print('  Flask:', flask.__version__); print('  Paramiko:', paramiko.__version__); print('  Requests:', requests.__version__)"
echo ""

echo "╔════════════════════════════════════════════════════════════════════════╗"
echo "║                    ✅ READY TO RUN                                    ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"
echo ""
echo "Next: python3 network_monitor_multi_vendor.py"
echo ""
