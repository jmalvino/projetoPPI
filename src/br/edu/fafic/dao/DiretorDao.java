/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fafic.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import br.edu.fafic.connection.ConnectionFactory;
import br.edu.fafic.model.Diretor;
import br.edu.fafic.model.Endereco;
import br.edu.fafic.model.Login;
import br.edu.fafic.model.Pessoa;

public class DiretorDao {

	public static Diretor cadastraDiretor(Diretor diretor, Endereco endereco, Login login) {

		final Connection con = ConnectionFactory.getConnectionFactory().getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			StringBuilder sql = new StringBuilder();

			PessoaDao.cadastraPessoa(diretor, endereco, login);

			sql.append("\n INSERT INTO ");
			sql.append("\n   diretor ");
			sql.append("\n VALUES ");
			sql.append("\n   ( ");
			sql.append("\n   ?, ");// cod
			sql.append("\n   ?, ");// titulacao
			sql.append("\n   ?, ");// salario
			sql.append("\n   ?, ");// dataAdm
			sql.append("\n   default ");// excluido
			sql.append("\n   ); ");// fim insert diretor
//			sql.append("INSERT INTO diretor(cod_diretor, titulacao, salario, data_admissao, excluido) "
//					+ "VALUES (?, ?, ?, '?', default);");
			ps = con.prepareStatement(sql.toString());

			diretor.setCodDiretor(PessoaDao.maximoCodPessoa());
			ps.setLong(1, diretor.getCodDiretor());
			ps.setString(2, diretor.getTitulacao());
			ps.setDouble(3, diretor.getSalario());
			ps.setDate(4, diretor.getDataAdmissao());

			ps.executeUpdate();

		} catch (SQLException ex) {
			ex.printStackTrace();
			Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			ConnectionFactory.closeConnection(con, ps, rs);
		}

