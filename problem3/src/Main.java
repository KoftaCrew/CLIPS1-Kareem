import net.sf.clipsrules.jni.*;

import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main (String[] args) throws CLIPSException {
        Environment clips = new Environment();

        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter input file path:");
        String inPath = scanner.nextLine();
        inPath = inPath.replace("\\", "\\\\");

        System.out.println("Enter output file path:");
        String outPath = scanner.nextLine();
        outPath = outPath.replace("\\", "\\\\");

        System.out.println("Loading clips rules...");
        clips.load("clips_src/rules.clp");

        System.out.println("Asserting paths...");
        clips.assertString("(input \"" + inPath + "\")");
        clips.assertString("(output \"" + outPath + "\")");

        System.out.println("Running rules...");
        clips.run();

        System.out.println("Done, check your output file.");
    }
}
