<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>--%>
<fmt:setLocale value = "pt_BR"/>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Escola</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="row justify-content-center">
<img src="imagens/escola.jpg"  alt="escola">
</div>
<p>

<div class="row justify-content-center">
                 <a href="/cadastrarCurso" class="btn btn-success">Cadastrar</a>&nbsp;
                  </div>
                  </br>
<div class="container">
    <div class="row">

            <c:forEach var="curso" items="${cursos}">


&nbsp &nbsp
                <div class="card text-dark bg-light mb-3"  style="width: 16rem;">
                      <div class="card-body">
                        <h5 class="card-title">Nome: ${curso.name}</h5>
                        <p class="card-text">Descrição: ${curso.descricao} </p>
                      </div>
                      <ul class="list-group list-group-flush">
                        <li class="list-group-item">Carga Horaria: ${curso.cargaHoraria}</li>
                        <li class="list-group-item">Categoria: ${curso.categoria}</li>
                          <li class="list-group-item">Professor: ${curso.professor.name}</li>
                        <li class="list-group-item">Alunos: ${curso.alunos.size()}</li>
                      </ul>

                      <div class="card-body">

                        <a href="/alterarCurso?id=${curso.id}" class="btn btn-success">Alterar </a>
                        <button class="btn btn-danger" onclick="confirmar('${curso.name}', '${curso.id}')">
                                                                     Excluir
                                                                     </button>
                </div>
                </div>

            </c:forEach>
            </tbody>
        </table>
    </div>




    <div class="row justify-content-center">
        <a class="btn btn-primary" href="/">Ir para o início</a>
    </div>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
function confirmar(name, id)
{
var r=confirm("Tem certeza que deseja excluir o curso "+name+" ?");
if (r==true)
  {
  window.location.href="/excluirCurso?id="+id;
  }
}
</script>
</html>