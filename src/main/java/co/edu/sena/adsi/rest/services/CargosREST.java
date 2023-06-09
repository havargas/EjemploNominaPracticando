
package co.edu.sena.adsi.rest.services;

import co.edu.sena.adsi.jpa.entities.Cargo;
import co.edu.sena.adsi.jpa.entities.Ciudad;
import co.edu.sena.adsi.jpa.sessions.CargoFacade;
import co.edu.sena.adsi.jpa.sessions.CiudadFacade;
import java.util.List;
import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("cargos")
//para lo que llegue sea Json y lo que retorne sea Json
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class CargosREST {
     @EJB
    private CargoFacade cargoEJB;
    
    @GET
    public List<Cargo> findAll(){
        try {
            return cargoEJB.findAll();
        } catch (Exception e) {
            System.out.println("ERROR: " + e);
            return null;
        }      
    }
    
}
