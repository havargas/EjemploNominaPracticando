
package co.edu.sena.adsi.rest.services;

import co.edu.sena.adsi.jpa.entities.Nomina;
import co.edu.sena.adsi.jpa.entities.Usuario;
import co.edu.sena.adsi.jpa.sessions.NominaFacade;
import co.edu.sena.adsi.jpa.sessions.UsuarioFacade;
import java.util.List;
import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("usuarios")
//para lo que llegue sea Json y lo que retorne sea Json
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class UsuariosREST {
    @EJB
    private UsuarioFacade usuarioEJB;
    @GET
    public List<Usuario> findAll(){
        try {
            return usuarioEJB.findAll();
        } catch (Exception e) {
            System.out.println("ERROR: " + e);
            return null;
        }      
    }
    
    @GET
    @Path("{id}")
    public Usuario findById(@PathParam("id") Integer id){
        return usuarioEJB.find(id);
    }
    
    @POST
    public void create(Usuario usuario){
        usuarioEJB.create(usuario);
    }
    
}
