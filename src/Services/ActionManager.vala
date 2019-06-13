public class Letras.ActionManager : Object {
    public weak Letras.Application app { get; construct; }
    public weak Letras.Window window { get; construct; }

    public SimpleActionGroup actions { get; construct; }

    private string local_fonts = GLib.File.new_build_filename (GLib.Environment.get_user_data_dir (), "fonts").get_parse_name ();

    public const string ACTION_PREFIX = "win.";
    public const string ACTION_OPEN = "action_open";
    public const string ACTION_OPEN_FOLDER = "action_open_folder";

    private const ActionEntry[] action_entries = {
        {ACTION_OPEN, action_open},
        {ACTION_OPEN_FOLDER, action_open_folder},
    };

    public ActionManager (Letras.Application letras_app, Letras.Window main_window) {
        Object (
            app: letras_app,
            window: main_window
        );
    }

    construct {
        actions = new SimpleActionGroup ();
        actions.add_action_entries (action_entries, this);
        window.insert_action_group ("win", actions);
    }

    public void action_open() {
        var files_filter = new Gtk.FileFilter ();
        files_filter.set_filter_name ("Font files");
        files_filter.add_mime_type ("font/*");

        var file_chooser = new Gtk.FileChooserNative (
            "Open font file",
            window,
            Gtk.FileChooserAction.OPEN,
            "Open", "Cancel"
        );
        file_chooser.add_filter (files_filter);
        file_chooser.select_multiple = true;
        file_chooser.set_current_folder_uri (GLib.Environment.get_home_dir ());

        var response = file_chooser.run ();
        file_chooser.destroy();

        if (response == Gtk.ResponseType.ACCEPT) {

            foreach (string uri in file_chooser.get_uris ()) {
                print(uri);
                print(local_fonts);
                if (copy (uri, local_fonts)) {
                    print("Copiado com sucesso.");
                }
            }
        }
    }

    public void action_open_folder() {
        return;
    }

    public static bool copy (string path, string dest) {
        var file = File.new_for_path (path);
        var dest_folder = File.new_for_path (dest);
        try {
            file.copy (dest_folder, FileCopyFlags.NONE);
            return true;
        } catch (Error e) {
            //display error dialog
            warning (e.message);
            return false;
        }
    }

    public static void action_from_group(string action_name, ActionGroup? action_group) {
        action_group.activate_action (action_name, null);
    }
}