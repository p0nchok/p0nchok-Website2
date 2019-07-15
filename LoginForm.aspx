<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginForm.aspx.cs" Inherits="LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
    <script type="text/javascript">
         function check_blank() {
             if (document.form1.LoginUsername.value == "") {
                 //alert("Please enter a Username!");
                 //Session["Error"] = "You must enter a Username!";
                 document.getElementById("ErrorMessage").innerHTML = "You must enter your Username!";
                 document.form1.LoginUsername.focus();
                 return false;
             }
             if (document.form1.LoginPassword.value == "") {
                 //alert("Please enter a Password!");
                 //Session["Error"] = "You must enter a Password!";
                 document.getElementById("ErrorMessage").innerHTML = "You must enter your Password!";
                 document.form1.LoginPassword.focus();
                 return false;
             }
             return true;
        }

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
  <a href="RegisterForm.aspx">Register</a>
  <a href="Login.aspx">Login</a>
     <div class="topnav-right">
  </div>
  </div>
    <form name="form1" action="LoginAction.aspx" method="post" onsubmit="return check_blank()">
        <div>
            <center>
                <table>
                    <tr>
                        <td><center>Username:</center></td>
                        <td><center><input type="text" name="LoginUsername" /></center></td>
                    </tr>
                    <tr>
                        <td><center>Password:</center></td>
                        <td><center><input type="password" name="LoginPassword" /></center></td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <p id="ErrorMessage" class="error">
                            </p>
                        </th>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" /><input type="reset"  value="Clear" /></td>
                    </tr>
                </table>
                 <div class="error">
                <%
                    if((string)Session["Error"]!="")
                    {
                        Response.Write(Session["Error"]);
                        Session["Error"] = "";
                    }
                    %>
               </div>
            </center>
        </div>
    </form>
</body>
</html>

