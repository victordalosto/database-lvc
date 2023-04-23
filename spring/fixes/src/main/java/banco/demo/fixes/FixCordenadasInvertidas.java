package banco.demo.fixes;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import banco.demo.domain.Log;
import banco.demo.repository.LogsRepository;


// @Component
public class FixCordenadasInvertidas implements CommandLineRunner {

    @Autowired
    private LogsRepository repository;
    private int min = 0; 
    private int max = 180000000; //174629431;
    private Path pathOutput = Paths.get("erros.txt"); // Saves progress in Log



    @Override
    public void run(String... args) throws Exception {
        Files.write(pathOutput, new byte[0], StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
        for (int id = min; id <= max; id++) {
            if (id % 100000 == 1) {
                System.out.println("Validando: " +id + " -> " + ((id)*100.0/174629431));
            }
            Optional<Log> opt = repository.findById(id);
            if (opt.isPresent()) {
                Log log = opt.get();
                if (!log.taNoBrasil()) {
                    Files.write(pathOutput, (log.getIdLog() + System.lineSeparator()).getBytes(), StandardOpenOption.APPEND);
                }
            }
        }
    }


  
}
