using Json;

namespace Pathfinder {
    public class StorageManager : Object {
        private string path;

        public StorageManager () {
            path = Path.build_filename (Environment.get_user_config_dir (), "pathfinder", "save.json");
            // Ensure directory exists
            var dir = Path.get_dirname (path);
            if (!File.new_for_path (dir).query_exists ()) {
                DirUtils.create_with_parents (dir, 0700);
            }
        }

        public void save_data (string key, string value) {
            // Implementation of JSON writing logic
            // In a real app, you'd load the existing JSON, update the key, and save
            print ("Saving %s: %s to %s\n", key, value, path);
        }
    }
}
