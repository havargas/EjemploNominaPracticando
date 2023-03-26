
package co.edu.sena.adsi.rest.services;


import java.util.Set;
import javax.ws.rs.core.Application;
import org.glassfish.jersey.media.multipart.MultiPartFeature;


@javax.ws.rs.ApplicationPath("api")
public class AppConfig extends Application {
    public AppConfig(){
        
    }
    
    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        resources.add(org.glassfish.jersey.jackson.JacksonFeature.class);
        resources.add(MultiPartFeature.class);
        
        addRestResourceClasses(resources);
        return resources;
    }
    
    private void addRestResourceClasses(Set<Class<?>> resources) {
        resources.add(co.edu.sena.adsi.rest.services.CargosREST.class);
        resources.add(co.edu.sena.adsi.rest.services.CiudadesREST.class);
        resources.add(co.edu.sena.adsi.rest.services.DetalleNominaREST.class);
        resources.add(co.edu.sena.adsi.rest.services.NominaREST.class);
        resources.add(co.edu.sena.adsi.rest.services.TipoDocumentoREST.class);
        resources.add(co.edu.sena.adsi.rest.services.UsuariosREST.class);
        
    }
}
