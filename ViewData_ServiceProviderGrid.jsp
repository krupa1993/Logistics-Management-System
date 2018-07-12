<%-- 
    Document   : ViewData_ServiceProviderGrid
    Created on : Apr 9, 2015, 7:34:22 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>ViewServiceProviderData</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
</head>
<body>
    <form name="ViewServiceProviderData">
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
        
        ArrayList dtList=new ArrayList();
        if(request.getAttribute("data")!=null)
        {
            dtList=(ArrayList)request.getAttribute("data");
            System.out.println("in jsp");
            System.out.println("ArrayList "+dtList);
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
                
                 <label id="Label1"  class="lblFormHeader" >ServiceProvider Profile:</label> 
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
                    <label id="Label1" class="lblForm">Name:</label> 
                </td>
                <td>
                    <label id="Name" class="lblForm"><%=name%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label2" class="lblForm">Address:</label> 
                </td>
                <td>
                    <label id="Address" class="lblForm"><%=add%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label3" class="lblForm">City:</label> 
                </td>
                <td>
                    <label id="City" class="lblForm"><%=city%></label>
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label4" class="lblForm">State:</label> 
                </td>
                <td>
                    <label id="State" class="lblForm"><%=state%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label5" class="lblForm">Country:</label> 
                </td>
                <td>
                    <label id="Country" class="lblForm"><%=country%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label6" class="lblForm">Phone Number:</label> 
                </td>
                <td>
                    <label id="MobileNumber1" class="lblForm"><%=phnno%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label7" class="lblForm">Mobile Number1:</label> 
                </td>
                <td>
                    <label id="MobileNumber2" class="lblForm"><%=mobileno1%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label8" class="lblForm">Mobile Number2:</label> 
                </td>
                <td>
                    <label id="Gender" class="lblForm"><%=mobileno2%></label> 
                </td>
            </tr>
                <tr>
                <td>
                    <label id="Label9" class="lblForm">Contact Person:</label> 
                </td>
                <td>
                    <label id="Gender" class="lblForm"><%=contactperson%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label10" class="lblForm">Contact Person Number:</label> 
                </td>
                <td>
                    <label id="Gender" class="lblForm"><%=contactperson_no%></label> 
                </td>
            </tr>
            <tr>
                <td>
                    <label id="Label11" class="lblForm">Description:</label> 
                </td>
                <td>
                    <label id="Description" class="lblForm"><%=description%></label> 
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

