
package co.edu.sena.adsi.jpa.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="usuarios_has_roles")
public class UsuariosHasRoles implements Serializable {
    @EmbeddedId
    protected UsuariosHasRolesPK usuariosHasRolesPK;
    
    @Basic(optional=false)
    @NotNull
    @Column(name="activo")
    private Boolean activo;
    
    @JoinColumn(name = "id_usuario",referencedColumnName = "id",insertable=false,updatable=false)
    @ManyToOne(optional=false)
    private Usuario usuario;
    
    @JoinColumn(name = "id_rol",referencedColumnName = "id",insertable=false,updatable=false)
    @ManyToOne(optional=false)
    private Rol rol;

    public UsuariosHasRoles() {
    }

    public UsuariosHasRoles(UsuariosHasRolesPK usuariosHasRolesPK) {
        this.usuariosHasRolesPK = usuariosHasRolesPK;
    }

    public UsuariosHasRoles(UsuariosHasRolesPK usuariosHasRolesPK, Boolean activo, Usuario usuario, Rol rol) {
        this.usuariosHasRolesPK = usuariosHasRolesPK;
        this.activo = activo;
        this.usuario = usuario;
        this.rol = rol;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    

    
    
    
}
