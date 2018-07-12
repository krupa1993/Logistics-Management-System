<%-- 
    Document   : WorkOrder
    Created on : Apr 14, 2015, 7:20:56 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>WorkOrderPage</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
    
<link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css" />
<script type="text/javascript" src="jquery.1.4.2.js"></script>
<script type="text/javascript" src="jsDatePick.jquery.min.1.3.js"></script>
    <script type="text/javascript">
        function dtpicker()
        {
            new JsDatePick({
			useMode:2,
			target:"date",
			dateFormat:"%d-%M-%Y"
			});
        }
</script>
</head>
<body onload="getVendorName()">
<form name="WorkOrderForm" method="get" action="WorkOrderServlet?generateNo=2">
<div id="header">
<jsp:include page="adminMenu.jsp"/>	
</div>
    <div id="contentsMaster">
        <div class="areaMaster">
            <div class="mainMaster">
                 <table cellpadding="5px" cellspacing="0" width="100%">
                     
                     <tr>
                         <td>
                             <label id="lbl"  class="lblFormHeader" >Create Work-order</label>
                         </td>
                     </tr>
                    <tr>
                        <td>
                            <label id="lbl1"  class="lblForm" >Work-order No:</label>
                        
                        <%
                            String wrknum=logic.checkNull(request,"workorderno");
                        %>
                        
                            <input name="hdnwrknum" type="hidden" value="<%=wrknum%>"/>
                        </td>
                        <td>
                            <label id="wrkorder" name="wrkordernum" value="" class="lblForm" ><%=wrknum%></label> 
                        </td>
                    </tr>
                    
                     <tr>
                         <td>
                            
                            <label id="lbl2"  class="lblForm" >From:</label> 

                        </td>
                         <td>
                         <select id="VendorName" name="VendorName" class="inputFrm" onchange="getVendorLocation()">
                         <option>---Select---</option>
                         </select>
                             <select id="vendorLocation" name="vendorLocation" class="inputFrm" onblur="getDealerName()">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                    
                    <tr>
                        <td>
                            
                            <label id="lbl3"  class="lblForm" >To:</label> 

                        </td>
                        <td>
                         <select id="dealerName" name="DealerName" class="inputFrm" onchange="getDealerLocation()">
                         <option>---Select---</option>
                         </select>
                         <select id="dealerLocation" name="dealerLocation" class="inputFrm">
                         <option>---Select---</option>
                         </select>
                         </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <label id="lbl4"  class="lblForm" >Date:</label> 
                        </td>
                        <td>
                            <input id="date" name="date" type="date" class="inputFrm" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td></td>
                       <td>
                            <input type="submit" id="btnSave" value="Submit" class="submitFrm" />
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
        <%--date --%> <input type="hidden" size="12" id="inputField" />
    
                            <jsp:include page="footer.jsp"/>
                
    </form>
</body>
</html>
