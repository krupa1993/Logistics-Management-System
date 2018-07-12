/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import functions.logic;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ronakrana
 */
@WebServlet(urlPatterns = {"/TransportExpensesServlet"})
public class TransportExpensesServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
       PrintWriter out = res.getWriter();
        RequestDispatcher rd=null;
        String path=null;
        PreparedStatement ps=null;
        String operation=null;
        System.out.println("Transport Expenses Servlet");
        try 
        {
            System.out.println("In Transport Expenses Servlet try");
            Connection conn=logic.getConnection();
            conn.createStatement();
            operation=logic.checkNull(req,"hdn").trim();
            System.out.println("transport expense operation: "+operation);
                 
            String vendorName=logic.checkNull(req,"vendorName");
            String workOrderNo=logic.checkNull(req,"workOrderNo");
            String vehicleregino=logic.checkNull(req,"vehicleregino");
            String km=logic.checkNull(req,"km");
            String day=logic.checkNull(req,"day");
            String Expense=logic.checkNull(req,"Expense");
            String Amount=logic.checkNull(req,"Amount");
            
            String VehicleRegistrationNo=logic.checkNull(req,"VehicleRegistrationNo").trim();
            System.out.println("VehicleRegistrationNo: "+VehicleRegistrationNo);
            if(operation!=null && operation.equalsIgnoreCase("Update"))
            {
                System.out.println("In Transport Expenses Servlet if");
                ps=conn.prepareStatement("delete from transport_expenses where VehicleRegistrationNo=?");
                /*ps=conn.prepareStatement("UPDATE transport_expenses SET KiloMeter=?,Day=?,Expense=?,Amount=? WHERE VehicleRegistrationNo=?");
                Enumeration en= req.getParameterNames();
                while(en.hasMoreElements())
                {
                    String val=en.nextElement().toString();
                    if(val.startsWith("chkbox"))
                    {
                        String ind=val.substring("chkbox".length());
                        Expense=logic.checkNull(req,"Expense"+ind);
                        Amount=logic.checkNull(req,"Amount"+ind);
                        ps.setString(1,km);
                        ps.setString(2,day);
                        ps.setString(3,Expense);
                        ps.setString(4,Amount);
                        ps.setString(5,vehicleregino);
                        ps.addBatch();
                        //ps.executeUpdate();
                        int i[]=  ps.executeBatch();

                            if(i[0]>0)
                            {
                                System.out.println("Row inserted");
                                path="/WorkOrderDetailGrid.jsp";
                            }
                            else
                            {
                                //path="/Location.jsp"; 
                                System.out.println("Sorry!");
                            }
                    }
                }*/
                ps.setString(1, vehicleregino);
                ps.executeUpdate();
                System.out.println("after update");
                //path="/WorkOrderDetailGrid.jsp";
            }
            
                System.out.println("In Transport Expenses Servlet else");
                ps=conn.prepareStatement("insert into transport_expenses(VendorName,WorkOrderNo,VehicleRegistrationNo,KiloMeter,Day,Expense,Amount)values(?,?,?,?,?,?,?)");
                Enumeration en= req.getParameterNames();
                while(en.hasMoreElements())
                {
                    String val=en.nextElement().toString();
                    if(val.startsWith("chkbox"))
                    {
                        String ind=val.substring("chkbox".length());
                        Expense=logic.checkNull(req,"Expense"+ind);
                        Amount=logic.checkNull(req,"Amount"+ind);

                        ps.setString(1,vendorName);
                        ps.setString(2,workOrderNo);
                        ps.setString(3,vehicleregino);
                        ps.setString(4,km);
                        ps.setString(5,day);
                        ps.setString(6,Expense);
                        ps.setString(7,Amount);
                        ps.addBatch();
                    }
                }
                int i[]=  ps.executeBatch();

                if(i[0]>0)
                {
                    System.out.println("Row inserted");
                    path="/TransportExpenses.jsp";
                }
                else
                {
                    //path="/Location.jsp"; 
                    System.out.println("Sorry!");
                }
                
            
            rd=req.getRequestDispatcher(path);
            rd.forward(req, res);
        } 
        catch(Exception e)
        {
            out.println(e);
        }
        finally
        {            
            out.close();
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
