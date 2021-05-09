/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.Ecom.dao;

import java.util.List;

import com.learn.Ecom.entities.Product;
import org.hibernate.Query;
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


            public List<Product> getAllProducts(){
                Session s=this.factory.openSession();
                Query query=s.createQuery("from Product");
                List<Product> list= query.list();
                return list;    
            }


    
}
