/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fafic.model;

/**
 *
 * @author Luciano
 */
public class Pessoa {

    private Long idPessoa;
    private String nome;
    private String titulacao;
    private String sexo;
    private String cpf;
    private String logradouro;
    private String numero;
    private String bairro;
    private String complemento;
    private String cidade;
    private String cep;
    private String telefone;
    private String email;
    private String perfil;
    private String usuario;
    private String senha;
    
    public Pessoa(){
        
    }

    public Pessoa(Long idPessoa, String nome, String titulacao, String sexo, String cpf, String logradouro, String numero, String bairro, String complemento, String cidade, String cep, String telefone, String email, String perfil, String usuario, String senha) {
        this.idPessoa = idPessoa;
        this.nome = nome;
        this.titulacao = titulacao;
        this.sexo = sexo;
        this.cpf = cpf;
        this.logradouro = logradouro;
        this.numero = numero;
        this.bairro = bairro;
        this.complemento = complemento;
        this.cidade = cidade;
        this.cep = cep;
        this.telefone = telefone;
        this.email = email;
        this.perfil = perfil;
        this.usuario = usuario;
        this.senha = senha;
    }

    public Pessoa(String nome, String titulacao, String sexo, String cpf, String logradouro, String numero, String bairro, String complemento, String cidade, String cep, String telefone, String email, String perfil, String usuario, String senha) {
        this.nome = nome;
        this.titulacao = titulacao;
        this.sexo = sexo;
        this.cpf = cpf;
        this.logradouro = logradouro;
        this.numero = numero;
        this.bairro = bairro;
        this.complemento = complemento;
        this.cidade = cidade;
        this.cep = cep;
        this.telefone = telefone;
        this.email = email;
        this.perfil = perfil;
        this.usuario = usuario;
        this.senha = senha;
    }

    public Long getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(Long idPessoa) {
        this.idPessoa = idPessoa;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTitulacao() {
        return titulacao;
    }

    public void setTitulacao(String titulacao) {
        this.titulacao = titulacao;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    

}
