public class MainWindow : Granite.Window {
        public MainWindow (Gtk.Application app) {
            Object (
                application: app,
                title: "Pathfinder - Portrait",
                default_width: 800,
                default_height: 700
            );

            apply_custom_styling ();

            var scrolled = new Gtk.ScrolledWindow (null, null);
            var content_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 24);
            content_box.margin = 20;

            // --- SECTION 1: Line of Sight ---
            content_box.pack_start (create_section_header ("Line of sight - what you see"), false, false, 0);
            content_box.pack_start (create_input_field ("What are your strategic goals?", "Describe your understanding of winning..."), false, false, 0);

            // --- SECTION 2: Critical Issue ---
            content_box.pack_start (create_section_header ("Critical Issue"), false, false, 0);
            content_box.pack_start (create_input_field ("Define the Critical Issue", "Authority, data access, and impact..."), false, false, 0);

            // --- SECTION 3: Issue Assessment ---
            content_box.pack_start (create_section_header ("Issue Assessment"), false, false, 0);
            
            // Adding the Dropdown Fields for Step 8 of your framework
            content_box.pack_start (create_rating_field ("Urgency", "How quickly does this need to be addressed?"), false, false, 0);
            content_box.pack_start (create_rating_field ("Uncertainty", "How volatile is the situation?"), false, false, 0);
            content_box.pack_start (create_rating_field ("Impact", "Effect on business success (Min: Medium)"), false, false, 0);

            scrolled.add (content_box);
            add (scrolled);
        }

        private Gtk.Widget create_section_header (string title) {
            var label = new Gtk.Label (title.up ());
            label.halign = Gtk.Align.START;
            label.get_style_context ().add_class ("section-header");
            return label;
        }

        private Gtk.Widget create_input_field (string question, string placeholder) {
            var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 8);
            var q_label = new Gtk.Label (question);
            q_label.halign = Gtk.Align.START;
            q_label.get_style_context ().add_class ("question-text");

            var entry = new Gtk.Entry ();
            entry.placeholder_text = placeholder;
            entry.get_style_context ().add_class ("green-widget");

            box.pack_start (q_label, false, false, 0);
            box.pack_start (entry, false, false, 0);
            return box;
        }

        // New method for Rating Dropdowns
        private Gtk.Widget create_rating_field (string question, string description) {
            var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 8);
            
            var q_label = new Gtk.Label (question);
            q_label.halign = Gtk.Align.START;
            q_label.get_style_context ().add_class ("question-text");

            var desc_label = new Gtk.Label (description);
            desc_label.halign = Gtk.Align.START;
            desc_label.get_style_context ().add_class ("description-text");

            var combo = new Gtk.ComboBoxText ();
            combo.append_text ("Low");
            combo.append_text ("Medium");
            combo.append_text ("High");
            combo.active = 1; // Default to Medium
            combo.get_style_context ().add_class ("green-widget");

            box.pack_start (q_label, false, false, 0);
            box.pack_start (desc_label, false, false, 0);
            box.pack_start (combo, false, false, 0);
            return box;
        }

        private void apply_custom_styling () {
            var provider = new Gtk.CssProvider ();
            provider.load_from_data ("""
                window, scrolledwindow, viewport {
                    background-color: #000000;
                }
                .section-header {
                    color: #00FF00;
                    font-weight: bold;
                    font-size: 1.2em;
                    border-bottom: 2px solid #00FF00;
                    margin-bottom: 10px;
                }
                .question-text {
                    color: #00FF00;
                    font-weight: bold;
                }
                .description-text {
                    color: #008800; /* Dimmer green for descriptions */
                    font-size: 0.9em;
                }
                .green-widget {
                    background-color: #000000;
                    color: #00FF00;
                    border: 1px solid #00FF00;
                    border-radius: 0;
                }
                /* Styling the dropdown menu internally */
                combobox window, combobox menu {
                    background-color: #000000;
                    border: 1px solid #00FF00;
                    color: #00FF00;
                }
            """);

            Gtk.StyleContext.add_provider_for_screen (
                Gdk.Screen.get_default (),
                provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            );
        }
    }
}
