<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>
<script language = "JavaScript">
	
function number()
{
	var n=document.f1.phoneno.value;
	if(isNaN(n))
	{
	alert("Enter only numbers");
	document.f1.phoneno.value="";
	document.f1.phoneno.focus();
	}
}
function zipnum()
{
	var n=document.f1.zipcode.value;
	if(isNaN(n))
	{
	alert("Enter only numbers");
	document.f1.zipcode.value="";
	document.f1.zipcode.focus()
	}
}

function email1()
		{
		var str=document.f1.email.value;
  if (str.indexOf('@')==-1)
	{
			alert("Not Valid E-Mail Address");
                        document.f1.email.focus();
			return false;
			}
		else if (str.indexOf('.')==-1)
			{
			alert("Not Valid E-Mail Address");
                        document.f1.focus();
                        return false;
			}
		else if (str.indexOf('.')==str.length-1)
			{
			alert("Not Valid E-Mail Address");
			document.f1.email.focus();
                         return false;
			}
		else if (str.indexOf('@')==str.indexOf('.')-1 || str.indexOf('.')==str.indexOf('@')-1)
			{
			alert("Not Valid E-Mail Address");
                        document.f1.email.focus();
                              return false;
			}
		else if (str.indexOf('@')==0 || str.indexOf('.')==0)
			{
			alert("Not Valid E-Mail Address");
                        document.f1.email.focus();
                        return false;
			}
		}


 
function chkpass()
{

var st=document.f1.password1.value ;
var len=st.length;

if (len<=5){
   alert("password should not be less than six characters");
   document.f1.password1.value="";
   document.f1.password2.value="";
   f1.password1.focus();
 }
 else if(f1.password1.value != f1.password2.value )
	{
 
	alert("mismatch password reenter");
	document.f1.password1.value="";
	document.f1.password2.value="";
	f1.password1.focus();
 }  
 }  
  
function registration()
{
	 if(f1.address.value=="")
	    {
	    alert("address should  not be left blank");
	    f1.address.focus();
		}
	else if(f1.userid.value=="")
		{
		alert("user_id should not be empty");
		f1.userid.focus();
		}
	else if(f1.hintsolution.value=="")
	     {
	     alert("hintsolution should not be left blank");
	     f1.hintsolution.focus();
	     }
	         else
	{
           	document.f1.action="./employeeconfirmed.html";
		document.f1.submit();
		}
	     
	    
	}     
													 	
</script>
<BODY bgcolor=lightyellow>
<%@ page import="java.sql.*;"%>

<%!Connection con;%>
<%!Statement st;%>
<%!ResultSet rs1;%>
<%!ResultSet rs2;%>
<%!ResultSet rs3;%>
<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:ecare","ecare","ecare");
   st=con.createStatement();

   rs1=st.executeQuery("select * from categoryies");
   

%>

