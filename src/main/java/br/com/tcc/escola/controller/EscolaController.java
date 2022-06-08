package br.com.tcc.escola.controller;

import br.com.tcc.escola.model.Aluno;
import br.com.tcc.escola.model.Curso;
import br.com.tcc.escola.model.Professor;
import br.com.tcc.escola.repository.AlunoRepository;
import br.com.tcc.escola.repository.CursoRepository;
import br.com.tcc.escola.repository.ProfessorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

@Controller
public class EscolaController {
    @Autowired
    AlunoRepository alunoRepository;
    @Autowired
    ProfessorRepository professorRepository;
    @Autowired
    CursoRepository cursoRepository;

    @RequestMapping("/")
    public String home(Model model) {
        return "homePage";
    }

//    Seção dos alunos
    @RequestMapping("/listarAlunos")
    public String listarAlunos(Model model) {
        model.addAttribute("alunos", alunoRepository.findAll());
        return "listarAlunos";
    }

    @GetMapping("/cadastrarAluno")
    public String cadastrarAluno(Model model) {
        return "cadastrarAluno";
    }

    @PostMapping("/cadastrarAluno")
    public String cadastrarAlunoPost(Aluno aluno) {
        aluno.setCpf(aluno.getCpf().replaceAll("\\D+",""));
        alunoRepository.save(aluno);
        return "redirect:/listarAlunos";
    }

    @GetMapping("/alterarAluno")
    public String alterarAluno(Model model, String id) {
        model.addAttribute("aluno", alunoRepository.findById(id).get());
        return "alterarAluno";
    }

    @PostMapping("/alterarAluno")
    public String alterarAlunoPost(Aluno aluno) {
        alunoRepository.save(aluno);
        return "redirect:/listarAlunos";
    }

    @RequestMapping("/excluirAluno")
    public String alterarAlunoPost(String id) {
        alunoRepository.deleteById(id);
        return "redirect:/listarAlunos";
    }

//    Seção dos professores
    @RequestMapping("/listarProfessores")
    public String listarProfessores(Model model) {
        model.addAttribute("professores", professorRepository.findAll());
        return "listarProfessores";
    }

    @GetMapping("/cadastrarProfessor")
    public String cadastrarProfessor(Model model) {
        return "cadastrarProfessor";
    }

    @PostMapping("/cadastrarProfessor")
    public String cadastrarProfessorPost(Professor professor) {
        professor.setCpf(professor.getCpf().replaceAll("\\D+",""));
        professorRepository.save(professor);
        return "redirect:/listarProfessores";
    }

    @GetMapping("/alterarProfessor")
    public String alterarProfessor(Model model, String id) {
        model.addAttribute("professor", professorRepository.findById(id).get());
        return "alterarProfessor";
    }


    @PostMapping("/alterarProfessor")
    public String alterarProfessorPost(Professor professor) {
        professorRepository.save(professor);
        return "redirect:/listarProfessores";
    }

    @RequestMapping("/excluirProfessor")
    public String alterarProfessorPost(String id) {
        professorRepository.deleteById(id);
        return "redirect:/listarProfessores";
    }

//    Seção dos cursos
    @RequestMapping("/listarCursos")
    public String listarCursos(Model model) {
        model.addAttribute("cursos", cursoRepository.findAll());
        return "listarCursos";
    }

    @GetMapping("/cadastrarCurso")
    public String cadastrarCurso(Model model) {
        return "cadastrarCurso";
    }

    @PostMapping("/cadastrarCurso")
    public String cadastrarCursoPost(Curso curso) {
        cursoRepository.save(curso);
        return "redirect:/listarCursos";
    }

    @GetMapping("/alterarCurso")
    public String alterarCurso(Model model, Long id) {
        Curso curso = cursoRepository.findById(id).get();
        List<Aluno> alunos = alunoRepository.findAll();
        alunos.removeAll(curso.getAlunos());

        model.addAttribute("curso", curso);
        model.addAttribute("alunoRem", alunos);
        model.addAttribute("alunoAdd", curso.getAlunos());
        model.addAttribute("professores", professorRepository.findAll());

        return "alterarCurso";
    }

    @PostMapping("/alterarCurso")
    public String alterarCursoPost(Curso curso) {
        Curso cursoSalvo = cursoRepository.findById(curso.getId()).get();
        cursoSalvo.setName(curso.getName());
        cursoSalvo.setCategoria(curso.getCategoria());
        cursoSalvo.setDescricao(curso.getDescricao());
        cursoSalvo.setCargaHoraria(curso.getCargaHoraria());
        cursoRepository.save(cursoSalvo);
        return "redirect:/listarCursos";
    }

    @Transactional
    @PostMapping("/salvarAlunoCurso")
    @ResponseBody
    public void salvarAlunoCurso(Long cursoId, String[] addAluno, String[] removeAluno) {
        Curso curso = cursoRepository.findById(cursoId).get();
        List<String> listAddAlunos = Arrays.asList(addAluno);
        List<String> listRemoveAluno = Arrays.asList(removeAluno);
        for(Aluno a : alunoRepository.findAll()) {
            for(String x : listAddAlunos) {
                if(a.getCpf().equals(x.replaceAll("\\D+",""))) {
                    if(!a.getCursos().contains(curso)) {
                        a.getCursos().add(curso);
                    }
                }
            }
            for(String x : listRemoveAluno) {
                if(a.getCpf().equals(x.replaceAll("\\D+",""))) {
                    if(a.getCursos().contains(curso)) {
                        a.getCursos().remove(curso);
                    }
                }
            }
        }
        cursoRepository.save(curso);
    }

    @PostMapping("/salvarProfessorCurso")
    @ResponseBody
    public void salvarProfessorCurso(Long cursoId, String addProfessor) {
        Curso curso = cursoRepository.findById(cursoId).get();
        Professor professor = professorRepository.findById(addProfessor).get();
        curso.setProfessor(professor);
        cursoRepository.save(curso);
    }

    @RequestMapping("/excluirCurso")
    public String alterarCursoPost(Long id) {
        cursoRepository.deleteById(id);
        return "redirect:/listarCursos";
    }

}