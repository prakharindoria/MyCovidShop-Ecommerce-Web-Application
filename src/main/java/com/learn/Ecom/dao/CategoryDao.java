/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.Ecom.dao;

import com.learn.Ecom.entities.Category;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {
    private SessionFactory factory;

        public CategoryDao(SessionFactory factory) {
            this.factory = factory;
        }

        public int saveCategory(Category category){
            Session session =this.factory.openSession();
            Transaction tx = session.beginTransaction();
            int catId=(int) session.save(category);
            tx.commit();
            session.close();
            return catId;
        }

        public List<Category> getCategories() {
            Session session =this.factory.openSession();
            Query query = session.createQuery("from Category");
            List<Category> list =   query.list();
            return list;
        }
    
}
