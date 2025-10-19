/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.restaurante.classes;

import br.com.restaurante.classes.Categoria;
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
public class CategoriaDAO {
    public List<Categoria> getLista() {
        String mysql = "select * from categoria";
        List<Categoria> categoria = new ArrayList<>();
        try {
            PreparedStatement pst = ModuloConexao.getPreparableStatement(mysql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Categoria objCategoria = new Categoria();
                objCategoria.setCodCategoria(rs.getInt("codCategoria"));
                objCategoria.setNomeCategoria(rs.getString("nomeCategoria"));

                categoria.add(objCategoria);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL " + ex.getMessage());
        }

        return categoria;
    }
    
    public boolean inserir(Categoria categoria) {
        String mysql = "CALL `proc_insereCategoria`(?)";
 
        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setString(1, categoria.getNomeCategoria());
            

            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Categoria cadastrado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Categoria não cadastrada!");
                return false;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro em mysql " + ex.getMessage());
            return false;
        }

    }

    public boolean salvar(Categoria objCategoria) {
        if (objCategoria.getCodCategoria()== null) {
            inserir(objCategoria);
            return true;
        } else {
            alterar(objCategoria);
            return true;
        }

    }

    public boolean remover(Categoria categoria) {
        String mysql = "CALL `proc_apagarCategoria`(?)";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, categoria.getCodCategoria());
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
    
    
    
    public boolean alterar(Categoria objCategoria){
        String mysql = "CALL `proc_alterarCategoria`(?, ?)";
        
        
        try{
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, objCategoria.getCodCategoria());
            prt.setString(2, objCategoria.getNomeCategoria());
            
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
