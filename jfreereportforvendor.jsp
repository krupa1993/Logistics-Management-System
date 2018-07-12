<%--
    Document   : myJsp
    Created on : Jul 18, 2013, 6:44:32 PM
    Author     : logicplus
--%>


<%@page import="java.awt.geom.Rectangle2D"%>
<%@page import="com.itextpdf.awt.DefaultFontMapper"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="com.itextpdf.text.pdf.PdfTemplate"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="functions.logic"%>

<%@page import="org.jfree.chart.JFreeChart" %>
<%@page import="org.jfree.chart.ChartUtilities" %>
<%@page import="org.jfree.chart.ChartFactory" %>
<%@page import="org.jfree.data.general.DefaultPieDataset" %>



<%
 try
 {           
     String uname="default";
     if(session.getAttribute("usernm")!=null)
     {
         uname=session.getAttribute("usernm").toString().trim();
     }
     DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
        DefaultPieDataset dataSet1 = new DefaultPieDataset();
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        con=logic.getConnection();
        st=con.createStatement();
        String title="";
        String x="";
        String y="";
        String q=""; 
       // operation="1";
        
            title=uname+" Work Order status Chart";
            x="Date ";
            y="Weight (In kg)";
           q="SELECT STATUS , count(STATUS ) FROM workorder where vendorname='"+uname+"' GROUP BY STATUS ";
       
        rs=st.executeQuery(q);
        int w;
        String a;
        while(rs.next())
        {
            w = Integer.parseInt(rs.getString(2));
            a = rs.getString(1);
            dataSet1.setValue(a+" ["+w+"]",w);
              }
        JFreeChart chart=null;        
       
              out.println("in diet chart section");
         chart=ChartFactory.createPieChart(
                title, 
                dataSet1, true, true, true);
       
        System.out.println("111111");
        File f=new File("E:/");
        System.out.println("333");
        File image = File.createTempFile("image", "tmp",f);
     //JFreeChart chart1=ChartFactory.createBarChart("try", "cus", "mea", dataSet, true, true, true, true);
 // Assume that we have the chart
 System.out.println("4444");
        ChartUtilities.saveChartAsPNG(image,chart, 900, 300);
 FileInputStream fileInStream = new FileInputStream(image);
 System.out.println("55555");
 OutputStream outStream = response.getOutputStream();
 long fileLength;
 byte[] byteStream;
 fileLength = image.length();
 byteStream = new byte[(int)fileLength];
 fileInStream.read(byteStream, 0, (int)fileLength);
 response.setContentType("image/png");
 response.setContentLength((int)fileLength);
 response.setHeader("Cache-Control","no-store,no-cache, must-revalidate, post-check=0, pre-check=0");
 response.setHeader("Pragma", "no-cache");
 fileInStream.close();
 outStream.write(byteStream);
 outStream.flush();
 outStream.close();
 PdfWriter writer = null;
 int width=200;
 int height=500;
 Document document = new Document();
 String fileName="C://barchart.pdf";
 document.open();
 PdfContentByte contentByte = writer.getDirectContent();
PdfTemplate template = contentByte.createTemplate(width, height);
Graphics2D graphics2d = template.createGraphics(width, height,new DefaultFontMapper());
Rectangle2D rectangle2d = new Rectangle2D.Double(0, 0, width,height);
chart.draw(graphics2d, rectangle2d);
graphics2d.dispose();
contentByte.addTemplate(template, 0, 0);
 }
 catch (Exception e)
 {
 System.err.println("Problem occurred creating chart."+e);
 }

%>