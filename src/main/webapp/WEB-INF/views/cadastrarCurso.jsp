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
        <h3>Cadastro de Curso</h3>
</div>

     </br>
<div class="row justify-content-center">


        <form action="/cadastrarCurso" method="post">
            <div class="form-group">
                <label>Nome</label>
                <input type="text" class="form-control" autocomplete="off" placeholder="Nome" name="name">
            </div>

            <div class="form-floating">
                <label>Descrição</label>
                <textarea class="form-control" placeholder="Descrição" autocomplete="off" name="descricao"></textarea>
            </div>

            <div class="form-group">
                <label>Carga Horária</label>
                <input type="text" class="form-control" placeholder="Carga Horária" autocomplete="off" name="cargaHoraria">
            </div>
            <div class="form-group">
                <label>Categoria</label>
                <input type="text" class="form-control" placeholder="Categoria" autocomplete="off" name="categoria">
            </div>
            <div class="row justify-content-center">
            <button class="btn btn-primary" type="submit">Cadastrar</button>
            </div>
        </form>
    </div>
    </br>
    <div class="row justify-content-center">
            <a class="btn btn-primary" href="/">Ir para o início</a>
</div>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

</html>