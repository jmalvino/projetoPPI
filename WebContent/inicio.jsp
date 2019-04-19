<%@page import="br.edu.fafic.model.Diretor"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.fafic.model.Pessoa"%>
<%@page import="br.edu.fafic.dao.DiretorDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<!-- SCRIPT DA LISTA  -->
        <script src='https://static.codepen.io/assets/editor/live/console_runner-1df7d3399bdc1f40995a35209755dcfd8c7547da127f6469fd81e5fba982f6af.js'></script><script src='https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/libajunior/pen/PqNrXR" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
        <style class="cp-pen-styles">.container {
                width: 80%;
            }

            .container h1 {
                margin: 40px 0px;
            }</style>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>  
        <style class="cp-pen-styles">

            table {
                border: 1px solid #666;
                width: 50%;
            }               

            th {
                background: #1E90FF;
                font-weight: bold;
                padding: 2px;
            }

            .error {
                color: red;
                font-family: verdana, Helvetica;
            }</style>

        <title>Cadastro</title>
        <script type="text/javascript">
            function excluir(id, nome) {
                if (window.confirm("Deseja realmente excluir o usuário " + nome + " ?")) {
                    location.href = "cadPessoa?id_pessoa=" + id + "&param=excluir";
                }
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
	<p id="msg"></p>

	<form name="cad" action="cadDiretor" method="post"
		accept-charset="utf8">
		<div
			class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Cadastro de Usuario</h3>
				</div>
				<div class="panel-body">
					<form role="form">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									Nome <input type="text" name="nome" class="form-control input-sm"
										placeholder="Nome">
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									Titulação <input type="text" name="titulacao"
										class="form-control input-sm" placeholder="Titulação">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-3 col-sm-3 col-md-3">
								<div class="form-group">
									Sexo <select required name="sexo" class="form-control"
										placeholder="Sexo">
										<option value=""></option>
										<option value="masculino">Masculino</option>
										<option value="feminino">Feminino</option>

									</select>
								</div>
							</div>

							<div class="col-xs-3 col-sm-4 col-md-4">
								<div class="form-group">
									Cpf <input type="text" name="cpf" class="form-control input-sm"
										placeholder="XXX.XXX.XXX-XX">
								</div>
							</div>
							<div class="col-xs-3 col-sm-4 col-md-4">
								<div class="form-group">
									Rg <input type="text" name="rg" class="form-control input-sm"
										placeholder="RG">
								</div>
							</div>
							<div class="col-xs-5 col-sm-5 col-md-5">
								<div class="form-group">
									Email <input type="text" name="email" class="form-control input-sm"
										placeholder="email@email.com">
								</div>
							</div>
						</div>
						<div class="form-group">
							Logradouro <input type="text" name="logradouro"
								class="form-control input-sm" placeholder="Digite seu Endereço">
						</div>
						<div class="row">
							<div class="col-xs-2 col-sm-2 col-md-2">
								<div class="form-group">
								Nº <input type="text" name="numero" class="form-control input-sm"
										placeholder="Nº">
								</div>
							</div>
							<div class="col-xs-5 col-sm-5 col-md-5">
								<div class="form-group">
									Bairro <input type="text" name="bairro" class="form-control input-sm"
										placeholder="Bairro">
								</div>
							</div>
							<div class="col-xs-5 col-sm-5 col-md-5">
								<div class="form-group">
									Cidade <input type="text" name="cidade" class="form-control input-sm"
										placeholder="Cidade">
								</div>
							</div>

						</div>

						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									Cep <input type="text" name="cep" class="form-control input-sm"
										placeholder="CEP">
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
								Complemento	<input type="text" name="complemento"
										class="form-control input-sm" placeholder="Complemento">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									Telefone <input type="text" name="telefone"
										class="form-control input-sm" placeholder="Telefone">
								</div>
							</div>

							<div class="col-xs-5 col-sm-5 col-md-5">
								<div class="form-group">
									Perfil <select required name="perfil" class="form-control input-sm">
										<option value=""></option>
										<option value="diretor">Diretor</option>
										<option value="coordenador">Coordenador</option>
										<option value="professor">Professor</option>
										<option value="aluno">Aluno</option>

									</select>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									Usuario <input type="text" name="usuario" class="form-control input-sm"
										placeholder="Usuário">
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									 Senha <input type="password" name="senha"
										class="form-control input-sm" placeholder="Senha">
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									 Data Admissão <input type="date" name="data_admissao"
										class="form-control input-sm" placeholder="xx/xx/xxxx">
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									Salário <input type="number" name="salario"
										class="form-control input-sm" placeholder="xx/xx/xxxx">
								</div>
							</div>
						</div>
						<input type="hidden" value="cadastrar" name="param" /> <input
							type="submit" value="cadastrar" class="btn btn-info btn-block"
							onclick="validaform();" />

					</form>
				</div>
			</div>
		</div>
	</form>

	<br />


	<% 
    	List<Diretor> diretores = (List<Diretor>) request.getAttribute("diretores");
	%>

	<div class="panel panel-primary">
            <table class="table table-striped table-condensed">
		<tr>
			<td>Id</td>
			<td>Nome</td>
			<td>Sexo</td>
			<td>CPF</td>
			<td>RG</td>
			<td>Logradouro</td>
			<td>Número</td>
			<td>Bairro</td>
			<td>Complemento</td>
			<td>Cidade</td>
			<td>Cep</td>
			<td>Usuario</td>
			<td>Senha</td>
			<td>Perfil</td>
			<td>Telefone</td>
			<td>Email</td>
			<td>Titulação</td>
			<td>Salário</td>
			<td>Admissão</td>
			<td colspan="2" style="text-align: center;">Ação</td>
		</tr>

		<tr>
			<c:forEach  items="${diretores}" var="d" >
				<br />
				<td>Cod:${d.codDiretor} </td>
				<td>Nome: ${d.nome}</td>
				<td>Sexo: ${d.sexo}</td>
				<td>CPF: ${d.cpf}</td>
				<td>RG: ${d.rg}</td>
				<td>Endereco:<br /> <c:forEach items="${d.endereco}" var="e">
						<td>Numero: ${d.e.numero}</td>
						<td>Logradouro: ${d.e.logradouro}</td>
						<td>Bairro: ${d.e.bairro}</td>
						<td>Complemento: ${d.e.complemento}</td>
						<td>Cidade: ${d.e.cidade}</td>
						<td>Cep: ${d.e.cep}</td>
						<br />
					</c:forEach>
				</td>
				<td>Telefone: ${d.telefone}</td>
				<td>Email: ${d.email}</td>
				<td>Login:<br /> <c:forEach items="${d.login}" var="l">
						<td>Usuario: ${d.l.usuario}</td>
						<td>Senha: ${d.l.senha}</td>
						<td>Perfil: ${d.l.perfil}</td>
						<br />
					</c:forEach>
				</td>
				<td>Titulacao: ${d.titulacao}</td>
			</c:forEach>
			<td><a href="edit.jsp?id_pessoa=${d.codDiretor}"> <img
					src="imagens/edit.png" />
			</a></td>
<%-- 			<td><a href="javascript://" onclick="excluir(${d.codDiretor}, '${d.nome}')"> <img --%>
<!-- 					src="imagens/lixo.png" /> -->
<!-- 			</a></td> -->
		</tr>
	</table>
</div>
</body>
</html>