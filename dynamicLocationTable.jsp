<%-- 
    Document   : dynamicLocationTable
    Created on : Apr 10, 2015, 12:42:38 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,functions.logic,java.sql.*,javax.servlet.http.HttpSession "%>
<!DOCTYPE html>
<%
try
{
    HttpSession s=request.getSession(false);
    String type_hidden=request.getParameter("type").trim();
    System.out.println("type_hidden dynamic location table"+type_hidden);
    String username1=s.getAttribute("userName").toString().trim();
    System.out.println("UserName::"+s.getAttribute("userName"));
    Connection conn=logic.getConnection();
    ResultSet rs=null;
    Statement stmt=null;
    stmt=conn.createStatement();
    String query=null;
    String serviceprovidername=logic.checkNull(request, "serviceprovidername");
    ArrayList colName=new ArrayList();
    
    if(type_hidden.equalsIgnoreCase("1"))
    {
       query="select VehicleType,VehicleRegistrationNo,PermitNo,PermitState,ServiceProviderID,ServiceProviderName,Capacity from vehicle_detail";
    }
    else if(type_hidden.equalsIgnoreCase("2"))
    {
       query="select UserName,Name,Address,City,State,Country,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,Zipcode from location where UserName='"+username1+"'";
    }   
    else if(type_hidden.equalsIgnoreCase("4")) 
    {
        query="select UserName,Name,Address,City,State,Country,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,Zipcode from location where UserName='"+username1+"'";
    } 
    else
    {
        out.println("No Data");
    }
      
    
    rs=stmt.executeQuery(query);
    ArrayList al=new ArrayList();
    ResultSetMetaData rsmd = rs.getMetaData();
    int columnsNumber = rsmd.getColumnCount();    
    String str=new String();
    out.println("columnsNumber: "+columnsNumber);
    if(rs!=null)
    {
        for(int k=1;k<=columnsNumber;k++) {   
        colName.add(rsmd.getColumnLabel(k));
       // out.println(nm);
        }
            while(rs.next())
            {
    //         out.println("in while");
            str=new String();    
            for(int i=1;i<=columnsNumber;i++)
            {
    //out.println("in for");

                    if(i==columnsNumber) 
                        str=str+rs.getString(i);
                    else
                        str=str+rs.getString(i)+"$";
            }
            al.add(str);
            }
             out.println(colName+"#"+al);
          }
    else
    {
               out.println("no Dta");
    }
        System.out.println("DYNAMIC:::"+al);
   
}
catch(Exception e)
{
    out.println(e);
}
%>