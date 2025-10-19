/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.restaurante.classes;

import java.time.LocalTime;

/**
 *
 * @author yuji
 */
public class Turno {
    private Integer codTurno;
    private LocalTime horarioInicial;
    private LocalTime horarioFinal;

    public Integer getCodTurno() {
        return codTurno;
    }

    public void setCodTurno(Integer codTurno) {
        this.codTurno = codTurno;
    }

    public LocalTime getHorarioInicial() {
        return horarioInicial;
    }

    public void setHorarioInicial(LocalTime horarioInicial) {
        this.horarioInicial = horarioInicial;
    }

    public LocalTime getHorarioFinal() {
        return horarioFinal;
    }

    public void setHorarioFinal(LocalTime horarioFinal) {
        this.horarioFinal = horarioFinal;
    }
    
    
    
}
