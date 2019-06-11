public class Typography.Window : Gtk.ApplicationWindow {

    public GLib.Settings settings;
    public Gtk.Stack stack { get; set; }

    public Window(Application app) {
        Object(
            application: app
        );
    }

    construct {
        set_default_size(350, 90);

        stack = new Gtk.Stack();
        stack.expand = true;
        var install_fonts = new Gtk.Grid();
        install_fonts.add( new Gtk.Label("Install fonts page"));
        var view_fonts = new Gtk.Grid();
        view_fonts.add( new Gtk.Label("View fonts page"));

        stack.add_titled(install_fonts, "install fonts", "Install");
        stack.add_titled(view_fonts, "view fonts", "View");

        add(stack);

        var headerbar = new Typography.HeaderBar(this);
        set_titlebar(headerbar);

        show_all();
    }
}