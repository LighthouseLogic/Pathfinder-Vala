using Gtk;
using Granite;

namespace Pathfinder {
    public class MainWindow : Granite.Window {
        private Stack content_stack;
        private ListBox sidebar;
        private StorageManager storage;

        public MainWindow (Gtk.Application app) {
            Object (
                application: app,
                title: "Project Pathfinder",
                default_width: 1000,
                default_height: 700
            );

            // 1. Initialize the Storage Manager
            storage = new StorageManager ();

            apply_custom_styling ();

            var root_hbox = new Box (Orientation.HORIZONTAL, 0);
            
            // 2. Setup the Sidebar
            sidebar = new ListBox ();
            sidebar.get_style_context ().add_class ("sidebar");
            sidebar.width_request = 250;
            
            // 3. Setup the Content Stack
            content_stack = new Stack ();
            content_stack.transition_type = StackTransitionType.SLIDE_LEFT_RIGHT;
            content_stack.hexpand = true;

            // 4. Create the Navigation Rows
            // We pass the 'storage' instance to the PortraitPage so it can save data
            var portrait_page = new PortraitPage (storage);
            
            add_step ("1. Portrait", portrait_page);
            add_step ("2. Factors", new Label ("Factors Content Coming Soon"));
            add_step ("3. Leader Input", new Label ("Leader Input Content Coming Soon"));
            add_step ("4. Brainstorm", new Label ("Brainstorming Content Coming Soon"));

            // 5. Connect Sidebar to Stack
            sidebar.row_selected.connect ((row) => {
                if (row != null) {
                    var label = (row.get_child () as Label);
                    content_stack.set_visible_child_name (label.get_text ());
                }
            });

            // Select the first row by default
            sidebar.select_row (sidebar.get_row_at_index (0));

            root_hbox.pack_start (sidebar, false, false, 0);
            root_hbox.pack_start (new Separator (Orientation.VERTICAL), false, false, 0);
            root_hbox.pack_start (content_stack, true, true, 0);

            add (root_hbox);
        }

        private void add_step (string name, Widget page) {
            var row = new ListBoxRow ();
            var label = new Label (name);
            label.margin = 12;
            label.halign = Align.START;
            label.get_style_context ().add_class ("sidebar-label");
            row.add (label);
            
            sidebar.add (row);
            content_stack.add_named (page, name);
        }

        private void apply_custom_styling () {
            var provider = new CssProvider ();
            provider.load_from_data ("""
                window, .sidebar, stack, viewport, scrolledwindow { 
                    background-color: #000000; 
                }
                .sidebar { 
                    border-right: 1px solid #00FF00; 
                }
                .sidebar-label { 
                    color: #00FF00; 
                    font-weight: bold; 
                }
                ListBoxRow {
                    background-color: #000000;
                }
                ListBoxRow:selected { 
                    background-color: #004400; 
                }
                ListBoxRow:hover { 
                    background-color: #002200; 
                }
                separator { 
                    background-color: #00FF00; 
                }
            """);
            StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, STYLE_PROVIDER_PRIORITY_APPLICATION);
        }
    }
}
