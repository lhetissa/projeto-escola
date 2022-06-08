package br.com.tcc.escola.repository;

import br.com.tcc.escola.model.Professor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProfessorRepository extends JpaRepository<Professor, String> {

}
