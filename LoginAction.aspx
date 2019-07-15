<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginAction.aspx.cs" Inherits="LoginAction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <%
        String strConnection = "Provider='Microsoft.ACE.OLEDB.12.0';Data Source=" + System.Web.HttpContext.Current.Server.MapPath(@"DataBase/p0nchokDataBase.accdb");
        //string strConnection = "Provider='Microsoft.Jet.OLEDB.4.0';Data Source=" + System.Web.HttpContext.Current.Server.MapPath(@"App_Data/Users.accdb");
        string MySQL = @"SELECT * FROM UsersDataBase WHERE Username =  '"+ Request.Form["LoginUsername"] + "' AND Passwrd = '" + Request.Form["LoginPassword"] + "';";
        System.Data.OleDb.OleDbConnection o_con = new System.Data.OleDb.OleDbConnection(strConnection);
        System.Data.OleDb.OleDbCommand o_command = new System.Data.OleDb.OleDbCommand(MySQL, o_con);

        o_con.Open();
        System.Data.OleDb.OleDbDataAdapter da = new System.Data.OleDb.OleDbDataAdapter(o_command);
        System.Data.DataSet ds = new System.Data.DataSet();
        da.Fill(ds, "UsersDataBase");
        o_con.Close();
        if (ds.Tables[0].Rows.Count == 0)
        {
            Session["Error"] = "Incorrect username and or password";
            Response.Redirect("LoginForm.aspx");

        }
        else {
                Session["Username"] = Request.Form["LoginUsername"];
                Response.Redirect("TableOfContent.aspx");
            }
    %>
</body>
</html>
