# Define your project details
# Using Reverse Domain Name Notation (RDNN) as the project name
project(
    'com.github.LighthouseLogic.pathfinder', 
    'vala', 'c',
    version: '0.1.0',
    meson_version: '>= 0.59.0',
    default_options: [
        'warning_level=2',
    ],
)

# Set the Project ID globally to use in subdirectories
app_id = meson.project_name()

# 1. Define Dependencies
# These are the "building blocks" provided by elementary OS.
# Granite is essential for the native 'Portrait' and 'Line of Sight' UI components.
dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gtk+-3.0'),
    dependency('granite'), # The elementary OS specific library
]

# 2. Initialize the Source Directory
# This tells Meson to look into the 'src' folder for the compilation instructions.
subdir('src')

# 3. Handle Data Files (Optional but Recommended)
# If you have a 'data' folder for your .desktop or .appdata.xml files:
# subdir('data')
