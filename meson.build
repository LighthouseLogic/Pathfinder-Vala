# Define your project details
project(
    'com.github.LighthouseLogic.pathfinder', 
    'vala', 'c',
    version: '0.1.0',
    meson_version: '>= 0.59.0',
    default_options: [
        'warning_level=2',
    ],
)

# 1. Define Dependencies
# These are the "building blocks" provided by elementary OS
dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gtk+-3.0'),
    dependency('granite'), # The elementary OS specific library
]

# 2. Initialize the Source Directory
# This tells Meson to go look into the 'src' folder for more instructions
subdir('src')
