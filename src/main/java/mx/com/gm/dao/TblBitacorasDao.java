package mx.com.gm.dao;

import mx.com.gm.domain.TblBitacoras;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TblBitacorasDao extends JpaRepository <TblBitacoras, Long> {
    
}
