<%-- 
    Document   : adminMenu
    Created on : Mar 27, 2015, 5:30:15 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Menu</title>
        <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
        <script src="MenuJScript.js" type="text/javascript"></script>
        <link href="css3menu1/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/styles.css" type="text/css" />
        <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
        <script src="MenuJScript.js" type="text/javascript"></script>
        <script src="js/data.js" type="text/javascript"></script>
         <link href="themes/6/js-image-slider.css" rel="stylesheet" type="text/css" />
        <script src="themes/6/mcVideoPlugin.js" type="text/javascript"></script>
        <script src="themes/6/js-image-slider.js" type="text/javascript"></script>
        <script src="themes/6/js-image-slider1.js" type="text/javascript"></script>
        <link href="generic.css" rel="stylesheet" type="text/css" />
    </head>
    <% System.out.println("ADMIN MENU");
        String username="";    
        if(session.getAttribute("userName")!=null)
                username=session.getAttribute("userName").toString();
        else
        {%>
        <jsp:forward page="Home.jsp"/>  
        <%}
            Map m=new HashMap();
            ArrayList mn=new ArrayList();
            ArrayList subMenu;
            if(session.getAttribute("mainMenu")!=null)
            {
                mn=(ArrayList)session.getAttribute("mainMenu");
                
            }
            if(session.getAttribute("menu")!=null)
            {
                m=(HashMap)session.getAttribute("menu");
                
            }
    

%>
     <div class="area">
         <table cellpadding="0" cellspacing="0" width="100%">
             <tr>
                 <td align="left" valign="middle"  >
                     <div id="logo">
                         <a href="Home.jsp"/>
                             <img src="images/Logo2.png" alt="LOGO" height="100" width="250" /></a>
                     </div>
                 </td>
                 <td align="right">
                     <table cellpadding="0" cellspacing="0">
                       <tr>
                          <td style="height:101px" >
                          
                          </td>
                       </tr>
                         
                         <tr>
                          <td>
                           <div id="sse2">
                            <div id="sses2">
                             <ul>
                                  
                                  <li><a><label id="lblwelcome">Welcome <%=username%></label> </a> </li>
                                  <li><a href="LogOutServlet">Logout</a></li>
                             </ul>
                           </div>
                          </div>
                           
                          </td>
                         
                       </tr>
                         <%-- <tr>
                          <td>
                           <div id="sse2">
                         <div id="sses2">
                             
                             <ul>
                               <%
                                 HttpSession s1=request.getSession(false);
                                 String menu=null;
                                 int len=0;
                                 ArrayList menuData=new ArrayList();  
                                 if(session.getAttribute("menuname")!=null)
                                   {
                                    menuData=(ArrayList)session.getAttribute("menuname");
                                    System.out.println("in jsp menuData="+menuData);
                                    Iterator itr=menuData.iterator();
                                    String mName=null;
                                    String pName=null;
                                    while(itr.hasNext())
                                    {
                                        mName=itr.next().toString();
                                        menu=mName.substring(0,mName.indexOf("$"));
                                        pName=mName.substring(mName.indexOf("$")+1);
                                        System.out.println("menu= "+menu);
                                        System.out.println("pName= "+pName);
                               %>
                                        <li><a href="<%=pName%>"/><%=menu%></a></li>
                                    <%}
                                   }
                                    else
                                    out.println("no data");
                                 %>
                                 <%--<li><a href="Home.jsp"/>Admin Home</a></li>
                                 <li><a href="#">Register vendor</a></li>
                                 <li><a href="#">Contact</a></li>
                             </ul>
                         </div>
                     </div>
                          </td>
                       </tr> --%>
                     </table>
                    
                 </td>
             </tr>
                             <tr>
                               <td colspan="2"  valign="top" align="left" >
                                  
                                 
                                 <ul id="css3menu1">
            <%
                
            for(int i=0;i<mn.size();i++)
                {
                    subMenu=new ArrayList();
                    String val1=mn.get(i).toString().trim();
                    System.out.print(val1);
                    String mName1=val1.substring(0,val1.indexOf("$")).trim();
                    System.out.print(mName1);
                    String pg1=val1.substring(val1.indexOf("$")+1).trim();
                    System.out.print(pg1);
                    
                %>
                
                <li class="topmenu">
                    <%
                    if(pg1.length()>4)
                                               {
                    %>
                            <a href="<%=pg1%>" class="selected"><%=mName1%></a>
                    
                    <%
                                         }
                    else
                                               {%>
                                              <a class="selected"><%= mName1%> </a>
                    <%
                     subMenu=(ArrayList)m.get(mName1);


%>
                    
                        <ul>
                        <%
                        for(int j=0;j<subMenu.size();j++)
                        {
                            String val=subMenu.get(j).toString().trim();
                            String mName=val.substring(0,val.indexOf("$"));
                            String pg=val.substring(val.indexOf("$")+1);
                            
                        %>
                        <li class="topmenu"><a href="<%=pg%>" class="selected"><%=mName%></a></li>
                        <%}%>
                    </ul>
                
                <%}
                %>
                
                
                </li> 
                       
                
                
                
                
                <%}%> 
                </ul>
            
                               </td>
                           </tr>
         </table>
     </div>
</html>
