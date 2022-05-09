package mx.com.gm.servicio;

import java.util.List;
import mx.com.gm.domain.TblAcciones;

public interface TblAccionesService {
    
    public List<TblAcciones> listarAcciones();
    
    public TblAcciones guardar(TblAcciones acciones);
    
    public void eliminar(TblAcciones acciones);
    
    public TblAcciones econtrarAccion(TblAcciones acciones);
    
}
