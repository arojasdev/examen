package mx.com.gm.servicio;

import java.util.List;
import mx.com.gm.domain.TblBitacoras;

public interface TblBitacorasService {
    
    public List<TblBitacoras> listarTblBitacoras();
    
    public TblBitacoras guardar(TblBitacoras bitacora);
    
    public void eliminar(TblBitacoras bitacora);
    
    public TblBitacoras econtrarBitacora(TblBitacoras bitacora);
    
}
