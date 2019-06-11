public class Typography.HeaderBar : Gtk.HeaderBar {

    public Typography.Window main_window { get; construct; }

    public HeaderBar(Typography.Window window) {
        Object(
            main_window : window
        );
    }

    construct {
        show_close_button = true;

        var switcher = new Gtk.StackSwitcher();
        switcher.stack = main_window.stack;

        set_custom_title(switcher);
    }
}