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

    public Cliente(String nome, String cpf, String senhaCliente, String telefone) {
        this.nome = nome;
        this.cpf = cpf;
        this.senhaCliente = senhaCliente;
        this.telefone = telefone;
    }

    public boolean insereCliente() {
        String sql = "CALL `proc_insereCliente`(?, ?, ?, ?)";
        PreparedStatement prt = ModuloConexao.getPreparableStatement(sql);
        try {
            prt.setString(1, this.nome);
            prt.setString(2, this.cpf);
            prt.setString(3, this.senhaCliente);
            prt.setString(4, this.telefone);
            prt.execute();
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            try {
                prt.close();
            } catch (Exception ignore) {

            }
        }
    }

    public static Cliente mostrarCliente(String cpf, String senha) {
        String sql = "select * from cliente where cpfCliente = ? AND senhaCliente = ?";

        PreparedStatement pst = ModuloConexao.getPreparableStatement(sql);
        try {
            pst.setString(1, cpf);
            pst.setString(2, senha);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return new Cliente(rs.getString("nomeCliente"), 
                                    rs.getString("cpfCliente"), 
                                    rs.getString("senhaCliente"), 
                                    rs.getString("telefone"));
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;

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
