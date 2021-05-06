/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.Ecom.servlets;

import com.learn.Ecom.dao.CategoryDao;
import com.learn.Ecom.dao.ProductDao;
import com.learn.Ecom.entities.Category;
import com.learn.Ecom.entities.Product;
import com.learn.Ecom.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "ProductOperationServlet", urlPatterns = {"/ProductOperationServlet"})
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String op=request.getParameter("operation");
            if(op.trim().equals("addcategory")){
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                Category category =new Category(title, description);
                
                //save category to DB
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId=categoryDao.saveCategory(category);

                //message
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Category Added Successfully : "+ catId);
                response.sendRedirect("admin.jsp");
                return;



            }
            else if(op.trim().equals("addproduct")){
                //add product
                System.out.println("In POS");
                String pName=request.getParameter("proTitle");
                int pPrice=Integer.parseInt(request.getParameter("proPrice"));
                int pDiscount=Integer.parseInt(request.getParameter("proDiscount"));
                int pQuantity=Integer.parseInt(request.getParameter("proQuantity"));
                String pDesc = request.getParameter("proDescription");
                int cId=Integer.parseInt(request.getParameter("proCategory"));
                Part part=request.getPart("proImage");

                //get category by Id
                CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
                Category category=cDao.getCategoryById(cId);

                //new Product obj
                Product product=new Product(pName,pDesc,part.getSubmittedFileName(),pPrice,pDiscount,pQuantity,category);

                //Save to DB
                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                int pId=pDao.saveProduct(product);
                out.println("Product added");

                //Message
//                HttpSession httpSession = request.getSession();
//                httpSession.setAttribute("message","Product Added Successfully : "+ pId);
//                response.sendRedirect("admin.jsp");
//                return;
                


            }




           

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
