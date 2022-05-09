package mx.com.gm.servicio;

import java.util.List;
import mx.com.gm.domain.Tblusuarios;

public interface TblusuariosService {
    
    public List<Tblusuarios> listarUsuarios();
    
    public Tblusuarios guardar(Tblusuarios usuario);
    
    public void eliminar(Tblusuarios usuario);
    
    public Tblusuarios econtrarUsuario(Tblusuarios usuario);
    
    public Tblusuarios findByloginandPassword (String login, String password);
    
}
