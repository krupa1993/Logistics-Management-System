<%-- 
    Document   : ProofOfDelivery
    Created on : Apr 15, 2015, 1:55:23 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>POD</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data1.js" type="text/javascript"></script>
<div id="header">
<jsp:include page="adminMenu.jsp"/>	
</div>
</head>
<body onload="getVendorNameForGeneratePOD()">
    <%
        String vehicletype=null;
        String vehicleregino=null;
        String quantity=null;
        String edit="";
       
        ArrayList dtList=new ArrayList();
        if(request.getAttribute("data")!=null)
        {
            edit="edit";
            dtList=(ArrayList)request.getAttribute("data");
            System.out.println("ArrayList "+dtList);
            vehicletype=dtList.get(0).toString();
            vehicleregino=dtList.get(1).toString();
            quantity=dtList.get(2).toString();
        }
        else
        {
            vehicletype="";
            if(logic.checkNull(request,"vehicletype")!=null)
                vehicletype=request.getParameter("vehicletype");
            vehicleregino="";
            if(logic.checkNull(request,"vehicleregino")!=null)
                vehicleregino=logic.checkNull(request,"vehicleregino");
            quantity="";
            if(logic.checkNull(request,"quantity")!=null)
                quantity=logic.checkNull(request,"quantity");
        } 
      %>
      <form name="ProofOfDeliveryForm" method="get" action="GeneratePODServlet?generateNo=2">
    <div id="contentsMaster">
        <div class="areaMaster">
            <div class="mainMaster">
                 <table cellpadding="5px" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <label id="lbl1"  class="lblFormHeader" >Generate POD:</label> 

                        </td>
                    </tr>
                     <tr>
                     <td>
                        <label id="lbl2"  class="lblForm" >POD No:</label>  
                     </td>
               
                     <%
                        String podnum=logic.checkNull(request,"podno");
                        %>
                        <td>
                            <input name="hdnpodnum" type="hidden" value="<%=podnum%>"/>
                            <label id="pod" name="podnum" value="" class="lblForm" ><%=podnum%></label> 
                        </td>
                        </tr>
                    <tr>
                        <td>
                            <label id="lbl2"  class="lblForm" >Vendor Name:</label> 
                        </td>
                        <td>
                         <select id="vendorName" name="vendorName" onchange="getWorkOrderNoForGeneratePOD()">
                         <option>---Select---</option>
                         </select>
                        </td>
                    </tr>
                        
                    <tr>
                        <td>
                            <label id="lbl3"  class="lblForm" >Work Order No:</label> 
                        </td>
                        <td>
                         <select id="WorkOrderNo" name="WorkOrderNo" onclick="getGatePassIDForGeneratePOD()">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl2"  class="lblForm" >Gate Pass:</label> 
                        </td>
                        <td>
                         <select id="gatepassid" name="gatePassId">
                         <option>---Select---</option>
                         </select>
                        </td>
                    </tr>
                        
                     <tr>
                        <td>
                            <label id="lbl7"  class="lblForm" >Date:</label> 
                        </td>
                        <td>
                         <input type="date" name="date" id="Date"/>
                         </td>
                    </tr>
                    </table>
                    <br></br>
                    <tr>
                        <td>
                            <input type="submit" id="save" name="save" value="Save" class="submitFrm" />
                            <input type="submit" id="cancel" name="cancel" value="Cancel" class="submitFrm" />
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
