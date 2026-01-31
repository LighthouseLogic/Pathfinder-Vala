# Define the source files for Pathfinder
sources = files(
    'Application.vala',
    'MainWindow.vala',
    'PortraitPage.vala',
    'StorageManager.vala'
)

# Create the executable
executable(
    app_id,
    sources,
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite'),
        dependency('gdk-3.0') # Added for the CSS styling
    ],
    install: true
)
