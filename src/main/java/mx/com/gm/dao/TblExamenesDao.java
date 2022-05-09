package mx.com.gm.dao;

import mx.com.gm.domain.TblExamenes;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TblExamenesDao extends JpaRepository <TblExamenes, Long> {
    
}
