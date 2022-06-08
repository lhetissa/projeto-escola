package br.com.tcc.escola.repository;


import br.com.tcc.escola.model.Curso;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CursoRepository extends JpaRepository<Curso, Long> {

}
