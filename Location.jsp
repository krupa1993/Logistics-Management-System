<%-- 
    Document   : Location
    Created on : Apr 10, 2015, 12:37:01 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Location</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
</head>
<body>
    
   <form name="LocationForm" method="get" action="LocationServlet">
   <%
        String name="";
        String add="";
        String city="";
        String state="";
        String country="";
        String phnno="";
        String mobileno="";
        String fax="";
        String contactperson="";
        String contactperson_no="";
        String zipcode="";
        String edit="";
       
        ArrayList dtList=new ArrayList();
       // string data1=request.getAttribute("editprofile");
       // System.out.println("DATA::"+data1);
        if(request.getAttribute("data")!=null)
        {
            edit="edit";
            dtList=(ArrayList)request.getAttribute("data");
            System.out.println("ArrayList "+dtList);
            name=dtList.get(0).toString();
            add=dtList.get(2).toString();
            city=dtList.get(3).toString();
            state=dtList.get(4).toString();
            country=dtList.get(5).toString();
            phnno=dtList.get(6).toString();
            mobileno=dtList.get(7).toString();
            fax=dtList.get(8).toString();
            contactperson=dtList.get(9).toString();
            contactperson_no=dtList.get(10).toString();
            zipcode=dtList.get(11).toString();
        }
        else
        {
            if(logic.checkNull(request,"err")!=null)
                System.out.println("Username already exists");
            name="";
            if(logic.checkNull(request,"nm")!=null)
                name=logic.checkNull(request,"nm");
            add="";
            if(logic.checkNull(request,"address")!=null)
                add=logic.checkNull(request,"address");
            city="";
            if(logic.checkNull(request,"city")!=null)
                city=logic.checkNull(request,"city");
            state="";
            if(logic.checkNull(request,"state")!=null)
                state=logic.checkNull(request,"state");
            country="";
            if(logic.checkNull(request,"country")!=null)
                country=logic.checkNull(request,"country");
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
            zipcode="";
            if(logic.checkNull(request,"zipcode")!=null)
                zipcode=logic.checkNull(request,"zipcode");
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
                
                 <label id="Label9"  class="lblFormHeader" >Location Form</label> 
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
                            <input id="txtName" name="nm" type="text" class="inputFrm" value="<%=name%>" required/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label2" class="lblForm" >Address:</label> 
                        </td>
                        <td>
                            
                            <textarea id="txtAdress" name="add" cols="20" rows="2" class="inputFrm" required><%=add%></textarea>
                           
                        </td>
                    </tr>
                            <tr>
                        <td>
                            
                            <label id="Label3" class="lblForm" >City:</label> 
                        </td>
                        <td>
                           <input id="txtCity" type="text" name="city" class="inputFrm" value="<%=city%>" required/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label4"   class="lblForm" >State:</label> 
                        </td>
                        <td>
                            <input id="txtState" type="text" name="state" class="inputFrm" value="<%=state%>" required/>
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label5" class="lblForm" >Country:</label> 
                        </td>
                        <td>
                             <input id="txtCountry" type="text" name="country" class="inputFrm" value="<%=country%>" required/>
                        </td>
                        </tr>
                        <tr>
                        <td>
                            <label id="Label6" class="lblForm" >Phone Number:</label> 
                        </td>
                        <td>
                            <input id="txtPhoneNo" type="text" name="phnno" class="inputFrm" value="<%=phnno%>" required maxlength="13"/>
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label7"   class="lblForm" >Mobile Number:</label> 
                        </td>
                        <td>
                            <input id="txtMobNo" name="mobileno" type="text" class="inputFrm" value="<%=mobileno%>" required maxlength="10"/>
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
                            <input id="txtContPersonNo" type="text" name="contactperson_no" class="inputFrm" value="<%=contactperson_no%>" required maxlength="13"/>
                        </td>
                        </tr>
                         <tr>
                        <td>
                            <label id="Label11"   class="lblForm" >Zipcode:</label> 
                        </td>
                        <td>
                            <input id="txtZipcode" type="text" name="zipcode" class="inputFrm" value="<%=zipcode%>" required/>
                        </td>
                        </tr>
                        <tr>
                            <td> 
                            <input type="hidden" name="hdn" value="<%=edit%>"/>
                            <% if(edit!=null && edit.equalsIgnoreCase("edit"))
                            {%>
                              <td>
                                 <input type="submit" name="Update" value="Update" class="submitFrm"><br>
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
