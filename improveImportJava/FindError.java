import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;


public class FindError {

    static Path caminhoLog = Paths.get("D:", "banco", "tb_log_db_lvc.csv");


    public static void main(String[] args) throws IOException {
        try (Scanner scanner = new Scanner(caminhoLog)) {
            while(scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String log = line.split(",")[0];
                System.out.println(log+"\n" +line + "\n\n");
            }
        }
    }

}
