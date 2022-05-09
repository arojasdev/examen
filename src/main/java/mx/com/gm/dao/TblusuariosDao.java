package mx.com.gm.dao;

import mx.com.gm.domain.Tblusuarios;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface TblusuariosDao extends CrudRepository<Tblusuarios, Long> {
    
    //Tblusuarios findByUsername(String username);
    
    @Query(value = "select u.* from tblusuarios u where u.login = :login and u.password = :password and u.activo = 1", nativeQuery = true)
    Tblusuarios findByloginandPassword(@Param("login") String login, @Param("password") String password);
    
}