<%@page import="br.edu.fafic.model.Pessoa"%>
<%@page import="br.edu.fafic.dao.PessoaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>  
        <style class="cp-pen-styles">

            table {
                border: 1px solid #666;
                width: 50%;
            }               

            th {
                background: #04B486;
                font-weight: bold;
                padding: 2px;
            }

            .error {
                color: red;
                font-family: verdana, Helvetica;
            }</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualiza Cadastro</title>
    </head>
    <body>
        <%
            Long id = Long.valueOf(request.getParameter("id_pessoa"));
            PessoaDao dao = new PessoaDao();
            Pessoa pessoa = dao.getLoginById(id);
        %>
        <br><br><br>

        <p id="msg"></p>

        <form name="atualizar" action="/UserServlets/cadProfessorAluno" method="post">
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Atulizar Cadastro</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">    
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12">
                                    <div class="form-group">  
                                        <input type="text" name="nome" class="form-control input-sm" value="<%=pessoa.getNome()%>">
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">                                      

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-3"> 
                                    <div class="form-group"> 
                                        <div class="form-group">                                      
                                            <input type="text" name="sexo" class="form-control input-sm" value="<%=pessoa.getSexo()%>" >
                                        </div>
                                    </div> 
                                </div>

                                <div class="col-xs-3 col-sm-4 col-md-4">
                                    <div class="form-group">                                      
                                        <input type="text" name="cpf" class="form-control input-sm"  value="<%=pessoa.getCpf()%>">
                                    </div>
                                </div>
                                <div class="col-xs-5 col-sm-5 col-md-5">
                                    <div class="form-group">                                      
                                        <input type="text" name="email" class="form-control input-sm" value="<%=pessoa.getEmail()%>">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="logradouro" class="form-control input-sm" value="<%=pessoa.getLogradouro()%>">
                            </div>
                            <div class="row">
                                <div class="col-xs-2 col-sm-2 col-md-2">
                                    <div class="form-group">
                                        <input type="text" name="numero" class="form-control input-sm" value="<%=pessoa.getNumero()%>">
                                    </div>
                                </div>
                                <div class="col-xs-5 col-sm-5 col-md-5">
                                    <div class="form-group">                                      
                                        <input type="text" name="bairro" class="form-control input-sm" value="<%=pessoa.getBairro()%>">
                                    </div>
                                </div>
                                <div class="col-xs-5 col-sm-5 col-md-5">
                                    <div class="form-group">                                      
                                        <input type="text" name="cidade" class="form-control input-sm" value="<%=pessoa.getCidade()%>">
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="cep" class="form-control input-sm" value="<%=pessoa.getCep()%>">
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="complemento" class="form-control input-sm" value="<%=pessoa.getComplemento()%>">
                                    </div>
                                </div>   
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="telefone" class="form-control input-sm" value="<%=pessoa.getTelefone()%>">
                                    </div>
                                </div>

                                <div class="col-xs-5 col-sm-5 col-md-5">
                                    <div class="form-group">
                                        <input type="text" name="perfil" class="form-control input-sm" value="<%=pessoa.getPerfil()%>">
                                    </div>
                                </div>                             

                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="usuario" class="form-control input-sm" value="<%=pessoa.getUsuario()%>">
                                    </div>
                                </div>   
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="password" name="senha" class="form-control input-sm" value="<%=pessoa.getSenha()%>">
                                    </div>
                                </div>                                
                            </div>
                            <input type="hidden" value="editar" name="param"/>
                            <input type="hidden" value="<%=pessoa.getIdPessoa()%>" name="id_pessoa"/>
                            <input type="submit" value="enviar" class="btn btn-info btn-block"/>

                        </form>
                    </div>
                </div>            
            </div>
        </form>
    </body>
</html>
