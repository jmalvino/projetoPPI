/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fafic.dao;

import br.edu.fafic.connection.ConnectionFactory;
import br.edu.fafic.model.Diretor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DiretorDao {

    private final Connection con = ConnectionFactory.getConnectionFactory().getConnection();

    public void cadastraDiretor(Diretor diretor) {
        //String sql = "insert into diretor values(default,?,?,?,?,?,?,?,?,?,?,?)";
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO ");
        sql.append("   diretor ");
        sql.append(" VALUES ");
        sql.append("   ( ");
        sql.append("   default, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?, ");
        sql.append("   ?  ");
        sql.append("   ); ");
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql.toString());
            ps.setString(1, diretor.getNome());
            ps.setString(2, diretor.getTitulacao());
            ps.setString(3, diretor.getSexo());
            ps.setString(4, diretor.getCpf());
            ps.setString(5, diretor.getLogradouro());
            ps.setString(6, diretor.getNumero());
            ps.setString(7, diretor.getBairro());
            ps.setString(8, diretor.getComplemento());
            ps.setString(9, diretor.getCidade());
            ps.setString(10, diretor.getCep());
            ps.setString(11, diretor.getTelefone());
            ps.setString(12, diretor.getEmail());
            ps.setString(13, diretor.getUsuario());
            ps.setString(14, diretor.getSenha());
            ps.setString(15, diretor.getPerfil());
            ps.executeUpdate();
            ps.close();
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Diretor> getAll() {
        List<Diretor> pessoas = new ArrayList();
        //String sql = "select * from pessoa";
        Diretor pessoa;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   * ");
        sql.append(" FROM ");
        sql.append("   pessoa ");

        PreparedStatement ps;
        ResultSet rs;
        try {
            ps = con.prepareStatement(sql.toString());

            rs = ps.executeQuery();
            while (rs.next()) {
                pessoa = new Diretor();
                pessoa.setIdPessoa(rs.getLong("id_pessoa"));
                pessoa.setNome(rs.getString("nome"));
                pessoa.setTitulacao(rs.getString("titulacao"));
                pessoa.setSexo(rs.getString("sexo"));
                pessoa.setCpf(rs.getString("cpf"));
                pessoa.setLogradouro(rs.getString("logradouro"));
                pessoa.setNumero(rs.getString("numero"));
                pessoa.setBairro((rs.getString("bairro")));
                pessoa.setComplemento((rs.getString("complemento")));
                pessoa.setCidade((rs.getString("cidade")));
                pessoa.setCep((rs.getString("cep")));
                pessoa.setTelefone((rs.getString("telefone")));
                pessoa.setEmail((rs.getString("email")));
                pessoa.setUsuario((rs.getString("usuario")));
                pessoa.setSenha((rs.getString("senha")));
                pessoa.setPerfil((rs.getString("perfil")));

                pessoas.add(pessoa);
            }
            ps.close();
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pessoas;
    }

    public Diretor getLoginById(Long idPessoa) {
        Diretor pessoa = new Diretor();
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   * ");
        sql.append(" FROM ");
        sql.append("   pessoa ");
        sql.append(" WHERE ");
        sql.append("   id_pessoa = ? ");
        sql.append(" ; ");
        //String sql = "select * from pessoa where id=?";
        PreparedStatement ps;
        ResultSet rs;
        try {
            ps = con.prepareStatement(sql.toString());
            ps.setLong(1, idPessoa);
            ps.executeQuery();

            rs = ps.getResultSet();
            while (rs.next()) {
                pessoa.setIdPessoa(rs.getLong("id_pessoa"));
                pessoa.setNome(rs.getString("nome"));
                pessoa.setTitulacao(rs.getString("titulacao"));
                pessoa.setSexo(rs.getString("sexo"));
                pessoa.setCpf(rs.getString("cpf"));
                pessoa.setLogradouro(rs.getString("logradouro"));
                pessoa.setNumero(rs.getString("numero"));
                pessoa.setBairro((rs.getString("bairro")));
                pessoa.setComplemento((rs.getString("complemento")));
                pessoa.setCidade((rs.getString("cidade")));
                pessoa.setCep((rs.getString("cep")));
                pessoa.setTelefone((rs.getString("telefone")));
                pessoa.setEmail((rs.getString("email")));
                pessoa.setUsuario((rs.getString("usuario")));
                pessoa.setSenha((rs.getString("senha")));
                pessoa.setPerfil((rs.getString("perfil")));

            }
            ps.close();
            con.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pessoa;
    }
    
   
    
    public List<Diretor> getLoginByPerfil(String perfilPessoa) {
        Diretor pessoa;
        List<Diretor> pessoas = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   * ");
        sql.append(" FROM ");
        sql.append("   pessoa ");
        sql.append(" WHERE ");
        sql.append("   perfil = ? ");
        sql.append(" ; ");
        //String sql = "select * from pessoa where id=?";
        PreparedStatement ps;
        ResultSet rs;
        try {
            ps = con.prepareStatement(sql.toString());
            ps.setString(1, perfilPessoa);
            ps.executeQuery();

            rs = ps.getResultSet();
            while (rs.next()) {
                pessoa = new Diretor();
                pessoa.setIdPessoa(rs.getLong("id_pessoa"));
                pessoa.setNome(rs.getString("nome"));
                pessoa.setTitulacao(rs.getString("titulacao"));
                pessoa.setSexo(rs.getString("sexo"));
                pessoa.setCpf(rs.getString("cpf"));
                pessoa.setLogradouro(rs.getString("logradouro"));
                pessoa.setNumero(rs.getString("numero"));
                pessoa.setBairro((rs.getString("bairro")));
                pessoa.setComplemento((rs.getString("complemento")));
                pessoa.setCidade((rs.getString("cidade")));
                pessoa.setCep((rs.getString("cep")));
                pessoa.setTelefone((rs.getString("telefone")));
                pessoa.setEmail((rs.getString("email")));
                pessoa.setUsuario((rs.getString("usuario")));
                pessoa.setSenha((rs.getString("senha")));
                pessoa.setPerfil((rs.getString("perfil")));
                pessoas.add(pessoa);
            }
            ps.close();
            con.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pessoas;
    }
    
    public List<Diretor> getLoginByPerfilProfessor(String perfilPessoa) {
        Diretor pessoa;
        List<Diretor> pessoas = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   * ");
        sql.append(" FROM ");
        sql.append("   pessoa ");
        sql.append(" WHERE ");
        sql.append("   perfil = ? ");
        sql.append(" ; ");
        //String sql = "select * from pessoa where id=?";
        PreparedStatement ps;
        ResultSet rs;
        try {
            ps = con.prepareStatement(sql.toString());
            ps.setString(1, perfilPessoa);
            ps.executeQuery();

            rs = ps.getResultSet();
            while (rs.next()) {
                pessoa = new Diretor();
                pessoa.setIdPessoa(rs.getLong("id_pessoa"));
                pessoa.setNome(rs.getString("nome"));
                pessoa.setTitulacao(rs.getString("titulacao"));
                pessoa.setSexo(rs.getString("sexo"));
                pessoa.setCpf(rs.getString("cpf"));
                pessoa.setLogradouro(rs.getString("logradouro"));
                pessoa.setNumero(rs.getString("numero"));
                pessoa.setBairro((rs.getString("bairro")));
                pessoa.setComplemento((rs.getString("complemento")));
                pessoa.setCidade((rs.getString("cidade")));
                pessoa.setCep((rs.getString("cep")));
                pessoa.setTelefone((rs.getString("telefone")));
                pessoa.setEmail((rs.getString("email")));
                pessoa.setUsuario((rs.getString("usuario")));
                pessoa.setSenha((rs.getString("senha")));
                pessoa.setPerfil((rs.getString("perfil")));
                pessoas.add(pessoa);
            }
            ps.close();
            con.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pessoas;
    }
    

    public void updatePessoa(Diretor pessoa) {
        // String sql = "update pessoa set nome = ?, email = ? where id = ?";
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE ");
        sql.append("   pessoa ");
        sql.append(" SET ");
        sql.append("   nome = ?, ");
        sql.append("   titulacao = ?, ");
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
        sql.append(" WHERE ");
        sql.append("   id_pessoa = ? ");
        sql.append(" ; ");

        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql.toString());
            ps.setString(1, pessoa.getNome());
            ps.setString(2, pessoa.getTitulacao());
            ps.setString(3, pessoa.getSexo());
            ps.setString(4, pessoa.getCpf());
            ps.setString(5, pessoa.getLogradouro());
            ps.setString(6, pessoa.getNumero());
            ps.setString(7, pessoa.getBairro());
            ps.setString(8, pessoa.getComplemento());
            ps.setString(9, pessoa.getCidade());
            ps.setString(10, pessoa.getCep());
            ps.setString(11, pessoa.getTelefone());
            ps.setString(12, pessoa.getEmail());
            ps.setString(13, pessoa.getUsuario());
            ps.setString(14, pessoa.getSenha());
            ps.setString(15, pessoa.getPerfil());
            ps.setLong(16, pessoa.getIdPessoa());
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void excluir(Long idPessoa) {
        // String sql = "delete from pessoa where id=?";
        PreparedStatement ps;

        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE ");
        sql.append(" FROM ");
        sql.append("   pessoa ");
        sql.append(" WHERE ");
        sql.append("   id_pessoa = ? ");
        sql.append(" ; ");
        try {
            ps = con.prepareStatement(sql.toString());
            ps.setLong(1, idPessoa);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Diretor autenticacao(String usuario, String senha) {
        Diretor pessoa = null;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   * ");
        sql.append(" FROM ");
        sql.append("   pessoa ");
        sql.append(" WHERE ");
        sql.append("   usuario = ? ");
        sql.append("   and senha = ? ");
        sql.append(" ; ");

        // String sql = "select * from pessoa where nome = ? and email = ?";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql.toString());

            ps.setString(1, usuario);
            ps.setString(2, senha);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pessoa = new Diretor();
                pessoa.setIdPessoa(rs.getLong("id_pessoa"));
                pessoa.setNome(rs.getString("nome"));
                pessoa.setTitulacao(rs.getString("titulacao"));
                pessoa.setSexo(rs.getString("sexo"));
                pessoa.setCpf(rs.getString("cpf"));
                pessoa.setLogradouro(rs.getString("logradouro"));
                pessoa.setNumero(rs.getString("numero"));
                pessoa.setBairro((rs.getString("bairro")));
                pessoa.setComplemento((rs.getString("complemento")));
                pessoa.setCidade((rs.getString("cidade")));
                pessoa.setCep((rs.getString("cep")));
                pessoa.setTelefone((rs.getString("telefone")));
                pessoa.setEmail((rs.getString("email")));
                pessoa.setUsuario((rs.getString("usuario")));
                pessoa.setSenha((rs.getString("senha")));
                pessoa.setPerfil((rs.getString("perfil")));

            }

            ps.close();
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(DiretorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pessoa;
    }
}
