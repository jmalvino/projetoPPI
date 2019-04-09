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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luciano
 */
@WebServlet("/login")
public class ServletLog extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

        Pessoa p = dao.autenticacao(usuario, senha);
        if (p != null) {
            if (p.getPerfil().equalsIgnoreCase("diretor")) {
                resp.sendRedirect("../UserServlets/diretor/indexDiretor.jsp");

            } else if (p.getPerfil().equalsIgnoreCase("coordenador")) {
                resp.sendRedirect("../UserServlets/coordenador/indexCoordenador.jsp");

            } else if (p.getPerfil().equalsIgnoreCase("professor")) {
                resp.sendRedirect("../UserServlets/professor/indexProfessor.jsp");

            } else if (p.getPerfil().equalsIgnoreCase("aluno")) {
                resp.sendRedirect("../UserServlets/aluno/indexAluno.jsp");

//            } else {
//                PrintWriter out = resp.getWriter();
//                out.println("<script type=\"text/javascript\">");
//                out.println("location='login.jsp';");
//                out.println("alert('Usuário ou senha inválidos esse!');");
//                out.println("</script>");
//            }
            }
        } else {
            PrintWriter out = resp.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Usuário ou senha inválidos aqui!');");
            out.println("location='login.jsp';");            
            out.println("</script>");
        }
    }

}
