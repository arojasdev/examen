package mx.com.gm.servicio;

import java.util.List;
import mx.com.gm.domain.TblExamenes;

public interface TblExamenesService {
    
    public List<TblExamenes> listarExamenes();
    
    public TblExamenes guardar(TblExamenes examen);
    
    public void eliminar(TblExamenes examen);
    
    public TblExamenes econtrarExamen(TblExamenes examen);
    
}
