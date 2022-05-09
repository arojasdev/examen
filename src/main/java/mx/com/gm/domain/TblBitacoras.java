package mx.com.gm.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "tblbitacoras")
public class TblBitacoras implements Serializable {

    private static final long SerialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_bitacora")
    private Long idBitacora;
    
    private Long idUsuario;
    
    private Long idAccion;
    
    @Column(name = "fecha_movimiento")
    private Date fechaMovimiento;
    
    @Column(name = "fecha_actualizacion")
    private Date fechaActualizacion;
    
    private String Observaciones;

}
