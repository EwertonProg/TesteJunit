<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Horários</title>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href="../../materialize/css/materialize.min.css"
	media="screen,projection" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	<jsp:useBean id="coordenador" scope="session"
		class="br.com.gestao_horario_aulas.model.Coordenador"></jsp:useBean>

	<jsp:useBean id="horarioController" scope="page"
		class="br.com.gestao_horario_aulas.controller.InserirHorarioController"></jsp:useBean>
	<nav>
	<div style="background: #3a3a3a;" class="nav-wrapper">
		<img style="height: 100%; margin-left: 25px; margin-right: 25px;"
			class="logo"
			src="https://vestibular.ucsal.br/wp-content/themes/theme_vestibular_2018/assets/images/logo.png">
		<a href="#!" class="brand-logo">Aulas UCSAL</a>
		<%
			if (coordenador.getNome() != null) {
		%>
		<ul class="right hide-on-med-and-down">
			<!-- Dropdown Trigger -->
			<li><a href="#"><%=coordenador.getNome()%></a></li>
		</ul>
		<%
			}
		%>
	</div>
	</nav>
	<nav style="background: #3a3a3a;">
	<div class="nav-wrapper" style="margin-left: 50px;">
		<ul class="left hide-on-med-and-down">
			<li><a href="cronogramaCoordenador.jsp">Início</a></li>
			<li><a href="listaSalas.jsp">Sala</a></li>
			<li><a href="listaDisciplinas.jsp">Disciplina</a></li>
			<li><a href="listaProfessores.jsp">Professor</a></li>
			<li><a href="listaGrades.jsp">Grade</a></li>
			<li><a href="listaCursos.jsp">Cursos</a></li>
			<li><a href="listaCoordenadores.jsp">Coordenadores</a></li>
			<li><a href="listaHorarios.jsp">Horários</a></li>
			<li><a href="estatisticas.jsp">Estatistica</a></li>
		</ul>
	</div>
	</nav>

	<div id="calendar" style="margin: 50px;">
		<div class="fc-toolbar">

			<div class="fc-center">
				<h2>Horários</h2>
			</div>
		</div>
		<div>
			<div class="row">
				<button class="btn waves-effect waves-light" name="action">
					<a style="color: white" href="horario.jsp">Inserir</a>
				</button>
			</div>
			<div>
				<table>
					<tr>
						<td><div>
								<table>
									<tr>
										<th>Horário</th>
										<th>Dia da Semana</th>
										<th>Disciplina</th>
										<th>Professor</th>
										<th>Sala</th>
										<th></th>
										<th></th>
									</tr>
									
									<c:forEach var="aula" items="${horarioController.getAulas()}">
										<tr>
											<td>${aula.getHorario().getDescricao()}</td>
											<td>${aula.getDia().getDescricao()}</td>
											<td>${aula.getDisciplina().getNome()}</td>
											<td>${aula.getProfessor().getNome()}</td>
											<td>${aula.getSala().getNome()}</td>
											<td><a href="inserirHorario?ac=del&id=${aula.getId()}">delete</a></td>
										</tr>
									</c:forEach>
								
								</table>
								<p>${mensagemErro}</p>
							</div></td>
					</tr>
				</table>
			</div>
		</div>


	</div>


	<!--JavaScript at end of body for optimized loading-->
	<script type="text/javascript"
		src="../../materialize/js/materialize.min.js"></script>

</body>
</html>
