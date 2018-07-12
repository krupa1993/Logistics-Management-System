<%-- 
    Document   : StatusInfo
    Created on : Jun 30, 2015, 10:39:54 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>StatusInfo</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
</head>
<body>
            <%
               String wrknum=null;
               String status=null;
               String dealernm=null;
               String vendornm=null;

               ArrayList dtList=new ArrayList();
               if(request.getAttribute("data")!=null)
               {
                   dtList=(ArrayList)request.getAttribute("data");
                   System.out.println("ArrayList "+dtList);
                   wrknum=dtList.get(0).toString();
                   dealernm=dtList.get(1).toString();
                   vendornm=dtList.get(2).toString();
                   status=dtList.get(3).toString();
               }
               
               String itemnm=null;
               
               ArrayList dtList1=new ArrayList();
               if(request.getAttribute("data1")!=null)
               {
                   dtList1=(ArrayList)request.getAttribute("data1");
                   //out.println("ArrayList "+dtList1);
                   
                   /*vehicletype=dtList1.get(1).toString();
                   vehicleregi=dtList1.get(2).toString();
                   quantity=dtList1.get(3).toString();
                   date=dtList1.get(4).toString();
                   status=dtList1.get(5).toString();*/
               }
             %>
    <form name="StatusInfoForm">
    
<div id="header">
    <jsp:include page="adminMenu.jsp"/>	
</div>
        
	<div id="contentsMaster">
		
		<div class="areaMaster">
			<div class="mainMaster">
        <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                
                 <label id="Label9"  class="lblFormHeader" >Status Information:</label> 
            </td>
        </tr>
           &nbsp;
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
        
           <tr>
           <td valign="top">
            <label id="Label1" class="lblForm" >Work-order No:</label> 
            <label id="Label1" class="lblForm" ><%=wrknum%></label> 
           </td>
           <td valign="top">
            <label id="Label2" class="lblForm" >Status:</label> 
            <label id="Label1" class="lblForm" ><%=status%></label> 
           </td>
           </tr>
           <tr>
           <td valign="top">
            <label id="Label1" class="lblForm" >Vendor:</label> 
            <label id="Label1" class="lblForm" ><%=vendornm%></label> 
           </td>
           <td valign="top">
            <label id="Label2" class="lblForm" >Dealer:</label> 
            <label id="Label1" class="lblForm" ><%=dealernm%></label> 
           </td>
           </tr>
           
           <table id="dataTable" cellpadding="5px" cellspacing="0" width="100%" border="1">
               &nbsp;&nbsp;  
            <tr>
            <td>
                    
                        <label name="ItemName"  class="lblFormHeader">Item Name</label> 
                    </td>
                    <td>
                        <label name="VehicleType"  class="lblFormHeader">Vehicle Type</label> 
                    </td>
                    <td>
                        <label name="VehicleRegistrationNo"  class="lblFormHeader">Vehicle Registration No</label> 
                    </td>
                    <td>
                        <label name="Quantity"  class="lblFormHeader">Quantity</label> 
                    </td>
                    <td>
                        <label name="Date"  class="lblFormHeader">Date</label> 
                    </td>
                    <td>
                        <label name="Status"  class="lblFormHeader">Status</label> 
                    </td>
       
            </tr>
               
               
                   <%
                   for(int i=0;i<dtList1.size();i++)
                   {%>
                    <tr>
                        <%     
                        itemnm=dtList1.get(i).toString();
                        //out.println("sds"+itemnm);
                        String s[]=itemnm.split(":");
                        
                        for(int j=0;j<s.length;j++)
                        {
                        %>
                            <td>  <%=s[j]%> </td>
                      <%}%>  
                    </tr>     
                 <%}%>
                    
              
           </table>
        <input type="hidden" name="hdn" value="<%=wrknum%>">
    </table>
				
			</div>
                        <%--<div class="blog">
        		    <div style="height:20px;"></div>
				<h2>Recent Blog Post</h2>
				<div class="frame">
					<img src="images/Aim.png" alt="Img" height="216" width="268" />
				</div>
				<h3></h3>
				<p>
					
				</p>
                        </div>--%>
		</div>
	</div>
                             <jsp:include page="footer.jsp"/>
    </form>
</body>
</html>
