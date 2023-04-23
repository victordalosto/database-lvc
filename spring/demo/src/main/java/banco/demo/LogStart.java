package banco.demo;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import banco.demo.domain.Log;
import banco.demo.repository.LogsRepository;


@Component
public class LogStart implements CommandLineRunner {

    @Autowired
    private LogsRepository repository;


    @Override
    public void run(String... args) throws Exception {
        System.out.println("\n\n\n INICIANDO::");
        int min = 98367620; // 107365773
        int max = 174629431;
        int batchSize = 100000;
        int tamanho = max - min;

        // SELECT * from tb_log where id_log = 98369937
        List<Log> logsToUpdate = new ArrayList<>(batchSize);
        for (int id = min; id < max; id++) {
            System.out.println("Updating: " +id + " -> " + ((id-min)*100.0/tamanho));
            Optional<Log> opt = repository.findById(id);
            if (opt.isPresent()) {
                Log log = opt.get();
                double temp = log.x;
                log.x = log.y;
                log.y = temp;
                logsToUpdate.add(log);
            }
            if (logsToUpdate.size() == batchSize) {
                repository.saveAll(logsToUpdate);
                logsToUpdate.clear();
                System.out.println("Updated batch: " + id);
            }
        }
        if (!logsToUpdate.isEmpty()) {
            repository.saveAll(logsToUpdate);
            System.out.println("Updated remaining logs.");
        }
    }


  
}
