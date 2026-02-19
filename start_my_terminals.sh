#!/bin/bash

# 1. Start the Master Window (FastFetch)
# We use 'setsid' to detach it completely, preventing process grouping issues
setsid wezterm start -- /home/USERNAME/.local/bin/fastfetch_auto.sh &

# Wait for the window to appear and take focus (Critical step)
sleep 2

# 2. Start the Top-Right Window (Cava)
# Since the first window is focused, this will split the screen 50/50
setsid wezterm start -- cava &

# Wait for Cava to appear and take focus
sleep 2

# 3. Start the Bottom-Right Window (Btop)
# Since Cava is now the focused window, this should split Cava in half
setsid wezterm start -- btop &
