<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Users</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
     <style>
        .anchors {

        }
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
</style>
     <script>
        function confirmDelete() {
            var r;
            r = confirm("Are you sure you want to delete this user?");
            if (r == true) {
                return true;
            }
            else {
                return false;
            }
         }
        function confirmAdmin() {
            var r;
            r = confirm("Are you sure you want to make this user an Admin?");
            if (r == true) {
                return true;
            }
            else {
                return false;
            }
         }
        function confirmRemoveAdmin() {
            var r;
            r = confirm("Are you sure you want to remove this user as an Admin?");
            if (r == true) {
                return true;
            }
            else {
                return false;
            }
        }
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1]; //The number is which column to check
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
</head>
<body>
     <!-- Top navigation -->
<div class="topnav">

  <!-- Centered link -->
  <div class="topnav-centered">
    <a href="TableOfContent.aspx" class="active">Home</a>
  </div>
  
  <!-- Left-aligned links (default) -->
  <a href="RegisterForm.aspx">Register</a>
  <a href="LoginForm.aspx">Login</a>
     <div class="topnav-right">
         <a href="Logout.aspx">Logout</a>
  </div>
  </div>
    <div><center>
     <%
         string PrintTable = "SELECT * FROM UsersDataBase";
         string strConnection = "Provider='Microsoft.ACE.OLEDB.12.0';Data Source=" + System.Web.HttpContext.Current.Server.MapPath(@"DataBase/p0nchokDataBase.accdb"); //Admin
         string check = "SELECT Admin FROM UsersDataBase WHERE Username='"+Session["Username"]+"';"; //Admin
         System.Data.OleDb.OleDbConnection o_con = new System.Data.OleDb.OleDbConnection(strConnection); //Admin
         System.Data.OleDb.OleDbCommand o_command2 = new System.Data.OleDb.OleDbCommand(check, o_con); //Admin
         System.Data.OleDb.OleDbCommand o_print = new System.Data.OleDb.OleDbCommand(PrintTable, o_con);

         o_con.Open(); //Admin

         System.Data.OleDb.OleDbDataAdapter tableData = new System.Data.OleDb.OleDbDataAdapter(o_print);
         System.Data.OleDb.OleDbDataAdapter checktableData = new System.Data.OleDb.OleDbDataAdapter(o_command2); //Admin
         System.Data.DataSet printData = new System.Data.DataSet();
         System.Data.DataSet checkData = new System.Data.DataSet(); //Admin
         tableData.Fill(printData, "UsersDataBase");
         checktableData.Fill(checkData, "UsersDataBase"); //Admin
         o_con.Close(); //Admin
         if ((int)checkData.Tables[0].Rows[0][0]==0) //Admin
         {
             Response.Redirect("TableOfContent.aspx");
         }

         Response.Write("<input type='text' id='myInput' onkeyup='myFunction()' placeholder='    Search for Usernames..' title='Type in a name'> <table border= 1>  </table> <table border = 1 id = 'myTable'> <tr> <th>ID</th> <th>Username</th> <th>Password</th> <th>Admin</th> <th>Delete</th></tr>");
         for (int i = 0; i < printData.Tables[0].Rows.Count; i++)
         {
             Response.Write("<tr>");
             for (int j = 0; j < printData.Tables[0].Columns.Count; j++)
             {
                 Response.Write("<td>");
                 Response.Write(printData.Tables[0].Rows[i][j].ToString());
                 Response.Write("</td>");
             }
             //Response.Write("<td><input type='button' id='printData.Tables[0].Rows[i][3].ToString()' onclick=''</td>");
             Response.Write("<td><form id='form1' action='DeleteAction.aspx' method='post'><button onclick='return confirmDelete()' name='deleteButton' value='"+printData.Tables[0].Rows[i][1].ToString()+"'>Delete</button></form><form id='form2' action='MakeAdmin.aspx' method='post'><button onclick='return confirmAdmin()' name='adminButton' value='"+printData.Tables[0].Rows[i][1].ToString()+"'>Make Admin</button></form><form id='form3' action='RemoveAdmin.aspx' method='post'><button onclick='return confirmRemoveAdmin()' name='adminButton' value='"+printData.Tables[0].Rows[i][1].ToString()+"'>Remove Admin</button></form></td>");
             Response.Write("</tr>");
         }
         Response.Write("</table>");
        %>
        </center></div>
</body>
</html>
