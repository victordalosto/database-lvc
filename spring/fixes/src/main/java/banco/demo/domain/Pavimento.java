package banco.demo.domain;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name = "pavimento_2020")
public class Pavimento {


    @Id
    private Integer id;

    @Column(name = "uf", columnDefinition = "bpchar")
    private String uf;

    @Column(name = "br", columnDefinition = "bpchar")
    private String br;

}
