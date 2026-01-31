using Gtk;
using Granite;

namespace Pathfinder {
    public class PortraitPage : Gtk.ScrolledWindow {
        private StorageManager storage;

        public PortraitPage (StorageManager storage_manager) {
            Object (
                hscrollbar_policy: PolicyType.NEVER,
                vscrollbar_policy: PolicyType.AUTOMATIC
            );
            
            this.storage = storage_manager;

            var content_box = new Box (Orientation.VERTICAL, 30);
            content_box.margin = 30;

            // --- SECTION 1: Line of sight ---
            content_box.pack_start (create_section_header ("I. Line of sight - what you see"), false, false, 0);
            content_box.pack_start (create_input_field ("strat_goals", "What are your strategic goals?", "Describe your understanding of winning..."), false, false, 0);
            content_box.pack_start (create_input_field ("contribution", "How do you contribute to these goals?", "Describe your functional area's support..."), false, false, 0);

            // --- SECTION 2: Critical Issue ---
            content_box.pack_start (create_section_header ("II. Critical Issue"), false, false, 0);
            content_box.pack_start (create_input_field ("critical_issue", "Define the Critical Issue", "Authority, data access, and impact..."), false, false, 0);

            // --- SECTION 3: Issue Assessment ---
            content_box.pack_start (create_section_header ("III. Issue Assessment"), false, false, 0);
            content_box.pack_start (create_rating_row ("urgency", "Urgency", "How quickly does this need to be addressed?"), false, false, 0);
            content_box.pack_start (create_rating_row ("uncertainty", "Uncertainty", "How volatile is the situation?"), false, false, 0);
            content_box.pack_start (create_rating_row ("impact", "Impact", "Effect on business success..."), false, false, 0);

            add (content_box);
            show_all ();
        }

        private Widget create_section_header (string title) {
            var label = new Label (title.up ());
            label.halign = Align.START;
            label.get_style_context ().add_class ("section-header");
            return label;
        }

        private Widget create_input_field (string id, string question, string prompt) {
            var box = new Box (Orientation.VERTICAL, 10);
            var q_label = new Label (question);
            q_label.halign = Align.START;
            q_label.get_style_context ().add_class ("prompt-text");

            var entry = new Entry ();
            entry.placeholder_text = prompt;
            entry.get_style_context ().add_class ("green-field");

            // SAVING LOGIC: Save to local storage whenever text changes
            entry.changed.connect (() => {
                storage.save_data (id, entry.get_text ());
            });

            box.pack_start (q_label, false, false, 0);
            box.pack_start (entry, false, false, 0);
            return box;
        }

        private Widget create_rating_row (string id, string question, string description) {
            var box = new Box (Orientation.VERTICAL, 10);
            var q_label = new Label (question);
            q_label.get_style_context ().add_class ("prompt-text");
            q_label.halign = Align.START;

            var combo = new ComboBoxText ();
            combo.append_text ("Low");
            combo.append_text ("Medium");
            combo.append_text ("High");
            combo.get_style_context ().add_class ("green-field");

            // SAVING LOGIC: Save selection
            combo.changed.connect (() => {
                storage.save_data (id, combo.get_active_text ());
            });

            box.pack_start (q_label, false, false, 0);
            box.pack_start (combo, false, false, 0);
            return box;
        }
    }
}
