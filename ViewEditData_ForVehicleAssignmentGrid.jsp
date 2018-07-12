<%-- 
    Document   : ViewEditData_ForVehicleAssignmentGrid
    Created on : Apr 13, 2015, 12:31:13 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VehicleAssignment</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
<div id="header">
<jsp:include page="adminMenu.jsp"/>	
</div>
</head>
<body onload="getServiceProviderNameForVehicleAssignmentGrid()">  
    <%
        String workorderno=null;
        String itemname=null;
        String quantitytodispatch=null;
        String serviceprovidername=null;
        String vehicleregistrationno=null;
        String vehicletype=null;
        String edit="";
       
        ArrayList dtList=new ArrayList();
        if(request.getAttribute("data")!=null)
        {
            edit="edit";
            dtList=(ArrayList)request.getAttribute("data");
            System.out.println("ArrayList "+dtList);
            workorderno=dtList.get(0).toString();
            itemname=dtList.get(1).toString();
            quantitytodispatch=dtList.get(2).toString();
            serviceprovidername=dtList.get(3).toString();
            vehicleregistrationno=dtList.get(4).toString();
            vehicletype=dtList.get(5).toString();
        }
        else
        {
            System.out.println("No data");
       } 
        ArrayList sp=new ArrayList();
        String selectedSp="";
        if(request.getAttribute("sp")!=null)
                       {
            sp=(ArrayList)request.getAttribute("sp");
            System.out.println(sp);
            selectedSp=sp.get(0).toString();
                   }
        ArrayList allSP=new ArrayList();
        if(request.getAttribute("allSP")!=null)
            allSP=(ArrayList)request.getAttribute("allSP"); 
      %>
<form name="ViewEditData_ForVehicleAssignmentGrid" method="get" action="VehicleAssignmentServlet">
    <div id="contentsMaster">
        <div class="areaMaster">
            <div class="mainMaster">
               
                 <table cellpadding="5px" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <label id="lbl3"  class="lblForm" >Work Order:</label> 
                        </td>
                        <td>
                            <label id="workOrderNo" name="workOrderNo" class="workOrderNo" ><%=workorderno%></label> 
                        </td>
                        
                    </tr>
                        
                    <tr>
                        <td>
                            <label id="lbl4"  class="lblForm" >Item Name:</label> 
                        </td>
                        <td>
                            <label id="ItemName"  class="ItemName" ><%=itemname%></label> 
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl5"  class="lblForm" >Quantity To Dispatch:</label> 
                        </td>
                        <td>
                            <input type="text" name="QuantityToDispatch" id="QuantityToDispatch" value="<%=quantitytodispatch%>" /></label> 
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl6"  class="lblForm" >Service Provider Name:</label> 
                        </td>
                        <td>
                            <select id="ServiceProviderName" name="ServiceProviderName" onchange="getVehicleTypeForViewEditData_ForVehicleAssignmentGrid();">
                            <option>---Select---</option>
                                <%
                                String val="";
                                for(int i=0;i<allSP.size();i++)
                                {
                                    val=allSP.get(i).toString();
                                    if(selectedSp.equalsIgnoreCase(val))
                                    {
                                  %><option value="<%=val%>" selected><%=val%></option>
                                  <%
                                   }
                                    else
                                    {%>
                                        <option value="<%=val%>" ><%=val%></option>
                                    <%}
    
    }%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl7"  class="lblForm" >Vehicle Type:</label> 
                        </td>
                        <td>
                            <select id="VehicleType" name="VehicleType" onchange="getVehicleRegistrationNo()">
                            <option>---Select---</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl7"  class="lblForm" >Vehicle Registration No:</label> 
                        </td>
                         <td>
                            <input type="text" name="VehicleRegistrationNo" id="VehicleRegistrationNo" value="<%=vehicleregistrationno%>"/>
                            <input type="hidden" name="hdn" value="<%=edit%>"/>
                        </td>
                    </tr>
                    </table>
                    <br></br>
                    <tr>
                              <td>
                                 <input type="submit" name="Update" value="Update" class="submitFrm"><br>
                              </td> 
                    </tr> 
            </div>
			<div class="blog">
        		    <div style="height:20px;"></div>
				<%--<h2>Recent Blog Post</h2>
				<div class="frame">
                                    <img src="images/Aim.png" alt="Img" height="216" width="268" />--%>
				</div>
                        </div>
		</div>
	</div>
                <jsp:include page="footer.jsp"/>
    </form>
</body>
</html>
