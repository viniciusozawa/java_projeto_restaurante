/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.restaurante.classes;

import java.sql.Date;

/**
 *
 * @author yuji
 */
public class Pagamento {

    private Integer codPagamento;
    private String formaPagamento;
    private Double valorTotal;
    private java.sql.Date dataPagamento;
    private Boolean status = false;

    public Pagamento() {
        java.util.Date agora = new java.util.Date();
        this.dataPagamento = new java.sql.Date(agora.getTime());
        
    }
    
    

    public Integer getCodPagamento() {
        return codPagamento;
    }

    public void setCodPagamento(Integer codPagamento) {
        this.codPagamento = codPagamento;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public Double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(Double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getDataPagamento() {
        return dataPagamento;
    }

    public void setDataPagamento(Date dataPagamento) {
        this.dataPagamento = dataPagamento;
    }

    public java.util.Date getdataConversor() {
        if (dataPagamento == null) {
            return null;
        }

        return new java.util.Date(dataPagamento.getTime());
    }

    public void setdataConversor(java.util.Date d) {
        if (d == null) {
            dataPagamento = null;
        } else {

            dataPagamento = new java.sql.Date(d.getTime());
            System.out.println(dataPagamento);
        }
    }

    public java.util.Date getdataPagamentoUtil() {
        if (dataPagamento == null) {
            return null;
        }
        return new java.util.Date(dataPagamento.getTime());
    }

    public void setdataPagamentoUtil(java.util.Date d) {
        if (d == null) {
            dataPagamento = null;
        } else {
            dataPagamento = new java.sql.Date(d.getTime());
            System.out.println(dataPagamento);
        }
    }
}
