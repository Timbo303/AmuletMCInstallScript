#!/bin/bash


# 1. Update system package index and install required build tools (Linux example)
# Note: On macOS, use 'brew install cmake' and 'xcode-select --install' instead.
echo "Installing build dependencies..."
if command -v apt-get &> /dev/null; then
	echo "Debian-based system detected."
	sudo apt-get update && upgrade -y
	curl -LsSf https://astral.sh/uv/install.sh | sh
    uv python install 3.12
	sudo apt-get update
	sudo apt-get install -y cmake build-essential git libgtk-3-dev pkg-config
#elif command -v dnf &> /dev/null; then
    #echo "Red Hat-based system detected. Building on Fedora is currently broken due to a bug I can't figure out how to fix."
    #sudo dnf install -y @development-tools
    #sudo dnf install -y cmake python3.12-devel git gtk3-devel pkgconfig gcc-c++ gawk
#elif command -v pacman &> /dev/null; then
    #echo "Arch-based system detected. Work in progress"
    #sudo pacman -Syu --needed git cmake base-devel python3.12 pkgconf gtk3
else
    echo "Unsupported package manager. Work in progress for Arch. Fedora builds are bugged at rocksdb compiling currently. Exiting."
    exit 1
fi

# 2. Create and activate a Python virtual environment
echo "Creating Python virtual environment..."
uv venv
source .venv/bin/activate

# 3. Upgrade pip, setuptools, and wheel
echo "Upgrading pip..."
uv pip install --upgrade pip setuptools wheel

# 4. Install Amulet dependencies (wxPython is required for the GUI)
echo "Installing wxPython and dependencies..."
uv pip install -U wxPython --verbose

# 5. Install the latest Amulet Map Editor from PyPI
echo "Installing Amulet Map Editor..."
export CXXFLAGS+=" -Wno-error=maybe-uninitialized"
uv pip install --upgrade amulet-map-editor --verbose

echo "Installation complete!"
echo "You can launch the editor anytime by activating the environment and running: uv amulet_map_editor"
