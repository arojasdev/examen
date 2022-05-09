package mx.com.gm.servicio;

import java.util.List;
import mx.com.gm.dao.TblAccionesDao;
import mx.com.gm.domain.TblAcciones;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TblAccionesServiceImpl implements TblAccionesService {
    
    @Autowired
    private TblAccionesDao accionesDao;

    @Override
    @Transactional(readOnly = true)
    public List<TblAcciones> listarAcciones() {
        return (List<TblAcciones>) accionesDao.findAll();
    }

    @Override
    @Transactional
    public TblAcciones guardar(TblAcciones acciones) {
        return accionesDao.save(acciones);
    }

    @Override
    @Transactional
    public void eliminar(TblAcciones acciones) {
        accionesDao.delete(acciones);
    }

    @Override
    @Transactional(readOnly = true)
    public TblAcciones econtrarAccion(TblAcciones acciones) {
        return accionesDao.findById(acciones.getIdAccion()).orElse(null);
    }
    
}
