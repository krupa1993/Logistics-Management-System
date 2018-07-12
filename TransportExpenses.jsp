<%-- 
    Document   : TransportExpenses
    Created on : Apr 15, 2015, 12:53:13 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TransportExpenses</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data1.js" type="text/javascript"></script>
</head>
<body onload="getVendorNameForTransportExpenses()">
    
   <form name="TransportExpensesForm" method="get" action="TransportExpensesServlet">
   <%
        String name="";
        String add="";
        String city="";
        String state="";
        String country="";
        String phnno="";
        String mobileno="";
        String fax="";
        String contactperson="";
        String contactperson_no="";
        String zipcode="";
        String edit="";
       
        ArrayList dtList=new ArrayList();
        if(request.getAttribute("data")!=null)
        {
            edit="edit";
            dtList=(ArrayList)request.getAttribute("data");
            System.out.println("ArrayList "+dtList);
            name=dtList.get(0).toString();
            add=dtList.get(2).toString();
            city=dtList.get(3).toString();
            state=dtList.get(4).toString();
            country=dtList.get(5).toString();
            phnno=dtList.get(6).toString();
            mobileno=dtList.get(7).toString();
            fax=dtList.get(8).toString();
            contactperson=dtList.get(9).toString();
            contactperson_no=dtList.get(10).toString();
            zipcode=dtList.get(11).toString();
        }
        else
        {
            name="";
            if(logic.checkNull(request,"nm")!=null)
                name=request.getParameter("nm");
            add="";
            if(logic.checkNull(request,"address")!=null)
                add=logic.checkNull(request,"address");
            city="";
            if(logic.checkNull(request,"city")!=null)
                city=logic.checkNull(request,"city");
            state="";
            if(logic.checkNull(request,"state")!=null)
                state=logic.checkNull(request,"state");
            country="";
            if(logic.checkNull(request,"country")!=null)
                country=logic.checkNull(request,"country");
            phnno="";
            if(logic.checkNull(request,"phnno")!=null)
                phnno=logic.checkNull(request,"phnno");
            mobileno="";
            if(logic.checkNull(request,"mobileno")!=null)
                mobileno=logic.checkNull(request,"mobileno");
            fax="";
            if(logic.checkNull(request,"fax")!=null)
                fax=logic.checkNull(request,"fax");
            contactperson="";
            if(logic.checkNull(request,"contactperson")!=null)
                contactperson=logic.checkNull(request,"contactperson");
            contactperson_no="";
            if(logic.checkNull(request,"contactperson_no")!=null)
                contactperson_no=logic.checkNull(request,"contactperson_no");
            zipcode="";
            if(logic.checkNull(request,"zipcode")!=null)
                zipcode=logic.checkNull(request,"zipcode");
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
                
                 <label id="Label9"  class="lblFormHeader" >Transport Expenses Form</label> 
            </td>
        </tr>
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
        
        <tr>
            <td valign="top">
            <table cellpadding="5px" cellspacing="0" width="100%">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <tr>
                        <td>
                            
                            <label id="Label1"  class="lblForm" >Vendor Name:</label> 

                        </td>
                        <td>
                         <select id="VendorName" name="vendorName" class="inputFrm" onchange="getWorkOrderForTransportExpenses()">
                         <option>---Select---</option>
                         </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label2" class="lblForm" >Work-Order No:</label> 
                        </td>
                         <td>
                         <select id="workOrderNo" name="workOrderNo" class="inputFrm" onclick="getDataByWorkOrder()">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label3" class="lblForm" >Assigned Vehicle:</label> 
                        </td>
                        <td>
                         <select id="vehicleregino" name="vehicleregino" class="inputFrm" onclick="getRules()">
                         <option>---Select---</option>
                         </select>
                               <%-- <input type="text" id="vehicleregino" name="vehicleregino"/>
                                <label id="VehicleRegistrationNo" name="vehicleregino" class="lblForm" ></label>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label3" class="lblForm" >KiloMeters Covered:</label> 
                        </td>
                        <td>
                            <input type="text" id="km" name="km" class="inputFrm"/> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label3" class="lblForm" >Days in Warehouse:</label> 
                        </td>
                        <td>
                            <input type="text" id="day" name="day" class="inputFrm"/> 
                        </td>
                    </tr>
                <table id="dataTable" cellpadding="5px" cellspacing="0" width="100%" border="1">
                <br></br>
                <tr>
                    <td></td>
                    <td>
                        <label name="Expense"  class="lblFormHeader">Expense Name</label> 
                    </td>
                    <td>
                        <label name="Amount"  class="lblFormHeader">Amount (Rs)</label> 
                    </td>
                </tr>
               </table>
                        
                <input type="button" value="Add Row" onclick="addRow('dataTable')" class="submitFrm" />
                &nbsp;
                <input type="button" value="Delete Row" onclick="deleteRow('dataTable')" class="submitFrm" />
                &nbsp; 
                <input type="hidden" name="hdn" value="<%=edit%>"/>
                <% if(edit!=null && edit.equalsIgnoreCase("edit"))
                {%>
                <input type="submit" name="Update" value="Update" class="submitFrm"/>
                <%
                }
                  else
                  {%>
                  <input type="submit" id="btnSave" value="Save" class="submitFrm" />
                <%}%>
                </table>
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
