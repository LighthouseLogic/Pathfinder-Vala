using Gtk;
using Granite;

namespace Pathfinder {
    public class MainWindow : Granite.Window {
        private Stack content_stack;
        private ListBox sidebar;

        public MainWindow (Gtk.Application app) {
            Object (
                application: app,
                title: "Pathfinder",
                default_width: 1000,
                default_height: 700
            );

            apply_custom_styling ();

            var root_hbox = new Box (Orientation.HORIZONTAL, 0);
            
            // --- LEFT SIDEBAR ---
            sidebar = new ListBox ();
            sidebar.get_style_context ().add_class ("sidebar");
            sidebar.width_request = 250;
            
            // --- RIGHT CONTENT AREA ---
            content_stack = new Stack ();
            content_stack.transition_type = StackTransitionType.SLIDE_UP_DOWN;
            content_stack.hexpand = true;

            // Define the 10 steps
            string[] steps = { 
                "1. Portrait", "2. Factors", "3. Leader Input", 
                "4. Brainstorm", "5. Themes", "6. Characteristics", 
                "7. Weights", "8. Scoring", "9. Weighted Scores", "10. Results" 
            };

            foreach (var step_name in steps) {
                sidebar.add (create_sidebar_row (step_name));
                // Add a placeholder or actual page for each step
                if (step_name == "1. Portrait") {
                    content_stack.add_named (new PortraitPage (), step_name);
                } else {
                    content_stack.add_named (new Label (step_name + " Content Coming Soon"), step_name);
                }
            }

            sidebar.row_selected.connect ((row) => {
                var label = (row.get_child () as Label);
                content_stack.set_visible_child_name (label.get_text ());
            });

            root_hbox.pack_start (sidebar, false, false, 0);
            root_hbox.pack_start (new Separator (Orientation.VERTICAL), false, false, 0);
            root_hbox.pack_start (content_stack, true, true, 0);

            add (root_hbox);
        }

        private ListBoxRow create_sidebar_row (string label_text) {
            var row = new ListBoxRow ();
            var label = new Label (label_text);
            label.margin = 12;
            label.halign = Align.START;
            label.get_style_context ().add_class ("sidebar-label");
            row.add (label);
            return row;
        }

        private void apply_custom_styling () {
            var provider = new CssProvider ();
            provider.load_from_data ("""
                window, .sidebar, stack { background-color: #000000; }
                .sidebar { border-right: 1px solid #00FF00; }
                .sidebar-label { color: #00FF00; font-weight: bold; }
                ListBoxRow:selected { background-color: #004400; }
                ListBoxRow:hover { background-color: #002200; }
                separator { background-color: #00FF00; }
            """);
            StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, STYLE_PROVIDER_PRIORITY_APPLICATION);
        }
    }
}