<FORM name=f1 action="./addemployee1">
<P>
<TABLE border=0 align="center" cellPadding=1 cellSpacing=1 id=TABLE2 width="75%" >
  
  <TR>
    <TD>
      <P align=center><FONT size=4>&nbsp;</FONT></P></TD>
    <TD><FONT color=forestgreen><FONT size=3><STRONG><U>ADD EMPLOYEE DETAILS</U> </STRONG></FONT></FONT></TD></TR>
  <TR>
    <TD></TD>
    <TD></TD></TR>
  <TR>
    <TD><STRONG>Level Name</STRONG> </TD>
    <TD>
     <SELECT id=select1 name=levelname style="HEIGHT: 22px; WIDTH: 152px"> 
        <OPTION selected value=Level1>Level 1</OPTION>
	<OPTION value=Level2>Level2</OPTION>
	<OPTION value=Level3>Level3</OPTION>
	<OPTION value=SupportTeam>Support Team</OPTION>
     </SELECT>
    </TD></TR>
  <TR>
    <TD><STRONG>Category Id</STRONG> </TD>
      <TD> 
        <select name="categoryid" id="categoryid">
		<%
		try{
		while(rs1.next())
		{
		System.out.println("rs1.getString"+rs1.getString(1));		
		out.println("rs1.getString"+rs1.getString(1));		
		%>
		<option value="<%=rs1.getString("categoryid")%>"><%out.println(rs1.getString("categoryid"));%></option>
		<%
		}
		rs1.close();
		%>
        </select></TD></TR>
  <TR>
    <TD><STRONG>Module Id</STRONG>  </TD>
      <TD> 
        <select name="moduleid" id="moduleid">
		<%
		rs2=st.executeQuery("select moduleid from module");
		while(rs2.next())
		{
System.out.println("rs2.getString"+rs2.getString(1));		
		%>
		<option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
		<%
		}
		rs2.close();
		%>

        </select></TD></TR>
  <TR>
    <TD><STRONG>SupportId</STRONG></TD>
      <TD> 
        <select name="supportid" id="supportid">
		<%
      rs3=st.executeQuery("select supportid from supportteam");
		while(rs3.next())
		{
		System.out.println("rs3.getString"+rs3.getString(1));		
		%>
		<option value="<%=rs3.getString(1)%>"><%=rs3.getString(1)%></option>
		<%
		}
		rs3.close();
		st.close();
		con.close();
		}catch(Exception e){e.printStackTrace();}
		%>

        </select></TD></TR>
  <TR>
    <TD><STRONG>UserId</STRONG> </TD>
    <TD>
      <P align=left><INPUT id=userid name=userid></P></TD></TR>
  <TR>
    <TD>
      <P align=left><STRONG><FONT size=3>Employee name</FONT></STRONG></P></TD>
    <TD>
      <P align=left><INPUT id=employeename name=employeename></P></TD></TR>
  <TR>
    <TD>
      <P align=left><STRONG>Address</STRONG></P></TD>
    <TD>
      <P align=left><INPUT id=address name=address></P></TD></TR>
  <TR>
    <TD><STRONG>City</STRONG></TD>
    <TD><INPUT id=city name=city></TD></TR>
  <TR>
    <TD><STRONG>State</STRONG></TD>
    <TD><INPUT id=text4 name=state></TD></TR>
  <TR>
    <TD><STRONG>Country</STRONG></TD>
    <TD>
      <P align=left><INPUT id=text5 name=country></P></TD></TR>
  <TR>
    <TD>
      <P align=left><STRONG>Zipcode</STRONG></P></TD>
    <TD>
      <P align=left><INPUT id=text6 name=zipcode onblur="zipnum()"></P></TD></TR>
  <TR>
    <TD><STRONG>Phoneno </STRONG>
      
    <TD>
      <P align=left><INPUT id=text7 name=phoneno onblur="number()"></P></TD></TR>
  <TR>
    <TD>
      <P align=left><STRONG>Email </STRONG></P></TD>
    <TD>
      <P align=left><INPUT id=text8 name=email onblur="email1()"></P></TD></TR>
     <TR>
    <TD>
      <P align=left><STRONG>Password</STRONG></P></TD>
    <TD>
      <P align=left><INPUT id=password1 name=password1 
      type=password ></P></TD></TR>
  <TR>
    <TD>
      <P align=left><STRONG>Confirmation Pwd</STRONG> </P> 
         <TD>
      <P align=left><INPUT id=password2 name=password2 
      type=password onblur="chkpass()"> </P></TD></TR>
  <TR>
    <TD>
      <P align=left><STRONG>Hint Question</STRONG> </P></TD>
    <TD>
      <P align=left><SELECT id=hintquestion 
      name=hintquestion style="HEIGHT: 22px; WIDTH: 156px"> <OPTION selected 
        value="your name?">your name?</OPTION><OPTION 
        value="your favourite color?">your favourite color?</OPTION><OPTION 
        value="your favourite sport">your favourite sport</OPTION><OPTION 
        value="your favourite place">your favourite place</OPTION><OPTION 
        value="your favourite actor">your favourite actor</OPTION><OPTION 
        value="your favourite food">your favourite food</OPTION><OPTION 
        value="your date of birth">your date of birth</OPTION><OPTION 
        value="your place of birth">your place of birth</OPTION><OPTION 
        value="your best friend">your best friend</OPTION><OPTION 
        value=""></OPTION></SELECT></P></TD></TR>
  <TR>
    <TD>
      <P align=left><STRONG>Hint Solution</STRONG> </P> </TD>
    <TD><INPUT id=text11 name=hintsolution></TD></TR>
  <TR>
    <TD></TD>
    <TD></TD></TR>
  <TR>
    <TD></TD>
    <TD><INPUT id=submit1 name=submit1 type=submit value=Submit onClick="registration()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<INPUT id=reset1 name=reset1 type=reset value=Reset></TD></TR></TABLE></P>
<DL>
  <DT>
  <P align=left>&nbsp;</P></DT></DL>
<P align=center>&nbsp;</P>
<DL></DL>
<P>&nbsp;</P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</P>
<P>&nbsp;</P>
<P></FORM></P></BODY></HTML>






<HTML>
<BODY >
<script language=vbscript>

</script>
<script language=vbscript>
</script>
</BODY>
</HTML>