package banco.demo;
import org.springframework.stereotype.Component;


@Component
public class Start {
// public class Start implements CommandLineRunner {

    // @Autowired
    // private OcorrenciaRepository repository;
    // private Path pathNovo = Paths.get("D:", "banco", "tb_ocorrencia_log_novo.csv");



    // @Override
    // public void run(String... args) throws Exception {
    //     int i = 0;
    //     int j = 0;
    //     try (Scanner sc = new Scanner(pathNovo)) {
    //         while (sc.hasNextLine()) {
    //             String line = sc.nextLine();
    //             Optional<Ocorrencia> opt = repository.findByIdLogAndIdTipoOcorrencia(Integer.valueOf(line.split(";")[0]), Integer.valueOf(line.split(";")[1]));
    //             System.out.println(line);
    //             System.out.println();
    //             System.out.println(opt.get());
    //             if ((++i) % 1000000 == 1) {
    //                 System.out.println("Analizing: " + (++j));
    //                 i = 1;
    //             }
    //         }
    //     }
    // }

}
