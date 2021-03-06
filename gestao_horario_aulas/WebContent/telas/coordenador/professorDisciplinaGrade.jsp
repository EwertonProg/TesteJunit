<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Professor Disciplina</title>
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
	
	<jsp:useBean id="DisciplinaGradeDao" scope="session"
		class="br.com.gestao_horario_aulas.dao.DisciplinaGradeDao"></jsp:useBean>
		
	<jsp:useBean id="ProfessorDao" scope="session"
		class="br.com.gestao_horario_aulas.dao.ProfessorDao"></jsp:useBean>
		
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
	<nav style="background: #3a3a3a;">
	<div class="nav-wrapper" style="margin-left: 50px;">
		<div class="col s12">
			<a href="listaProfessores.jsp" class="breadcrumb">Professores</a><a
				class="breadcrumb">Inserir</a>

		</div>
	</div>
	</nav>

	<div id="calendar" style="margin: 50px;">
		<div class="fc-toolbar">

			<div class="fc-center">
				<h2>Professor</h2>
			</div>
		</div>
		<div>
			<form class="col s3" action="InserirProfessorDisciplinaGrade" method="POST">
			
			<div class="col">
					<label>Professor</label>

				</div>

				<div class="row">
					<div class="input-field col s3">
						<select required="required" name="professor" class="browser-default">
							<option value="" disabled selected>Selecione</option>
							<c:forEach var="professor" items="${ProfessorDao.getLista()}">
								<option value="${professor.getId()}">${professor.getNome()}</option>
							</c:forEach>
						</select>

					</div>
				</div>
				
				<div class="col">
					<label>Disciplina Grade</label>

				</div>

				<div class="row">
					<div class="input-field col s3">
						<select required="required" name="disciplinaGrade" class="browser-default">
							<option value="" disabled selected>Selecione</option>
							<c:forEach var="disciplinaGrade" items="${DisciplinaGradeDao.getLista()}">
								<option value="${disciplinaGrade.getId()}">${disciplinaGrade.getNome()}</option>
							</c:forEach>
						</select>

					</div>
				</div>
				
				<div class="row">
					<button class="btn waves-effect waves-light" type="submit"
						name="action">Cadastrar</button>
				</div>
				<p>${mensagem}</p>
			</form>

		</div>


	</div>


	<!--JavaScript at end of body for optimized loading-->
	<script type="text/javascript"
		src="../../materialize/js/materialize.min.js"></script>

</body>
</html>
