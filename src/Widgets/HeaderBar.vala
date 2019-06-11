public class Typography.HeaderBar : Gtk.HeaderBar {

    public Typography.Window main_window { get; construct; }

    public HeaderBar(Typography.Window window) {
        Object(
            main_window : window
        );
    }

    construct {
        show_close_button = true;

        title = "Letras";
        subtitle = "Install some fonts";
    }
}