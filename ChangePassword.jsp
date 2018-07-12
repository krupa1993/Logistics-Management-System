<%-- 
    Document   : ChangePassword
    Created on : Apr 8, 2015, 4:35:03 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
    </head>
    <body>
        <form name="ChangePasswordForm" method="get" action="ChangePasswordServlet">
<%
    if(session.getAttribute("userName")!=null)
                System.out.println(session.getAttribute("userName"));
    
%>    <div id="header">
    <jsp:include page="adminMenu.jsp"/>	
    	</div>
	<div id="contentsMaster">
		
		<div class="areaMaster">
			<div class="mainMaster">
				
			 <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                
                 <label id="Label9"  class="lblFormHeader" >Change Password:</label> 
            </td>
        </tr>
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
        
        <tr>
            <td valign="top">
            <table cellpadding="5px" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            
                            <label id="Label1" class="lblForm" >Old Password:</label> 

                        </td>
                        <td>
                            <input id="txtoldpwd" name="oldpwd" type="password" class="inputFrm" required />
                            <%  if(logic.checkNull(request,"err").equalsIgnoreCase("1"))
                                    out.println("Old password wrong");%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                            <label id="Label2" class="lblForm" >New Password:</label> 
                        </td>
                        <td>
                            
                            <input id="txtPwd" name="newpwd" type="password" class="inputFrm" required />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label3" class="lblForm" >Confirm Password:</label> 
                        </td>
           
                        <td>
                            <input id="txtConPwd" name="conpwd" type="password" class="inputFrm" align="center" onblur="ValidatePass()" required/>
                        </td>
                        <td>
                            <label id="confirmpassword"  class="lblForm" /> 
                        </td>
                 </tr>
                 <tr  align="left">
                        <td>
                             &nbsp;
                        </td>
                      
                     <td>
                        <input type="submit" name="Update" value="Update" class="submitFrm" /><br>   
                     </td> 
                 </tr>
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
