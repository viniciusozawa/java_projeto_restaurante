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
public class CargoDAO {
    
    public List<Cargo> getLista() {
        String mysql = "select * from cargo";
        List<Cargo> cargo = new ArrayList<>();
        try {
            PreparedStatement pst = ModuloConexao.getPreparableStatement(mysql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Cargo objCargo = new Cargo();
                objCargo.setCod(rs.getInt("codCargo"));
                objCargo.setDescricao(rs.getString("nomeCargo"));

                cargo.add(objCargo);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL " + ex.getMessage());
        }

        return cargo;
    }

    public boolean inserir(Cargo cargo) {
        String mysql = "insert into cargo(nomeCargo) values(?)";
 
        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setString(1, cargo.getDescricao());
            

            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Cargo cadastrado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Cargo não cadastrada!");
                return false;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro em mysql " + ex.getMessage());
            return false;
        }

    }

    public boolean salvar(Cargo objCargo) {
        if (objCargo.getCod() == null) {
            inserir(objCargo);
            return true;
        } else {
            alterar(objCargo);
            return true;
        }

    }

    public boolean remover(Cargo objCargo) {
        String mysql = "delete from cargo where codCargo = ?";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, objCargo.getCod());
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
    
    
    
    public boolean alterar(Cargo objCargo){
        String mysql = "UPDATE estoque SET descricao = ? WHERE codCargo = ?";
        
        
        try{
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setString(1, objCargo.getDescricao());
            prt.setInt(2, objCargo.getCod());
            
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
