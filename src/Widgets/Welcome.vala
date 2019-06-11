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

        activated.connect ( index => {
            switch (index) {
                case 0:
                    Letras.ActionManager.action_from_group (Letras.ActionManager.ACTION_OPEN, main_window.get_action_group ("win"));
                break;
                case 1:
                    print("1");
                break;
            }
        });
    }
}