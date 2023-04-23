package banco.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import banco.demo.domain.Log;

public interface LogsRepository extends JpaRepository<Log, Integer> {
    
}
