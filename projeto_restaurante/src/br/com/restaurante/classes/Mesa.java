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
public class Mesa {
    private Integer codMesa;
    private Integer numeroMesa;
    private String descricao;

    public Integer getCodMesa() {
        return codMesa;
    }

    public void setCodMesa(Integer codMesa) {
        this.codMesa = codMesa;
    }

    public Integer getNumeroMesa() {
        return numeroMesa;
    }

    public void setNumeroMesa(Integer numeroMesa) {
        this.numeroMesa = numeroMesa;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
