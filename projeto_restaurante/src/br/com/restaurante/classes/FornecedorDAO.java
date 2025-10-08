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
public class FornecedorDAO {
    public List<Fornecedor> getLista(){
        String mysql = "select * from fornecedores";
        List<Fornecedor> fornecedor = new ArrayList<>();
        try{
            PreparedStatement pst = ModuloConexao.getPreparableStatement(mysql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Fornecedor objFornecedor = new Fornecedor();
                objFornecedor.setCod(rs.getInt("codFornecedor"));
                objFornecedor.setNome(rs.getString("nomeFornecedor"));
                objFornecedor.setCnpj(rs.getString("cnpj"));
                objFornecedor.setEndereco(rs.getString("endereco"));
                objFornecedor.setBairro(rs.getString("bairro"));
                objFornecedor.setCidade(rs.getString("cidade"));
                objFornecedor.setUf(rs.getString("estado"));
                
                
                fornecedor.add(objFornecedor);
            }
            
            
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Erro de SQL "+ex.getMessage());
        }
        
        return fornecedor;
    }
    
    
    
    public boolean inserir(Fornecedor objFornecedor){
        String mysql = "CALL `proc_insereFornecedor`(?, ?, ?, ?, ?, ?)";
        
        try{
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setString(1, objFornecedor.getNome());
            prt.setString(2, objFornecedor.getCnpj());
            prt.setString(3, objFornecedor.getEndereco());
            prt.setString(4, objFornecedor.getBairro());
            prt.setString(5, objFornecedor.getCidade());
            prt.setString(6, objFornecedor.getUf());
            if(prt.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Fornecedor cadastrado com sucesso!");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Cidae não cadastrada!");
                return false;
            }
            
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Erro em mysql "+ex.getMessage());
            return false;
        }

    }
    
    
    
    public boolean salvar(Fornecedor objFornecedor){
        if(objFornecedor.getCod() == null){
            inserir(objFornecedor);
            return true;
        }else{
            alterar(objFornecedor);
            return true;
        }
        
        
    }
    
    public boolean remover(Fornecedor objFornecedor){
       String mysql = "delete from fornecedores where codFornecedor = ?";
        
        try{
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setInt(1, objFornecedor.getCod());
            if(prt.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Apagado com sucesso");
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
    
    public boolean alterar(Fornecedor objFornecedor){
        String mysql = "UPDATE fornecedores SET "
           + "nomeFornecedor = ?, "
           + "cnpj = ?, "
           + "endereco = ?, "
           + "bairro = ?, "
           + "cidade = ?, "
           + "estado = ? "
           + "WHERE codFornecedor = ?";
   
        
        try{
            PreparedStatement prt = ModuloConexao.getPreparableStatement(mysql);
            prt.setString(1, objFornecedor.getNome() );
            prt.setString(2, objFornecedor.getCnpj());
            prt.setString(3, objFornecedor.getEndereco());
            prt.setString(4, objFornecedor.getBairro());
            prt.setString(5, objFornecedor.getCidade());
            prt.setString(6, objFornecedor.getUf());
            prt.setInt(7, objFornecedor.getCod());
            
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
