public class Letras.Window : Gtk.ApplicationWindow {

    public GLib.Settings settings;
    public Gtk.Stack stack { get; set; }

    private Letras.Welcome welcome_screen;

    public SimpleActionGroup actions { get; construct; }

    public const string ACTION_OPEN = "action_open";
    public const string ACTION_OPEN_FOLDER = "action_open_folder";

    private const ActionEntry[] action_entries = {
        { ACTION_OPEN, action_open },
        { ACTION_OPEN_FOLDER, action_open_folder }
    };

    public Window(Application app) {
        Object(
            application: app
        );
    }

    construct {
        set_default_size (800, 800);

        actions = new SimpleActionGroup ();
        actions.add_action_entries (action_entries, this);

        settings = new GLib.Settings ("com.github.drom98.letras");
        move(settings.get_int("pos-x"), settings.get_int("pos-y"));
        resize(settings.get_int("window-width"), settings.get_int("window-height"));

        delete_event.connect ( e => {
            return save_state ();
        });

        //var welcome_screen = new Letras.Welcome (this);
        welcome_screen = new Letras.Welcome(this);

        stack = new Gtk.Stack ();
        stack.transition_type = Gtk.StackTransitionType.SLIDE_LEFT_RIGHT;
        stack.expand = true;
        var install_fonts = new Gtk.Grid ();
        install_fonts.add ( welcome_screen );
        var view_fonts = new Gtk.Grid ();
        view_fonts.add( new Gtk.Label("View fonts page"));

        stack.add_titled(install_fonts, "install fonts", "Install fonts");
        stack.add_titled(view_fonts, "view fonts", "View installed");

        add(stack);

        var headerbar = new Letras.HeaderBar (this);
        set_titlebar (headerbar);

        show_all ();
    }

    public bool save_state() {
        int width, height, x, y;
        get_size(out width, out height);
        get_position(out x, out y);
        settings.set_int("pos-x", x);
        settings.set_int("pos-y", y);
        settings.set_int("window-width", width);
        settings.set_int("window-height", height);

        return false;
    }

    private void action_open() {
        var files_filter = new Gtk.FileFilter ();
        files_filter.set_filter_name ("Font files");
        files_filter.add_mime_type ("font-x-generic/*");

        var file_chooser = new Gtk.FileChooserNative (
            "Open font file",
            this,
            Gtk.FileChooserAction.OPEN,
            "Open", "Cancel"
        );
        file_chooser.add_filter (files_filter);
        file_chooser.select_multiple = false;
        file_chooser.set_current_folder_uri (GLib.Environment.get_home_dir ());
    }

    private void action_open_folder() {
        return;
    }
}