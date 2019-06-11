public class Letras.Welcome : Gtk.Grid {

    public Letras.Window main_window { get; construct; }

    public Welcome(Letras.Window window) {
        Object(
            main_window: window
        );
    }

    construct {
        var welcome_screen = new Granite.Widgets.Welcome("Install some fonts", "Select a file or open a folder.");
        welcome_screen.append ("font-x-generic", "Select file", "Select a font file from your computer.");
        welcome_screen.append ("folder", "Open folder", "Open a folder from your computer.");

        add(welcome_screen);
        
        welcome_screen.activated.connect ((i) => {

        });
    }
}