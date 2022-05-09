package mx.com.gm.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "tblexamenes")
public class TblExamenes implements Serializable {
    
    private static final long SerialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_examen")
    private Long idExamen;
    
    @Column(name = "id_usuario")
    private Long idUsuario;
    
    @Column(name = "num_preguntas")
    private int numPreguntas;
    
    @Column(name = "fecha_registro")
    private Date fechaRegistro;
    
    @Column(name = "fecha_actualizacion")
    private Date fechaActualizacion;
    
    @OneToMany()
    @JoinColumn(name = "id_examen")
    private List<TblExamenesPreguntas> examenesPreguntas;
    
}
