/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.Ecom.helper;

import java.util.ArrayList;

/**
 *
 * @author prakhar patidar
 */
public class Helper {
    
    public static String getTenWords(String desc){
    String res="";
        String[] arr=desc.split(" ");
        if(arr.length>12){
        for (int i = 0; i < 12; i++) {
            res+=arr[i]+" ";
        }
         return res+"...";
        }
        else return (desc+"...");
    }
    
}
