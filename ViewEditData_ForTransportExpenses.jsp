<%-- 
    Document   : ViewEditData_ForTransportExpenses
    Created on : Apr 13, 2015, 12:33:24 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Data For Transport Expense</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
    <script src="js/data1.js" type="text/javascript"></script>
<div id="header">
<jsp:include page="adminMenu.jsp"/>	
</div>
</head>
<body  onload="getAssignedVehicle();">  
    <%
               String vendornm=null;
               String wrknum=null;
               String vehicleregino=null;
               String km=null;
               String day=null;
               
               ArrayList dtList=new ArrayList();
               if(request.getAttribute("data")!=null)
               {
                   dtList=(ArrayList)request.getAttribute("data");
                   System.out.println("ArrayList "+dtList);
                   vendornm=dtList.get(0).toString();
                   wrknum=dtList.get(1).toString();
                   vehicleregino=dtList.get(2).toString();
                   km=dtList.get(3).toString();
                   day=dtList.get(4).toString();
                   
               }
              /*ArrayList vr=new ArrayList();
                if(request.getAttribute("vr")!=null)
                vr=(ArrayList)request.getAttribute("vr");*/
        %>
        <form name="ViewEditData_ForTransportExpenseForm" method="get" action="TransportExpensesServlet">
    <div id="contentsMaster">
        <div class="areaMaster">
            <div class="mainMaster">
                 <table cellpadding="5px" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <label id="lbl3"  class="lblForm" >Vendor:</label> 
                        </td>
                        <td>
                            <label id="vendorName" name="vendorName" class="lblForm"><%=vendornm%></label> 
                            <input type="hidden" value="<%=vendornm%>" name="vendorName">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl3"  class="lblForm" >Work Order:</label> 
                        </td>
                        <td>
                            <label id="workOrderNo" name="workOrderNo" class="lblForm" ><%=wrknum%></label> 
                            <input type="hidden" value="<%=wrknum%>" name="workOrderNo">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl6"  class="lblForm" >Assigned Vehicle:</label> 
                        </td>
                        <td>
                            <select id="VehicleRegistrationNo" name="vehicleregino" value="<%=vehicleregino%>" onclick="getRules1();">
                            <option>---Select---</option>
                            <%--<%
                                String val="";
                                for(int i=0;i<vr.size();i++)
                                {
                                    val=vr.get(i).toString();
                                %><option value="<%=val%>"><%=val%></option>
                                <%}%>--%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label name="KilometersCovered" class="lblForm">Kilometers Covered</label> 
                        </td>
                        <td>
                            <input type="text" name="km" class="inputFrm"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label name="DaysInWarehouse" class="lblForm">Days In Warehouse</label> 
                        </td>
                        <td>
                            <input type="text" name="day" class="inputFrm"/>
                        </td>
                    </tr>
                    </table>
                     <table id="dataTable1" cellpadding="5px" cellspacing="0" width="100%" border="1">
               &nbsp;&nbsp;  
            <tr>
                    <td><input type="checkbox" name="chk"/></td>
                    <td>
                        <label name="Expense"  class="lblFormHeader">Expense</label> 
                    </td>
                    <td>
                        <label name="Amount"  class="lblFormHeader">Amount</label> 
                    </td>
                <input type="hidden" name="hdnwrkno" id="hdnwrkno" value="<%=wrknum%>"></input>
                <input type="hidden" name="hdnregino" id="hdnregino" value="<%=vehicleregino%>"/>
             </tr>
             </table>
       
                    <br></br>
                    <tr>
                              <td>
                                    <input type="button" value="Add Row" onclick="addRow1('dataTable1')" class="submitFrm" />
                                    &nbsp;
                                    <input type="button" value="Delete Row" onclick="deleteRow1('dataTable1')" class="submitFrm" />
                                    &nbsp;
                                    <input type="submit" name="Update" value="Update" class="submitFrm"/><br>
                              </td> 
                    </tr> 
                    <input type="hidden" name="hdn" value="Update">
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
