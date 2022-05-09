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
@Table(name = "tblrespuestas")
public class TblRespuestas implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_respuesta")
    private Long idRepuesta;
    
    private String desRespuesta;
    
    private int correcta;
    
    private int activo;
    
    @Column(name = "fecha_registro")
    private Date fechaRegistro;
    
    @Column(name = "fecha_actualizacion")
    private Date fechaActualizacion;
    
    @OneToMany()
    @JoinColumn(name = "id_pregunta")
    private List<TblPreguntas> preguntas;
    
    @OneToMany()
    @JoinColumn(name = "id_pregunta")
    private List<TblExamenesPreguntas> examenesPreguntas;
    
}
