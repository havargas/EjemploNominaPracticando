
package co.edu.sena.adsi.jpa.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name="roles")
public class Rol implements Serializable {
    @Id    
    @NotNull
    @Size(min=3,max=10)
    @Column(name="id")
    
    private String id;
    
    @Basic(optional=false)
    @NotNull
    @Size(min=5,max=40)
    @Column(name="descripcion")
    private String descripcion;
    
    @OneToMany(mappedBy="rol")
    private List<UsuariosHasRoles> usuarioHasRolesList; 

    public Rol() {
    }

    public Rol(String id) {
        this.id = id;
    }

    public Rol(String id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @XmlTransient
    public List<UsuariosHasRoles> getUsuarioHasRolesList() {
        return usuarioHasRolesList;
    }

    public void setUsuarioHasRolesList(List<UsuariosHasRoles> usuarioHasRolesList) {
        this.usuarioHasRolesList = usuarioHasRolesList;
    }

    
    @Override
    public String toString() {
        return "Rol{" + "id=" + id + '}';
    }
    
    
    
}
