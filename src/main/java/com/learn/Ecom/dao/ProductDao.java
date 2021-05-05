/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.Ecom.dao;

import com.learn.Ecom.entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author prakhar patidar
 */
public class ProductDao {
    private SessionFactory factory;

        public ProductDao(SessionFactory factory) {
            this.factory = factory;
        }

        public int saveProduct(Product product){
            int pId=-1;
            try {
                Session session = this.factory.openSession();
                Transaction tx = session.beginTransaction();

                pId=(int) session.save(product);

                tx.commit();
                session.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return pId;

        }

    
}
