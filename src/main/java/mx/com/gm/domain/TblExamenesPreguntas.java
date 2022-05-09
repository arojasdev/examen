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
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "tblexamenespreguntas")
public class TblExamenesPreguntas implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_examen_pregunta")
    private Long idExamenPregunta;
    
    private int activo;
    
    @Column(name = "id_pregunta")
    private Long idPregunta;
    
    @Column(name = "id_examen")
    private Long idExamen;
    
    @Column(name = "fecha_registro")
    private Date fechaRegistro;
    
    @Column(name = "fecha_actualizacion")
    private Date fechaActualizacion;
    
//    @ManyToOne
//    @JoinColumn(name = "id_examen")
//    private TblExamenes examen;
//    
//    @ManyToOne
//    @JoinColumn(name = "id_pregunta")
//    private TblPreguntas pregunta;
    
}
