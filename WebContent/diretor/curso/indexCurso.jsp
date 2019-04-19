
<%@page import="java.util.List"%>
<%@page import="br.edu.fafic.model.Curso"%>
<%@page import="br.edu.fafic.dao.CursoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Curso</title>
<script type="text/javascript">
            function excluir(id, nome) {
                if (window.confirm("Deseja realmente excluir o  curso " + nome + " ?")) {
                    location.href = "cadCurso?cod_curso=" + id + "&param=excluir";
                }
            }
            function validaform() {
                if (document.cad.nome.value === "") {
                    alert("O campo nome é obrigatório!");
                }
                if (document.cad.area.value === "") {
                    alert("O campo área é obrigatório!");
                }
            }
	</script>

</head>
<body>
	<h1>Curso</h1>
	<p id="msg"></p>
	<form value="cad" action="cadCurso" method="post" accept-charset="utf8">
		Nome <input type="text" name="nome" placeholder="Nome"><br />
		Área <input type="text" name="area" placeholder="Área"><br />
		Carga Horária <input type="text" name="carga_horaria"
			placeholder="Carga Horária"><br /> <input type="hidden"
			value="cadastrar" name="param" /><br /> <input type="submit"
			value="cadastrar" onclick="validaform();" /><br />
	</form>

	<%
		List<Curso> cursos = CursoDao.getAllCurso();
	%>

	<b>Lista de Cursos</b>
	<br />
	<br />
	<table border="1">
		<tr>
			<td>Id</td>
			<td>Nome</td>
			<td>Area</td>
			<td>Carga Horaria</td>
			<td>Excluido</td>

			<td colspan="2" style="text-align: center;">Ação</td>
		</tr>
		<%
			for (Curso curso : cursos) {
		%>
		<tr>
			<td><%=curso.getCodCurso()%></td>
			<td><%=curso.getNome()%></td>
			<td><%=curso.getArea()%></td>
			<td><%=curso.getCargaHoraria()%></td>
			<td><%=curso.getExcluido()%></td>
			<td><a href="edit.jsp?cod_curso=<%=curso.getCodCurso()%>"><img
					src="imagens/edit.png" /></a></td>
			<td><a href="javascript://"
				onclick="excluir(<%=curso.getCodCurso()%>, '<%=curso.getNome()%>')"><img
					src="imagens/lixo.png" /></a></td>

		</tr>
		<%
			}
		%>
	</table>
	<br />


</body>
</html>
