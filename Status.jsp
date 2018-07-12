<%-- 
    Document   : Status
    Created on : Jun 30, 2015, 10:37:09 PM
    Author     : ronakrana
--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WelcomePage</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
</head>
    <form name="StatusForm" method="get" action="StatusServlet">  
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
                
                <label id="Label9"  class="lblFormHeader" >Status:</label> 
            </td>
        </tr>
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
        <table>
         <tr>
             <td>
           <label id="Label9"  class="lblForm" >Enter Number:</label>
           </td>
             <td>
            <input type="text" id="no" name="no"/>
            </td>
         </tr>
            <td>
                <input type="submit" id="btnSave" value="Submit" class="submitFrm" />
            </td>
          
        </table>
        </table>
                            </form>            
        
       
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
</html>
