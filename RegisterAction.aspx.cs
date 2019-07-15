using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisterAction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public string RequestSQL()
    {
        return "Provider='Microsoft.Ace.OLEDB.12.0';Data Source=" + System.Web.HttpContext.Current.Server.MapPath(@"DataBase/p0nchokDataBase.accdb");
    }
}