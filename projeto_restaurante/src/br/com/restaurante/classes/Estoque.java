/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.restaurante.classes;
import java.util.Date;


/**
 *
 * @author yuji
 */
public class Estoque {

    private Integer cod;
    private String nomeItem;
    private Double quant;
    private java.sql.Date dataProducao;
    private java.sql.Date dataVencimento;
    private String descricao;

    public Estoque() {
        java.util.Date agora = new java.util.Date();
        this.dataProducao = new java.sql.Date(agora.getTime());
        this.dataVencimento = new java.sql.Date(agora.getTime());
    }

    
    public Integer getCod() {
        return cod;
    }

    public void setCod(Integer cod) {
        this.cod = cod;
    }

    public String getNomeItem() {
        return nomeItem;
    }

    public void setNomeItem(String nomeItem) {
        this.nomeItem = nomeItem;
    }

    public Double getQuant() {
        return quant;
    }

    public void setQuant(Double quant) {
        this.quant = quant;
    }

    public java.sql.Date getDataProducao() {
        return dataProducao;
    }

    public void setDataProducao(java.sql.Date dataProducao) {
        this.dataProducao = dataProducao;
    }

    public java.sql.Date getDataVencimento() {
        return dataVencimento;
    }

    public void setDataVencimento(java.sql.Date dataVencimento) {
        this.dataVencimento = dataVencimento;
    }
    
    
    public java.util.Date getdataProducaoUtil() {
        if (dataProducao == null) {
            return null;
        }
        
        return new java.util.Date(dataProducao.getTime());
    }

    public void setdataProducaoUtil(java.util.Date d) {
        if (d == null) {
            dataProducao = null;
        } else {
            
            dataProducao = new java.sql.Date(d.getTime());
            System.out.println(dataProducao);
        }
    }

    public java.util.Date getdataVencimentoUtil() {
        if (dataVencimento == null) {
            return null;
        }
        return new java.util.Date(dataVencimento.getTime());
    }

    public void setdataVencimentoUtil(java.util.Date d) {
        if (d == null) {
            dataVencimento = null;
        } else {
            dataVencimento = new java.sql.Date(d.getTime());
            System.out.println(dataVencimento);
        }
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

}
