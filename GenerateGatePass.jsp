<%-- 
    Document   : GenerateGatePass
    Created on : Apr 15, 2015, 12:28:20 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
 <title>GenerateGatePass</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data1.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css" />
    <script type="text/javascript" src="jquery.1.4.2.js"></script>
    <script type="text/javascript" src="jsDatePick.jquery.min.1.3.js"></script>
    <script type="text/javascript">
        /*function dtpicker()
        {
            new JsDatePick({
			useMode:2,
			target:"Date",
			dateFormat:"%d-%M-%Y"
			});
        }*/
        window.onblur = function(){
		new JsDatePick({
			useMode:2,
			target:"Date",
			dateFormat:"%d-%M-%Y"});}
</script>
</head>
<body onload="getVendorNameForGenerateGatePass()">
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
<form name="GenerateGatePassForm" method="get" action="GenerateGatePassServlet">
<div id="header">
<jsp:include page="adminMenu.jsp"/>	
</div>
    <div id="contentsMaster">
        <div class="areaMaster">
            <div class="mainMaster">
                <table cellpadding="5px" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            
                            <label id="lbl1"  class="lblFormHeader" >Generate Gate Pass:</label> 

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl2"  class="lblForm" >Vendor Name:</label> 
                        </td>
                        <td>
                         <select id="vendorName" name="vendorName"  class="inputFrm" onchange="getWorkOrderForGenerateGatePass()">
                         <option>---Select---</option>
                         </select>
                        </td>
                    </tr>
                        
                    <tr>
                        <td>
                            <label id="lbl3"  class="lblForm" >Work Order No:</label> 
                        </td>
                        <td>
                         <select id="WorkOrderNo" name="WorkOrderNo" class="inputFrm" onclick="getItemNameForGenerateGatePass()">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                        
                    <tr>
                        <td>
                            <label id="lbl4"  class="lblForm" >Item Name:</label> 
                        </td>
                        <td>
                         <select id="ItemName" name="ItemName" class="inputFrm" onclick="getDataByItemName()">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl5"  class="lblForm" >Vehicle Type:</label> 
                        </td>
                        <td>
                            <input type="text" name="vehicletype" class="inputFrm" id="VehicleType" />
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl6"  class="lblForm" >Vehicle Registration No:</label> 
                        </td>
                        <td>
                         <input type="text" name="vehicleregino" class="inputFrm" id="VehicleRegiNo" />
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lbl7"  class="lblForm" >Quantity:</label> 
                        </td>
                        <td>
                         <input type="text" name="quantity" class="inputFrm" id="Qty"/>
                         </td>
                    </tr>
                     <tr>
                        <td>
                            <label id="lbl7"  class="lblForm" >Date:</label> 
                        </td>
                        <td>
                         <input type="date" name="date" class="inputFrm" id="Date"/>
                         </td>
                    </tr>
                    </table>
                    <br></br>
                    <table align="center">
                    <tr>
                        <td>
                            <input type="submit" id="save" name="save" value="Save" class="submitFrm" />
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
                        </div>
		</div>
	</div>
                <jsp:include page="footer.jsp"/>
    </form>
</body>
</html>
