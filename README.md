# 🧩 gin-go-migration 

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

**gin-go-migration** is a lightweight Bash-based CLI tool inspired by php artisan, designed to simplify SQL-based database migrations for Golang projects.

---

### 📦 Features

- Automatically generates timestamped .up.sql and .down.sql migration files.
- Supports running migrations via [golang-migrate](https://github.com/golang-migrate/migrate).
- Works seamlessly on Windows, macOS, and Linux.
- Allows custom database connection parameters.

---

### 🚀 Installation

Make sure the following files are in the same folder:

```
gin-go-migration
install.sh
```

### macOS & Linux

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
gin-go-migration help
```

---

### Windows

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
gin-go-migration help
```

#### Option 2: Manual (if not using Git Bash)
1. Copy the `gin-go-migration` file to:
   ```
   C:\Program Files\gin-go-migration
   ```
2. Add that folder to your **PATH environment variable**.

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

## 🚀 Usage

### 1. Create a New Migration File

```bash
gin-go-migration create add_new_table
```
This will generate two files inside the `database/migrations/` folder:
Default output:
```
database/migrations/20251111224220_add_new_table.up.sql
database/migrations/20251111224220_add_new_table.down.sql
```

#### 📂 Custom output directory

```bash
gin-go-migration create add_new_table -o ./sql/migrations
```

Output:
```
sql/migrations/20251111224220_add_new_table.up.sql
sql/migrations/20251111224220_add_new_table.down.sql
```


### 2. Run Migrations
The following command executes migrations using go-migrate:
```
gin-go-migration migrate -s database/migrations -db postgres -u mintegra -p 'password' -port 5434 -ssl disable up
```
Expected output:
```
Running migration...
Migrating from: database/migrations
Database: postgres://mintegra:password@localhost:5434/yourdb?sslmode=disable
Migration successful!
```

### 3. Rollback Migrations
To rollback one migration step:
```
gin-go-migration migrate -s database/migrations -db postgres -u mintegra -p 'password' -port 5434 -ssl disable down -1
```

### 4. Update
Checking for the lastest version, then download it.

```
gin-go-migration update
```

### 5. Update
Checking for the current version installed.

```
gin-go-migration version
```

### 6. Help
```bash
gin-go-migration help
```

Displays a list of available commands and usage examples.

---
## Notes

- The script automatically checks if go-migrate (from golang-migrate) is installed.
If not found, it will show: 

   ```
   [ERROR] go-migrate not found in the system.
   Please install it with:
   go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
   ```
- Default migration directory is `database/migrations`.

---

## 🧠 Tips

- Make sure you run the script from the same folder as `install.sh`
- If the `gin-go-migration` command isn’t recognized after installation, **restart your terminal**
- Use `sudo` when installing on macOS/Linux if permission is required

---

Built with ❤️
