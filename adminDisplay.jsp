<%-- 
    Document   : adminDisplay
    Created on : Apr 8, 2015, 5:46:49 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,functions.logic,javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dynamic Table Display</title>
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
                <link href="css/GridViewStyles.css" rel="stylesheet" type="text/css" />
                <script src="MenuJScript.js" type="text/javascript"></script>
		<script src="js/jquery-1.8.2.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
		<script src="jquerydatepicker/ui/jquery.ui.core.js"></script>
		<script src="jquerydatepicker/ui/jquery.ui.widget.js"></script>
		<script src="jquerydatepicker/ui/jquery.ui.datepicker.js"></script>
		<link rel="stylesheet" href="css/demos.css"/>
		<script src="js/data.js" type="text/javascript"></script>
                <script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#date123').datepicker();
				$('.date').datepicker({ dateFormat: 'dd/mm/yy' });
				$('#admindata').dataTable();
				
			} );
		</script>
    </head>
    <body onload="getTable()">
       <div id="header">
    <jsp:include page="adminMenu.jsp"/>	
    	</div>
        <div class="body1">
             <% 
                                                 String type="";
                                                 String lbl=null;
                                                if(request.getParameter("typeforgrid")!=null)
                                                    type=request.getParameter("typeforgrid").trim();
                                                 
                                                else
                                                {
                                              //  HttpSession s1=request.getSession(false);
                                                    if(session.getAttribute("typeforgrid")!=null)
                                                     type=session.getAttribute("typeforgrid").toString().trim();
                                                 }                                                    
                                                    System.out.println("type in jsp page: "+type);
                                                    if(type.equalsIgnoreCase("1"))
                                                    {
                                                        lbl="Admin Grid";
                                                    }
                                                    else if(type.equalsIgnoreCase("2"))
                                                    {
                                                        lbl="Vendor Grid";
                                                    }
                                                    else if(type.equalsIgnoreCase("3"))
                                                    {
                                                        lbl="Service Provider Grid";
                                                    }
                                                    else if(type.equalsIgnoreCase("4"))
                                                    {
                                                        lbl="Dealer Grid";
                                                    }
                                                    else
                                                    {
                                                       out.println("No Data"); 
                                                    }
                                                 %>
	<div class="form1">
            <form name="gridForm">	
            <fieldset class="fieldset1">
                <legend><%=lbl%></legend>
			<div class="grid"  >
				<div>
					<table  width="100%" id="admindata"
                                               class="mGrid">
						<thead style="background-color: silver">
							
						</thead>
                                               
                                            
                                        </table>
                                    <input type="hidden" id="hdn" name="typehidden" value="<%=type%>"/>
				</div>
			</div>
                </fieldset>
                                        </form>
	</div>
        </div>
                     
                             <jsp:include page="footer.jsp"/>
</body>
</html>
