/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ronakrana
 */
@WebServlet(urlPatterns = {"/DISPLAYCAPTCHASERVLET"})
public class DISPLAYCAPTCHASERVLET extends HttpServlet {

     private int height=0;
    private int width=0;

    public static final String CAPTCHA_KEY = "captcha_key_name";

    public void init(ServletConfig config) throws ServletException 
    {
        super.init(config);
        height=50;
        width=250;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        
        try
        {
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Max-Age", 0);

            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D graphics2D = image.createGraphics();
            Hashtable map = new Hashtable();
            Random r = new Random();
            System.out.println("@@ Math.abs(r.nextLong()):  "+ Math.abs(r.nextLong()));
            System.out.println("@@ Math.abs(r.nextLong()), 36: "+ Long.toString(Math.abs(r.nextLong()), 36));
            String token = Long.toString(Math.abs(r.nextLong()), 36);
            String ch = token.substring(0,6);
            Color c = new Color(0.6662f, 0.4569f, 0.3232f);
            GradientPaint gp = new GradientPaint(30, 30, c, 15, 25, Color.white, true);
            graphics2D.setPaint(gp);
            Font font=new Font("Verdana", Font.CENTER_BASELINE , 26);
            graphics2D.setFont(font);
            graphics2D.drawString(ch,2,20);
            graphics2D.dispose();
            System.out.println("captcha : "+ch);
            HttpSession session = request.getSession(true);
            session.setAttribute("CAPTCHA_KEY",ch);
            request.setAttribute("captcha", ch);
            //System.out.println("Value from session : "+session.getAttribute(""))
            OutputStream outputStream = response.getOutputStream();
            ImageIO.write(image, "jpeg", outputStream);

            outputStream.close();

                }
        catch(Exception e)
        {
          //  out.println(e);
        }
        finally {
          //  out.close();
        }
    } 


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
