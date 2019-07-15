<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TableOfContent.aspx.cs" Inherits="TableOfContent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%
        if((string)Session["Username"]=="Guest")
        {
            Response.Redirect("Index.aspx");
        }
    %>
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
        <script>
            function adminOptions()
            {
                var checkAdmin =
            <%
            string strConnection = "Provider='Microsoft.ACE.OLEDB.12.0';Data Source=" + System.Web.HttpContext.Current.Server.MapPath(@"DataBase/p0nchokDataBase.accdb");
            string check = "SELECT Admin FROM UsersDataBase WHERE Username='"+Session["Username"]+"';";
            System.Data.OleDb.OleDbConnection o_con = new System.Data.OleDb.OleDbConnection(strConnection);
            System.Data.OleDb.OleDbCommand o_command2 = new System.Data.OleDb.OleDbCommand(check, o_con);
            System.Data.OleDb.OleDbDataAdapter checktableData = new System.Data.OleDb.OleDbDataAdapter(o_command2);
            o_con.Open();
            System.Data.DataSet checkData = new System.Data.DataSet();
            checktableData.Fill(checkData, "UsersDataBase");
            o_con.Close();
            if ((int)checkData.Tables[0].Rows[0][0] == 1)
            {
                Response.Write("1;");

            }
            else
            {
                Response.Write("0;");
            }
            %>
                if (checkAdmin == 1) {
                    document.getElementById("AdminOnly").style.visibility = "visible";
                }
            }
        function loadName()
        {
            var name = '<%=Session["Username"].ToString()%>';
            document.getElementById("Username").innerHTML = "Welcome " + name+"!";
            }

    </script>
        <style>
        .bigtext {
            font-size: 30px
        }
    </style>
</head>
<body onload="loadName(),adminOptions()">
     <!-- Top navigation -->
<div class="topnav">

  <!-- Centered link -->
  <div class="topnav-centered">
    <a href="TableOfContent.aspx" class="active">Home</a>
  </div>
  
  <!-- Left-aligned links (default) -->
<%--  <a href="RegisterForm.aspx">Register</a>
  <a href="LoginForm.aspx">Login</a>--%>
     <div class="topnav-right">
         <a href="Users.aspx" id="AdminOnly" style="visibility:hidden;">Users</a>
         <a href="Logout.aspx">Logout</a>
  </div>
  </div>
        <div>
            <center>
            <a id="Username" class="bigtext"></a>
            </center>
        </div>
</body>
</html>
