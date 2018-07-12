<%-- 
    Document   : WorkOrderItem
    Created on : Apr 14, 2015, 7:37:45 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>WorkOrderItem</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
</head>
<body>
            <%
               String wrknum=logic.checkNull(request,"hdnwrknum");
            %>
    <form name="WorkOrderItemForm" method="get" action="WorkOrderItemServlet">
    
<div id="header">
    <jsp:include page="adminMenu.jsp"/>	
</div>
        
	<div id="contentsMaster">
		
		<div class="areaMaster">
			<div class="mainMaster">
        <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                
                 <label id="Label9"  class="lblFormHeader" >Work-order Item:</label> 
            </td>
        </tr>
          
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
        
        <tr>
           <td valign="top">
              &nbsp;&nbsp;&nbsp;&nbsp;
            <label id="Label9">Work-order No:<%=wrknum%></label> 
            </td>
        </tr>
           <table id="dataTable" cellpadding="5px" cellspacing="0" width="100%" border="1">
               &nbsp;&nbsp;&nbsp;&nbsp;
            <tr>
            <td><INPUT type="checkbox" name="chk"/></td>
                    <td>
                        <label name="ItemNo"  class="lblFormHeader">Item No</label> 
                    </td>
                    <td>
                        <label name="ItemName"  class="lblFormHeader">Item Name</label> 
                    </td>
                    <td>
                        <label name="Description"  class="lblFormHeader">Description</label> 
                    </td>
                    <td>
                        <label name="Quantity"  class="lblFormHeader">Quantity</label> 
                    </td>
                    <td>
                        <label name="ApproximateCost"  class="lblFormHeader">Approximate Cost</label> 
                    </td>
       
            </tr>
           </table>
        <input type="hidden" name="hdn" value="<%=wrknum%>"/>
        <input type="button" value="Add Row" onclick="addRow('dataTable')" class="submitFrm" />
        &nbsp;
        <input type="button" value="Delete Row" onclick="deleteRow('dataTable')" class="submitFrm" />
        &nbsp;
        <input type="submit" id="btnSave" value="Submit" class="submitFrm" />
        </td>
        </tr>
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
