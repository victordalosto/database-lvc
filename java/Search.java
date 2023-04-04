import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;


public class Search {

    static Path pathLogs = Paths.get("D:", "banco", "tb_ocorrencia_log_novo.csv");
    

    public static void main(String[] args) throws IOException {
        run();
    }


    public static void run() throws IOException {
        int i = 0;
        try (Scanner sc = new Scanner(pathLogs)) {
            while (sc.hasNextLine()) {
                String line = sc.nextLine();
                Integer idLog = Integer.valueOf(line.split(";")[0]);
                if (idLog > i)  {
                    i = idLog;
                    System.out.println(i);
                }

            }
        }
    }

}