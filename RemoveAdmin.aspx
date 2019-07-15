<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RemoveAdmin.aspx.cs" Inherits="RemoveAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
                string adminCommand = "UPDATE UsersDataBase SET Admin=0 WHERE Username = '" + Request.Form["adminButton"] + "';";
                string strConnection = "Provider='Microsoft.Ace.OLEDB.12.0';Data Source=" + System.Web.HttpContext.Current.Server.MapPath(@"DataBase/p0nchokDataBase.accdb");
                System.Data.OleDb.OleDbConnection o_con = new System.Data.OleDb.OleDbConnection(strConnection);
                System.Data.OleDb.OleDbCommand o_command = new System.Data.OleDb.OleDbCommand(adminCommand, o_con);
                o_con.Open();
                o_command.ExecuteNonQuery();
                o_con.Close();
                Response.Redirect("Users.aspx");
            %>
        </div>
    </form>
</body>
</html>
