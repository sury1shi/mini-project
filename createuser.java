
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class createuser extends HttpServlet
{

    public createuser()
    {
    }

    public void init(ServletConfig servletconfig)
        throws ServletException
    {
        super.init(servletconfig);
        try
        {
            System.out.println("inside init");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:ecare","ecare","ecare");
//Class.forName("oracle.jdbc.driver.OracleDriver");
  //con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:project","ecare","ecare");
  st=con.createStatement();
            st1 = con.createStatement();
            System.out.println("statement is created");

        }
        catch(Exception exception)
        {
            System.out.println("init method" + exception);
        }
    }

    public void service(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws ServletException, IOException
    {
        System.out.println("inside service");
 String uname;
HttpSession httpsession = httpservletrequest.getSession(true);
        PrintWriter printwriter = httpservletresponse.getWriter();
    
        httpservletresponse.setContentType("text/html");

   uname=(String)httpsession.getValue("user");
        String s2 = "";
        try
        {
            System.out.println("inside try");
            rs = st.executeQuery("select u.user_id from  userinfo u,hdcompanyinfo h where  h.company_name=u.companyname and h.user_id='"+uname+"'");
            printwriter.println("<html>");
            printwriter.println("<head>");
            printwriter.println("<style>");
            printwriter.println("a{ Text-Decoration:none;}");
            printwriter.println("</style>");
            printwriter.println("</head>");
            printwriter.println("<body>");
            printwriter.println("<form> ");
            printwriter.println("<TABLE border=0 cellPadding=1 cellSpacing=1 width=75% align=center>");
            printwriter.println("<P>");
            printwriter.println("<TR>");
            printwriter.println("<TD></TD>");
            printwriter.println("<TD></TD>");
            printwriter.println("<TD>");
            printwriter.println("<P align=left style='COLOR: forestgreen'><FONT size=6><STRONG><U>HD Corporate User List</U></STRONG></FONT></P></TD></TR>");
            printwriter.println("<P align=center>&nbsp;</P>");
            printwriter.println("<P align=left>");
            printwriter.println("<TABLE border=0 cellPadding=1 cellSpacing=1 style='HEIGHT: 130px; WIDTH: 431px'");
            printwriter.println("width=75%>");
            printwriter.println("<TR>");
            printwriter.println("<TD><STRONG><h3 align=left>CorporateUserId</STRONG>");
            printwriter.println("<STRONG>&nbsp;Actions</h3></STRONG></TD></TR>");
            System.out.println("after rs");
            String s;
            for(; rs.next(); printwriter.println("<P align=left><a href='./modifyuser?u=" + s + "'>Modify </a><a href='./deleteuser?u=" + s + "'>Delete</a></P></TD></TR> "))
            {
                System.out.println("INSIDE RS");
                s = rs.getString(1);
                System.out.println("code is " + s);
                         
                String s3 = "Modify Delete";
                printwriter.println(" <TR> ");
                printwriter.println(" <TD>" + s + "&nbsp;&nbsp;</TD> ");
              
                printwriter.println(" <TD>  ");
            }

            printwriter.println("<TR>");
            printwriter.println("<TD></TD>");
            printwriter.println("<TD>&nbsp;</TD></TR>");
            printwriter.println("<TD></TD>");
            printwriter.println("<TR><TD><STRONG>Click here to &gt;&gt;</STRONG>");
            printwriter.println("<a href='./eregis2.html'>Add Corporate Users </a></TD></TR>");
            printwriter.println("</P> ");
            printwriter.println("</form>");
            printwriter.println("</body>");
            printwriter.println("</html>");
        }
        catch(Exception exception)
        {
            System.out.println(exception);
        }
    }
Connection con;
    Statement st;
    Statement st1;
    ResultSet rs;
    ResultSet rs1;
}