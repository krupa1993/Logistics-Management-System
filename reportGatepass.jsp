<%-- 
    Document   : reportGatepass
    Created on : Apr 15, 2015, 12:35:51 PM
    Author     : ronakrana
--%>

<%@ page language="java" import="net.sf.jasperreports.engine.*,net.sf.jasperreports.engine.export.*" %>
<%@ page import="java.sql.*,java.io.*" %>
<%
     //String filename = request.getParameter("filename").trim()+".jasper";
     //System.out.println("filename:"+filename);
     String filename = "gatepass.jasper";
     String reporttype = "pdf";//request.getParameter("reporttype");


            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/e-logistics";
            Connection con =DriverManager.getConnection(url,"root", "");
            
            

            /******************Data base connectivity End****/
         //   stmt=con.createStatement();
            out.println("1");

             // rs=stmt.executeQuery("select username,password from student");          System.out.println("Connection Established");
    // String path = application.getRealPath("/");

     JasperPrint jasperPrint = JasperFillManager.fillReport("D:/Project Reports" + "/" + filename, null, con);
     System.out.println("Report Created...");

     OutputStream ouputStream = response.getOutputStream();

     JRExporter exporter = null;

     if( "pdf".equalsIgnoreCase(reporttype) )
     {
          response.setContentType("application/pdf");
          exporter = new JRPdfExporter();
          exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
          exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
     }
     else if( "rtf".equalsIgnoreCase(reporttype) )
     {
          response.setContentType("application/rtf");
          response.setHeader("Content-Disposition", "inline; filename=\"file.rtf\"");

          exporter = new JRRtfExporter();
          exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
          exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
     }
     else if( "html".equalsIgnoreCase(reporttype) )
     {
          exporter = new JRHtmlExporter();
          exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
          exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
     }
     else if( "xls".equalsIgnoreCase(reporttype) )
     {
          response.setContentType("application/xls");
          response.setHeader("Content-Disposition", "inline; filename=\"file.xls\"");

          exporter = new JRXlsExporter();
          exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
          exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
     }
     else if( "csv".equalsIgnoreCase(reporttype) )
     {
          response.setContentType("application/csv");
          response.setHeader("Content-Disposition", "inline; filename=\"file.csv\"");

          exporter = new JRCsvExporter();
          exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
          exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
     }

     try
     {
          exporter.exportReport();
     }
     catch (JRException e)
     {
          throw new ServletException(e);
     }
     finally
     {
          if (ouputStream != null)
          {
               try
               {
                    ouputStream.close();
               }
               catch (IOException ex)
               {
               }
          }
     }
%>