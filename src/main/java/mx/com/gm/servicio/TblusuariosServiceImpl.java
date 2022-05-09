package mx.com.gm.servicio;

import java.util.List;
import mx.com.gm.dao.TblusuariosDao;
import mx.com.gm.domain.Tblusuarios;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TblusuariosServiceImpl implements TblusuariosService {
    
    @Autowired
    private TblusuariosDao usuarioDao;

    @Override
    @Transactional(readOnly = true)
    public List<Tblusuarios> listarUsuarios() {
        return (List<Tblusuarios>) usuarioDao.findAll();
    }

    @Override
    @Transactional
    public Tblusuarios guardar(Tblusuarios usuario) {
        return usuarioDao.save(usuario);
    }

    @Override
    @Transactional
    public void eliminar(Tblusuarios usuario) {
        usuarioDao.delete(usuario);
    }

    @Override
    @Transactional(readOnly = true)
    public Tblusuarios econtrarUsuario(Tblusuarios usuario) {
        return usuarioDao.findById(usuario.getIdUsuario()).orElse(null);
    }
    
    @Transactional(readOnly = true)
    public Tblusuarios findByloginandPassword(String login, String password) {
        return usuarioDao.findByloginandPassword(login, password);
    }
    
}