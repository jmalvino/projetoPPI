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

        <title>Cadastro Coordenador</title>
        <script type="text/javascript">
            function excluir(id, nome) {
                if (window.confirm("Deseja realmente excluir o usuário " + nome + " ?")) {
                    location.href = "/UserServlets/cadCoordenador?id_pessoa=" + id + "&param=excluir";
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
        <form name="cad" action="/UserServlets/cadCoordenador" method="post">
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Cadastro Coordenador</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12">
                                    <div class="form-group">
                                        <input type="text" name="nome" class="form-control input-sm" placeholder="Nome">
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
                                        <select required name="sexo" class="form-control" placeholder="Sexo">
                                            <option value=""></option>
                                            <option value="masculino">Masculino</option>
                                            <option value="feminino">Feminino</option>

                                        </select>
                                    </div> 
                                </div>

                                <div class="col-xs-3 col-sm-4 col-md-4">
                                    <div class="form-group">                                      
                                        <input type="text" name="cpf" class="form-control input-sm"  placeholder="XXX.XXX.XXX-XX">
                                    </div>
                                </div>
                                <div class="col-xs-5 col-sm-5 col-md-5">
                                    <div class="form-group">                                      
                                        <input type="text" name="email" class="form-control input-sm" placeholder="email@email.com">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="logradouro" class="form-control input-sm" placeholder="Digite seu Endereço">
                            </div>
                            <div class="row">
                                <div class="col-xs-2 col-sm-2 col-md-2">
                                    <div class="form-group">
                                        <input type="text" name="numero" class="form-control input-sm" placeholder="Nº">
                                    </div>
                                </div>
                                <div class="col-xs-5 col-sm-5 col-md-5">
                                    <div class="form-group">                                      
                                        <input type="text" name="bairro" class="form-control input-sm" placeholder="Bairro">
                                    </div>
                                </div>
                                <div class="col-xs-5 col-sm-5 col-md-5">
                                    <div class="form-group">                                      
                                        <input type="text" name="cidade" class="form-control input-sm" placeholder="Cidade">
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="cep" class="form-control input-sm" placeholder="CEP">
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="complemento" class="form-control input-sm" placeholder="Complemento">
                                    </div>
                                </div>   
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="telefone" class="form-control input-sm" placeholder="Telefone">
                                    </div>
                                </div>

                                <div class="col-xs-5 col-sm-5 col-md-5"> 
                                    <div class="form-group">
                                        <select required name="perfil" class="form-control input-sm">                                            
                                            <option value="coordenador">Coordenador</option>
                                        </select>
                                    </div> 
                                </div>                                

                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="usuario" class="form-control input-sm" placeholder="Usuário">
                                    </div>
                                </div>   
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <input type="password" name="senha" class="form-control input-sm" placeholder="Senha">
                                    </div>
                                </div>                                
                            </div>
                            <input type="hidden" value="cadastrar" name="param"/>
                            <input type="submit" value="enviar" class="btn btn-info btn-block" onclick="validaform();"/>

                        </form>
                    </div>
                </div>            
            </div>         
        </form>        

        <%
            PessoaDao dao = new PessoaDao();
            List<Pessoa> pessoas = dao.getLoginByPerfil("coordenador");
        %>


        <div class="panel panel-primary">
            <table class="table table-striped table-condensed">
                <tr>

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
                    <td>******</td>
                    <td><%=pessoa.getPerfil()%></td>
                    <td><a  href="atualizaCoordenador.jsp?id_pessoa=<%=pessoa.getIdPessoa()%>"><img src="../imagens/edit.png"/></a></td>
                    <td><a  href="javascript://" onclick="excluir(<%=pessoa.getIdPessoa()%>, '<%=pessoa.getNome()%>')"><img src="../imagens/lixo.png"/></a></td>

                </tr>
                <%}%>
            </table>            
            <input type="button" value="Voltar" class="btn btn-info btn-block" onClick="javascript:location.href = 'indexDiretor.jsp'">
        </div>
        <script type="text/javascript">
            function limpa_formulario_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('rua').value = ("");
                document.getElementById('bairro').value = ("");
                document.getElementById('cidade').value = ("");
                document.getElementById('estado').value = ("");

            }

            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                    //Atualiza os campos com os valores.
                    document.getElementById('rua').value = (conteudo.logradouro);
                    document.getElementById('bairro').value = (conteudo.bairro);
                    document.getElementById('cidade').value = (conteudo.localidade);
                    document.getElementById('estado').value = (conteudo.uf);
                } //end if.
                else {
                    //CEP não Encontrado.
                    limpa_formulario_cep();
                    alert("CEP não encontrado.");
                    document.getElementById('cep').value = ("");
                }
            }

            function pesquisacep(valor) {

                //Nova variável "cep" somente com dígitos.
                var cep = valor.replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep !== "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        document.getElementById('rua').value = "...";
                        document.getElementById('bairro').value = "...";
                        document.getElementById('cidade').value = "...";
                        document.getElementById('estado').value = "...";

                        //Cria um elemento javascript.
                        var script = document.createElement('script');

                        //Sincroniza com o callback.
                        script.src = '//viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

                        //Insere script no documento e carrega o conteúdo.
                        document.body.appendChild(script);

                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulario_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulario_cep();
                }
            }

            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i);

                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }

            }

            function idade() {
                var data = document.getElementById("dtnasc").value;
                var dia = data.substr(0, 2);
                var mes = data.substr(3, 2);
                var ano = data.substr(6, 4);
                var d = new Date();
                var ano_atual = d.getFullYear(),
                        mes_atual = d.getMonth() + 1,
                        dia_atual = d.getDate();

                ano = +ano,
                        mes = +mes,
                        dia = +dia;

                var idade = ano_atual - ano;

                if (mes_atual < mes || mes_atual == mes_aniversario && dia_atual < dia) {
                    idade--;
                }
                return idade;
            }


            function exibe(i) {
                document.getElementById(i).readOnly = true;
            }

            function desabilita(i) {
                document.getElementById(i).disabled = true;
            }
            function habilita(i)
            {
                document.getElementById(i).disabled = false;
            }

            function showhide()
            {
                var div = document.getElementById("newpost");

                if (idade() >= 18) {

                    div.style.display = "none";
                }
                else if (idade() < 18) {
                    div.style.display = "inline";
                }

            }
        </script>

    </body>
</html>
