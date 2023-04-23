package banco.demo.domain;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name = "tb_log")
public class Log {

    @Id
    private Integer idLog;

    @Column(name = "gps_y")
    public Double y;

    @Column(name = "gps_x")
    public Double x;


    public void inverterCoordenada() {
        double temp = this.x;
        this.x = this.y;
        this.y = temp;
    }
    
    
     /** 
     * Limites do territorio brasileiro:
     * Y: -33.7 <= a <= -5.3
     * X: -74.0 <= a <= -32.398
     * 
     * SUL:        -33.7, -53.377113
     * PERNAMBUCO: -7.264892, -34.696421
     * FERNANDO DE NORONHA: -3.835182, -32.397947 */
    public boolean taNoBrasil() {
        if (this.y <= -33.70) { // Em baixo do RS
            return false;
        }
        if (this.x >= -32.398) { // A direita de FE.
            return false;
        }
        if (this.x >= -34.79 && this.y <= -3.88) { // A direita de PE mas a baixo de FE.
            return false;
        }
        return true;
        
    }

}
