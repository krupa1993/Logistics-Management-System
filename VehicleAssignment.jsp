<%-- 
    Document   : VehicleAssignment
    Created on : Apr 14, 2015, 10:09:28 PM
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
<body onload="getVendorNameForVehicleAssignment()">
    <%
        String workorderno=null;
        String itemname=null;
        String quantitytodispatch=null;
        String serviceprovidername=null;
        String vehicleregistrationno=null;
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
        }
        else
        {
            workorderno="";
            if(logic.checkNull(request,"workOrderNo")!=null)
                workorderno=request.getParameter("workOrderNo");
            itemname="";
            if(logic.checkNull(request,"ItemName")!=null)
                itemname=logic.checkNull(request,"ItemName");
            quantitytodispatch="";
            if(logic.checkNull(request,"QuantityToDispatch")!=null)
                quantitytodispatch=logic.checkNull(request,"QuantityToDispatch");
            serviceprovidername="";
            if(logic.checkNull(request,"ServiceProvidername")!=null)
                serviceprovidername=logic.checkNull(request,"ServiceProvidername");
            vehicleregistrationno="";
            if(logic.checkNull(request,"VehicleRegistrationNo")!=null)
                vehicleregistrationno=logic.checkNull(request,"VehicleRegistrationNo");
       } 
      %>
<form name="VehicleAssignmentForm" method="get" action="VehicleAssignmentServlet">
    <div id="contentsMaster">
        <div class="areaMaster">
            <div class="mainMaster">
                 <table cellpadding="5px" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            
                            <label id="lbl1"  class="lblFormHeader" >Vehicle Assignment:</label> 

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl2"  class="lblForm" >Vendor Name:</label> 
                        </td>
                        <td>
                         <select id="VendorName" name="vendorName" class="inputFrm" onclick="getWorkOrderForVehicleAssignment()">
                         <option>---Select---</option>
                         </select>
                        </td>
                    </tr>
                        
                    <tr>
                        <td>
                            <label id="lbl3"  class="lblForm" >Work Order:</label> 
                        </td>
                        <td>
                         <select id="workOrderNo" name="workOrderNo" class="inputFrm" onclick="getItemName()">
                         <option>---Select---</option>
                         </select>
                        </td>
                    </tr>
                        
                    <tr>
                        <td>
                            <label id="lbl4"  class="lblForm" >Item Name:</label> 
                        </td>
                        <td>
                         <select id="ItemName" name="ItemName" class="inputFrm" onclick="getQuantity()">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl5"  class="lblForm" >Quantity:</label> 
                        </td>
                        <td>
                            <select id="Quantity" name="Quantity" class="inputFrm" onclick="getServiceProviderNameForVehicleAssignment()">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                      <tr>
                        <td>
                            <label id="lbl5"  class="lblForm" >Quantity To Dispatch:</label> 
                        </td>
                        <td>
                            <input id="QuantityToDispatch" class="inputFrm" name="QuantityToDispatch" type="text"/>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl6"  class="lblForm" >Service Provider Name:</label> 
                        </td>
                        <td>
                            <select id="ServiceProviderName" name="ServiceProviderName" class="inputFrm" onchange="getVehicleType()">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl7"  class="lblForm" >Vehicle Type:</label> 
                        </td>
                        <td>
                            <select id="VehicleType" name="VehicleType" class="inputFrm" onclick="getVehicleRegistrationNo()">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl7"  class="lblForm" >Vehicle Registration No:</label> 
                        </td>
                        <td>
                         <select id="VehicleRegistrationNo" class="inputFrm" name="VehicleRegistrationNo">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                    </table>
                    <br></br>
                    <tr>
                            <td> 
                            <input type="hidden" name="hdn" value="<%=edit%>"/>
                            <% if(edit!=null && edit.equalsIgnoreCase("edit"))
                            {%>
                              <td>
                                 <input type="submit" name="Update" value="Cancel" class="submitFrm"><br>
                              </td> 
                            <%
                              }
                             else
                             {%>
                             <td>
                            <input type="submit" id="save" name="save" value="Save" class="submitFrm" />
                            <input type="submit" id="cancel" name="cancel" value="Cancel" class="submitFrm" />
                             </td>
                            <%}%>
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
