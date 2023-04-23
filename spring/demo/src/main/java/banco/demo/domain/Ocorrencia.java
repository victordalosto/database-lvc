package banco.demo.domain;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name = "tb_ocorrencia_log")

@IdClass(OcorrenciaLogId.class)
public class Ocorrencia {

    @Id
    private Integer idLog;

    @Id
    private Integer idTipoOcorrencia;
    private Integer idDetalheOcorrencia;
}


