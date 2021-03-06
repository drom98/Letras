public class Letras.Window : Gtk.ApplicationWindow {
    public weak Letras.Application app { get; construct; }

    public GLib.Settings settings;
    public Gtk.Stack stack { get; set; }

    private Letras.Welcome welcome_screen;
    private Letras.ActionManager action_manager;

    public Window(Letras.Application letras_app) {
        Object(
            application: letras_app,
            app: letras_app
        );
    }

    construct {
        set_default_size (800, 800);

        settings = new GLib.Settings ("com.github.drom98.letras");
        move(settings.get_int("pos-x"), settings.get_int("pos-y"));
        resize(settings.get_int("window-width"), settings.get_int("window-height"));

        delete_event.connect ( e => {
            return save_state ();
        });

        action_manager = new Letras.ActionManager(app, this);

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
}