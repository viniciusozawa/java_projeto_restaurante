/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.restaurante.classes;

/**
 *
 * @author yuji
 */

import br.com.restaurante.dal.ModuloConexao;
import br.com.restaurante.classes.Turno;
import java.sql.*;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class TurnoDAO {

    public List<Turno> getLista() {
        String mysql = "SELECT * FROM turnos";
        List<Turno> turnos = new ArrayList<>();

        try {
            PreparedStatement pst = ModuloConexao.getPreparableStatement(mysql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Turno turno = new Turno();
                turno.setCodTurno(rs.getInt("codTurnos"));
                
                turno.setHorarioInicial(rs.getTime("horarioInicio").toLocalTime());
                System.out.println(turno.getHorarioInicial());
                turno.setHorarioFinal(rs.getTime("horarioFinal").toLocalTime());
                System.out.println(turno.getHorarioFinal());
                turnos.add(turno);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }

        return turnos;
    }

    public boolean inserir(Turno turno) {
        String mysql = "CALL `proc_insereTurnos`(?, ?)";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setTime(1, Time.valueOf(turno.getHorarioInicial()));
            prt.setTime(2, Time.valueOf(turno.getHorarioFinal()));

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

    public boolean salvar(Turno turno) {
        if (turno.getCodTurno() == null) {
            return inserir(turno);
        } else {
            return alterar(turno);
        }
    }

    public boolean alterar(Turno turno) {
        String mysql = "CALL `proc_alterarTurnos`(?, ?, ?)";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, turno.getCodTurno());
            prt.setTime(2, Time.valueOf(turno.getHorarioInicial()));
            prt.setTime(3, Time.valueOf(turno.getHorarioFinal()));

            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Turno alterado com sucesso!");
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

    public boolean remover(Turno turno) {
        String mysql = "DELETE FROM turnos WHERE codTurnos = ?;";

        try {
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, turno.getCodTurno());

            if (prt.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Turno apagado com sucesso!");
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