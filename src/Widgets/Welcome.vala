public class Letras.Welcome : Granite.Widgets.Welcome {

    public unowned Letras.Window main_window { get; construct; }

    public Welcome (Letras.Window window) {
        Object (
            main_window: window,
            title: "Install some fonts",
            subtitle: "Select a file or open a folder."
        );
    }

    construct {
        append ("font-x-generic", "Select file", "Select a font file from your computer.");
        append ("folder", "Open folder", "Open a folder from your computer.");

        //add(welcome_screen);
        
        activated.connect ((i) => {
            switch (i) {
                case 0: 
                    try {
                        
                    } catch (Error e) {
                        warning (e.message);
                    }
            }
        });
    }
}