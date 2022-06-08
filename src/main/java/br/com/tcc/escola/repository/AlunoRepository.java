package br.com.tcc.escola.repository;

import br.com.tcc.escola.model.Aluno;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlunoRepository extends JpaRepository<Aluno, String> {

}
