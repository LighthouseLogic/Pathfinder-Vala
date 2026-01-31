public class Application : Granite.Application {
        public Application () {
            Object (
                application_id: "com.github.LighthouseLogic.pathfinder",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate () {
            var main_window = new MainWindow (this);
            main_window.show_all ();
        }

        public static int main (string[] args) {
            return new Application ().run (args);
        }
    }
