<%-- 
    Document   : ViewData_GatePass
    Created on : Apr 15, 2015, 12:32:39 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic,javax.servlet.http.HttpServletRequest;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ViewGatePass:</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
</head>
<body>
    <form name="ViewGatePass" action="reportGatepass.jsp?filename=gatepass">
    
    <%
        String vname="";
        String workorderno="";
        String itemnm="";
        String vehicletype=null;
        String vehicleregino=null;
        String quantity=null;
        String date=null;
        ArrayList dtList=new ArrayList();
        if(request.getAttribute("data")!=null)
        {
            dtList=(ArrayList)request.getAttribute("data");
            System.out.println("ArrayList "+dtList);
            vname=dtList.get(0).toString();
            workorderno=dtList.get(1).toString();
            itemnm=dtList.get(2).toString();
            vehicletype=dtList.get(3).toString();
            vehicleregino=dtList.get(4).toString();
            quantity=dtList.get(5).toString();
            date=dtList.get(6).toString();
        }
    %>
       
<div id="header">
    <jsp:include page="adminMenu.jsp"/>	
</div>
        
	<div id="contentsMaster">
		
		<div class="areaMaster">
			<div class="mainMaster">
				
			 <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                
                 <label id="Label1"  class="lblFormHeader" >View Gate Pass:</label> 
            </td>
        </tr>
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
        
        <tr>
            <td valign="top">
            <table cellpadding="5px" cellspacing="0" width="100%">
            <tr>
                <td>
                    <label id="Label1" class="lblForm">Vendor Name:</label> 
                </td>
                <td>
                    <label id="VendorName" class="lblForm"><%=vname%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label2" class="lblForm">Work Order No:</label> 
                </td>
                <td>
                    <label id="WorkOrderNo" class="lblForm"><%=workorderno%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label3" class="lblForm">Item Name:</label> 
                </td>
                <td>
                    <label id="ItemName" class="lblForm"><%=itemnm%></label>
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label4" class="lblForm">Vehicle Type:</label> 
                </td>
                <td>
                    <label id="VehicleType" class="lblForm"><%=vehicletype%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label5" class="lblForm">Vehicle Registration No:</label> 
                </td>
                <td>
                    <label id="VehicleRegiNo" class="lblForm"><%=vehicleregino%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label6" class="lblForm">Quantity:</label> 
                </td>
                <td>
                    <label id="Quantity" class="lblForm"><%=quantity%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label7" class="lblForm">Date:</label> 
                </td>
                <td>
                    <label id="Date" class="lblForm"><%=date%></label> 
                </td>
            </tr>
            </table>
                <br></br>
                    <tr>
                        <td>
                            <input type="submit" id="print" name="print" value="Print" class="submitFrm" />
                        </td>
                    </tr> 
            </td>
        </tr>
    </table>
				
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
    </form>
</body>
</html>
