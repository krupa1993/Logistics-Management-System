<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Service Provider Registration</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
</head>
<body>
    <form name="ServiceProviderForm" method="get" action="ServiceProviderRegistrationServlet">
    <%
        String name="";
        String add="";
        String city="";
        String state="";
        String country="";
        String phnno="";
        String mobileno1="";
        String mobileno2="";
        String contactperson="";
        String contactperson_no="";
        String description="";
        String edit="";
       
        ArrayList dtList=new ArrayList();
        if(request.getAttribute("data")!=null)
        {
            edit="edit";
            dtList=(ArrayList)request.getAttribute("data");
            out.println("ArrayList "+dtList);
            name=dtList.get(0).toString();
            add=dtList.get(1).toString();
            city=dtList.get(2).toString();
            state=dtList.get(3).toString();
            country=dtList.get(4).toString();
            phnno=dtList.get(5).toString();
            mobileno1=dtList.get(6).toString();
            mobileno2=dtList.get(7).toString(); 
            contactperson=dtList.get(8).toString();
            contactperson_no=dtList.get(9).toString();
            description=dtList.get(10).toString();
        }
        else
        {
            if(request.getParameter("err")!=null)
                //out.println("Username already exists");
            name="";
            if(request.getParameter("nm")!=null)
                name=request.getParameter("nm");
            add="";
            if(request.getParameter("address")!=null)
                add=request.getParameter("address");
            System.out.println("Service JSP Address::"+add);
            city="";
            if(request.getParameter("city")!=null)
                city=request.getParameter("city");
            state="";
            if(request.getParameter("state")!=null)
                state=request.getParameter("state");
            country="";
            if(request.getParameter("country")!=null)
                country=request.getParameter("country");
            phnno="";
            if(request.getParameter("phnno")!=null)
                phnno=request.getParameter("phnno");
            mobileno1="";
            if(request.getParameter("mobileno1")!=null)
                mobileno1=request.getParameter("mobileno1");
            mobileno2="";
            if(request.getParameter("mobileno2")!=null)
                mobileno2=request.getParameter("mobileno2");
            contactperson="";
            if(request.getParameter("contactperson")!=null)
                contactperson=request.getParameter("contactperson");
            contactperson_no="";
            if(request.getParameter("contactperson_no")!=null)
                contactperson_no=request.getParameter("contactperson_no");
            description="";
            if(request.getParameter("description")!=null)
                description=request.getParameter("description");
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
                
                 <label id="Label9"  class="lblFormHeader" >Service Provider Registration Form</label> 
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
                            <input id="txtName" name="nm" value="<%=name%>" type="text" class="inputFrm" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                            <label id="Label2"   class="lblForm" >Address:</label> 
                        </td>
                        <td>
                            <textarea id="txtAdress" name="add" cols="20" rows="2" class="inputFrm" required><%=add%></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label3"  class="lblForm" >City</label> 
                        </td>
           
                        <td>
                            <input id="txtCity" name="city" value="<%=city%>" type="text" class="inputFrm"/>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label4"  class="lblForm" >State:</label> 
                        </td>
                        <td align="left" width="50%">
                            <input id="txtState" type="text" value="<%=state%>" name="state" class="inputFrm" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label5"   class="lblForm" >Country</label> 
                        </td>
                        <td>
                           <input id="txtCountry" type="text" value="<%=country%>" name="country" class="inputFrm" />
                        </td>
                    </tr>
                         <tr>
                        <td>
                            <label id="Label6"   class="lblForm" >Phone Number:</label> 
                        </td>
                        <td>
                            <input id="txtPhoneNo" type="text" value="<%=phnno%>" name="phnno" class="inputFrm" />
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label7"   class="lblForm" >Mobile Number1:</label> 
                        </td>
                        <td>
                            <input id="txtMobNo1" name="mobileno1" value="<%=mobileno1%>" type="text" class="inputFrm" />
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label8"   class="lblForm" >Mobile Number2:</label> 
                        </td>
                        <td>
                            <input id="txtMobNo2" name="mobileno2" value="<%=mobileno2%>" type="text" class="inputFrm" />
                        </td>
                        </tr>
                        <tr>
                        <td>
                            <label id="Label9" class="lblForm" >Contact Person:</label> 
                        </td>
                        <td>
                            <input id="txtContPerson" type="text" value="<%=contactperson%>" name="contactperson" class="inputFrm" />
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label10" class="lblForm" >Contact Person Number:</label> 
                        </td>
                        <td>
                            <input id="txtContPersonNo" type="text" value="<%=contactperson_no%>" name="contactperson_no" class="inputFrm" />
                        </td>
                        </tr>
                         <tr>
                        <td>
                            
                            <label id="Label11"   class="lblForm" >Description:</label> 
                        </td>
                        <td>
                            <textarea id="txtDescription" name="description" cols="20" rows="2" class="inputFrm"><%=description%></textarea>
                        </td>
                        </tr>
                    <tr>
                        <td>
                             &nbsp;
                        </td>
                        <td >
                            <input type="hidden" name="hdn" value="<%=edit%>"/>
                            <% if(edit!=null && edit.equalsIgnoreCase("edit"))
                            {%>
                              <td align="center">
                                 <input align="center" type="submit" name="Update" value="Update" class="submitFrm"/><br>
                              </td> 
                            <%
                              }
                             else
                             {%>
                             <td align="center">
                                 <input align="center" type="submit" id="btnSave" value="Sign Up" class="submitFrm" />
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
