package mx.com.gm.dao;

import mx.com.gm.domain.TblAcciones;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TblAccionesDao extends JpaRepository <TblAcciones, Long> {
    
}
