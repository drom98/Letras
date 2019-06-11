public class Typography.Window : Gtk.ApplicationWindow {

    public GLib.Settings settings;

    public Window(Application app) {
        Object(
            application: app
        );
    }

    construct {
        set_default_size(350, 90);

        var headerbar = new Typography.HeaderBar(this);
        set_titlebar(headerbar);

        show_all();
    }
}