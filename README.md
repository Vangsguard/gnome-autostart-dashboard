# Linux Startup Dashboard

A simple setup to launch a beautiful terminal-based dashboard on system startup using **WezTerm**. It is specifically designed to work with Tiling Window Managers (like Pop Shell, Tiling Assistant, or i3) by using timed execution to ensure windows split into a "Master/Stack" layout rather than simple columns.

![Layout Example](https://via.placeholder.com/800x450.png?text=Master+and+Stack+Layout+Dashboard)

## 🚀 Features
- **Perfect Tiling:** Uses `sleep` intervals to ensure the Window Manager correctly tiles separate windows.
- **Visual Gaps & Blur:** By spawning separate windows (rather than internal panes), you maintain your system's native gaps and background blur.
- **Automated:** One script handles the pathing, shell aliases, and sequencing.

## 📋 Prerequisites
- **Terminal:** [WezTerm](https://wezfurlong.org/wezterm/)
- **CLI Tools:** `cava`, `btop`, and `fastfetch` (or your preferred fetch tool).
- **Environment:** A Tiling Window Manager or a GNOME tiling extension.

## 🛠️ Installation

### 1. The Startup Script
Save `start_my_terminals.sh` to your local bin folder. This script handles the timing to ensure your layout doesn't break during the "race condition" of system startup.

```bash
mkdir -p ~/.local/bin
# Move the script to ~/.local/bin/start_my_terminals.sh
chmod +x ~/.local/bin/start_my_terminals.sh
```

### 2. The Autostart Entry
To make this run when you log in, create a `.desktop` file in your autostart directory:

```bash
mkdir -p ~/.config/autostart
# Create ~/.config/autostart/startup_terminals.desktop
```

**Paste the following into the file:**
(Make sure to replace `USERNAME` with your own username)

```ini
[Desktop Entry]
Type=Application
Name=Startup Terminals
Exec=/home/USERNAME/.local/bin/start_my_terminals.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Comment=Launch separate WezTerm windows with delays for proper tiling
```

## ⚙️ Customization

### Adjusting the Layout
The script uses a "sequential focus" logic. 
1. The first window becomes the **Master** (Left).
2. The second window splits the master to become the **Top Right**.
3. The third window splits the second to become the **Bottom Right**.

If your windows are appearing in the wrong order or as three vertical columns, increase the `sleep` duration in `start_my_terminals.sh`:
```bash
sleep 2  # Increase if the window manager is too slow to register new windows
```

### Fastfetch Script
If you are using a custom fastfetch alias, ensure the path in `start_my_terminals.sh` points directly to your `.sh` script, as desktop entries cannot read shell aliases.

---
