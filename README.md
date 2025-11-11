# 🧩 gin-go-migration

**`gin-go-migration`** is a simple CLI tool for generating SQL migration files.  
It’s designed for **Golang** projects and works seamlessly on **macOS**, **Linux**, and **Windows (CMD / PowerShell / Git Bash)**.

---

### ⚙️ Features

- 🪶 Automatically generates `.up.sql` and `.down.sql` migration files with a timestamp format (`YYYYMMDDHHMMSS`)
- 📂 Saves generated files by default to `database/migrations/`
- 🧭 Supports custom output directory via the `-o` flag
- 🧠 Automatically detects project root (based on `.git` or `go.mod`)
- 💻 Runs on all OSes without requiring `./`
- 🧹 Comes with a built-in installer and uninstaller

---

### 🚀 Installation

Make sure the following files are in the same folder:

```
gin-go-migration
install.sh
```

### 🔧 macOS & Linux

```bash
chmod +x install.sh
./install.sh
```

This script will:
- Copy `gin-go-migration` to `/usr/local/bin`
- Make it executable
- Allow you to run it directly from any terminal

Example:
```bash
gin-go-migration create add_new_table
```

---

### 🪟 Windows

#### Option 1: Using **Git Bash**
```bash
chmod +x install.sh
./install.sh
```

This will:
- Install the script to `C:\Program Files\gin-go-migration`
- Create a `gin-go-migration.bat` wrapper so it can be run from CMD or PowerShell

After installation, you can use it directly from:
- **Git Bash**
- **PowerShell**
- **CMD**

Example:
```bash
gin-go-migration create add_new_table
```

#### Option 2: Manual (if not using Git Bash)
1. Copy the `gin-go-migration` file to:
   ```
   C:\Program Files\gin-go-migration
   ```
2. Add that folder to your **PATH environment variable**.
3. (Optional) Create a file `gin-go-migration.bat` containing:
   ```bat
   @echo off
   bash "%~dp0gin-go-migration" %*
   ```

---

## 🧹 Uninstallation

To uninstall, simply run:

```bash
./install.sh uninstall
```

This will remove:
- `/usr/local/bin/gin-go-migration` (macOS/Linux)
- `C:\Program Files\gin-go-migration\gin-go-migration` and `.bat` wrapper (Windows)

---

## 🧰 Usage

### 🧱 Create a new migration

```bash
gin-go-migration create add_new_table
```

Default output:
```
database/migrations/20251111224220_add_new_table.up.sql
database/migrations/20251111224220_add_new_table.down.sql
```

---

### 📂 Custom output directory

```bash
gin-go-migration create add_new_table -o ./sql/migrations
```

Output:
```
sql/migrations/20251111224220_add_new_table.up.sql
sql/migrations/20251111224220_add_new_table.down.sql
```

---

### ❓ Help

```bash
gin-go-migration help
```

Displays a list of available commands and usage examples.

---

## 🧾 Example Output

```
✅ Migration files created:
 - database/migrations/20251111224220_add_new_table.up.sql
 - database/migrations/20251111224220_add_new_table.down.sql
```

Example `.up.sql` content:
```sql
-- Migration: add_new_table
-- Created at: Tue Nov 11 22:42:20 WIB 2025

-- Write your UP SQL here
```

Example `.down.sql` content:
```sql
-- Rollback: add_new_table
-- Created at: Tue Nov 11 22:42:20 WIB 2025

-- Write your DOWN SQL here
```

---

## 🧠 Tips

- Make sure you run the script from the same folder as `install.sh`
- If the `gin-go-migration` command isn’t recognized after installation, **restart your terminal**
- Use `sudo` when installing on macOS/Linux if permission is required

---

## 📄 License

MIT License © 2025  
Built with ❤️
