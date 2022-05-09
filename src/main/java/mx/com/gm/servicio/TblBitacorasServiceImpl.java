package mx.com.gm.servicio;

import java.util.List;
import mx.com.gm.dao.TblBitacorasDao;
import mx.com.gm.domain.TblAcciones;
import mx.com.gm.domain.TblBitacoras;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TblBitacorasServiceImpl implements TblBitacorasService {
    
    @Autowired
    private TblBitacorasDao bitacoraDao;

    @Override
    @Transactional(readOnly = true)
    public List<TblBitacoras> listarTblBitacoras() {
        return (List<TblBitacoras>) bitacoraDao.findAll();
    }

    @Override
    @Transactional
    public TblBitacoras guardar(TblBitacoras bitacora) {
        return bitacoraDao.save(bitacora);
    }

    @Override
    @Transactional
    public void eliminar(TblBitacoras bitacora) {
        bitacoraDao.delete(bitacora);
    }

    @Override
    @Transactional(readOnly = true)
    public TblBitacoras econtrarBitacora(TblBitacoras bitacora) {
        return bitacoraDao.findById(bitacora.getIdBitacora()).orElse(null);
    }
    
}
