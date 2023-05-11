import new_tables;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.Scanner;


public class FiltraOcorrenciaLog {

    static List<Integer> ids = List.of(72, 83, 92, 32, 28, 31, 70, 93, 71, 90, 79, 80, 81, 91);
    static Path file = Paths.get("D:", "Downloads", "nova_ocorrencia.csv");
    static Path output = Paths.get("output.txt");


    @SuppressWarnings("resource")
    public static void main(String[] args) throws IOException {
        Scanner scanner = new Scanner(file);
        Files.deleteIfExists(output);
        Files.createFile(output);
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            Integer id = Integer.valueOf(line.split(";")[1]);
            if (ids.contains(id)) {
                Files.write(output, (line+"\n").getBytes(), StandardOpenOption.APPEND);
            }
        }
    }

}