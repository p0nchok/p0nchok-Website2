<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterForm.aspx.cs" Inherits="RegisterForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
    <script type="text/javascript">
         function check_blank() {
             if (document.form1.Username.value == "") {
                 //alert("Please enter a Username!");
                 //Session["Error"] = "You must enter a Username!";
                 document.getElementById("ErrorMessage").innerHTML = "You must enter a Username!";
                 document.form1.Username.focus();
                 return false;
             }
             if (document.form1.Password.value == "") {
                 //alert("Please enter a Password!");
                 //Session["Error"] = "You must enter a Password!";
                 document.getElementById("ErrorMessage").innerHTML = "You must enter a Password!";
                 document.form1.Password.focus();
                 return false;
             }
             if (document.form1.Password2.value == "") {
                 //alert("Please enter a Password!");
                 //Session["Error"] = "You must enter a Password!";
                 document.getElementById("ErrorMessage").innerHTML = "You must confirm your Password!";
                 document.form1.Password2.focus();
                 return false;
             }
             if (document.form1.Password.value != document.form1.Password2.value) {
                 //alert("Passwords have to match!");
                 //Session["Error"] = "Passwords have to match!";
                 document.getElementById("ErrorMessage").innerHTML = "Passwords have to match!";
                 document.form1.Password2.focus();
                 return false;
             }
             return true;
         }
<%--        function loadName()
        {
            var name = '<%=Session["Username"].ToString()%>';
            document.getElementById("ErrorMessage").innerHTML = <%Session["Error"] %>;
        }--%>
    </script>
</head>
<body>
          <!-- Top navigation -->
<div class="topnav">

  <!-- Centered link -->
  <div class="topnav-centered">
    <a href="Index.aspx" class="active">Home</a>
  </div>
  
  <!-- Left-aligned links (default) -->
  <a href="LoginForm.aspx">Login</a>
     <div class="topnav-right">
  </div>
  </div>
        <div>
            <center>
                <form name="form1" action="RegisterAction.aspx" method="post" onsubmit="return check_blank()">
                    <table>
                        <tr>
                            <td><center>Username:</center></td>
                            <td><center><input type="text" name="Username" /></center></td>
                        </tr>
                        <tr>
                            <td><center>Password:</center></td>
                            <td><center><input type="password" name="Password" /></center></td>
                        </tr>
                        <tr>
                            <td><center>Confirm Password:</center></td>
                            <td><center><input type="password" name="Password2" /></center></td>
                        </tr>
                        <tr>
                            <th colspan="2"> <p id="ErrorMessage" class="error"></p></th>
                        </tr>
                        <tr>
                            <td colspan="2"><center><input type="submit" value="Submit"/></center></td>
                        </tr>
                    </table>
             <div class="error">
             <%
             if ((string)Session["Error"]!="")
             {
                 Response.Write(Session["Error"]);
                 Session["Error"] = "";
             }
             %>
             </div>
                </form>
            </center>
        </div>
</body>
</html>
