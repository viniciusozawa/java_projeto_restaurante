/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.restaurante.dal;
import java.sql.*;
/**
 *
 * @author Usuario
 */
public class ModuloConexao {
    //metodo para estabeler conexao com o banco de dados
    public static Connection conector(){
        //Connection e um framework 
        Connection conexao = null;
        
        //a linha abaixo chama o driver de conexao
        String driver = "com.mysql.cj.jdbc.Driver";
        //informacoes do banco de dados
        String url = "jdbc:mysql://localhost:3306/bd_restaurante";
        String user = "root";
        String password = "takeot15";
        //estabelecendo conexao
        try { //tentar conecao
            Class.forName(driver);
            conexao = DriverManager.getConnection(url,user,password);
            return conexao;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
