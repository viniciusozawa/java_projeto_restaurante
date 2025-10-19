/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.restaurante.classes;

import br.com.restaurante.dal.ModuloConexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author yuji
 */
public class MesaDAO {
    public List<Mesa> getLista() {
        String mysql = "select * from mesa";
        List<Mesa> mesa = new ArrayList<>();
        try {
            PreparedStatement pst = ModuloConexao.getPreparableStatement(mysql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Mesa objMesa = new Mesa();
                objMesa.setCodMesa(rs.getInt("codMesa"));
                objMesa.setNumeroMesa(rs.getInt("numeroMesa"));
                objMesa.setDescricao(rs.getString("localMesa"));

                mesa.add(objMesa);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL " + ex.getMessage());
        }

        return mesa;
    }
    
    public boolean inserir(Mesa mesa) {
        String mysql = "CALL `proc_insereMesa`(?, ?)";
 
        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, mesa.getNumeroMesa());
            prt.setString(2, mesa.getDescricao());
            

            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Mesa cadastrado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Mesa não cadastrada!");
                return false;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro em mysql " + ex.getMessage());
            return false;
        }

    }

    public boolean salvar(Mesa objMesa) {
        if (objMesa.getCodMesa() == null) {
            inserir(objMesa);
            return true;
        } else {
            alterar(objMesa);
            return true;
        }

    }

    public boolean remover(Mesa mesa) {
        String mysql = "CALL `proc_apagarMesa`(?)";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            System.out.println(mesa.getCodMesa());
            prt.setInt(1, mesa.getCodMesa());
            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Apagado com sucesso");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Erro chave nao encontrada");
                return false;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro em mysql " + ex.getMessage());
            return false;
        }
    }
    
    
    
    public boolean alterar(Mesa mesa){
        String mysql = "CALL `proc_alterarMesa`(?, ?, ?)";
        
        
        try{
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, mesa.getCodMesa());
            prt.setInt(2, mesa.getCodMesa());
            prt.setString(3, mesa.getDescricao());
            
            if(prt.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Alterado com sucesso");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Erro chave nao encontrada");
                return false;
            }
            
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Erro em mysql "+ex.getMessage());
            return false;
        }
    }
    
    
}
