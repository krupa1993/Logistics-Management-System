<%-- 
    Document   : VendorContract
    Created on : Apr 15, 2015, 2:10:07 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VendorContract</title>
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
</head>
<body>
            <%
               String vendorName="";
               ArrayList dtList=new ArrayList();
               if(request.getAttribute("vendorNamedata")!=null)
               {
                   dtList=(ArrayList)request.getAttribute("vendorNamedata");
                   System.out.println("ArrayList "+dtList);
                   //out.println("ArrayList "+dtList);
               }
               
               String dispatchCharge="";
               ArrayList dtList1=new ArrayList();
               if(request.getAttribute("dispatchChargedata")!=null)
               {
                   dtList1=(ArrayList)request.getAttribute("dispatchChargedata");
                   System.out.println("ArrayList "+dtList1);
                   //out.println("ArrayList "+dtList1);
               }
               
               String warehouseCharge="";
               ArrayList dtList2=new ArrayList();
               if(request.getAttribute("warehouseChargedata")!=null)
               {
                   dtList2=(ArrayList)request.getAttribute("warehouseChargedata");
                   System.out.println("ArrayList "+dtList2);
                   //out.println("ArrayList "+dtList2);
               }
               
               String extraCharge="";
               ArrayList dtList3=new ArrayList();
               if(request.getAttribute("extraChargedata")!=null)
               {
                   dtList3=(ArrayList)request.getAttribute("extraChargedata");
                   System.out.println("ArrayList "+dtList3);
                   //out.println("ArrayList "+dtList3);
               }
               int count=0;
             %>
             <form name="VendorContractForm" method="get" action="SaveVendorContractServlet">
    
<div id="header">
    <jsp:include page="adminMenu.jsp"/>	
</div>
        
	<div id="contentsMaster">
		
		<div class="areaMaster">
			<div class="mainMaster">
        <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                
                 <label id="Label9"  class="lblFormHeader" >Vendor Contract:</label> 
            </td>
        </tr>
           &nbsp;
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
           <tr align="center">
               <td>
                   <label name="lbl">Vendor Name:</label>
                    <select name="vendornm" id="vendornm" class="inputFrm">
                    <%
                    for(int i=0;i<dtList.size();i++)
                    {
                        vendorName=dtList.get(i).toString();
                        String s[]=vendorName.split(":");
                    %>
                        <option value="<%=s[0]%>">
                            <%=s[1]%>
                        </option>
                    <%}%>
                        
                    </select>
                </td>
           </tr>
               
        
           <table id="dataTable" cellpadding="5px" cellspacing="0" width="100%" border="1">
               &nbsp;&nbsp;  
            <tr>
                <td align="center" colspan="5">
                        <label name="DispatchCharge" align="center" class="lblFormHeader">Dispatch Charges</label> 
                        <%
                        for(int i=0;i<dtList1.size();i++)
                        {
                            String chkName="chk"+count;
                            String txtName="txt"+count;
                            String hdmId="hdn"+count;
                        %>
                            
                        <tr><td><input type="checkbox" name="<%=chkName%>"/></td>
                                <%     
                                dispatchCharge=dtList1.get(i).toString();
                                //out.println("sds"+itemnm);
                                String s[]=dispatchCharge.split(":");
                                
                                for(int j=0;j<s.length;j++)
                                {%>
                                 <%if(j==0)
                                  {%>
                                  <td> <%=s[j]%></td><td><input type="text" name="<%=txtName%>"/></td>
                                  <%}
                                  else
                                  {
                                       if(j==1)
                                       {%>
                                       <td><%=s[j]%></td>
                                 <%}
                                       if(j==2)
                                       {%>
                                        <input type="hidden" value="<%=s[j]%>" name="<%=hdmId%>"/>
                                 <%}}}%>  
                             
                            </tr>     
                        <% count++;}%>
                    </td>
                    <td align="center" colspan="5">
                        <label name="WarehouseCharge"  class="lblFormHeader">Warehouse Charges</label> 
                        <%
                        for(int i=0;i<dtList2.size();i++)
                        {
                            String chkName="chk"+count;
                            String txtName="txt"+count;
                            String hdmId="hdn"+count;
                        %>
                            
                        <tr><td><input type="checkbox" name="<%=chkName%>"/></td>
                                <%     
                                warehouseCharge=dtList2.get(i).toString();
                                //out.println("sds"+itemnm);
                                String s[]=warehouseCharge.split(":");
                                
                                for(int j=0;j<s.length;j++)
                                {%>
                                 <%if(j==0)
                                  {%>
                                  <td> <%=s[j]%></td><td><input type="text" name="<%=txtName%>"/></td>
                                  <%}
                                  else
                                  {
                                       if(j==1)
                                       {%>
                                       <td><%=s[j]%></td>
                                 <%}
                                       if(j==2)
                                       {%>
                                        <input type="hidden" value="<%=s[j]%>" name="<%=hdmId%>"/>
                                 <%}}}%>  
                             
                            </tr>     
                        <% count++;}%>
                    </td>
                    <td align="center" colspan="5">
                        <label name="ExtraCharge"  class="lblFormHeader">Extra Charges</label> 
                        <%
                        for(int i=0;i<dtList3.size();i++)
                        {
                            String chkName="chk"+count;
                            String txtName="txt"+count;
                            String hdmId="hdn"+count;
                        %>
                            
                        <tr><td><input type="checkbox" name="<%=chkName%>"/></td>
                                <%     
                                extraCharge=dtList3.get(i).toString();
                                //out.println("sds"+itemnm);
                                String s[]=extraCharge.split(":");
                                
                                for(int j=0;j<s.length;j++)
                                {%>
                                 <%if(j==0)
                                  {%>
                                  <td> <%=s[j]%></td><td><input type="text" name="<%=txtName%>"/></td>
                                  <%}
                                  else
                                  {
                                       if(j==1)
                                       {%>
                                       <td><%=s[j]%></td>
                                 <%}
                                       if(j==2)
                                       {%>
                                        <input type="hidden" value="<%=s[j]%>" name="<%=hdmId%>"/>
                                 <%}}}%>  
                             
                            </tr>     
                        <% count++;}%>
                    </td>
                   
            </tr>
           </table>
                    <table  align="center">
                    <tr>
                        <td>
                        <input type="submit" id="btnSave" value="Submit" class="submitFrm"/>
                        </td>
                    </tr>
                    </table>
        </table>
				
			</div>
                        <%--<div class="blog">
        		    <div style="height:20px;"></div>
				<h2>Recent Blog Post</h2>
				<div class="frame">
					<img src="images/Aim.png" alt="Img" height="216" width="268" />
				</div>
				<h3></h3>
				<p>
					
				</p>
                        </div>--%>
		</div>
	</div>
                             <jsp:include page="footer.jsp"/>
    </form>
</body>
</html>
