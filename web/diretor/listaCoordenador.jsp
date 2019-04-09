<%-- 
    Document   : Lista Coordenador
    Created on : 19/02/2019, 19:44:32
    Author     : Jmalvino
--%>

<%@page import="java.util.List"%>
<%@page import="br.edu.fafic.model.Pessoa"%>
<%@page import="br.edu.fafic.dao.PessoaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <%
            PessoaDao dao = new PessoaDao();
            List<Pessoa> pessoas = dao.getLoginByPerfil("coordenador");
        %>


        <div class="panel panel-primary">
            <table class="table table-striped table-condensed">
                <tr>
                    <td>Id</td>
                    <td>Nome</td>
                    <td>Sexo</td>
                    <td>CPF</td>
                    <td>Logradouro</td>
                    <td>Número</td>
                    <td>Bairro</td>
                    <td>Complemento</td>
                    <td>Cidade</td>
                    <td>Cep</td>
                    <td>Telefone</td>
                    <td>Email</td>
                    <td>Usuario</td>
                    <td>Senha</td>
                    <td>Perfil</td>
                    <td colspan="2" style="text-align: center;">Ação</td>
                </tr>
                <%for (Pessoa pessoa : pessoas) {%>
                <tr>
                    <td><%=pessoa.getIdPessoa()%></td>
                    <td><%=pessoa.getNome()%></td>
                    <td><%=pessoa.getSexo()%></td>
                    <td><%=pessoa.getCpf()%></td>
                    <td><%=pessoa.getLogradouro()%></td>
                    <td><%=pessoa.getNumero()%></td>
                    <td><%=pessoa.getBairro()%></td>
                    <td><%=pessoa.getComplemento()%></td>
                    <td><%=pessoa.getCidade()%></td>
                    <td><%=pessoa.getCep()%></td>
                    <td><%=pessoa.getTelefone()%></td>
                    <td><%=pessoa.getEmail()%></td>
                    <td><%=pessoa.getUsuario()%></td>
                    <td><%=pessoa.getSenha()%></td>
                    <td><%=pessoa.getPerfil()%></td>
                    <td><a  href="../edit.jsp?id_pessoa=<%=pessoa.getIdPessoa()%>"><img src="../imagens/edit.png"/></a></td>
                    <td><a  href="javascript://" onclick="excluir(<%=pessoa.getIdPessoa()%>, '<%=pessoa.getNome()%>')"><img src="../imagens/lixo.png"/></a></td>
                    
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
