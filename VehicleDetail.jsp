<%-- 
    Document   : VehicleDetail
    Created on : Apr 10, 2015, 12:33:06 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>VehicleDetail</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
</head>
<body onload="getServiceProviderName()">
    <form name="VehicleDetailForm" method="get" action="VehicleDetailServlet">
    <%
        String vehicletype="";
        String Wheeler3="";
        String Wheeler4="";
        String Wheeler6="";
        String Wheeler8="";
        String Wheeler12="";
        String vehicleregi_no="";
        String permitno="";
        String permitstate="";
        String serviceproviderid="";
        String serviceprovidername="";
        String capacity="";
        String edit="";
        
        ArrayList dtList=new ArrayList();
        if(request.getAttribute("data")!=null)
        {
           //hidden field var update
            edit="edit";
            dtList=(ArrayList)request.getAttribute("data");
            System.out.println("ArrayList "+dtList);
            vehicletype="";
            if(dtList.get(0)!=null)
            vehicletype=dtList.get(0).toString();
            if(vehicletype.equalsIgnoreCase("3-Wheeler"))
                Wheeler3="selected";
            else if(vehicletype.equalsIgnoreCase("4-Wheeler"))
                Wheeler4="selected";
            else if(vehicletype.equalsIgnoreCase("6-Wheeler"))
                Wheeler6="selected";
            else if(vehicletype.equalsIgnoreCase("8-Wheeler"))
                Wheeler8="selected";
            else if(vehicletype.equalsIgnoreCase("12-Wheeler"))
                Wheeler12="selected";
            else
            {
                System.out.println("No data");
            }
            vehicleregi_no=dtList.get(1).toString();
            permitno=dtList.get(2).toString();
            permitstate=dtList.get(3).toString();
            serviceproviderid=dtList.get(4).toString();
            //serviceprovidername="";
            serviceprovidername=dtList.get(5).toString();
           
           /* if(serviceprovidername.equalsIgnoreCase(""))
                Wheeler3="selected";
            else if(vehicletype.equalsIgnoreCase("serviceprovidername"))
                Wheeler4="selected";
            else if(vehicletype.equalsIgnoreCase("6-Wheeler"))
                Wheeler6="selected";
            else if(vehicletype.equalsIgnoreCase("8-Wheeler"))
                Wheeler8="selected";
            else if(vehicletype.equalsIgnoreCase("12-Wheeler"))
                Wheeler12="selected";
            else
            {
                System.out.println("No data");
            }*/
            capacity=dtList.get(6).toString();
         }
        else
        {
            vehicletype="";
            if(logic.checkNull(request,"nm1")!=null && logic.checkNull(request,"nm1").equalsIgnoreCase("on"))
            vehicletype="selected";
            vehicleregi_no="";
            if(logic.checkNull(request,"nm2")!=null)
                vehicleregi_no=logic.checkNull(request,"nm2").trim();
            permitno="";
            if(logic.checkNull(request,"nm3")!=null)
                permitno=logic.checkNull(request,"nm3").trim();
            permitstate="";
            if(logic.checkNull(request,"nm4")!=null)
                permitstate=logic.checkNull(request,"nm4").trim();
            serviceproviderid="";
            if(logic.checkNull(request,"nm5")!=null)
                serviceproviderid=logic.checkNull(request,"nm5").trim();
            serviceprovidername="";
            if(logic.checkNull(request,"ServiceProviderName")!=null)
                serviceprovidername=logic.checkNull(request,"ServiceProviderName").trim();
            capacity="";
            if(logic.checkNull(request,"nm6")!=null)
                capacity=logic.checkNull(request,"nm6").trim();
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
                
                 <label id="Label9"  class="lblFormHeader" >Vehicle Detail Form</label> 
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
                            <label id="Label1"  class="lblForm" >Vehicle Type:</label> 
                        </td>
                        <td>
                            <select id="txtVehicalType" name="nm1" value="" class="inputFrm">
                                <option value="3-Wheeler" <%=Wheeler3%>>3-Wheeler</option>
                                <option value="4-Wheeler" <%=Wheeler4%>>4-Wheeler</option>
                                <option value="6-Wheeler" <%=Wheeler6%>>6-Wheeler</option>
                                <option value="8-Wheeler" <%=Wheeler8%>>8-Wheeler</option>
                                <option value="12-Wheeler" <%=Wheeler12%>>12-Wheeler</option>
                            </select>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            
                            <label id="Label2"   class="lblForm" >Vehicle Registration No:</label> 
                        </td>
                        <td>
                            
                            <input id="txtVehicleRegistrationNo" name="nm2" type="text" value="<%=vehicleregi_no%>" class="inputFrm" required/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label3"  class="lblForm" >Permit No:</label> 
                        </td>
           
                        <td>
                            <input id="txtPermitNo" name="nm3" type="text" value="<%=permitno%>" class="inputFrm" required/>
                           
                        </td>
                     </tr>
                    <tr>
                        <td>
                            <label id="Label4"  class="lblForm" >Permit State:</label> 
                        </td>
                        <td align="left" width="50%">
                            
                            <input id="txtPermitState" name="nm4" type="text" value="<%=permitstate%>" class="inputFrm" required/>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label6"   class="lblForm" >Service Provider Id:</label> 
                        </td>
                        <td>
                            
                            <input id="txtServiceProviderId" name="nm5" type="text" value="<%=serviceproviderid%>" class="inputFrm" required/>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="Label5"  class="lblForm" >Service Provider:</label> 
                        </td>
                        <td>
                            <select id="ServiceProviderName" name="ServiceProviderName" value="<%=serviceprovidername%>" class="inputFrm" required>
                                <option value="">---Select---</option>
                            </select>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            
                            <label id="Label7" class="lblForm" >Capacity (ton):</label> 
                        </td>
                        <td>
                            
                         <input id="txtCapacity" name="nm6" type="text" value="<%=capacity%>" class="inputFrm" required/>  
                            
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
                            <input type="submit" id="btnSave" value="Save" class="submitFrm" />
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
                            <input type="hidden" name="providerHidden" value="<%=serviceprovidername%>"></input>
                             <jsp:include page="footer.jsp"/>
    </form>
</body>
</html>
