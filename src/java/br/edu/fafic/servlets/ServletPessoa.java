/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fafic.servlets;

import br.edu.fafic.dao.PessoaDao;
import br.edu.fafic.model.Pessoa;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luciano
 */
@WebServlet("/cadPessoa")
public class ServletPessoa extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Pessoa pessoa = null;
            PessoaDao dao = new PessoaDao();
            String nome = req.getParameter("nome");
            String titulacao = req.getParameter("titulacao");
            String sexo = req.getParameter("sexo");
            String cpf = req.getParameter("cpf");
            String logradouro = req.getParameter("logradouro");
            String numero = req.getParameter("numero");
            String bairro = req.getParameter("bairro");
            String complemento = req.getParameter("complemento");
            String cidade = req.getParameter("cidade");
            String cep = req.getParameter("cep");
            String telefone = req.getParameter("telefone");
            String email = req.getParameter("email");
            String usuario = req.getParameter("usuario");
            String senha = req.getParameter("senha");
            String perfil = req.getParameter("perfil");
            String type = req.getParameter("param");
            if (type.equalsIgnoreCase("cadastrar")) {
                pessoa = new Pessoa(nome, titulacao, sexo, cpf, logradouro, numero, bairro, complemento, cidade, cep, telefone, email, perfil, usuario, senha);
                dao.cadastraPessoa(pessoa);
            } else if (type.equalsIgnoreCase("editar")) {
                Long id = Long.valueOf(req.getParameter("id_pessoa"));
                pessoa = new Pessoa(id, nome, titulacao, sexo, cpf, logradouro, numero, bairro, complemento, cidade, cep, telefone, email, perfil, usuario, senha);
                dao.updatePessoa(pessoa);
            } else if (type.equalsIgnoreCase("excluir")) {
                Long id = Long.valueOf(req.getParameter("id_pessoa"));
                dao.excluir(id);
            }
        } catch (Exception ex) {

        }

        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("location='inicio.jsp';");
        out.println("alert('Operação realizada com sucesso!');");
        out.println("</script>");

    }

}
