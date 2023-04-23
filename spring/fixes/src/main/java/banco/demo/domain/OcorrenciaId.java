package banco.demo.domain;
import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class OcorrenciaId implements Serializable {

    private Integer idLog;
    private Integer idTipoOcorrencia;

}
