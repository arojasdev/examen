package mx.com.gm.web;

import java.util.List;
import javax.validation.Valid;
import mx.com.gm.domain.Tblusuarios;
import mx.com.gm.servicio.TblusuariosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/usuarios")
public class ControladorInicioRest {
    
    @Autowired
    private TblusuariosService usuarioService;
	
    @RequestMapping(value = "/listar", method = RequestMethod.GET)
    public ResponseEntity<Tblusuarios> list() {
        List<Tblusuarios> usuarios = usuarioService.listarUsuarios();
        return new ResponseEntity(usuarios, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/usuario", method = RequestMethod.GET)
    public ResponseEntity<Tblusuarios> userById(@RequestParam(value = "id") long id) {
        Tblusuarios user = new Tblusuarios();
        user.setIdUsuario(id);
        user = usuarioService.econtrarUsuario(user);
        return new ResponseEntity(user, HttpStatus.OK);
    }

    @RequestMapping(value = "/agregar", method = RequestMethod.POST)
    public ResponseEntity<Tblusuarios> create(@Valid @RequestBody Tblusuarios user) {
        Tblusuarios userCreated = usuarioService.guardar(user);
        return new ResponseEntity(userCreated, HttpStatus.CREATED);
    }
    
}
