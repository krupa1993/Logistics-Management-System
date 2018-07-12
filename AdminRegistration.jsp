<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminRegistration</title>
        <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
    </head>
    <body>
        <form name="AdminForm" method="get" action="AdminRegistrationServlet">
        <%
        String fname="";
        String lname="";
        String usernm="";
        String pwd="";
        String add="";
        String city="";
        String state="";
        String country="";
        String mobileno1="";
        String mobileno2="";
        String gender="";
        String description="";
        String edit="";
        String genM="";
        String genF="";
        String emailid="";
        ArrayList dtList=new ArrayList();
        if(request.getAttribute("data")!=null)
        {
           //hidden field var update
            edit="edit";
            dtList=(ArrayList)request.getAttribute("data");
            System.out.println("ArrayList "+dtList);
            fname=dtList.get(0).toString();
            lname=dtList.get(1).toString();
            usernm=dtList.get(2).toString();
            pwd=dtList.get(3).toString();
            add=dtList.get(4).toString();
            city=dtList.get(5).toString();
            state=dtList.get(6).toString();
            country=dtList.get(7).toString();
            mobileno1=dtList.get(8).toString();
            mobileno2=dtList.get(9).toString();
            gender="";
            if(dtList.get(10)!=null)
            gender=dtList.get(10).toString();
            if(gender.equalsIgnoreCase("male"))
                genM="selected";
            else
                genF="selected";
            emailid=dtList.get(11).toString();
            description=dtList.get(12).toString();
           }
        else
        {
            fname="";
            if(logic.checkNull(request,"nm1")!=null)
                fname=logic.checkNull(request, "nm1").trim();
            lname="";
            if(logic.checkNull(request,"nm2")!=null)
                lname=logic.checkNull(request,"nm2").trim();
            usernm="";
            if(logic.checkNull(request,"nm3")!=null)
                usernm=logic.checkNull(request,"nm3").trim();
            pwd="";
            if(logic.checkNull(request,"pwd")!=null)
                pwd=logic.checkNull(request,"pwd").trim();
            add="";
            if(logic.checkNull(request,"add")!=null)
                add=logic.checkNull(request,"add").trim();
            city="";
            if(logic.checkNull(request,"city")!=null)
                city=logic.checkNull(request,"city").trim();
            state="";
            if(logic.checkNull(request,"state")!=null)
                state=logic.checkNull(request,"state").trim();
            country="";
            if(logic.checkNull(request,"country")!=null)
                country=logic.checkNull(request,"country").trim();
            mobileno1="";
            if(logic.checkNull(request,"mobileno1")!=null)
                mobileno1=logic.checkNull(request,"mobileno1").trim();
            mobileno2="";
            if(logic.checkNull(request,"mobileno2")!=null)
                mobileno2=logic.checkNull(request,"mobileno2").trim();
            gender="";
            if(logic.checkNull(request,"gender")!=null && logic.checkNull(request,"gender").equalsIgnoreCase("on"))
            gender="selected";
            emailid="";
            if(logic.checkNull(request,"emailid")!=null)
                emailid=logic.checkNull(request,"emailid");
            description="";
            if(logic.checkNull(request,"description")!=null)
                description=logic.checkNull(request,"description").trim();
        } 
      %>
        <div id="header">
    <jsp:include page="adminMenu.jsp"/>	
