<%-- 
    Document   : Reminder
    Created on : Apr 8, 2015, 10:40:57 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Reminders</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
</head>
    <form name="ReminderForm" method="get" action="ReminderServlet">  
<body>
<div id="header">
    <jsp:include page="adminMenu.jsp"/>	
    	</div>
	<div id="contentsMaster">
		
		<div class="areaMaster">
			<div class="mainMaster">
				
			 <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                
                <label id="Label9"  class="lblFormHeader" >Reminder:</label> 
            </td>
        </tr>
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
        <table>
            <tr>
                <td>
                    <label id="Label1"  class="lblForm" >Subject:</label>
                </td>
                <td>
                <input type="text" id="subject" name="subject" class="inputFrm"/>
                </td> 
            </tr>
            
            <tr>
                <td>
                    <label id="Label1"  class="lblForm" >Your Reminders:</label>
                </td>
                <td>
                    <textarea id="txtDesc" name="desc" cols="20" rows="2" class="inputFrm"></textarea>
                </td>
            </tr>
            <td>
                <input type="submit" id="btnSave" value="Submit" class="submitFrm" />
            </td>
          
        </table>
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

</body>
  </form>  
</html>

