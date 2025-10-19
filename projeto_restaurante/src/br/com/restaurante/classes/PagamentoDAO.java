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
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author yuji
 */
public class PagamentoDAO {

    public List<Pagamento> getLista() {
        String mysql = "SELECT * FROM pagamento";
        List<Pagamento> pagamento = new ArrayList<>();

        try {
            PreparedStatement pst = ModuloConexao.getPreparableStatement(mysql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Pagamento objPagamento = new Pagamento();

                objPagamento.setCodPagamento(rs.getInt("codPagamento"));
                objPagamento.setFormaPagamento(rs.getString("formaPagamento"));
                objPagamento.setValorTotal(rs.getDouble("valorPago"));
                objPagamento.setDataPagamento(rs.getDate("dataPagamento"));
                objPagamento.setStatus(rs.getBoolean("statusPagamento"));

                pagamento.add(objPagamento);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }

        return pagamento;
    }

    public boolean inserir(Pagamento objPagamento) {
        String mysql = "INSERT INTO pagamento( formaPagamento, valorPago, dataPagamento,  statusPagamento) VALUES ( ?, ?, ?, ?)";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);

            prt.setString(1, objPagamento.getFormaPagamento());
            prt.setDouble(2, objPagamento.getValorTotal());
            prt.setDate(3, objPagamento.getDataPagamento());
            prt.setBoolean(4, objPagamento.getStatus());

            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Turno cadastrado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Turno não cadastrado!");
                return false;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro em mysql: " + ex.getMessage());
            return false;
        }
    }

    public boolean salvar(Pagamento pagamento) {
        if (pagamento.getCodPagamento() == null) {
            return inserir(pagamento);
        } else {
            return alterar(pagamento);
        }
    }

    public boolean alterar(Pagamento objPagamento) {
        String mysql = "UPDATE pagamento SET formaPagamento = ?, valorPago = ?, dataPagamento = ?, statusPagamento = ? WHERE codPagamento = ?";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setString(1, objPagamento.getFormaPagamento());
            prt.setDouble(2, objPagamento.getValorTotal());
            prt.setDate(3, objPagamento.getDataPagamento());
            prt.setBoolean(4, objPagamento.getStatus());
            prt.setInt(5, objPagamento.getCodPagamento());

            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Pagamento alterado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Erro: chave não encontrada");
                return false;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro em mysql: " + ex.getMessage());
            return false;
        }
    }

    public boolean remover(Pagamento pagamento) {
        String mysql = "DELETE FROM pagamento WHERE codPagamento = ?;";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, pagamento.getCodPagamento());

            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Pagamento apagado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Erro: chave não encontrada");
                return false;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro em mysql: " + ex.getMessage());
            return false;
        }
    }
}
