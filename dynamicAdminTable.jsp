<%-- 
    Document   : dynamicAdminTable
    Created on : Apr 8, 2015, 5:58:50 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,functions.logic,java.sql.*,javax.servlet.http.HttpSession "%>
<!DOCTYPE html>
<%
try
{
   // HttpSession s1=request.getSession(false);
    String type_hidden=request.getParameter("type").trim();
    System.out.println("type_hidden"+type_hidden);
    Connection conn=logic.getConnection();
    ResultSet rs=null;
    Statement stmt=null;
    stmt=conn.createStatement();
    String query=null;
    ArrayList colName=new ArrayList();
    if(type_hidden.equalsIgnoreCase("1"))
    {
       query="select UserName,concat(FirstName,' ',LastName) as Name,Address,City,State,Country,MobileNo1,MobileNo2,Gender,EmailID,Description from admin_registration";
    }   
    else if(type_hidden.equalsIgnoreCase("2")) 
    {
        query="select UserName,Name,Address,City,State,Country,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,EmailID,Website,Description from vendor_registration";
    } 
    else if(type_hidden.equalsIgnoreCase("3"))
    {
        query="select Name,Address,City,State,Country,PhoneNo,MobileNo1,MobileNo2,ContactPerson,ContactPersonNo,Description from serviceprovider_registration";
    }
    else if(type_hidden.equalsIgnoreCase("4"))
    {
        query="select UserName,Name,Address,PhoneNo,MobileNo,Fax,ContactPerson,ContactPersonNo,EmailID,Website,Description from dealer_registration";
    }
    else
    {
        out.println("No Data");
    }
      
    
    rs=stmt.executeQuery(query);
    ArrayList al=new ArrayList();
    ResultSetMetaData rsmd = rs.getMetaData();
    int columnsNumber = rsmd.getColumnCount();    
    String s=new String();
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
            s=new String();    
            for(int i=1;i<=columnsNumber;i++)
            {
    //out.println("in for");

                    if(i==columnsNumber) 
                        s=s+rs.getString(i);
                    else
                        s=s+rs.getString(i)+"$";
            }
            al.add(s);
            }
             out.println(colName+"#"+al);
          }
    else
    {
         out.println("no Data");
    }
        System.out.println(al);
        System.out.println("Got u");
   
}
catch(Exception e)
{
    out.println(e);
}
%>