package br.edu.fafic.servlets;

import br.edu.fafic.dao.LoginDao;
import br.edu.fafic.model.Login;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
        String usuario = req.getParameter("usuario");
        String senha = req.getParameter("senha");

        Login login = LoginDao.autenticacao(usuario, senha);
        String param = req.getParameter("param");
        
        if(param != null && param.equals("logout")){
            req.getSession().invalidate();
            resp.sendRedirect("${pageContext.request.contextPath}/inicio.jsp");// acho que aqui tem que colocar para o inicio.jsp
        } else{
        	if (login != null) {
        		String perfil = login.getPerfil();
        		req.setAttribute("login", login);
        		req.getSession().setAttribute("usuario", login);
        		req.getRequestDispatcher("../projetoPPI" + perfil +"/index" + perfil + ".jsp").forward(req, resp);
        	} else {
        		PrintWriter out = resp.getWriter();
        		out.println("<script type=\"text/javascript\">");
        		out.println("location='inicio.jsp';");
        		out.println("alert('Usu·rio ou senha inv·lidos!');");
         		out.println("</script>");
        	}
        }

        
//        if (login != null) {
//            if (login.getPerfil().equalsIgnoreCase("diretor")) {
//                resp.sendRedirect("../projetoPPI/diretor/indexDiretor.jsp");
//
//            } else if (login.getPerfil().equalsIgnoreCase("coordenador")) {
//                resp.sendRedirect("../projetoPPI/coordenador/indexCoordenador.jsp");
//
//            } else if (login.getPerfil().equalsIgnoreCase("professor")) {
//                resp.sendRedirect("../projetoPPI/professor/indexProfessor.jsp");
//
//            } else if (login.getPerfil().equalsIgnoreCase("aluno")) {
//                resp.sendRedirect("../projetoPPI/aluno/indexAluno.jsp");

//            } else {
//                PrintWriter out = resp.getWriter();
//                out.println("<script type=\"text/javascript\">");
//                out.println("location='login.jsp';");
//                out.println("alert('Usu√°rio ou senha inv√°lidos esse!');");
//                out.println("</script>");
//            }
            
//	} else {
//		PrintWriter out = resp.getWriter();
//		out.println("<script type=\"text/javascript\">");
//		out.println("alert('Usuario ou senha invalidos aqui!');");
//		out.println("location='login.jsp';");            
//		out.println("</script>");
//	}
	}
}
