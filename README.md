# Pathfinder 🧭

**Pathfinder** is a tool for enhanced decision making for the [elementary OS](https://elementary.io) ecosystem. 

Designed with the "LighthouseLogic" philosophy, Pathfinder aims to provide a clear path through complex decision landscapes by utilizing native Vala and the Granite framework for a seamless, high-performance desktop experience.

## ✨ Features
* **Native Performance:** Built with Vala and GTK for a lightweight footprint.
* **Elementary Integration:** Deeply integrated with the elementary OS stylesheet and Granite widgets.
* **Open Logic:** Commercial-grade open-source core designed for transparency and reliability.

## 🛠 Tech Stack
* **Language:** [Vala](https://vala.dev/)
* **Framework:** GTK 3 & [Granite](https://github.com/elementary/granite)
* **Build System:** Meson & Ninja
* **Target Platform:** elementary OS / Linux

## 🚀 Getting Started

### Prerequisites
To build Pathfinder on your machine (like a MacBook Air running elementary OS), you will need the following dependencies:
* `valac`
* `meson`
* `libgranite-dev`
* `libgtk-3-dev`

### Building from Source
```bash
# Clone the repository
git clone [https://github.com/LighthouseLogic/Pathfinder.git](https://github.com/LighthouseLogic/Pathfinder.git)
cd Pathfinder

# Set up the build directory
meson setup _build

# Compile the project
meson compile -C _build

# Run the application
./_build/src/com.github.LighthouseLogic.pathfinder
