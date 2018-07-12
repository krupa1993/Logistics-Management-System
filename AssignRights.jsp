<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,javax.servlet.RequestDispatcher,functions.logic"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AssignRights</title>
        <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
    </head>
    <body>
      <%
        String unm=logic.checkNull(request,"username").toString().trim();
        String typ=logic.checkNull(request,"type").toString().trim();
        System.out.println("Username in jsp"+unm);
        System.out.println("Type in jsp"+typ);
    %>
    <form name="AssignRightsForm" method="get" action="SaveAssignRightsServlet">
    <div id="header">
        <jsp:include page="adminMenu.jsp"/>	
    	</div>
	<div id="contentsMaster">
		
		<div class="areaMaster">
			<div class="mainMaster">
				
			 <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                
                 <label id="Label9"  class="lblFormHeader" >Assign Rights</label> 
            </td>
        </tr>
        <tr>
            <td style="height: 15px">
            </td>
        </tr>
        <tr>
            <td valign="top">
              
            <table cellpadding="5px" cellspacing="0" width="100%">
               <%! String mName=null;
                   String menu=null;
                   String menuid=null;
                   int count=0;
               %>
<%
        
        
        ArrayList menuData=new ArrayList();  
        if(request.getAttribute("menuname")!=null)
        {
            menuData=(ArrayList)request.getAttribute("menuname");
            Iterator itr=menuData.iterator();
            String cname="chk";
            String mid="hdn";
            String check=null;
            while(itr.hasNext())
            {
                mName=itr.next().toString();
                //out.println("mName:  "+mName);               
                menu=mName.substring(0,mName.indexOf("$"));
                menuid=mName.substring(mName.indexOf("$")+1,mName.indexOf("#"));
                check=mName.substring(mName.indexOf("#")+1).trim();
                //out.println("check: "+check);
                cname="chk"+count;
                mid="hdn"+count;
                
            %>
            
                <tr>      
            
                        <td>
                            <%
                                if(!check.equalsIgnoreCase("null"))
                                {%>
                                    <input id="chk" type="checkbox" name=<%=cname%> checked class="inputFrm" />   
                                <%}
                                else
                                {%>
                                    <input id="chk" type="checkbox" name=<%=cname%> class="inputFrm" />
                                <%}
                            %>
                            
                        </td>
                        <td>
                            <input id="txt" name="txt" type="text"value="<%=menu%>" class="inputFrm" />
                        </td>
                        <td>
                            <input type="hidden" name=<%=mid%> value="<%=menuid%>"/>
                        </td>
                       
                   </tr>    
                        <%
            count++;
            }
        }
       
%>
 
          
                            
<tr align="center">
    &nbsp;&nbsp;&nbsp;
                            <td>
                                <input type="submit" id="btnSave" value="Submit" class="submitFrm" />
                            </td>
                        </tr>
                </table>
            </td>
        </tr>
    </table>

<input type="submit" value="<%=unm%>" name="hdnuname">
<input type="submit" value="<%=typ%>" name="hdnType">
				
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
