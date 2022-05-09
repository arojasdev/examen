package mx.com.gm.web;

import java.util.Date;
import mx.com.gm.domain.TblAcciones;
import mx.com.gm.domain.TblBitacoras;
import mx.com.gm.domain.Tblusuarios;
import mx.com.gm.servicio.TblAccionesService;
import mx.com.gm.servicio.TblBitacorasService;
import mx.com.gm.servicio.TblusuariosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/login")
public class ControladorLogin {
    
    @Autowired
    private TblusuariosService tblusuariosService;
    @Autowired
    private TblBitacorasService bitacoraService;
    
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public ResponseEntity<Tblusuarios> usuarioByUser(@RequestParam(value = "login") String login, @RequestParam(value = "password") String password) {
        
        Tblusuarios user = new Tblusuarios();
        user = tblusuariosService.findByloginandPassword(login, password);
        
        TblBitacoras bitacora = new TblBitacoras();
        bitacora.setIdAccion(1L);
        bitacora.setIdUsuario(user.getIdUsuario());
        bitacora.setFechaMovimiento(new Date());
        bitacora.setFechaActualizacion(new Date());
        bitacora.setObservaciones("Sin observacion");
        bitacoraService.guardar(bitacora);
        
        return new ResponseEntity(user, HttpStatus.OK);
    }
    
}
