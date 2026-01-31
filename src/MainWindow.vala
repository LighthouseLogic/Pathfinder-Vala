using Gtk;
using Granite;

namespace Pathfinder {
    public class MainWindow : Granite.Window {
        public MainWindow (Gtk.Application app) {
            Object (
                application: app,
                title: "Project Pathfinder - Portrait",
                default_width: 800,
                default_height: 800
            );

            apply_custom_styling ();

            var scrolled = new Gtk.ScrolledWindow (null, null);
            var content_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 30);
            content_box.margin = 30;

            // --- SECTION 1: Line of sight - what you see ---
            content_box.pack_start (create_section_header ("I. Line of sight - what you see"), false, false, 0);
            
            content_box.pack_start (create_input_field (
                "What are your strategic goals?", 
                "In your own words, state your understanding of what you are trying to do to win..."
            ), false, false, 0);

            content_box.pack_start (create_input_field (
                "How do you contribute to the achievement of those goals?", 
                "Describe how you, or your functional area, supports the organization’s goals..."
            ), false, false, 0);

            // --- SECTION 2: Critical Issue ---
            content_box.pack_start (create_section_header ("II. Critical Issue"), false, false, 0);
            
            content_box.pack_start (create_input_field (
                "Define the Critical Issue", 
                "Address strategic goals, ensure authority, and verify access to relevant data..."
            ), false, false, 0);

            // --- SECTION 3: Issue Assessment ---
            content_box.pack_start (create_section_header ("III. Issue Assessment"), false, false, 0);
            
            // Dropdowns for Step 8: Scoring the context
            content_box.pack_start (create_rating_row (
                "Urgency", 
                "How quickly does this issue need to be addressed?"
            ), false, false, 0);

            content_box.pack_start (create_rating_row (
                "Uncertainty", 
                "How volatile or unpredictable is the situation surrounding your issue?"
            ), false, false, 0);

            content_box.pack_start (create_rating_row (
                "Impact", 
                "How profoundly will this issue effect your organization’s continued business success?"
            ), false, false, 0);

            scrolled.add (content_box);
            add (scrolled);
        }

        private Gtk.Widget create_section_header (string title) {
            var label = new Gtk.Label (title.up ());
            label.halign = Gtk.Align.START;
            label.get_style_context ().add_class ("section-header");
            return label;
        }

        private Gtk.Widget create_input_field (string question, string prompt) {
            var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 10);
            
            var q_label = new Gtk.Label (question);
            q_label.halign = Gtk.Align.START;
            q_label.get_style_context ().add_class ("prompt-text");

            var p_label = new Gtk.Label (prompt);
            p_label.halign = Gtk.Align.START;
            p_label.wrap = true;
            p_label.get_style_context ().add_class ("description-text");

            var entry = new Gtk.Entry ();
            entry.get_style_context ().add_class ("green-field");

            box.pack_start (q_label, false, false, 0);
            box.pack_start (p_label, false, false, 0);
            box.pack_start (entry, false, false, 0);
            return box;
        }

        private Gtk.Widget create_rating_row (string question, string description) {
            var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 10);

            var q_label = new Gtk.Label (question);
            q_label.halign = Gtk.Align.START;
            q_label.get_style_context ().add_class ("prompt-text");

            var d_label = new Gtk.Label (description);
            d_label.halign = Gtk.Align.START;
            d_label.wrap = true;
            d_label.get_style_context ().add_class ("description-text");

            var combo = new Gtk.ComboBoxText ();
            combo.append_text ("Low");
            combo.append_text ("Medium");
            combo.append_text ("High");
            combo.active = 1; // Default to Medium
            combo.get_style_context ().add_class ("green-field");

            box.pack_start (q_label, false, false, 0);
            box.pack_start (d_label, false, false, 0);
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
                    font-size: 14pt;
                    border-bottom: 2px solid #00FF00;
                    margin-bottom: 15px;
                }
                .prompt-text {
                    color: #00FF00;
                    font-weight: bold;
                }
                .description-text {
                    color: #00AA00;
                    font-style: italic;
                    margin-left: 10px;
                }
                .green-field {
                    background-color: #000000;
                    color: #00FF00;
                    border: 1px solid #00FF00;
                    caret-color: #00FF00;
                }
                /* Ensure dropdown menus are also black/green */
                combobox menu, combobox window {
                    background-color: #000000;
                    color: #00FF00;
                    border: 1px solid #00FF00;
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
