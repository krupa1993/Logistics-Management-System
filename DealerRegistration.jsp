<%-- 
    Document   : DealerRegistration
    Created on : Apr 9, 2015, 3:14:36 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Dealer Registration</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
</head>
<body>
    <form name="DealerForm" method="get" action="DealerRegistrationServlet">
   <%
        String name="";
        String usernm="";
        String pwd="";
        String add="";
        String phnno="";
        String mobileno="";
        String fax="";
        String contactperson="";
        String contactperson_no="";
        String emailid="";
        String website="";
        String description="";
        String edit="";
       
        ArrayList dtList=new ArrayList();
        if(request.getAttribute("data")!=null)
        {
            edit="edit";
            dtList=(ArrayList)request.getAttribute("data");
            System.out.println("ArrayList "+dtList);
            name=dtList.get(0).toString();
            usernm=dtList.get(1).toString();
            pwd=dtList.get(2).toString();
            add=dtList.get(3).toString();
            phnno=dtList.get(4).toString();
            mobileno=dtList.get(5).toString();
            fax=dtList.get(6).toString();
            contactperson=dtList.get(7).toString();
            contactperson_no=dtList.get(8).toString();
            emailid=dtList.get(9).toString();
            website=dtList.get(10).toString();
            description=dtList.get(11).toString();
        }
        else
        {
            if(logic.checkNull(request,"err")!=null)
                //out.println("Username already exists");
            name="";
            if(logic.checkNull(request,"nm")!=null)
                name=logic.checkNull(request,"nm");
            usernm="";
            if(logic.checkNull(request,"usernm")!=null)
                usernm=logic.checkNull(request,"usernm");
            System.out.println("Dealer jsp::"+usernm);
            pwd="";
            if(logic.checkNull(request,"pwd")!=null)
                pwd=logic.checkNull(request,"pwd");
            add="";
            if(logic.checkNull(request,"address")!=null)
                add=logic.checkNull(request,"address");
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
            emailid="";
            if(logic.checkNull(request,"emailid")!=null)
                emailid=logic.checkNull(request,"emailid");
            website="";
            if(logic.checkNull(request,"website")!=null)
                website=logic.checkNull(request,"website");
            description="";
            if(logic.checkNull(request,"description")!=null)
                description=logic.checkNull(request,"description");
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
                
                 <label id="Label9"  class="lblFormHeader" >Dealer Registration Form</label> 
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
                            
                            <label id="Label1"  class="lblForm" >Name:</label> 

                        </td>
                        <td>
                            <input id="txtName" name="nm" type="text" class="inputFrm" value="<%=name%>"required/>
                        </td>
                    </tr>
                        <%
                            if(!edit.equalsIgnoreCase("edit"))
                            {
                        %>
                    <tr>
                        <td>
                            <label id="Label2"   class="lblForm" >User Name:</label> 
                        </td>
                        <td>
                            
                            <input id="txtUserName" name="usernm" type="text" class="inputFrm" value="<%=usernm%>" required/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label3"  class="lblForm" >Password:</label> 
                        </td>
           
                        <td>
                            <input id="txtPwd" name="pwd" type="password" class="inputFrm" value="<%=pwd%>" required/>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label3"  class="lblForm" >Confirm Password:</label> 
                        </td>
                        <td align="left" width="50%">
                            <input id="txtConPwd" name="conpwd" type="password" value="<%=pwd%>" class="inputFrm" onblur="ValidatePass()" />
                        </td>
                        <td>
                            <label id="confirmpassword"  class="lblForm" /> 
                        </td>
                    </tr>
                            <%}%>
                    <tr>
                        <td>
                            <label id="Label5"   class="lblForm" >Address:</label> 
                        </td>
                        <td>
                            <textarea id="txtAdress" name="add" cols="20" rows="2" class="inputFrm" required><%=add%></textarea>
                        </td>
                    </tr>
                         <tr>
                        <td>
                            <label id="Label6"   class="lblForm" >Phone Number:</label> 
                        </td>
                        <td>
                            <input id="txtPhoneNo" type="text" name="phnno" class="inputFrm" value="<%=phnno%>" maxlength="13" required/>
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label7"   class="lblForm" >Mobile Number:</label> 
                        </td>
                        <td>
                            <input id="txtMobNo" name="mobileno" type="text" class="inputFrm" value="<%=mobileno%>" maxlength="10" required/>
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label8"   class="lblForm" >Fax:</label> 
                        </td>
                        <td>
                            
                            <input id="txtFax" name="fax" type="text" class="inputFrm" value="<%=fax%>" required/>
                            
                        </td>
                        </tr>
                        <tr>
                        <td>
                            <label id="Label9"   class="lblForm" >Contact Person:</label> 
                        </td>
                        <td>
                            
                            <input id="txtContPerson" type="text" name="contactperson" class="inputFrm" value="<%=contactperson%>" required/>
                            
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label10"   class="lblForm" >Contact Person Number:</label> 
                        </td>
                        <td>
                            
                            <input id="txtContPersonNo" type="text" name="contactperson_no" class="inputFrm" maxlength="10" value="<%=contactperson_no%>" required/>
                            
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label11"   class="lblForm" >Email ID:</label> 
                        </td>
                        <td>
                            
                            <input id="txtEmailID" type="email" name="emailid" class="inputFrm" value="<%=emailid%>" required/>
                            
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label12"   class="lblForm" >Website:</label> 
                        </td>
                        <td>
                            
                            <input id="txtWebsite" type="text" name="website" class="inputFrm" value="<%=website%>" required/>
                            
                        </td>
                        </tr>
                        
                        <tr>
                        <td>
                            
                            <label id="Label13"   class="lblForm" >Description:</label> 
                        </td>
                        <td>
                            <textarea id="txtDescription" name="description" cols="20" rows="2" class="inputFrm"><%=description%></textarea>
                        </td>
                        </tr>
                   
                            <%
                            if(!edit.equalsIgnoreCase("edit"))
                            {
                            %>
                            <tr>
                                <td></td>
                                <%-- <tr>
                                <td>
                                    <img src="DISPLAYCAPTCHAsERVLET"></img>
                                </td>
                                <td>
                                    <input type="text" name="captchaCode" id="captchaCode" class="inputFrm" onblur="checkCaptcha();" />
                                </td>
                                <td>
                                    <label id="txtCaptcha"></label>
                                </td>
                                </tr>--%>
                                 <%}%>
                            </tr>
                        <tr>
                        <td align="center">
                             <input type="hidden" name="hdn" value="<%=edit%>"/>
                             <input type="hidden" name="hdn1" value="<%=usernm%>"/>
                            <% if(edit!=null && edit.equalsIgnoreCase("edit"))
                            {%>
                              <td>
                                 <input type="submit" name="Update" value="Update" class="submitFrm"/><br>
                              </td> 
                            <%
                              }
                             else
                             {%>
                             <td>
                            <input type="submit" id="btnSave" value="Sign Up" class="submitFrm" />
                            <input type="reset" value="Reset" class="submitFrm"/>
                             </td>
                            <%}%>
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
