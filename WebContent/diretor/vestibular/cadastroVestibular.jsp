<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Vestibular</title>
        <script type="text/javascript">
            function excluir(id, nome) {
                if (window.confirm("Deseja realmente excluir o vestibular " + nome + " ?")) {
                    location.href = "cadVestibular?cod_vestibular=" + id + "&param=excluir";
                }
            }
            function teste(login) {
                console.log(login.value);
                location.href = "cadLogin?email=" + login + "&param=teste";
            }
            function validaform() {
                if (document.cad.nome.value === "") {
                    alert("O campo nome é obrigatório!");
                }
                if (document.cad.email.value === "") {
                    alert("O campo email é obrigatório!");
                }
            }
        </script>
    </head>
    <body>
        <h1>Cadastrar Vestibular</h1>
        <p id="msg"></p>
		<form value="cad" action="cadCurso" method="post" accept-charset="utf8">
			Data <input type="date" name="data" placeholder="YYYY/MM/DD"><br />
			Endereco <input type="text" name="area" placeholder="Área"><br />
			Curso <input type="" name="carga_horaria" placeholder="Carga Horária"><br /> 
			<input type="hidden" value="cadastrar" name="param" /><br /> 
			<input type="submit" value="cadastrar" onclick="validaform();" /><br />
		</form>
        
        
        
    </body>
</html>
