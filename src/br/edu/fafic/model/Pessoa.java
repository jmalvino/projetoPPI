package br.edu.fafic.model;

public abstract class Pessoa {

	private Long codPessoa;
	private String nome;
	private String sexo;
	private String cpf;
	private String rg;
	private Endereco endereco;
	private Login login;
	private String telefone;
	private String email;
	private boolean excluido;

	public Pessoa(Long codPessoa, String nome, String sexo, String cpf, String rg, Endereco endereco, Login login,
			String telefone, String email, boolean excluido) {
		this.codPessoa = codPessoa;
		this.nome = nome;
		this.sexo = sexo;
		this.cpf = cpf;
		this.rg = rg;
		this.endereco = endereco;
		this.login = login;
		this.telefone = telefone;
		this.email = email;
		this.excluido = excluido;
	}

	public Pessoa(String nome, String sexo, String cpf, String rg, Endereco endereco, Login login, String telefone,
			String email, boolean excluido) {
		this.nome = nome;
		this.sexo = sexo;
		this.cpf = cpf;
		this.rg = rg;
		this.endereco = endereco;
		this.login = login;
		this.telefone = telefone;
		this.email = email;
		this.excluido = excluido;
	}

	Pessoa(){
		
	}
	public Long getCodPessoa() {
		return codPessoa;
	}

	public void setCodPessoa(Long codPessoa) {
		this.codPessoa = codPessoa;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
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

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
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

	public boolean isExcluido() {
		return excluido;
	}

	public void setExcluido(boolean excluido) {
		this.excluido = excluido;
	}

}
