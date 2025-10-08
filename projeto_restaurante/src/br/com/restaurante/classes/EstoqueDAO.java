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
public class EstoqueDAO {

    public List<Estoque> getLista() {
        String mysql = "select * from estoque";
        List<Estoque> estoque = new ArrayList<>();
        try {
            PreparedStatement pst = ModuloConexao.getPreparableStatement(mysql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Estoque objEstoque = new Estoque();
                objEstoque.setCod(rs.getInt("codEstoque"));
                objEstoque.setNomeItem(rs.getString("nomeItem"));
                objEstoque.setQuant(rs.getDouble("quant"));
                objEstoque.setDataProducao(rs.getDate("dataProducao"));
                objEstoque.setDataVencimento(rs.getDate("dataVencimento"));
                objEstoque.setDescricao(rs.getString("descricao"));

                estoque.add(objEstoque);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL " + ex.getMessage());
        }

        return estoque;
    }

    public boolean inserir(Estoque objEstoque) {
        String mysql = "CALL proc_insereEstoque(?,?,?,?,?)";
        java.util.Date dataProdUtil = objEstoque.getdataProducaoUtil(); // do getter auxiliar
        java.util.Date dataVencUtil = objEstoque.getdataVencimentoUtil();
        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setString(1, objEstoque.getNomeItem());
            prt.setDouble(2, objEstoque.getQuant());
            if (dataProdUtil != null) {
                prt.setDate(3, new java.sql.Date(dataProdUtil.getTime()));
            } else {
                prt.setNull(3, java.sql.Types.DATE);
            }

            if (dataVencUtil != null) {
                prt.setDate(4, new java.sql.Date(dataVencUtil.getTime()));
            } else {
                prt.setNull(4, java.sql.Types.DATE);
            }
            prt.setString(5, objEstoque.getDescricao());

            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Estoque cadastrado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Estoque não cadastrada!");
                return false;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro em mysql " + ex.getMessage());
            return false;
        }

    }

    public boolean salvar(Estoque objEstoque) {
        if (objEstoque.getCod() == null) {
            inserir(objEstoque);
            return true;
        } else {
            alterar(objEstoque);
            return true;
        }

    }

    public boolean remover(Estoque objEstoque) {
        String mysql = "delete from estoque where codEstoque = ?";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, objEstoque.getCod());
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
    
    
    
    public boolean alterar(Estoque e){
        String mysql = "UPDATE estoque SET nomeItem = ?, quant = ?, dataProducao = ?, dataVencimento = ?, descricao = ? WHERE codEstoque = ?";
        java.util.Date dataProdUtil = e.getdataProducaoUtil(); // do getter auxiliar
        java.util.Date dataVencUtil = e.getdataVencimentoUtil();
        
        try{
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setString(1, e.getNomeItem());
            prt.setDouble(2, e.getQuant());
            if (dataProdUtil != null) {
                prt.setDate(3, new java.sql.Date(dataProdUtil.getTime()));
            } else {
                prt.setNull(3, java.sql.Types.DATE);
            }

            if (dataVencUtil != null) {
                prt.setDate(4, new java.sql.Date(dataVencUtil.getTime()));
            } else {
                prt.setNull(4, java.sql.Types.DATE);
            }
            prt.setString(5, e.getDescricao());
            prt.setInt(6, e.getCod());
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
