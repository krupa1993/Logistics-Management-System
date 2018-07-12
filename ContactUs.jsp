<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>ContactUs</title>
     <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <link href="MenuStyle.css" rel="stylesheet" type="text/css" />
    <script src="MenuJScript.js" type="text/javascript"></script>
    <script src="js/data.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">

        var map;
        function initialize() {
            var latlng = new google.maps.LatLng(23.033413, 72.52479);
            var myOptions = {
                zoom: 16,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById("map"), myOptions);
            var marker = new google.maps.Marker
                                                    (
                                                        {
                                                            position: new google.maps.LatLng(23.033413, 72.52479),
                                                            map: map,
                                                            title: 'Click me'

                                                        }
                                                    );

            var infowindow = new google.maps.InfoWindow({
                content: 'MAGIC HORSE TECHNOLOGIES:<br/>215, Sunrise Mall, Near Swaminarayan Temple,<br/>Mansi Circle, Vastrapur,<br />Ahmedabad ? 380015, GUJARAT-INDIA<br />CALL: 9909912765, 7878512765'
            });
            google.maps.event.addListener(marker, 'click', function () {
                // Calling the open method of the infoWindow 
                infowindow.open(map, marker);
            });
            infowindow.open(map, marker);
        }
        
    </script>
    <script type="text/javascript">

        var map1;
        function initialize1() {
            var latlng = new google.maps.LatLng(23.022483, 72.566430);
            var myOptions = {
                zoom: 16,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map1 = new google.maps.Map(document.getElementById("map1"), myOptions);
            var marker = new google.maps.Marker
                                                    (
                                                        {
                                                            position: new google.maps.LatLng(23.022483, 72.566430),
                                                            map: map1,
                                                            title: 'Click me'

                                                        }
                                                    );

            var infowindow = new google.maps.InfoWindow({
                content: 'GUJARAT ARTS AND SCIENCE COLLEGE:<br/>Opposite to Kanak Hotel,<br />Ellise Bridge,<br/> Ahmedabad - 380006, GUJARAT-INDIA<br />CALL: 26446939'
            });
            google.maps.event.addListener(marker, 'click', function () {
                // Calling the open method of the infoWindow 
                infowindow.open(map1, marker);
            });
            infowindow.open(map1, marker);
        }
      
    </script>
    <script type="text/javascript">
        function loadmaps() {
            initialize();
            initialize1();
        }
        window.onload = loadmaps;
    </script>
</head>
    <body>
        <form name="ContactUsForm">
<div id="header">
		
     <div class="area">
         <table cellpadding="0" cellspacing="0" width="100%">
             <tr>
                 <td align="left" valign="middle">
                     <div id="logo">
                         <a href="index.jsp"></a>
                             <%--<img src="images/Logo2.png" alt="LOGO" height="100" width="250" /></a>--%>
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
	<%--<<div class="contents">
		<div class="adbox">
			<div class="area">
				ul>
					<li>
						<div>
							<h2><span>LAND</span> TRANSPORT</h2>
							<p>
								Dedicated to safe and reliable transport, Provides a comprehensive distribution and delivery network.</a>
							</p>
						</div>
					</li>
					<li>
						<div>
							<h2><span>OCEAN</span> TRANSPORT</h2>
							<p>
								We specialize in Ocean transport with world class customer service and the most competitive rates.
							</p>
						</div>
					</li>
					<li>
						<div>
							<h2><span>AIR</span> TRANSPORT</h2>
							<p>
								leading provider of air cargo transportation and related services to domestic and foreign air carriers.
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
                <div class="area">
			<div class="main">
				<h2>E-LOGISTIC</h2>
				<p>
					Established in March 1984 and dedicated to safe and reliable transport, E-Logistic provides a comprehensive distribution and delivery network across Australia. With 
		            29 years of experience and a fleet of over 150 vehicles, E-Logistic is committed to a safe and personal service every step of the way.
				</p>
				<div id="features">
					<h2>WHY CHOOSE US</h2>
					<ul>
						<li>
							<img src="images/WhyChooseUs.jpg" alt="Img" height="147" width="410" />
							<p>
							 E-Logistic has a modern, extensive fleet which operates. Our fleet consists of over 150 vehicles including Prime Movers, body trucks, tilt tray and various trailer types. All vehicles and equipment are on a rigorous service and maintenance schedule.
							</p>
							<br />
							<p>
								E-Logistic has specifically designed trailers for the cartage of machinery, trucks and all general freight. These include drop deck trailers fitted with hydraulic ramps and wideners, open trailers with container pins and tautliners with mezzanine floors. E-Logistic prides itself with our safety record and uses all recommended and accredited forms of load restraints.<br />
							</p>
							<br />
							<p>
			E-Logistic sets very high standards of professionalism through a focus on continuous improvement and strives to maintain all equipment with the most up to date procedures.				
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
        <a href="UserRegistration.jsp">Register</a>
         </fieldset>
			</div>
			
			
			    <div style="height:20px;"></div>
				<h2>Recent Blog Post</h2>
				<div class="frame">
					<img src="images/Aim.png" alt="Img" height="216" width="268" />
				</div>
				<h3></h3>
				<p>
					
				</p>
			</div>
		</div>
	</div>--%>
        <div class="area">
        <table style="width: 100%; font-family: 'Times New Roman', Times, serif;">
            &nbsp;
            <tr>
                <td colspan="2">
                    <img src="images/BlueSunset.jpg" width="960px" height="200px" alt="ContactUs"></img>
                </td>
            </tr>   
        <tr>
            <td colspan="2">
                
              
               <h5>Have questions about our products and services?&nbsp; Here?s how to contact us:</h5>
            </td>
        </tr>
        <tr>
            <td>
                <h3>Customer Care:</h3>
                <hr />
            </td>
            <td>
                <h3>Sales:</h3>
                <hr />
            </td>
        </tr>
        <tr>
            <td valign="top">
                
                 <h4>Address:</h4>
                 <p>MAGIC HORSE TECHNOLOGIES:<br/>
                        215, Sunrise Mall, Near Swaminarayan Temple,
                        Mansi Circle, Vastrapur,<br />
                        Ahmedabad - 380015, GUJARAT-INDIA<br />
                       CALL: 9909912765, 7878512765<br />
                9 a.m.-8 p.m. Monday-Thursday, GMT<br />
                9 a.m.-6 p.m. Friday, GMT<br />
                  
                Fax:(022) 2656 5500</p>
            </td> 
             <td valign="top">
                 <h4>Address:</h4>
                 <p>GUJARAT ARTS AND SCIENCE COLLEGE:<br/>
                    Opposite to Kanak Hotel,
                    Ellise Bridge,<br/>
                    Ahmedabad - 380006, GUJARAT-INDIA<br />
                    CALL: 26446939<br />
                10.30 a.m.-5.30 p.m. Monday-Friday, GMT<br />
                10.30 a.m.-4.30 p.m. Saturday, GMT<br />
                  
                Fax:(022) 2656 5500</p>
            </td>
        </tr>
           
        <tr>
            <td valign="top">
                <div id="map" style="width: 450px; height: 250px">
</div></td>
            <td valign="top">
                <div id="map1" style="width: 450px; height: 250px">
</div></td>
        </tr>
       <tr><td>&nbsp;</td></tr>
        
    </table>
            </div>
	<div id="footer">
		<span class="divider"></span>
		<div class="area">
			<div id="connect">
				<a href="#" target="_blank" class="googleplus"></a> 
				<a href="#" target="_blank" class="facebook"></a> 
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
