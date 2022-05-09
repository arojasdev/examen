package mx.com.gm.web;

import java.util.Date;
import java.util.List;
import mx.com.gm.domain.TblBitacoras;
import mx.com.gm.domain.TblExamenes;
import mx.com.gm.servicio.TblBitacorasService;
import mx.com.gm.servicio.TblExamenesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/examen")
public class ControladorExamen {
    
    @Autowired
    private TblExamenesService examenService;
    
    @Autowired
    private TblBitacorasService bitacoraService;
    
    @RequestMapping(value = "/listar", method = RequestMethod.GET)
    public ResponseEntity<TblExamenes> list() {
        List<TblExamenes> examenes = examenService.listarExamenes();
        
        TblBitacoras bitacora = new TblBitacoras();
        bitacora.setIdAccion(2L);
        bitacora.setIdUsuario(1L);
        bitacora.setFechaMovimiento(new Date());
        bitacora.setFechaActualizacion(new Date());
        bitacora.setObservaciones("Sin observacion");
        bitacoraService.guardar(bitacora);
        
        return new ResponseEntity(examenes, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/buscar", method = RequestMethod.GET)
    public ResponseEntity<TblExamenes> userById(@RequestParam(value = "id") long id) {
        TblExamenes examen = new TblExamenes();
        examen.setIdExamen(id);
        examen = examenService.econtrarExamen(examen);
        return new ResponseEntity(examen, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/eliminar", method = RequestMethod.DELETE)
    public void delete(@RequestParam(value = "id") long id) {
        TblExamenes examen = new TblExamenes();
        examen.setIdExamen(id);
        examenService.eliminar(examen);
    }
    
}
