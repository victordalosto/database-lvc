import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;


public class FilterYetAnotherLog {

    static Path pathAntigo = Paths.get("D:", "banco", "tb_ocorrencia_log_condensed.csv");
    static Path pathNovo = Paths.get("D:", "banco", "tb_ocorrencia_log_novo.csv");
    static Path pathOutput = Paths.get("D:", "banco", "tb_ocorrencia_log_condensed.csv");


    public static void main(String[] args) throws Exception {
        Set<Integer> logsAntigos = get(pathAntigo); // mini 5484
        System.out.println("Finalizado");
        run(logsAntigos);
    }


    public static Set<Integer> get(Path fileName) throws IOException {
        int i = 0;
        Set<Integer> set = new HashSet<>();
        try (Scanner sc = new Scanner(fileName)) {
            sc.nextLine();
            while (sc.hasNextLine()) {
                if ((++i) % 1000000 == 1)
                    System.out.println("Analizing: " + i / 1000000);
                String line = sc.nextLine();
                set.add(Integer.valueOf(line.split(";")[0]));
            }
        }
        return set;
    }


    public static void run(Set<Integer> modelsAntigos) throws IOException {
        Files.write(pathOutput, new byte[0], StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
        int i = 0;
        try (Scanner sc = new Scanner(pathNovo)) {
            while (sc.hasNextLine()) {
                if ((++i) % 1000000 == 1)
                    System.out.println("Analizing: " + i / 1000000);
                String line = sc.nextLine();
                Model model = new Model();
                model.idLog = Integer.valueOf(line.split(";")[0]);
                model.marcacao = Integer.valueOf(line.split(";")[1]);
                // if (!modelsAntigos.contains(model)) {
                // try {
                // Files.write(pathOutput, (line + System.lineSeparator()).getBytes(),
                // StandardOpenOption.APPEND);
                // } catch (IOException e) {
                // e.printStackTrace();
                // }
                // }
            }
        }
    }

}
