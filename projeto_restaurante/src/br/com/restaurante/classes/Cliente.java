/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.restaurante.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import br.com.restaurante.dal.ModuloConexao;
import java.sql.Connection;
/**
 *
 * @author yuji
 */
public class Cliente {
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

    
    public boolean insereCliente(){
        String sql = "CALL `proc_insereCliente`(?, ?, ?, ?)";
        PreparedStatement prt = ModuloConexao.getPreparableStatement(sql);
        try{
            prt.setString(1, this.nome);
            prt.setString(2, this.cpf);
            prt.setString(3, this.senhaCliente);
            prt.setString(4, this.telefone);
            prt.execute();
            return true;
        } catch (Exception e) {
            return false;
        }finally{
            try {
                prt.close();
            } catch (Exception ignore) {
            
            }
        }
        
        
    }
    
}
