/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.restaurante.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import br.com.restaurante.dal.ModuloConexao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author yuji
 */
public class Cliente {
    private Integer id;
    private String nome;
    private String cpf;
    private String senhaCliente;
    private String telefone;
    private Date dataCadastro;

    public Cliente(){}
    
    public Cliente(Integer id, String nome, String cpf, String senhaCliente, String telefone, Date dataCadastro) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.senhaCliente = senhaCliente;
        this.telefone = telefone;
        this.dataCadastro = dataCadastro;
    }

    


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSenhaCliente() {
        return senhaCliente;
    }

    public void setSenhaCliente(String senhaCliente) {
        this.senhaCliente = senhaCliente;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

}
