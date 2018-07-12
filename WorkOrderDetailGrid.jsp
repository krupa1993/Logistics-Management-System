<%-- 
    Document   : WorkOrderDetailGrid
    Created on : Apr 13, 2015, 12:14:55 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,functions.logic,javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Work Order Detail</title>
		<style type="text/css" title="currentStyle">
			@import "css/demo_page.css";
			@import "css/demo_table.css";
			@import "css/customJ.css";
		</style>
                <link rel="stylesheet" type="text/css" href="css/menu.css"/>
		<link rel="stylesheet" type="text/css" href="css/customJ.css"/>
		<link rel="stylesheet" href="jquerydatepicker/themes/base/jquery.ui.all.css"/>
                <link rel="stylesheet" href="css/styles.css" type="text/css" />
                <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
                <script src="MenuJScript.js" type="text/javascript"></script>
		<script src="js/jquery-1.8.2.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
		<script src="jquerydatepicker/ui/jquery.ui.core.js"></script>
		<script src="jquerydatepicker/ui/jquery.ui.widget.js"></script>
		<script src="jquerydatepicker/ui/jquery.ui.datepicker.js"></script>
		<link rel="stylesheet" href="css/demos.css"/>
		<script src="js/data1.js" type="text/javascript"></script>
                <script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#date123').datepicker();
				$('.date').datepicker({ dateFormat:'dd/mm/yy'});
				$('#admindata').dataTable();
				
			} );
		</script>
                
                <%
                    String uname=null;
                    if(request.getParameter("fromuser")!=null)
                        uname=session.getAttribute("userName").toString();
                    
                %>
                    
</head>
                <%
                    if(uname==null)
                    {%>
                        <body onload="getVendorNameForWorkOrderDetailGrid()">
                    <%}
                    else
                    {%>
                        <body onload="getWorkOrderDetailGrid()">
                   <% }
                    
                    %>

<div id="header">
    <jsp:include page="adminMenu.jsp"/>	
    	</div>
        <div class="body1">
        <div class="form1">
          
            <form name="WorkOrderDetailGridForm">	
            <fieldset class="fieldset1">
                <table align="center">
                    &nbsp;&nbsp;&nbsp;
                    <tr>
                        <td>
                            <%
                    if(uname==null)
                    {%>
                    <select name="vendorname" id="vendorname" onchange="getWorkOrderDetailGrid()" class="inputFrm">
                                <option>---Select---</option>
                            </select>
                            <input type="hidden" name="hdndes"  id="hdndes" value="0" ></input>
                       
                    <%}
                    else
                    {%>
                    <input type="hidden" name="vendorname"  id="vendorname" value="<%=uname%>" ></input>
                    <input type="hidden" name="hdndes"  id="hdndes" value="1" ></input>
                    <%}
                    %>
                        </td>
                    </tr>
                </table>
                
                <legend>Work Order Detail</legend>
                <div class="grid" >
               
                    <table align="center" width="100%" id="admindata" style="border: 1px solid;">
                        &nbsp;&nbsp;&nbsp;
                    <thead style="background-color: silver">
                    </thead>
                    </table>
                    
                </div>
            </fieldset>
            </form>
	</div>
        </div>
                                    <jsp:include page="footer.jsp"/>
</body>
</html>
