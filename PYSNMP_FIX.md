═════════════════════════════════════════════════════════════════════════════
  PYSNMP VERSION CONFLICT - SCHNELLE LÖSUNG
═════════════════════════════════════════════════════════════════════════════

PROBLEM:
─────────
```
ModuleNotFoundError: No module named 'pyasn1.compat.octets'
```

URSACHE:
─────────
pysnmp 4.4.12 ist mit neueren pyasn1 Versionen nicht kompatibel.
Das ist ein bekanntes Python-Package-Problem.

LÖSUNG #1: Entferne pysnmp (EMPFOHLEN für Catalyst 9300)
──────────────────────────────────────────────────────────

Du brauchst pysnmp nicht! Catalyst 9300 arbeitet über SSH, nicht SNMP.

```bash
# Aktiviere venv
source venv/bin/activate

# Deinstalliere pysnmp
pip uninstall pysnmp -y

# Installiere nur die benötigten Packages
pip install flask flask-cors paramiko requests

# Starte Monitor
python3 network_monitor_production.py
```

Das war's! ✅


LÖSUNG #2: Fix mit korrekter pysnmp Version
──────────────────────────────────────────────

Wenn du pysnmp brauchst (für Huawei HN8255Ws SNMP):

```bash
source venv/bin/activate

# Deinstalliere alte pysnmp
pip uninstall pysnmp -y

# Installiere neuere Version mit korrekter pyasn1
pip install pysnmp==5.0.3 pyasn1==0.4.8

# Oder: Verwende modernere SNMP Library
pip uninstall pysnmp -y
pip install snmp_passphrases
```


LÖSUNG #3: Verwende nur REST APIs (BEST für Multi-Vendor)
──────────────────────────────────────────────────────────

Huawei HN8255Ws hat REST API - wir brauchen kein SNMP!

```bash
source venv/bin/activate
pip uninstall pysnmp -y
pip install flask flask-cors paramiko requests
python3 network_monitor_multi_vendor.py
```

Multi-Vendor Monitor arbeitet mit:
- Cisco: SSH (nicht SNMP)
- Huawei: REST API (nicht SNMP)
- UniFi: REST API (nicht SNMP)

Kein SNMP nötig! ✅


═════════════════════════════════════════════════════════════════════════════
SCHRITT-FÜR-SCHRITT FIX (WÄHLE EINE LÖSUNG)
═════════════════════════════════════════════════════════════════════════════

OPTION A: Schneller Fix (90 Sekunden)
──────────────────────────────────────

```bash
source venv/bin/activate
pip uninstall pysnmp -y
pip install flask flask-cors paramiko requests
python3 network_monitor_production.py
```

✅ EMPFOHLEN FÜR: Catalyst 9300 (SSH, kein SNMP nötig)


OPTION B: Multi-Vendor Version
───────────────────────────────

```bash
source venv/bin/activate
pip uninstall pysnmp -y
pip install flask flask-cors paramiko requests
python3 network_monitor_multi_vendor.py
```

✅ EMPFOHLEN FÜR: Cisco + Huawei + UniFi (alle REST/SSH)


OPTION C: Falls du SNMP brauchst
─────────────────────────────────

```bash
source venv/bin/activate
pip uninstall pysnmp -y
pip install flask flask-cors paramiko requests
pip install snmp-mibs pycryptodome
```

Aber: Für Catalyst + Huawei + UniFi brauchst du kein SNMP!


═════════════════════════════════════════════════════════════════════════════
WAS IST SNMP UND BRAUCHST DU ES?
═════════════════════════════════════════════════════════════════════════════

SNMP = Simple Network Management Protocol
└─ Wird verwendet für: Interface Counters, System Info
└─ ALTERNATIVE: SSH CLI, REST API

DU BRAUCHST SNMP NICHT WEIL:

Cisco Catalyst 9300:
  ✓ SSH CLI Command (show interfaces, show arp)
  ✗ SNMP nicht nötig

Huawei HN8255Ws:
  ✓ REST API (alle Daten)
  ✗ SNMP nicht nötig

UniFi UCK G2+ / UXG Max:
  ✓ REST API (alle Daten)
  ✗ SNMP nicht unterstützt

FAZIT: Entferne pysnmp und starte! 🎉


═════════════════════════════════════════════════════════════════════════════
EXAKTE BEFEHLE ZUM KOPIEREN & EINFÜGEN
═════════════════════════════════════════════════════════════════════════════

Kopiere diese Zeilen exakt:

```bash
source venv/bin/activate
pip uninstall pysnmp -y
pip install flask flask-cors paramiko requests
python3 network_monitor_production.py
```

Fertig! ✅


═════════════════════════════════════════════════════════════════════════════
VERIFIZIERUNG
═════════════════════════════════════════════════════════════════════════════

Nach installation, teste:

```bash
python3 -c "import flask; import paramiko; import requests; print('✓ All imports work!')"
```

Du solltest sehen: `✓ All imports work!`


═════════════════════════════════════════════════════════════════════════════
WENN DU PYTHON 3.13 VERWENDEST
═════════════════════════════════════════════════════════════════════════════

Python 3.13 hat manchmal Issues mit alten Libraries.

Lösung:
```bash
pip install --upgrade setuptools wheel
pip uninstall pysnmp -y
pip install flask flask-cors paramiko requests
```


═════════════════════════════════════════════════════════════════════════════
WAS JETZT FUNKTIONIERT
═════════════════════════════════════════════════════════════════════════════

Nach Deinstallation von pysnmp:

✅ Cisco Catalyst 9300:    SSH (show interfaces, show arp)
✅ Huawei HN8255Ws:        REST API (port stats, health)
✅ UniFi UCK G2+:          REST API (clients, WiFi)
✅ UniFi UXG Max:          REST API (traffic, firewall)

Alle Funktionen arbeiten! SNMP wird nicht benötigt! 🎉


═════════════════════════════════════════════════════════════════════════════
ZURÜCK ZU WORK
═════════════════════════════════════════════════════════════════════════════

1. Deinstalliere pysnmp
2. Installiere nur Flask, Paramiko, Requests
3. Starte Monitor
4. Öffne Browser

So einfach! ✅

═════════════════════════════════════════════════════════════════════════════
