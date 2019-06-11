public class Letras.HeaderBar : Gtk.HeaderBar {

    public Letras.Window main_window { get; construct; }
    private Gtk.SearchEntry search_entry;

    public HeaderBar(Letras.Window window) {
        Object(
            main_window: window
        );
    }

    construct {
        show_close_button = true;

        var switcher = new Gtk.StackSwitcher();
        switcher.stack = main_window.stack;

        search_entry = new Gtk.SearchEntry ();
        search_entry.expand = true;
        search_entry.placeholder_text = "Search installed fonts";
        search_entry.valign = Gtk.Align.CENTER;

        set_custom_title(switcher);
        pack_end(search_entry);
    }
}