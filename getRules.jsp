<%-- 
    Document   : getRules
    Created on : Apr 15, 2015, 1:05:29 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.sql.*,functions.logic "%>
<!DOCTYPE html>
<%
        Statement stmt=null;
        ResultSet rs=null;
        
            String name=null;
            String id=null;
            Connection conn=logic.getConnection();
            stmt=conn.createStatement();
            String query="select RuleID,RuleName from rule where Type=2 and RuleType='EC' order by RuleName";
            rs=stmt.executeQuery(query);
            ArrayList al=new ArrayList();
           
            while(rs.next())
            {
              //  id=rs.getString("RuleID").toString();
                name=rs.getString("RuleName").toString();
                al.add(name);
            }
            out.println(al);
          
 %> 
