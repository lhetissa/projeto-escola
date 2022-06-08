package br.com.tcc.escola.model;


import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Aluno implements Serializable {
    @Transient
    private static final long serialVersionUID = 7614450898065032795L;
    @Id
    @Column(unique = true, nullable = false)
    private String cpf;
    private String name;
    @Column(unique = true, nullable = false)
    private String email;
    private String telefone;

    @ManyToMany
    private List<Professor> professores = new ArrayList<>();
    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    private List<Curso> cursos = new ArrayList<>();

    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getTelefone() {
        return telefone;
    }
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    public List<Professor> getProfessores() {
        return professores;
    }
    public void setProfessores(List<Professor> professores) {
        this.professores = professores;
    }
    public List<Curso> getCursos() {
        return cursos;
    }
    public void setCursos(List<Curso> cursos) {
        this.cursos = cursos;
    }


    @Override
    public String toString() {
        return "Aluno{" +
                "cpf='" + cpf + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", telefone='" + telefone + '\'' +
                '}';
    }
}