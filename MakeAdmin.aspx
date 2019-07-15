<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MakeAdmin.aspx.cs" Inherits="MakeAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
//    string strConnection2 = "Provider='Microsoft.ACE.OLEDB.12.0';Data Source=" + System.Web.HttpContext.Current.Server.MapPath(@"DataBase/p0nchokDataBase.accdb");
//    System.Data.OleDb.OleDbConnection con = new System.Data.OleDb.OleDbConnection(strConnection2);

//    string mySQL2 = @"UPDATE UsersDataBase SET Admin=1 WHERE Username='" + Request.Form["adminButton"] + "'; ";
//    con.Open();
//    System.Data.OleDb.OleDbCommand cmd = new System.Data.OleDb.OleDbCommand(mySQL2, con);

//    cmd.ExecuteNonQuery();
//    con.Close();
//Response.Redirect("Users.aspx");
            string adminCommand = "UPDATE UsersDataBase SET Admin=1 WHERE Username = '" + Request.Form["adminButton"] + "';";
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
