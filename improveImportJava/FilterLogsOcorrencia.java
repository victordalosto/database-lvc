import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Scanner;
import java.util.Set;
import java.util.stream.Collectors;


public class FilterLogsOcorrencia {

    static Path pathAntigo = Paths.get("D:", "banco", "tb_ocorrencia_log_export.csv");
    static Path pathNovo = Paths.get("D:", "banco", "tb_ocorrencia_log_novo.csv");
    static Path pathOutput = Paths.get("D:", "banco", "tb_ocorrencia_log_condensed.csv");

    public static void main(String[] args) throws Exception {
        Set<Model> modelsAntigos = get(pathAntigo); // mini 5484
        System.out.println("Finalizado");
        run(modelsAntigos);
    }



    public static Set<Model> get(Path fileName) throws IOException {
        return Files.lines(fileName)
                    .skip(1) // skip header line
                    .map(line -> {
                        String[] fields = line.split(";");
                        Model model = new Model();
                        model.idLog = Integer.parseInt(fields[0]);
                        model.marcacao = Integer.parseInt(fields[1]);
                        return model;
                    })
                    .collect(Collectors.toSet());
    }


    public static void run(Set<Model> modelsAntigos) throws IOException {
        Files.write(pathOutput, new byte[0], StandardOpenOption.CREATE,
                                             StandardOpenOption.TRUNCATE_EXISTING);
        int i = 0;
        try (Scanner sc = new Scanner(pathNovo)) {
            while (sc.hasNextLine()) {
                if ((++i) % 1000000 == 1)
                    System.out.println("Analizing: " + i/1000000);
                String line = sc.nextLine();
                Model model = new Model();
                model.idLog = Integer.valueOf(line.split(";")[0]);
                model.marcacao = Integer.valueOf(line.split(";")[1]);
                if (!modelsAntigos.contains(model)) {
                    try {
                        Files.write(pathOutput, (line + System.lineSeparator()).getBytes(),
                                                        StandardOpenOption.APPEND);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

}
