package mx.com.gm.servicio;

import java.util.List;
import mx.com.gm.dao.TblExamenesDao;
import mx.com.gm.domain.TblExamenes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TblExamenesServiceImpl implements TblExamenesService {
    
    @Autowired
    private TblExamenesDao examenDao;

    @Override
    @Transactional(readOnly = true)
    public List<TblExamenes> listarExamenes() {
        return (List<TblExamenes>) examenDao.findAll();
    }

    @Override
    @Transactional
    public TblExamenes guardar(TblExamenes examen) {
        return examenDao.save(examen);
    }

    @Override
    @Transactional
    public void eliminar(TblExamenes examen) {
        examenDao.delete(examen);
    }

    @Override
    @Transactional(readOnly = true)
    public TblExamenes econtrarExamen(TblExamenes examen) {
        return examenDao.findById(examen.getIdExamen()).orElse(null);
    }
    
}
