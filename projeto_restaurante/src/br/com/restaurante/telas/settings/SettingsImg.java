/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.restaurante.telas.settings;

import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

/**
 *
 * @author Usuario
 */
public class SettingsImg {
    private BufferedImage settingsImg;
    
    public SettingsImg(String path){
        try {
            settingsImg = ImageIO.read(getClass().getResource(path));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public BufferedImage getSprite(int x, int y , int width, int height){
        return settingsImg.getSubimage(x, y, width, height);
    }
        
}