</div>
        
	<div id="contentsMaster">
		
		<div class="areaMaster">
			<div class="mainMaster">
				
			 <table cellpadding="0" cellspacing="0" width="100%" >
       <%-- <tr>
             <%
                            if(!edit.equalsIgnoreCase("edit"))
                                                               {
                            %>
            <td>
                
                 <label id="Label9"  class="lblFormHeader" >Admin Registration Form</label> 
            </td>
            <%}%>
        </tr>--%>
                            <% if(edit!=null && edit.equalsIgnoreCase("edit"))
                            {%>
                              <td>
                                <label id="Label9"  class="lblFormHeader" >Edit Profile:</label>
                              </td> 
                              <%
                              }
                             else
                             {%>
                             <td>
                            <label id="Label9"  class="lblFormHeader" >Admin Registration Form:</label>
                             </td>
                            <%}%>
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
        
        <tr>
            <td valign="top">
            <table cellpadding="5px" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            
                            <label id="lbl1"  class="lblForm" >First Name:</label> 

                        </td>
                        <td>
                            <input id="txtFirstName" name="nm1" type="text" value="<%=fname%>" class="inputFrm" required />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                            <label id="Label1"   class="lblForm" >Last Name:</label> 
                        </td>
                        <td>
                            
                            <input id="txtLastName" name="nm2" type="text" value="<%=lname%>" class="inputFrm" required/>
                            
                        </td>
                    </tr>
                            <%
                            if(!edit.equalsIgnoreCase("edit"))
                            {
                            %>
                    <tr>
                        <td>
                            <label id="Label2"  class="lblForm" >UserName:</label> 
                        </td>
           
                        <td>
                            <input id="txtUserName" name="nm3" type="text" value="<%=usernm%>" class="inputFrm" onblur="duplicateUsername();" required/>
                           
                        </td>
                        <td>
                            <label id="lblUserName"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label3"  class="lblForm" >Password:</label> 
                        </td>
                        <td align="left" width="50%">
                            
                            <input id="txtPwd" name="pwd" type="password" value="<%=pwd%>" class="inputFrm" required/>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label3"  class="lblForm" >Confirm Password:</label> 
                        </td>
                        <td align="left" width="50%">
                            <input id="txtConPwd" name="conpwd" type="password" value="<%=pwd%>" class="inputFrm" onblur="ValidatePass()" required/>
                        </td>
                        <td>
                            <label id="confirmpassword"  class="lblForm" /> 
                        </td>
                    </tr>
                            <%}%>
                    <tr>
                        <td>
                            
                            <label id="Label4" class="lblForm" >Address:</label> 
                        </td>
                        <td>
                            
                            <textarea id="txtAdress" name="add" cols="20" rows="2" class="inputFrm" required><%=add%></textarea>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label5"   class="lblForm" >City:</label> 
                        </td>
                        <td>
                            
                            <input id="txtCity" name="city" value="<%=city%>" type="text" class="inputFrm" required/>
                            
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label6"   class="lblForm" >State:</label> 
                        </td>
                        <td>
                            
                            <input id="txtState" name="state" value="<%=state%>" type="text" class="inputFrm" required/>
                            
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label7"   class="lblForm" >Country:</label> 
                        </td>
                        <td>
                            
                            <input id="txtCountry" name="country" value="<%=country%>" type="text" class="inputFrm" required/>
                            
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label8"   class="lblForm" >Mobile Number1:</label> 
                        </td>
                        <td>
                            
                            <input id="txtMobNo1" name="mobileno1" value="<%=mobileno1%>" type="text" class="inputFrm" required maxlength="10"/>
                            
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label9"   class="lblForm" >Mobile Number2:</label> 
                        </td>
                        <td>
                            
                            <input id="txtMobNo2" name="mobileno2" value="<%=mobileno2%>" type="text" class="inputFrm" required maxlength="10"/>
                            
                        </td>
                        </tr>
                        <tr>
                        <td>
                            <label id="Label10"   class="lblForm" >Gender:</label> 
                        </td>
                        <td>
                            <select id="ddlGender" name="gender" value="<%=gender%>" class="inputFrm">
                                <option value="male" <%=genM%>>Male</option>
                                <option value="female" <%=genF%>>Female</option>
                            </select>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label11"   class="lblForm" >EmailID:</label> 
                        </td>
                        <td>
                            
                            <input id="txtEmailID" name="emailid" type="text" value="<%=emailid%>" class="inputFrm" required/>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                            <label id="Label12"   class="lblForm" >Description:</label> 
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
                                <%--<tr>
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
                            <% if(edit!=null && edit.equalsIgnoreCase("edit"))
                            {%>
                              <td>
                                 <input type="submit" name="Update" value="Update" class="submitFrm"><br>
                              </td> 
                                 <input id="txtUserName1" name="nm3" type="hidden" value="<%=usernm%>" class="inputFrm" />
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
