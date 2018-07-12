/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//package report;

import java.awt.Container;
import static java.awt.Frame.MAXIMIZED_BOTH;
import java.sql.Connection;
import java.util.HashMap;
import javax.swing.JFrame;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JRViewer;
//import util.Database;
import java.io.*;
import static javax.swing.WindowConstants.DISPOSE_ON_CLOSE;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
public class Report extends JFrame {

    HashMap hm = null;
    Connection con = null;
    String reportName;

    public Report() {
        setExtendedState(MAXIMIZED_BOTH);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);

    }

    public Report(HashMap map) {
        this.hm = map;
        setExtendedState(MAXIMIZED_BOTH);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);

    }

    public Report(HashMap map, Connection con) {
        this.hm = map;
        this.con = con;
        setExtendedState(MAXIMIZED_BOTH);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setTitle("Report Viewer");

    }

    public void setReportName(String rptName) {
        this.reportName = rptName;
    }

    public void callReport() {
        JasperPrint jasperPrint = generateReport();
        JRViewer viewer = new JRViewer(jasperPrint);
        Container c = getContentPane();
        c.add(viewer);
        this.setVisible(true);
    }

    public void callConnectionLessReport() {
        JasperPrint jasperPrint = generateEmptyDataSourceReport();
        JRViewer viewer = new JRViewer(jasperPrint);
        Container c = getContentPane();
        c.add(viewer);
        this.setVisible(true);
    }

    public void closeReport() {
        //jasperViewer.setVisible(false);
    }

    /** this method will call the report from data source*/
    public JasperPrint generateReport() {
        try {
            if (con == null) {
                try {
                    con = functions.logic.getConnection();

                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            JasperPrint jasperPrint = null;
            if (hm == null) {
                hm = new HashMap();
            }
            try {
                /**You can also test this line if you want to display
                 * report from any absolute path other than the project root path*/
                System.out.println("hm: "+hm);
                jasperPrint = JasperFillManager.fillReport("D:/Project Reports/VendorReport.jasper",hm, con);
               // jasperPrint = JasperFillManager.fillReport(reportName + ".jasper", hm, con);
            } catch (JRException e) {
                e.printStackTrace();
            }
            return jasperPrint;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }


    }

    /** call this method when your report has an empty data source*/
    public JasperPrint generateEmptyDataSourceReport() {
        try {
            JasperPrint jasperPrint = null;
            if (hm == null) {
                hm = new HashMap();
            }
            try {
                jasperPrint = JasperFillManager.fillReport(reportName + ".jasper", hm, new JREmptyDataSource());
            } catch (JRException e) {
                e.printStackTrace();
            }
            return jasperPrint;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }

    }
    public void fl() {
        FileOutputStream fos = null;
        File tempFile = null;
        try {
            String downloadFileName = System.currentTimeMillis() + "_filename.pdf";
            String contentType = "application/pdf";

            tempFile = File.createTempFile("tmp", ".pdf");
            fos = new FileOutputStream(tempFile);

            String jrxml = "D:\\ProjectReports\\selectedData.jrxml";
           // String jrxmlPath = getClass().getClassLoader().getResource(".").getPath() + jrxml;
            System.out.println("11111");
            String jasperCompile= JasperCompileManager.compileReportToFile(jrxml);
            System.out.println("222");
            System.out.println("Hm in page: "+hm);
            HashMap hm1=new HashMap();
            hm1.put("nm","Ratnik Gandhi");
            JasperPrint print = JasperFillManager.fillReport(jasperCompile, hm1, new JREmptyDataSource());
            System.out.println("333");
            JasperExportManager.exportReportToPdfStream(print, fos);
            System.out.println("444");
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        catch (JRException e) {
            e.printStackTrace();
        }
        finally {
            if (fos != null) {
                try {
                    fos.flush();
                    fos.close();
                }
                catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
             /*   try {
            TemporaryFileDownloadResource resource = new TemporaryFileDownloadResource(getApplication(), downloadFileName, contentType, tempFile);
            getWindow().open(resource, "_self");
        }
        catch (FileNotFoundException e) {
            logger.error(e.getMessage(), e);
        }*/
    }
}
