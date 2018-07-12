<%-- 
    Document   : Home
    Created on : Mar 26, 2015, 10:27:39 PM
    Author     : ronakrana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>e-Logistic</title>
        <link rel="stylesheet" href="css/styles.css" type="text/css" />
        <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
        <script src="MenuJScript.js" type="text/javascript"></script>
        <script src="js/data.js" type="text/javascript"></script>
         <link href="themes/6/js-image-slider.css" rel="stylesheet" type="text/css" />
        <script src="themes/6/mcVideoPlugin.js" type="text/javascript"></script>
        <script src="themes/6/js-image-slider.js" type="text/javascript"></script>
        <script src="themes/6/js-image-slider1.js" type="text/javascript"></script>
        <link href="generic.css" rel="stylesheet" type="text/css" />
</head>
<body onload="getType();">
        <form name="home_form" method="get" action="Login">
<div id="header">
		
     <div class="area">
         <table cellpadding="0" cellspacing="0" width="100%">
             <tr>
                 <td align="left" valign="middle">
                     <div id="logo">
                         <img src="images/Logo2.png" alt="LOGO" height="100" width="250" />
                     </div>
                 </td>
                 <td align="right">
                     <table cellpadding="0" cellspacing="0">
                       <tr>
                          <td style="height:110px" >
                          
                          </td>
                       </tr>
                       <tr>
                          <td>
                           <div id="sse2">
                         <div id="sses2">
                             <ul>
                                 <li><a href="Home.jsp">Home</a></li>
                                 <li><a href="AboutUs.jsp">AboutUs</a></li>
                                 <li><a href="ContactUs.jsp">Contact</a></li>
                             </ul>
                         </div>
                     </div>
                          </td>
                       </tr>
                     </table>
                    
                 </td>
             </tr>
         </table>
     </div>
	</div>
	<div class="contents">
		<div class="adbox">
			<div class="area">
				<ul>
					<li>
						<div>
						<h2><span>LAND</span> TRANSPORT</h2>
                                                <p>
                                                    Dedicated to safe and reliable transport, "SWIFT E-LOGISTICS" provides a comprehensive distribution and delivery network.</a>
						</p>
						</div>
					</li>
					<li>
						<div>
							<h2><span>OCEAN</span> TRANSPORT</h2>
							<p>
								We are still working on this facility of Ocean transport with world class customer service and the most competitive rates.
							</p>
						</div>
					</li>
					<li>
						<div>
							<h2><span>AIR</span> TRANSPORT</h2>
							<p>
								We are still working on this facility of air cargo transportation and related services to domestic and foreign air carriers.
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="area">
			<div class="main">
				<h2>SWIFT E-LOGISTIC</h2>
				<p>
					Established in March 1984 and dedicated to safe and reliable transport, "SWIFT E-LOGISTIC" provides a comprehensive distribution and delivery network across India. With 
		            30 years of experience and a fleet of over 150 vehicles, "SWIFT E-LOGISTIC" is committed to a safe and personal service every step of the way.
				</p>
				<div id="features">
					<h2>WHY CHOOSE US</h2>
					<ul>
						<li>
							<img src="images/WhyChooseUs.jpg" alt="Img" height="147" width="410" />
							<p>
							 "SWIFT E-LOGISTIC" has a modern, extensive fleet which operates. Our fleet consists of over 150 vehicles including Prime Movers, body trucks, tilt tray and various trailer types. All vehicles and equipment are on a rigorous service and maintenance schedule.
							</p>
							<br />
							<p>
								"SWIFT E-LOGISTIC" has specifically designed trailers for the cartage of machinery, trucks and all general freight. These include drop deck trailers fitted with hydraulic ramps and wideners, open trailers with container pins and tautliners with mezzanine floors. E-Logistic prides itself with our safety record and uses all recommended and accredited forms of load restraints.<br />
							</p>
							<br />
							<p>
			"SWIFT E-LOGISTIC" sets very high standards of professionalism through a focus on continuous improvement and strives to maintain all equipment with the most up to date procedures.				
							</p>
						</li>
						
					</ul>
				</div>
			</div>
			<div class="blog">
			<h2>Log In</h2>
			
			   <div id="login">
    <%! String name="";%>
    <%
       
    if(request.getParameter("err")!=null)
    {
        String error=request.getParameter("err");
        out.println("Either user name or password incorrect! Please try again");
    } %>
   
			     
    <fieldset id="inputs">
        <input id="username" name="uname" type="text" placeholder="Username" autofocus required/>   
        <input id="password" name="pwd" type="password" placeholder="Password" required/>
        <select id="type" name="type" >
            <option>---Select---</option>
        </select>
    </fieldset>
    <fieldset id="actions">
        
        <input type="submit"    id="submit" value="Log in" />
    </fieldset>
    <fieldset id="Mylink">
        <a href="ForgotPwd.jsp">Forgot your password?</a>
    </fieldset>
			</div>
			<div style="height:20px;"></div>
                        <div class="frame">
					 <div id="sliderFrame1">
        <div id="slider1">
            <a href="#">
                <img src="Slider/Small Slider/images.jpg" width="268px" height="216px" alt="Welcome to Swift Logistics" />
            </a>
            <a href="#">
                <img src="Slider/Small Slider/images1.jpg" width="268px" height="216px" alt="Welcome to Swift Logistics" />
            </a>
            <a href="#">
                <img src="Slider/Small Slider/images2.jpg" width="268px" height="216px" alt="Welcome to Swift Logistics" />
            </a>
            <a href="#">
                <img src="Slider/Small Slider/images3.jpg" width="268px" height="216px" alt="Welcome to Swift Logistics" />
            </a>
            <a href="#">
                <img src="Slider/Small Slider/images4.jpg" width="268px" height="216px" alt="Welcome to Swift Logistics" />
            </a>
            <a href="#">
                <img src="Slider/Small Slider/images5.jpg" width="268px" height="216px" alt="Welcome to Swift Logistics" />
</a>
        </div>
    </div> 
				</div>
				<h3></h3>
				<p>
					
				</p>
			</div>
		</div>
	</div>
	<div id="footer">
		<span class="divider"></span>
		<div class="area">
			<div id="connect">
				<a href="https://plus.google.com/110614548614365786248/posts?hl=en-GB" target="_blank" class="googleplus"></a> 
				<a href="https://www.facebook.com/pages/Swift-Logistics/226914250850818?ref=hl" target="_blank" class="facebook"></a> 
				<a href="#" target="_blank" class="twitter"></a>
			</div>
			<p>
				© 2014 Swift E-Logistics. All Rights Reserved.
			</p>
		</div>
	</div>
        </form>
</body>
</html>
