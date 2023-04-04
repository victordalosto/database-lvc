public class Model {

    public int idLog;
    public int marcacao;


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + idLog;
        result = prime * result + marcacao;
        return result;
    }


    @Override
    public boolean equals(Object obj) {
        Model other = (Model) obj;
        if (idLog != other.idLog)
            return false;
        if (marcacao != other.marcacao)
            return false;
        return true;
    }

    
}
