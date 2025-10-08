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
public class ClienteDAO {

    public List<Cliente> getLista() {
        String mysql = "select * from cliente";
        List<Cliente> cliente = new ArrayList<>();
        try {
            PreparedStatement pst = ModuloConexao.getPreparableStatement(mysql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Cliente objCliente = new Cliente(
                        rs.getInt("codCliente"),
                        rs.getString("nomeCliente"),
                        rs.getString("cpfCliente"),
                        rs.getString("senhaCliente"),
                        rs.getString("telefone"),
                        rs.getDate("dataCadastro")
                );

                cliente.add(objCliente);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL " + ex.getMessage());
        }

        return cliente;
    }

    public boolean inserir(Cliente objCliente) {
        String mysql = "CALL `proc_insereCliente`(?, ?, ?, ?)";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setString(1, objCliente.getNome());
            prt.setString(2, objCliente.getCpf());
            prt.setString(3, objCliente.getSenhaCliente());
            prt.setString(4, objCliente.getTelefone());

            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Cliente cadastrado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Não foi possível cadastrar o cliente!");
                return false;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro no MySQL: " + ex.getMessage());
            return false;
        }
    }

    public boolean atualizar(Cliente objCliente) {
        String mysql = "CALL `proc_alterarClienteOpcoes`(?, ?, ?, ?, ?)";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, objCliente.getId());
            prt.setString(2, objCliente.getNome());
            prt.setString(3, objCliente.getCpf());
            prt.setString(4, objCliente.getSenhaCliente());
            prt.setString(5, objCliente.getTelefone());

            if (prt.execute()) {
                JOptionPane.showMessageDialog(null, "Cliente atualizado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Cidae não cadastrada!");
                return false;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro em mysql " + ex.getMessage());
            return false;
        }

    }

    public boolean salvar(Cliente objCliente) {
        if (objCliente == null) {
            atualizar(objCliente);
            return true;
        } else {
            System.out.println("nao deu certo");
            return true;
        }

    }

    public static Cliente login(String cpf, String senha) {
        String sql = "SELECT codCliente, nomeCliente, cpfCliente, telefone, dataCadastro "
                + "FROM cliente WHERE cpfCliente = ? AND senhaCliente = ? LIMIT 1";

        try (PreparedStatement ps = ModuloConexao.getPreparableStatement(sql)) {
            ps.setString(1, cpf);
            ps.setString(2, senha);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Cliente c = new Cliente();
                    c.setId(rs.getInt("codCliente"));
                    c.setNome(rs.getString("nomeCliente"));
                    c.setCpf(rs.getString("cpfCliente"));
                    c.setTelefone(rs.getString("telefone"));
                    c.setDataCadastro(rs.getDate("dataCadastro"));
                    // não retorne a senha
                    return c;
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // ou logger
        }
        return null;
    }

    public boolean remover(Cliente objCliente) {
        String mysql = "delete from cliente where codCliente = ?";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, objCliente.getId());
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

}
