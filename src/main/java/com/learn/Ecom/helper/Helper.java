/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.Ecom.helper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

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

    public static Map<String,Long> getCounts(SessionFactory sf){
        Session session=sf.openSession();
        String numberOfUsers="Select count(*) from User";
        String numberOfProducts="Select count(*) from Product";
        Query q1=session.createQuery(numberOfUsers);
        Query q2=session.createQuery(numberOfProducts);

        Long userCount=(Long) q1.list().get(0);
        Long productCount=(Long) q2.list().get(0);

        Map<String,Long> map=new HashMap<String,Long>();
        map.put("userCount", userCount);
        map.put("productCount", productCount);

        session.close();
        return map;

    }

    
}
