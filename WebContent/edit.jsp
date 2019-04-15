
<%@page import="br.edu.fafic.model.Pessoa"%>
<%@page import="br.edu.fafic.dao.DiretorDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        	Long id = Long.valueOf(request.getParameter("id_pessoa"));
                    DiretorDao dao = new DiretorDao();
                    Pessoa pessoa = dao.getLoginById(id);
        %>
        <b>Atulizar Cadastro</b>

<!--         <form name="atualizar" action="cadPessoa" method="post"> -->
<%--             id<input type="text" name="id_pessoa"value="<%=pessoa.getIdPessoa()%>"><br/><br/> --%>
<%--             nome<input type="text" name="nome"value="<%=pessoa.getNome()%>"><br/><br/> --%>
<%--             titulacao<input type="text" name="titulacao" value="<%=pessoa.getTitulacao()%>"><br/><br/> --%>
<%--             sexo<input type="text" name="sexo" value="<%=pessoa.getSexo()%>"><br/><br/> --%>
<%--             cpf<input type="text" name="cpf" value="<%=pessoa.getCpf()%>"><br/><br/> --%>
<%--             logradouro<input type="text" name="logradouro" value="<%=pessoa.getLogradouro()%>"><br/><br/> --%>
<%--             numero<input type="text" name="numero" value="<%=pessoa.getNumero()%>"><br/><br/> --%>
<%--             bairro<input type="text" name="bairro" value="<%=pessoa.getBairro()%>"><br/><br/> --%>
<%--             complemento<input type="text" name="complemento" value="<%=pessoa.getComplemento()%>"><br/><br/> --%>
<%--             cidade<input type="text" name="cidade"value="<%=pessoa.getCidade()%>"><br/><br/> --%>
<%--             cep<input type="text" name="cep"value="<%=pessoa.getCep()%>"><br/><br/> --%>
<%--             telefone<input type="text" name="telefone"value="<%=pessoa.getTelefone()%>"><br/><br/> --%>
<%--             email<input type="text" name="email"value="<%=pessoa.getEmail()%>"><br/><br/> --%>
<%--             usuario<input type="text" name="usuario"value="<%=pessoa.getUsuario()%>"><br/><br/> --%>
<%--             senha<input type="password" name="senha"value="<%=pessoa.getSenha()%>"><br/><br/> --%>
<%--             perfil<input type="text" name="perfil"value="<%=pessoa.getPerfil()%>"><br/><br/> --%>
<!--             <input type="hidden" value="editar" name="param"/> -->
<%--             <input type="hidden" value="<%=pessoa.getIdPessoa()%>" name="id_pessoa"/> --%>
<!--             <input type="submit" value="atualizar"/> -->
<!--         </form> -->
    </body>
</html>
