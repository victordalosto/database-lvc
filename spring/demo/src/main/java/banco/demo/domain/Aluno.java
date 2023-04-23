package banco.demo.domain;
import lombok.Data;


@Data
public class Aluno {

    private static Integer staticId = 0;
    private Integer id;
    private String nome;
    private String sobreNome;


    public Aluno() {
        this.id = ++staticId;
    }


    public Integer getId() {
        return this.id;
    }



}
