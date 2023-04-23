package banco.demo.repository;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import banco.demo.domain.Ocorrencia;
import banco.demo.domain.OcorrenciaLogId;


public interface OcorrenciaRepository extends JpaRepository<Ocorrencia, OcorrenciaLogId> {

    Optional<Ocorrencia> findByIdLogAndIdTipoOcorrencia(Integer idLog, Integer idTipoOcorrencia);

}
