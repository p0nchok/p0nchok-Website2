<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterAction.aspx.cs" Inherits="RegisterAction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
        //if (Request.Form["Username"] == "")
        //{
        //    Session["Error"] = "Please enter a Username!";
        //    Response.Redirect("RegisterForm.aspx");
        //}
        //if (Request.Form["Password"] == "")
        //{
        //    Session["Error"] = "Please enter a Password!";
        //    Response.Redirect("RegisterForm.aspx");
        //}
        //if (Request.Form["Password2"] == "")
        //{
        //    Session["Error"] = "Please confirm your password!";
        //    Response.Redirect("RegisterForm.aspx");
        //}
        //if (Request.Form["Password"] != Request.Form["Password2"])
        //{
        //    Session["Error"] = "Passwords have to match!";
        //    Response.Redirect("RegisterForm.aspx");
        //}
        string check = "SELECT * FROM UsersDataBase WHERE Username = '" + Request.Form["Username"] + "';";
        //string fname = Request.Form["Fname"].ToLower();
        //string lname = Request.Form["Lname"].ToLower();
        //string username = Request.Form["Username"].ToLower();
        //string e_mail = Request.Form["E_mail"].ToLower();
        string MySQL = "INSERT INTO UsersDataBase (Username, Passwrd) VALUES ('" + Request.Form["Username"].ToLower() + "','" + Request.Form["Password"] + "');";
        Response.Write(MySQL);
        string strConnection = RequestSQL();
        System.Data.OleDb.OleDbConnection o_con = new System.Data.OleDb.OleDbConnection(strConnection);

        System.Data.OleDb.OleDbCommand o_command = new System.Data.OleDb.OleDbCommand(MySQL, o_con);
        System.Data.OleDb.OleDbCommand o_command2 = new System.Data.OleDb.OleDbCommand(check, o_con);
        o_con.Open();
        System.Data.OleDb.OleDbDataAdapter da = new System.Data.OleDb.OleDbDataAdapter(o_command2);
        System.Data.DataSet ds = new System.Data.DataSet();
        da.Fill(ds, "UsersDataBase");
        o_con.Close();
        if (ds.Tables[0].Rows.Count == 0)
        {


            o_con.Open(); // open the connection

            o_command.ExecuteNonQuery();  // run the command
            o_con.Close();                // close the connection
        }
        else
        {
            Session["Error"] = "Username already exists!";
            Response.Redirect("RegisterForm.aspx");
        }
        Session["Username"] = Request.Form["Username"];
        Response.Redirect("TableOfContent.aspx");
        %>
</body>
</html>
