<%-- 
    Document   : get_Type
    Created on : Mar 26, 2015, 11:03:29 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.sql.*,functions.logic "%>
<%
        Statement stmt=null;
        ResultSet rs=null;
        
            String name=null;
            String id=null;
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            String query="select * from user_type where Type_ID!=3 order by Type_ID";
            rs=stmt.executeQuery(query);
            ArrayList al=new ArrayList();
           
            while(rs.next())
            {
                id=rs.getString("Type_ID").toString();
                name=rs.getString("Type_Name").toString();
                al.add(id+"$"+name);
            }
            out.println(al);
          
 %> 
