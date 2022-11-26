import net.sf.clipsrules.jni.*;

import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main (String[] args) throws CLIPSException {
        Environment clips = new Environment();
        CaptureRouter router = new CaptureRouter(clips, new String[] {Router.STDOUT});

        System.out.println("Loading facts to working memory");
        clips.load("clips_src/flags.clp");
        System.out.println("Loaded flags.clp");
        clips.reset();
        System.out.println("Loaded working memory");
        System.out.println();

        System.out.println("Querying available colors");
        clips.load("clips_src/colors.clp");
        System.out.println("Loaded colors.clp");
        System.out.println("Available colors:");
        clips.run();
        System.out.println(router.getOutput());
        router.clear();

        System.out.println("Setting up queries");
        clips.load("clips_src/queries.clp");
        System.out.println("Loaded queries.clp");
        System.out.println();

        String color;
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.println("Enter a color to query (or exit to quit):");
            color = scanner.nextLine();
            if (color.equalsIgnoreCase("exit")) {
                break;
            }

            System.out.println("Querying for " + color);
            clips.eval("(assert (query " + color + "))");
            clips.run();
            System.out.println(router.getOutput());
            router.clear();
        }
    }
}
