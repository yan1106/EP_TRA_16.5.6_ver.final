using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using MySql.Data.MySqlClient;
using System.Data.Odbc;
using System.Web.Services; //System.Web.Services.WebMethod
using System.Drawing;

using System.Reflection;




public partial class EP_Category_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            //ddlBind(GD_CATE);

            //string temp_name = Session["value_del_stage"].ToString();
            //DBint(temp_name);
            DDL_DatingBind();

        }
        Panel_update_category.Visible = false;
        Panel_Add_Category.Visible = false;
        Panel_Category_View.Visible = false;
       
    }
   


    protected void ddlBind(GridView gv)
    {
        if (gv.BottomPagerRow != null)
        {
            //讓下拉式選單顯示頁數
            DropDownList ddlSelectPage = (DropDownList)gv.BottomPagerRow.FindControl("ddlSelectPage");
            for (int i = 0; i < GD_CATE.PageCount; i++)
            {
                ddlSelectPage.Items.Add(new ListItem("第" + (i + 1).ToString() + "頁", i.ToString()));
            }
            //顯示目前頁數
            ddlSelectPage.SelectedIndex = gv.PageIndex;
           
            //下拉選單顯示頁面資料列數
            /*DropDownList ddlSelectPageSize = (DropDownList)gv.BottomPagerRow.FindControl("ddlSelectPageSize");
            if (ddlSelectPageSize.Items.Count <= 0)
            {
                ddlSelectPageSize.Items.Add(new ListItem("每頁1筆", "1"));
                ddlSelectPageSize.Items.Add(new ListItem("每頁2筆", "2"));
                ddlSelectPageSize.Items.Add(new ListItem("每頁3筆", "3"));
            }*/
            //顯示目前列數
            //ddlSelectPageSize.SelectedValue = gv.PageSize.ToString();
        }
    }

    protected void ddlSelectIndexChanged(object sender, EventArgs e)
    {
        int ddlIndex = 0;
        string ddlselect_stage = "";
        string ddlselect_stage_qn = "";
        int sign = 0;
        if (int.TryParse(((DropDownList)(sender)).SelectedValue, out ddlIndex))
        {
            switch (((DropDownList)(sender)).ID)
            {
                case "ddlSelectPageSize":
                    GD_CATE.PageSize = ddlIndex;
                    break;
                case "ddlSelectPage":
                    GD_CATE.PageIndex = ddlIndex;
                    break;
            }
            if (Session["value_ddl_stage"].ToString() != null) { 
            HttpContext.Current.Session["stage_qn"] = Session["value_ddl_stage"].ToString();
                sign = 1;
            }
            else
            {
                ddlselect_stage = Session["stage_qn"].ToString();
            }
            if(sign==1)
            {
                ddlselect_stage =Session["value_ddl_stage"].ToString();
            }

            DBint(ddlselect_stage);
            ddlBind(GD_CATE);
        }
    }



    [System.Web.Services.WebMethod]

    public static string DEL_Category(string str_stage)
    {
        string strError = "";
        string[] category_spilit_inf = new string[6];
        category_spilit_inf = str_stage.Split('|');

        for (int i = 0; i < category_spilit_inf.Length; i++)
        {
            if (category_spilit_inf[i] == "&nbsp;")
            {
                category_spilit_inf[i] = "";
            }
        }


        string strSQL_Delete = string.Format("Delete from npi_ep_category where EP_Cate_Stage='{0}' and EP_Cate_Iiitems='{1}' and EP_Cate_SpeChar='{2}' and  EP_Cate_Md='{3}' and EP_Cate_Cate='{4}' and  EP_Cate_KP='{5}'",
                                               category_spilit_inf[0], category_spilit_inf[1], category_spilit_inf[2], category_spilit_inf[3], category_spilit_inf[4], category_spilit_inf[5]);


        clsMySQL db = new clsMySQL();
        if (db.QueryExecuteNonQuery(strSQL_Delete))
        {
            strError = "刪除成功!";
            //DBint(category_spilit_inf[0]);

            HttpContext.Current.Session["value_del_stage"] = category_spilit_inf[0];
            db.Close();
        }
        else
        {
            strError = "Error Message:[NPI ManualForm] Delete Fail!!";
        }
        return strError;

    }
    public void DBint(string temp)
    {
        //string temp = "";

        //temp = Session["value_cate_stage"].ToString();

        string sql_category = "select * from npi_ep_category where EP_Cate_Stage='" + temp + "'";
        clsMySQL ds = new clsMySQL();

        clsMySQL.DBReply dr = ds.QueryDS(sql_category);
        GD_CATE.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GD_CATE.DataBind();
        ds.Close();
        Session.Clear();


    }

    protected void DDL_DatingBind()
    {
        string mySQL = "select DISTINCT EP_Cate_Stage from npi_ep_category ";
        int index = 0;


        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(mySQL, MySqlConn);
        MySqlDataReader SelData = MySqlCmd.ExecuteReader();

        while (SelData.Read())
        {

            string temp = SelData["EP_Cate_Stage"].ToString();
            cate_Stage_DDL.Items.Add(new ListItem(temp, temp));
            index++;
        }

    }

   

    protected void butSearch_Click(object sender, EventArgs e)
    {
        clsMySQL db = new clsMySQL();
        //string sql_category = "select * from npi_ep_category where EP_Cate_Stage='" + cate_Stage_DDL.SelectedValue + "' OR ( EP_Cate_Cate='" + Text_Category.Text + "')";
        string sql_category = "select * from npi_ep_category where EP_Cate_Stage='" + cate_Stage_DDL.SelectedValue + "'";
        //HttpContext.Current.Session["value_cate_stage"] = cate_Staege_DDL.SelectedValue;

        string stage_value = cate_Stage_DDL.SelectedValue;
        clsMySQL.DBReply dr = db.QueryDS(sql_category);
        GD_CATE.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GD_CATE.DataBind();
        HttpContext.Current.Session["value_ddl_stage"] = stage_value;
        ddlBind(GD_CATE);
        //bindDDL_gridview_countpage();
        db.Close();



    }

    protected void view_category(int index)
    {
        GridViewRow category = GD_CATE.Rows[index];
        List<string> category_inf = new List<string>();
        int count = 1;
        string mySQL = "select * from npi_ep_category where EP_Cate_Stage='" + category.Cells[1].Text.Trim() + "' and " +
            "EP_Cate_Iiitems='" + category.Cells[2].Text.Trim() + "' and EP_Cate_SpeChar='" + category.Cells[3].Text.Trim() + "' and " +
            "EP_Cate_Md='" + category.Cells[4].Text.Trim() + "' and EP_Cate_Cate='" + category.Cells[5].Text.Trim() + "' and " +
            "EP_Cate_KP='" + category.Cells[6].Text.Trim() + "'";


        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(mySQL, MySqlConn);
        MySqlDataReader SelData = MySqlCmd.ExecuteReader();

        while (SelData.Read())
        {
            /*category_inf.Add(SelData.GetString(count));
            if (count == 2)
                category_inf.Add(SelData["npi_EP_Cate_UpdateTime"].ToString());
            
                count++;*/
            Lab_view_cate_user.Text = SelData["npi_EP_Cate_Username"].ToString();
            Lab_view_cate_uptime.Text = Convert.ToString((DateTime)SelData["npi_EP_Cate_UpdateTime"]);
            Lab_view_cate_sta.Text = SelData["npi_EP_Cate_Status"].ToString();
            Lab_view_cate_stage.Text = SelData["EP_Cate_Stage"].ToString();
            Lab_view_cate_input.Text = SelData["EP_Cate_Iiitems"].ToString();
            Lab_view_cate_sp.Text = SelData["EP_Cate_SpeChar"].ToString();
            Lab_view_cate_md.Text = SelData["EP_Cate_Md"].ToString();
            Lab_view_cate_cate.Text = SelData["EP_Cate_cate"].ToString();
            Lab_view_cate_kp.Text = SelData["EP_Cate_KP"].ToString();



        }

        /*Lab_view_cate_user.Text = category_inf[0];
        Lab_view_cate_uptime.Text = category_inf[1];
        Lab_view_cate_sta.Text = category_inf[2];
        Lab_view_cate_stage.Text = category_inf[3];
        Lab_view_cate_sp.Text = category_inf[4];
        Lab_view_cate_md.Text = category_inf[5];
        Lab_view_cate_cate.Text = category_inf[6];
        Lab_view_cate_kp.Text = category_inf[7];*/

    }
    [System.Web.Services.WebMethod(EnableSession = true)]
    protected void GD_CAP_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }



    protected void receiver_CATE_data_Update(int index)
    {
        string sql_cate = "";

        GridViewRow gvrow = GD_CATE.Rows[index];
        HttpContext.Current.Session["gvrow_index"] = index.ToString();
        text_up_cate_user.Text = gvrow.Cells[7].Text.Trim();
        text_cate_stage.Text = gvrow.Cells[1].Text.Trim();
        text_cate_input.Text = gvrow.Cells[2].Text.Trim();
        text_cate_sp.Text = gvrow.Cells[3].Text.Trim();
        text_cate_md.Text = gvrow.Cells[4].Text.Trim();
        text_cate_cate.Text = gvrow.Cells[5].Text.Trim();
        text_cate_kp.Text = gvrow.Cells[6].Text.Trim();


    }



   
    
    
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlSelectPage = (DropDownList)GD_CATE.BottomPagerRow.FindControl("ddlSelectPage");

        int pIndex = 0;
        if (int.TryParse(ddlSelectPage.SelectedValue, out pIndex))
        {
            GD_CATE.PageIndex = pIndex;
            //getData(GD_CATE, "select * from product;");
        }
    }

    /*public void getData()
    {
        DataTable aTb = WebUtility.GetSQLdata("select * from product where id='0';", "teachDB");

        if (aTb.Rows.Count == 0)
        {

            aTb.Rows.Add(aTb.NewRow());

            GridView1.DataSource = aTb;
            GridView1.DataBind();


            int columnCount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());

            GridView1.Rows[0].Cells[0].ColumnSpan = columnCount;
            GridView1.Rows[0].Cells[0].Text = "無資料!";
            GridView1.RowStyle.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
        }
        else
        {
            GridView1.DataSource = aTb;
            GridView1.DataBind();
        }


    }*/



    protected void Button_Update_Click(object sender, EventArgs e)
    {
        clsMySQL db = new clsMySQL();
        int index;
        string Status = "Y";
        index = Convert.ToInt32(Session["gvrow_index"].ToString());
        GridViewRow gvrow = GD_CATE.Rows[index];
        Session.Clear();




        String update_cate = string.Format("update  npi_ep_category set " +
            "npi_EP_Cate_Username='{0}',npi_EP_Cate_UpdateTime=NOW(),npi_EP_Cate_Status='{1}'," +
            "EP_Cate_Stage='{2}',EP_Cate_Iiitems='{3}',EP_Cate_SpeChar='{4}'," +
            "EP_Cate_Md='{5}',EP_Cate_Cate='{6}',EP_Cate_KP='{7}' " +
            "where EP_Cate_Stage='{8}' and  EP_Cate_Iiitems='{9}' and EP_Cate_SpeChar='{10}'" +
            "and EP_Cate_Md='{11}'and EP_Cate_Cate='{12}' and EP_Cate_KP='{13}' "
            , text_up_cate_user.Text, Status, text_cate_stage.Text, text_cate_input.Text
            , text_cate_sp.Text, text_cate_md.Text, text_cate_cate.Text, text_cate_kp.Text
            , gvrow.Cells[1].Text.Trim(), gvrow.Cells[2].Text.Trim(), gvrow.Cells[3].Text.Trim()
            , gvrow.Cells[4].Text.Trim(), gvrow.Cells[5].Text.Trim(), gvrow.Cells[6].Text.Trim());


        try
        {

            if (db.QueryExecuteNonQuery(update_cate))
            {
                RegisterStartupScript("訊息通知", "<script> alert('資料更新，成功！！');</script>");
                Panel_update_category.Visible = false;
                Panel_Category.Visible = true;
                DBint(text_cate_stage.Text);
                //ChangeViewMode();
            }
            else
            {
                //lblError.Text = strSQL_Delete;
                RegisterStartupScript("訊息通知", "<script> alert('資料更新，失敗！！');</script>");
            }
        }
        catch (FormatException ex)
        {
            lblError.Text = "[Error Message::NPI Manual Form Delete Function]: " + ex.ToString();
        }

    }

    protected void Button_Cancel_Click(object sender, EventArgs e)
    {
        Panel_update_category.Visible = false;
        Panel_Category.Visible = true;
    }

    protected void LinkButton_Insert_Add_Click(object sender, EventArgs e)
    {
        clsMySQL db = new clsMySQL();

        string Status = "Y";
        string User_Name = "CIM";
        String insert_cap = string.Format("insert into npi_ep_category" +
                            "(npi_EP_Cate_Username,npi_EP_Cate_UpdateTime,npi_EP_Cate_Status," +
                            "EP_Cate_Stage,EP_Cate_Iiitems,EP_Cate_SpeChar," +
                            "EP_Cate_Md,EP_Cate_Cate,EP_Cate_KP)values" +
                            "('{0}',NOW(),'{1}','{2}','{3}','{4}','{5}','{6}','{7}')",
                            text_ad_cate_user.Text, Status, text_ad_cate_stage.Text, text_ad_cate_input.Text,
                            text_ad_cate_sp.Text, text_ad_cate_md.Text, text_ad_cate_cate.Text, text_ad_cate_kp.Text);



        try
        {
            if (text_ad_cate_stage.Text.Trim() == "")
            {
                string strScript = string.Format("<script language='javascript'>alert('您沒有輸入Stage，請重新輸入!');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
                Panel_Add_Category.Visible = true;
                Panel_Category_View.Visible = false;
                Panel_update_category.Visible = false;
                Panel_Category.Visible = false;
                
            }
            else if (db.QueryExecuteNonQuery(insert_cap) == true)
            {
                string strScript = string.Format("<script language='javascript'>alert('Stage:" + text_ad_cate_stage.Text + "新增成功');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
                Panel_Add_Category.Visible = false;
                Panel_update_category.Visible = false;
                Panel_Category.Visible = true;
                Response.Redirect(Request.Url.AbsoluteUri);
                DBint(text_ad_cate_stage.Text);
            }
            else
            {
                string strScript = string.Format("<script language='javascript'>alert('新增失敗');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void LinkButton_Add_Cancel_Click(object sender, EventArgs e)
    {
        Panel_Category.Visible = true;
        Panel_update_category.Visible = false;
        Panel_Add_Category.Visible = false;
        Panel_Category_View.Visible = false;
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        Panel_Category.Visible = false;
        Panel_update_category.Visible = false;
        Panel_Add_Category.Visible = true;
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Panel_Category.Visible = true;
        Panel_update_category.Visible = false;
        Panel_Add_Category.Visible = false;
        Panel_Category_View.Visible = false;
        Response.Redirect(Request.Url.AbsoluteUri);
    }



    protected void GD_CATE_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        clsMySQL db = new clsMySQL();
        try
        {
            GridViewRow gvrow = GD_CATE.Rows[e.RowIndex];
            string stage = gvrow.Cells[1].Text;
            string Input = gvrow.Cells[2].Text;
            string sp = gvrow.Cells[3].Text;
            string md = gvrow.Cells[4].Text;
            string category = gvrow.Cells[5].Text;
            string kp = gvrow.Cells[6].Text;


            if (Input == "&nbsp;")
                Input = "";
            if (sp == "&nbsp;")
                sp = "";
            if (md == "&nbsp;")
                 md = "";
            if (category == "&nbsp;")
                category = "";
            if (kp == "&nbsp;")
                kp = "";
           


            //lblError.Text = gvrow.Cells[1].Text + "////" + gvrow.Cells[2].Text;

            string strSQL_Delete = string.Format("Delete from npi_ep_category where EP_Cate_Stage='{0}' and EP_Cate_Iiitems='{1}' and EP_Cate_SpeChar='{2}' and  EP_Cate_Md='{3}' and EP_Cate_Cate='{4}' and  EP_Cate_KP='{5}'",
                                     stage,Input,sp,md,category,kp);

            if (db.QueryExecuteNonQuery(strSQL_Delete))
            {
                RegisterStartupScript("訊息通知", "<script> alert('資料已刪除，成功！！');</script>");
                Response.Redirect(Request.Url.AbsoluteUri);
                DBint(stage);
            }
            else
            {
                //lblError.Text = strSQL_Delete;
                RegisterStartupScript("訊息通知", "<script> alert('資料刪除，失敗！！');</script>");
            }
        }
        catch (FormatException ex)
        {
            lblError.Text = "[Error Message::NPI Category Form Delete Function]: " + ex.ToString();
        }
    }

    protected void GD_CATE_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void GD_CATE_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string temp = "";
        clsMySQL db = new clsMySQL();

        receiver_CATE_data_Update(e.RowIndex);
    }

   

    protected void GD_CATE_PageIndexChanged(object sender, EventArgs e)
    {
        string sql_category = "select * from npi_ep_category where EP_Cate_Stage='" + cate_Stage_DDL.SelectedValue + "' OR ( EP_Cate_Cate='" + Text_Category.Text + "')";
        clsMySQL db = new clsMySQL();

        clsMySQL.DBReply dr = db.QueryDS(sql_category);
        GD_CATE.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GD_CATE.DataBind();
        db.Close();
    }

    protected void GD_CATE_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GD_CATE.PageIndex = e.NewPageIndex;
        ddlBind(GD_CATE);
    }

    protected void GD_CATE_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string strScript = "";
        clsMySQL db = new clsMySQL();
        int index = 0;


        switch (e.CommandName)
        {

            case "Update":
                Panel_update_category.Visible = true;
                Panel_Category.Visible = false;

                break;

            case "View":
                Panel_Category.Visible = false;
                Panel_update_category.Visible = false;
                Panel_Add_Category.Visible = false;
                Panel_Category_View.Visible = true;
                index = Convert.ToInt32(e.CommandArgument);
                view_category(index);
                //Session.Clear();
                //HttpContext.Current.Session["value_view_index"] = index;
                break;

            case "btnDelete":
                index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selecteRow = GD_CATE.Rows[index];
                string category_inf = selecteRow.Cells[1].Text + "|" + selecteRow.Cells[2].Text + "|" + selecteRow.Cells[3].Text + "|" + selecteRow.Cells[4].Text + "|" + selecteRow.Cells[5].Text + "|" + selecteRow.Cells[6].Text;
                strScript = string.Format("<script language='javascript'>ConfirmDelManual('確定刪除_FCU？','" + category_inf + "');</script>", category_inf);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);

                break;


        }
    }
}