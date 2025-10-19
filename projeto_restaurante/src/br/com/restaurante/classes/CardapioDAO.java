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
public class CardapioDAO {
    public List<Cardapio> getLista() {
        String mysql = "select * from cardapio";
        List<Cardapio> cardapio = new ArrayList<>();
        try {
            PreparedStatement pst = ModuloConexao.getPreparableStatement(mysql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Cardapio objCardapio = new Cardapio();
                objCardapio.setCodProduto(rs.getInt("codCardapio"));
                objCardapio.setNome(rs.getString("nomeComida"));
                objCardapio.setValor(rs.getDouble("valorComida"));
                objCardapio.setDescricao(rs.getString("descricaoComida"));

                cardapio.add(objCardapio);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL " + ex.getMessage());
        }

        return cardapio;
    }
}
