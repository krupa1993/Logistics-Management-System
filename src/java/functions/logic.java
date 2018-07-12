package functions;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author admin
 */
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Properties;
import java.io.*;
import javax.mail.Message;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.ArrayList;
import java.util.Iterator;

public class logic 
{
   
   public static Connection getConnection()
    {
       String url=null;
       Connection con=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            url="jdbc:mysql://localhost:3306/SwiftLogictics";
            con =DriverManager.getConnection(url,"root", "");
             
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
   
    /*public void print()
    {
        PrinterJob job = PrinterJob.getPrinterJob();
        job.setPrintable(this);
        //vypis(job.defaultPage());
        boolean ok = job.printDialog();
        if (ok) 
        {
            try
            {
                vypis(job.defaultPage());
                job.print();
                vypis(job.defaultPage());
            } 
            catch (PrinterException ex) 
            {
                System.out.println(ex);
            /* The job did not successfully complete 
            }
        }
    }*/

   public static String checkNull(HttpServletRequest req,String str)
    {
        if(req.getParameter(str)!=null)
            return req.getParameter(str);
        return "";
            
    }
    
    
   public static void closeConnection(Connection con)
    {
        try
        {
            con.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
   // for email
        public static void mymail(String email,String uname,String type)
        {
           
                System.out.println("In mymail fun");
		String host = "smtp.gmail.com";
                String from = "krr122814@gmail.com";
                String pass = "Krupa0203!";
                Properties props = System.getProperties();
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.timeout" , "3000");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.socketFactory.port", "587");
                props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
                props.put("javax.net.debug","ssl,session");
                props.put("mail.smtp.dsn.notify","SUCCESS ORCPT=rfc822;");
                props.put("mail.smtp.dsn.ret", "FULL");
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.user", from);
                props.put("mail.smtp.password", pass);
                
                
                try
                {
                    System.out.println("Email mymail:"+email);
                   // email="prachi_ajmera@ymail.com";
                    String[] to = {email}; // added this line

                    Session session = Session.getDefaultInstance(props, null);
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(from));

                    InternetAddress[] toAddress = new InternetAddress[to.length];

                    // To get the array of addresses
                    for( int i=0; i < to.length; i++ )
                    { // changed from a while loop
                        toAddress[i] = new InternetAddress(to[i]);
                    }
            //        System.out.println(Message.RecipientType.TO);

                    for( int i=0; i < toAddress.length; i++) 
                    { // changed from a while loop
                        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
                    }
                    
                    message.setSubject("E-logistics.com : Password Reset Request");
                    message.setContent(" To reset your password, click on the link below."
                            +"<br>"
                            +"<a href=\"http://localhost:8080/Swift_Logistics/ForgotPwd.jsp?mail=1&uname="+uname+"&type="+type+"\">Click here</a>"
                            +"<br>"
                            +"If you did not request to change your password, ignore this email and no changes will be made to your account."
                            +"<br>"
                            +"Best regards,"
                            +"<br>"
                            +"E-logistics Team","text/html");

                    Transport transport = session.getTransport("smtp");
                    transport.connect(host, from, pass);
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();


                }
                catch(Exception e)
                {
                    System.out.print(e);
                }
        }
        
        public static void mymail1(String email,String usernm,String password)
        {
           
                System.out.println("In mymail fun");
		String host = "smtp.gmail.com";
                String from = "rkrupa41@gmail.com";
                String pass = "Birva226";
                Properties props = System.getProperties();
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.timeout" , "3000");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.socketFactory.port", "587");
                props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
                props.put("javax.net.debug","ssl,session");
                props.put("mail.smtp.dsn.notify","SUCCESS ORCPT=rfc822;");
                props.put("mail.smtp.dsn.ret", "FULL");
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.user", from);
                props.put("mail.smtp.password", pass);
                
                
                try
                {
                    System.out.println("Email mymail:"+email);
                    System.out.println("unm mymail:"+usernm);
                    System.out.println("pwd mymail:"+password);
                   // email="prachi_ajmera@ymail.com";
                    String[] to = {email}; // added this line

                    Session session = Session.getDefaultInstance(props, null);
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(from));

                    InternetAddress[] toAddress = new InternetAddress[to.length];

                    // To get the array of addresses
                    for( int i=0; i < to.length; i++ )
                    { // changed from a while loop
                        toAddress[i] = new InternetAddress(to[i]);
                    }
            //        System.out.println(Message.RecipientType.TO);

                    for( int i=0; i < toAddress.length; i++) 
                    { // changed from a while loop
                        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
                    }
                    
                    message.setSubject("E-logistics.com : See your username and password.");
                    message.setContent("Your Username is:"+usernm
                            +"<br>"
                            +"Your Password is:"+password
                            +"<br>"
                            +"You can use our site by entering this username and password in the fields of login form and by choosing your appropriate type!."
                            +"<br>"
                            +"Welocme to Swift Logistics! Regards!"
                            +"<br>"
                            +"E-logistics Team","text/html");

                    Transport transport = session.getTransport("smtp");
                    transport.connect(host, from, pass);
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();


                }
                catch(Exception e)
                {
                    System.out.print(e);
                }
        }
         
     public static void mymail(String email[],int no)
        {
           
                System.out.println("In mymail fun");
		String host = "smtp.gmail.com";
                String from = "rkrupa41@gmail.com";
                String pass = "Birva226";
                Properties props = System.getProperties();
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.timeout" , "3000");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.socketFactory.port", "587");
                props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
                props.put("javax.net.debug","ssl,session");
                props.put("mail.smtp.dsn.notify","SUCCESS ORCPT=rfc822;");
                props.put("mail.smtp.dsn.ret", "FULL");
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.user", from);
                props.put("mail.smtp.password", pass);
                
                
                try
                {
                    System.out.println("Email mymail:"+email);
                   // email="prachi_ajmera@ymail.com";
                    String[] to = email; // added this line

                    Session session = Session.getDefaultInstance(props, null);
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(from));

                    InternetAddress[] toAddress = new InternetAddress[to.length];

                    // To get the array of addresses
                    for( int i=0; i < to.length; i++ )
                    { // changed from a while loop
                        toAddress[i] = new InternetAddress(to[i]);
                    }
            //        System.out.println(Message.RecipientType.TO);

                    for( int i=0; i < toAddress.length; i++) 
                    { // changed from a while loop
                        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
                    }
                    
                    message.setSubject("E-logistics.com : Work Order Status Number");
                    message.setContent(" To check your status."
                            +"<br>"
                            +"Work Order Status Number="+no
                            +"<br>"
                            +"Enter this number to check your status."
                            +"<br>"
                            +"Best regards,"
                            +"<br>"
                            +"E-logistics Team","text/html");

                    Transport transport = session.getTransport("smtp");
                    transport.connect(host, from, pass);
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();


                }
                catch(Exception e)
                {
                    System.out.print(e);
                }
        }
       
} 




