package br.com.tcc.escola.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Professor implements Serializable {

    @Transient
    private static final long serialVersionUID = 7614450898065032795L;
    @Id
    @Column(unique = true, nullable = false)
    private String cpf;
    private String name;
    @Column(unique = true, nullable = false)
    private String email;
    private String telefone;

    @ManyToMany(mappedBy = "professores", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    private List<Aluno> alunos = new ArrayList<>();
    @OneToMany(mappedBy = "professor", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
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
    public List<Aluno> getAlunos() {
        return alunos;
    }
    public void setAlunos(List<Aluno> alunos) {
        this.alunos = alunos;
    }
    public List<Curso> getCursos() {
        return cursos;
    }
    public void setCursos(List<Curso> cursos) {
        this.cursos = cursos;
    }


}