		return diretor;
	}

	public static List<Diretor> getAll() {

		final Connection con = ConnectionFactory.getConnectionFactory().getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Diretor> diretores = new ArrayList<Diretor>();

		try {

			StringBuilder sql = new StringBuilder();
			sql.append("\n SELECT ");
			sql.append("\n   * ");
			sql.append("\n FROM ");
			sql.append("\n   diretor d");
			sql.append("\n INNER JOIN ");
			sql.append("\n   pessoa p");
			sql.append("\n ON ");
			sql.append("\n  d.cod_diretor = p.cod_pessoa ");
			sql.append("\n INNER JOIN ");
			sql.append("\n   endereco e");
			sql.append("\n ON ");
			sql.append("\n  p.cod_endereco = e.cod_endereco ");
			sql.append("\n INNER JOIN ");
			sql.append("\n   login l");
			sql.append("\n ON ");
			sql.append("\n  p.cod_login = l.cod_login ");
			sql.append("\n  AND p.excluido = false ");
			sql.append("\n ORDER BY ");
			sql.append("\n   p.nome ");

			ps = con.prepareStatement(sql.toString());
			rs = ps.executeQuery();

			while (rs.next()) {

				Diretor diretor = new Diretor();
				Endereco endereco = new Endereco();
				Login login = new Login();
				diretor.setCodDiretor(rs.getLong("cod_diretor"));
				diretor.setNome(rs.getString("nome"));
				diretor.setSexo(rs.getString("sexo"));
				diretor.setCpf(rs.getString("cpf"));
				diretor.setRg(rs.getString("rg"));
				endereco.setLogradouro(rs.getString("logradouro"));
				endereco.setNumero(rs.getString("numero"));
				endereco.setBairro((rs.getString("bairro")));
				endereco.setComplemento((rs.getString("complemento")));
				endereco.setCidade((rs.getString("cidade")));
				endereco.setCep((rs.getString("cep")));
				diretor.setEndereco(endereco);
				login.setUsuario((rs.getString("usuario")));
				login.setSenha((rs.getString("senha")));
				login.setPerfil((rs.getString("perfil")));
				diretor.setLogin(login);
				diretor.setTelefone((rs.getString("telefone")));
				diretor.setEmail((rs.getString("email")));
				diretor.setTitulacao(rs.getString("titulacao"));
				diretor.setSalario(Double.parseDouble(rs.getString("salario")));
				diretor.setDataAdmissao(Date.valueOf((rs.getString("data_admissao"))));

				diretores.add(diretor);
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
			Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			ConnectionFactory.closeConnection(con, ps, rs);
		}
		System.out.println(diretores.toString());
		
		return diretores;
	}

	public static Diretor getLoginById(Long codDiretor) {

		final Connection con = ConnectionFactory.getConnectionFactory().getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Diretor diretor = null;

		try {

			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT ");
			sql.append("   * ");
			sql.append(" FROM ");
			sql.append("   diretor ");
			sql.append(" WHERE ");
			sql.append("   cod_diretor = ? ");
			sql.append("   AND excluido = false");
			sql.append(" ; ");

			ps = con.prepareStatement(sql.toString());
			ps.setLong(1, codDiretor);
			ps.executeQuery();

			rs = ps.getResultSet();

			while (rs.next()) {

				diretor = new Diretor();
				Endereco endereco = new Endereco();
				Login login = new Login();
				diretor.setCodDiretor(rs.getLong("cod_diretor"));
				diretor.setNome(rs.getString("nome"));
				diretor.setSexo(rs.getString("sexo"));
				diretor.setCpf(rs.getString("cpf"));
				diretor.setRg(rs.getString("rg"));
				endereco.setLogradouro(rs.getString("logradouro"));
				endereco.setNumero(rs.getString("numero"));
				endereco.setBairro((rs.getString("bairro")));
				endereco.setComplemento((rs.getString("complemento")));
				endereco.setCidade((rs.getString("cidade")));
				endereco.setCep((rs.getString("cep")));
				diretor.setEndereco(endereco);
				login.setUsuario((rs.getString("usuario")));
				login.setSenha((rs.getString("senha")));
				login.setPerfil((rs.getString("perfil")));
				diretor.setLogin(login);
				diretor.setTelefone((rs.getString("telefone")));
				diretor.setEmail((rs.getString("email")));
				diretor.setTitulacao(rs.getString("titulacao"));
				diretor.setSalario(Double.parseDouble(rs.getString("salario")));
				diretor.setDataAdmissao(Date.valueOf((rs.getString("data_admissao"))));
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
			Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			ConnectionFactory.closeConnection(con, ps, rs);
		}

		return diretor;
	}

	public static boolean updateDiretor(Diretor diretor) {

		final Connection con = ConnectionFactory.getConnectionFactory().getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE ");
			sql.append("   diretor ");
			sql.append(" SET ");
			sql.append("   nome = ?, ");
			sql.append("   sexo = ?, ");
			sql.append("   cpf = ?, ");
			sql.append("   logradouro = ?, ");
			sql.append("   numero = ?, ");
			sql.append("   bairro = ?, ");
			sql.append("   complemento = ?, ");
			sql.append("   cidade = ?, ");
			sql.append("   cep = ?, ");
			sql.append("   telefone = ?, ");
			sql.append("   email = ?, ");
			sql.append("   usuario = ?, ");
			sql.append("   senha = ?, ");
			sql.append("   perfil = ? ");
			sql.append("   titulacao = ?, ");
			sql.append(" WHERE ");
			sql.append("   cod_diretor = ? ");
			sql.append(" ; ");

			ps = con.prepareStatement(sql.toString());
			ps.setString(1, diretor.getNome());
			ps.setString(2, diretor.getTitulacao());
			ps.setString(3, diretor.getSexo());
			ps.setString(4, diretor.getCpf());
//			ps.setString(5, diretor.getLogradouro());
//			ps.setString(6, diretor.getNumero());
//			ps.setString(7, diretor.getBairro());
//			ps.setString(8, diretor.getComplemento());
//			ps.setString(9, diretor.getCidade());
//			ps.setString(10, diretor.getCep());
			ps.setString(11, diretor.getTelefone());
			ps.setString(12, diretor.getEmail());
//			ps.setString(13, diretor.getUsuario());
//			ps.setString(14, diretor.getSenha());
//			ps.setString(15, diretor.getPerfil());
			ps.setLong(16, diretor.getCodDiretor());

			ps.executeUpdate();
			return true;

		} catch (SQLException ex) {
			ex.printStackTrace();
			Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}
	}

	public static boolean excluir(Long idPessoa) {

		final Connection con = ConnectionFactory.getConnectionFactory().getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			StringBuilder sql = new StringBuilder();
			sql.append(" DELETE ");
			sql.append(" FROM ");
			sql.append("   pessoa ");
			sql.append(" WHERE ");
			sql.append("   id_pessoa = ? ");
			sql.append(" ; ");
			ps = con.prepareStatement(sql.toString());
			ps.setLong(1, idPessoa);

			ps.execute();
			return true;

		} catch (SQLException ex) {
			ex.printStackTrace();
			Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}

	}

}
