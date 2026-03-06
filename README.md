# 🚀 Projekt Template Script

Ein Batch-Script zur automatisierten Erstellung neuer Python-Projekte mit vorkonfigurierten Ignoredateien.

## 📋 Anforderungen

- Windows 10/11
- Git installiert
- PowerShell (für Umgebungsvariablen-Setup)

---

## ⚙️ Installation & Konfiguration

### 1. Script global verfügbar machen

Das Script muss zur Windows **PATH-Umgebungsvariable** hinzugefügt werden.

Lege ein Ordner auf deinen PC an wo du dir alle Scripte abspeichen tust. Von dort aus werden später diese Scripte von überall auf deinen PC verfügbar sein.

#### Option A: PowerShell (als Administrator)

```bash
[Environment]::SetEnvironmentVariable("PATH", "$env:PATH;C:\path\to\scripts", "User")
```

Nach Ausführung: Windows neustarten oder neue CMD öffnen.

#### Option B: Manuelle Einrichtung über GUI

1. `Win + Pause` → "Erweiterte Systemeinstellungen"
2. → "Umgebungsvariablen" 
3. → "Benutzervariablen" → "PATH" → "Bearbeiten"
4. → "Neu" → Pfad eintragen (z.B. `C:\path\to\scripts`)
5. → "OK" und Windows neustarten

---

### 2. Template-Verzeichnis konfigurieren

Das Script nutzt eine `TEMPLATE_DIR` Umgebungsvariable für Template-Dateien.

Kopiere den Inhalt aus _template in einen für dich passenden Ort und merk dir den PATH zu diesen.
Die Template Datein werden später als Vorlage kopiert und im nächsten Projekt eingefügt.

#### PowerShell (als Administrator)
```powershell
[Environment]::SetEnvironmentVariable("TEMPLATE_DIR", "C:\path\to\templates", "User")
```

#### Oder manuell:
1. `Win + Pause` → "Erweiterte Systemeinstellungen"
2. → "Umgebungsvariablen"
3. → "Benutzervariablen" → "Neu"
4. → Name: `TEMPLATE_DIR` 
5. → Wert: Pfad zu Template-Dateien (z.B. `C:\path\to\template`)
6. → "OK" und Windows neustarten

---

## 🎯 Verwendung

Navigator zum gewünschten Projektordner und starten Sie:

```bash
new-project
```

Das Script fragt dann nach einem Projektnamen und erstellt automatisch:
- ✅ Neue Projektordner-Struktur
- ✅ Ignoredateien (`.gitignore`, `.dockerignore`, `.claudeignore`)
- ✅ Konfigurationsdateien (`.env.example`)
- ✅ README mit Projektnamen
- ✅ Git-Repository 


---

## 📁 Projektstruktur

```
projektname/
├── main.py
├── .env.example
├── .gitignore
└── README.md
```
