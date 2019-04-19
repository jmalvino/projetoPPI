package br.edu.fafic.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.fafic.dao.DiretorDao;
import br.edu.fafic.model.Diretor;
import br.edu.fafic.model.Endereco;
import br.edu.fafic.model.Login;

@WebServlet("/cadDiretor")
public class DiretorServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Diretor diretor = null;
		Endereco endereco = null;
		Login login = null;
		List<Diretor> diretores = DiretorDao.getAll();
		req.setAttribute("diretores", diretores);//(identificador , valor(lista))
		req.getRequestDispatcher("inicio.jsp").forward(req, resp);
		try {
			
			String nome = req.getParameter("nome");
			String sexo = req.getParameter("sexo");
			String cpf = req.getParameter("cpf");
			String rg = req.getParameter("rg");
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
			String titulacao = req.getParameter("titulacao");
			Double salario = Double.valueOf(req.getParameter("salario"));
			Date dataAdmissao = Date.valueOf(req.getParameter("data_admissao"));
			Boolean excluido = Boolean.valueOf(req.getParameter("excluido"));
			String type = req.getParameter("param");

			if (type.equalsIgnoreCase("cadastrar")) {
				endereco = new Endereco(logradouro, numero, bairro, complemento, cidade, cep);
				login = new Login(usuario, senha, perfil);
				diretor = new Diretor(nome, sexo, cpf, rg, endereco, login, telefone, email, excluido, titulacao,
						salario, dataAdmissao, excluido);// '1994-03-22'
				DiretorDao.cadastraDiretor(diretor, endereco, login);

			} else if (type.equalsIgnoreCase("editar")) {
				Long codDiretor = Long.valueOf(req.getParameter("cod_diretor"));
				endereco = new Endereco(logradouro, numero, bairro, complemento, cidade, cep);
				login = new Login(usuario, senha, perfil);
				diretor = new Diretor(codDiretor, nome, sexo, cpf, rg, endereco, login, telefone, email, excluido,
						codDiretor, titulacao, salario, dataAdmissao, excluido);
				DiretorDao.updateDiretor(diretor);

			} else if (type.equalsIgnoreCase("excluir")) {
				Long codDiretor = Long.valueOf(req.getParameter("cod_diretor"));
				// dao.excluir(id);
			}

			PrintWriter out = resp.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("location='inicio.jsp';");
			out.println("alert('Operacao realizada com sucesso!');");
			out.println("</script>");

		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}
