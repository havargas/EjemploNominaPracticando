
package co.edu.sena.adsi.rest.services;

import co.edu.sena.adsi.jpa.entities.Ciudad;
import co.edu.sena.adsi.jpa.entities.TipoDocumento;
import co.edu.sena.adsi.jpa.sessions.TipoDocumentoFacade;
import java.util.List;
import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("tipos_documentos")
//para lo que llegue sea Json y lo que retorne sea Json
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class TipoDocumentoREST {
    @EJB
    private TipoDocumentoFacade tipoDocumentoEJB;
     @GET
    public List<TipoDocumento> findAll(){
        try {
            return tipoDocumentoEJB.findAll();
        } catch (Exception e) {
            System.out.println("ERROR: " + e);
            return null;
        }      
    }
}
