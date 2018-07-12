<%-- 
    Document   : welcomevendor
    Created on : Apr 15, 2015, 3:44:48 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>WelcomeVendor</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
</head>
<body>
    <%
               String Reminder=null;
               
               ArrayList dtList=new ArrayList();
               if(request.getAttribute("reminder")!=null)
               {
                   dtList=(ArrayList)request.getAttribute("reminder");
                   System.out.println("ArrayList "+dtList);
                   //Reminder=dtList.get(0).toString();
               }
               
               String PendingTask=null;
               
               ArrayList dtList1=new ArrayList();
               if(request.getAttribute("pendingTask")!=null)
               {
                   dtList1=(ArrayList)request.getAttribute("pendingTask");
                   System.out.println("ArrayList "+dtList1);
                   //PendingTask=dtList.get(0).toString();
               }
               ArrayList a1=new ArrayList();
               if(request.getAttribute("workorder")!=null)
               {
                   a1=(ArrayList)request.getAttribute("workorder");
                   System.out.println("ArrayList "+a1);
                   //PendingTask=dtList.get(0).toString();
               }
             %>
             
    <form name="HomeForm">
<div id="header">
    <jsp:include page="adminMenu.jsp"/>	
    <td valign="top">
        <%--<%
                String username=session.getAttribute("usernm").toString();
                out.println("Welcome  "+username+"!!!");
                %>--%>
 </td>
</div>

    
  
 	<div id="contentsMaster">
		
		<div class="areaMaster">
			<div class="mainMaster">
                              <label id="Label9"  class="lblFormHeader" >Dash Board</label> 
        <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                
                 <label id="Label9"  class="lblFormHeader" ></label> 
            </td>
        </tr>
           &nbsp;
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
           
           <table id="dataTable" cellpadding="5px" cellspacing="0" width="100%" >
               <tr>
                   <td>
                       <marquee onMouseOver="this.scrollAmount=0" onMouseOut="this.scrollAmount=4" scrollamount="4" direction="up" loop="true"  height="400px">
        
           <table id="dataTable" cellpadding="5px" cellspacing="0" width="100%" border="1">
               &nbsp;&nbsp;  
            
            <tr>
                <td align="center" colspan="5">
                    <label name="reminder"  class="lblFormHeader">Reminders</label> 
                    <%
                   for(int i=0;i<dtList.size();i++)
                   {%>
                    <tr>
                        <%  
                        Reminder=dtList.get(i).toString();
                        String s[]=Reminder.split(":");
                        
                        for(int j=0;j<s.length;j++)
                        {
                        %>
                            <td>  <%=s[j]%> </td>
                      <%}%>  
                    </tr>     
                 <%}%>
                </td>
            </tr>
            
            <tr>
                <td align="center" colspan="5">
                    <label name="pendingtask"  class="lblFormHeader">Pending Tasks</label> 
                    <%
                   for(int i=0;i<dtList1.size();i++)
                   {%>
                    <tr>
                        <%     
                        PendingTask=dtList1.get(i).toString();
                        //out.println("sds"+itemnm);
                        String s[]=PendingTask.split(":");
                        
                        for(int j=0;j<s.length;j++)
                        {
                        %>
                            <td>  <%=s[j]%> </td>
                      <%}%>  
                    </tr>     
                 <%}%>
                </td>
             </tr>
           </table>
                </marquee>
                </td>
               
                
                 <td>
                
                <table id="dataTable" cellpadding="5px" cellspacing="0" width="100%" border="1">
               &nbsp;&nbsp;  
            
            <tr>
                
                    <tr>
                       
                        <td>  <img src="jfreereportforvendor.jsp" alt="Progress chart"  width="500 px" height="300 px"/>
 </td>
                       
                    </tr>     
                
                </td>
            </tr>
                </table>
                </td>
               
                <td>
                 <marquee onMouseOver="this.scrollAmount=0" onMouseOut="this.scrollAmount=4" scrollamount="4" direction="down" loop="true"  height="400px">
        
                <table id="dataTable" cellpadding="5px" cellspacing="0" width="100%" border="1">
               &nbsp;&nbsp;  
            
            <tr>
                <td align="center" colspan="5">
                    <label name="Work Order"  class="lblFormHeader">Work Order</label> 
                    <%
                   for(int i=0;i<a1.size();i++)
                   {%>
                    <tr>
                        <%  
                        Reminder=a1.get(i).toString();
                        String s[]=Reminder.split(":");
                        
                        for(int j=0;j<s.length;j++)
                        {
                        %>
                            <td>  <%=s[j]%> </td>
                      <%}%>  
                    </tr>     
                 <%}%>
                </td>
            </tr>
                </table>
                </marquee >
                </td>
                </tr>
                
           </table>
       </div>
       </div>
			<div class="blog">
			
			
			   
			
			    <div style="height:20px;"></div>
				<%--<h2>Recent Blog Post</h2>
				<div class="frame">
                                    <img src="images/Aim.png" alt="Img" height="216" width="268" />--%>
				</div>
				<h3></h3>
				<p>
					
				</p>
			</div>
		</div>
	</div>
                             <jsp:include page="footer.jsp"/>

</body>
</html>
