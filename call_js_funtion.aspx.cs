using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class call_js_funtion : System.Web.UI.Page
{
    [System.Web.Services.WebMethod]
    public static string GetContactName(string TextBox1text)
    {
        return TextBox1text + System.DateTime.Now.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TextBox1.Attributes.Add("onblur", "CallMe('" + TextBox1.ClientID + "', '" + TextBox2.ClientID + "')");
        }
    }
}