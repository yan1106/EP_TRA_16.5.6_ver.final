using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Linq;
using System.Web.Configuration;
using MySql.Data.MySqlClient;



public partial class EP_Capability_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            Panel_CAP_table.Visible = false;
            Panel_CAP_Table_View.Visible = false;
            Panel_CAP_Table_Update.Visible = false;
            DBint();
            
        }
       
    }
    [System.Web.Services.WebMethod]
    protected void Delete_CAP(string sql)
    {
        clsMySQL db = new clsMySQL();
        string sql_delete_cap = "Delete from npi_cap_ep where CAP_EP_Name='" + sql + "'";
        if(db.dbQueryExecuteNonQuery(sql_delete_cap)==true)
        {
            string strScript = string.Format("<script language='javascript'>alert('未刪除!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
        }

    }

    protected void butSearch_Click(object sender, EventArgs e)
    {
        string cap_sql = "select * from npi_cap_ep where CAP_EP_Name ='" + Text_packge.Text + "'";
        clsMySQL ds = new clsMySQL();

        clsMySQL.DBReply dr = ds.QueryDS(cap_sql);
        GD_CAP.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GD_CAP.DataBind();
        ds.Close();
    }
    protected void DBint()
    {
        //string sql_cap = "select * from npi_ep_cap where like '" + Text_packge.Text.Trim() + "%'";
        string sql_cap = "select * from npi_cap_ep ";
        clsMySQL ds = new clsMySQL();

        clsMySQL.DBReply dr = ds.QueryDS(sql_cap);
        GD_CAP.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GD_CAP.DataBind();
        ds.Close();
        
    }

    protected void GD_CAP_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    [System.Web.Services.WebMethod(EnableSession = true)]
    

    protected void  receiver_CAP_data(string pk_name)
    {
        string View_cap = "select * from npi_cap_ep where CAP_EP_Name='" + pk_name + "'";
        TextBox_PK_Name.Text=pk_name;

        int i = 4;
        //List<string> data_cap_por = new List<string>();
        List<string> data_cap = new List<string>();



        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(View_cap, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();


        while (mydr.Read())
        {
            for (i = 4; i < mydr.FieldCount; i++)
            {
                data_cap.Add(mydr.GetString(i));

            }
        }




        for (i = 0; i < 64; i++)
        {
            if (i == 6 || i == 9 || i == 13 || i == 16 || i == 17 || i == 22 || i == 47 || i == 49)
            {
                char[] exp = new char[] { '|' };
                string[] temp_exp = data_cap[i].Split(exp);
                data_cap[i] = "";
                for (int j = 0; j < temp_exp.Length; j++)
                {
                    data_cap[i] += temp_exp[j] + "<br />";
                }

            }

            string temp = "Lab_CAP_" + Convert.ToString(i + 1);
            Label mylabel = (Label)FindControl(temp);
            mylabel.Text = data_cap[i];
        }
        int count = 1;
        for (i = 65; i < 80; i++)
        {

            if (i == 77)
            {
                char[] exp = new char[] { '|' };
                string[] temp_exp = data_cap[i].Split(exp);
                data_cap[i] = "";
                for (int j = 0; j < temp_exp.Length; j++)
                {
                    data_cap[i] += temp_exp[j] + "<br />";
                }

            }



            string temp = "Lab_CAP_POR_" + Convert.ToString(count);
            Label mylabel = (Label)FindControl(temp);
            mylabel.Text = data_cap[i];
            count++;
        }






    }


    protected void receiver_CAP_data_Update(string pk_name)
    {
        string View_cap = "select * from npi_cap_ep where CAP_EP_Name='" + pk_name + "'";
        Text_UP_PK_Name.Text = pk_name;

        int i = 4;
        List<string> data_cap_por = new List<string>();
        List<string> data_cap = new List<string>();



        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(View_cap, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();


        while (mydr.Read())
        {
            for (i = 4; i < mydr.FieldCount; i++)
            {
                data_cap.Add(mydr.GetString(i));

            }

            for (i = 0; i < 64; i++)
            {
                string temp = "Text__UP_CAP_" + Convert.ToString(i + 1);
                TextBox mylabel = (TextBox)FindControl(temp);
                mylabel.Text = data_cap[i];
            }
        }
        int count = 1;
        for ( i = 65; i < 80; i++)
        {

          
            string temp = "Text_UP_CAP_POR_" + Convert.ToString(count);
            TextBox mylabel = (TextBox)FindControl(temp);
            mylabel.Text = data_cap[i];
            count++;
        }






    }





    protected void GD_CAP_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string strScript = "";
        clsMySQL db = new clsMySQL();
        int index=0;
       

        switch (e.CommandName) {

        case "Insert":

                Panel_CAP_table.Visible = true;
                Panel_Packge.Visible = false;
                break;
        case "Update":
                Panel_CAP_Table_Update.Visible = true;
                Panel_Packge.Visible = false;
                Panel_CAP_Table_View.Visible = false;
                Panel_CAP_table.Visible = false;

                break;

            case "View":
                Panel_CAP_table.Visible = false;
                Panel_Packge.Visible = false;
                Panel_CAP_Table_View.Visible = true;
                index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selecteRow_View = GD_CAP.Rows[index];
                string Packge_Name_View = selecteRow_View.Cells[1].Text;
                receiver_CAP_data(Packge_Name_View);
                break;

            case "Delete" :
                index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selecteRow = GD_CAP.Rows[index];
                string Packge_Name = selecteRow.Cells[1].Text;                       
                break;
                
  
        }
    }

    protected void Button_Save_CAP_Click(object sender, EventArgs e)
    {

       



   }



    protected void Button_Add_Click(object sender, EventArgs e)
    {
        clsMySQL db = new clsMySQL();

        string Status = "Y";
        string User_Name = "CIM";
        String insert_cap = string.Format("insert into npi_cap_ep" +
                                        "(CAP_EP_Name,Update_Time,npiuser,CAP_EP_Status," +
                                      "CAP_EP_01,CAP_EP_02,CAP_EP_03,CAP_EP_04,CAP_EP_05," +
                                      "CAP_EP_06,CAP_EP_07,CAP_EP_08,CAP_EP_09,CAP_EP_10," +
                                      "CAP_EP_11,CAP_EP_12,CAP_EP_13,CAP_EP_14,CAP_EP_15," +
                                      "CAP_EP_16,CAP_EP_17,CAP_EP_18,CAP_EP_19,CAP_EP_20," +
                                      "CAP_EP_21,CAP_EP_22,CAP_EP_23,CAP_EP_24,CAP_EP_25," +
                                      "CAP_EP_26,CAP_EP_27,CAP_EP_28,CAP_EP_29,CAP_EP_30," +
                                      "CAP_EP_31,CAP_EP_32,CAP_EP_33,CAP_EP_34,CAP_EP_35," +
                                      "CAP_EP_36,CAP_EP_37,CAP_EP_38,CAP_EP_39,CAP_EP_40," +
                                      "CAP_EP_41,CAP_EP_42,CAP_EP_43,CAP_EP_44,CAP_EP_45," +
                                      "CAP_EP_46,CAP_EP_47,CAP_EP_48,CAP_EP_49,CAP_EP_50," +
                                      "CAP_EP_51,CAP_EP_52,CAP_EP_53,CAP_EP_54,CAP_EP_55," +
                                      "CAP_EP_56,CAP_EP_57,CAP_EP_58,CAP_EP_59,CAP_EP_60," +
                                      "CAP_EP_61,CAP_EP_62,CAP_EP_63,CAP_EP_64,CAP_EP_65," +
                                      "CAP_POR_EP_01,CAP_POR_EP_02,CAP_POR_EP_03,CAP_POR_EP_04,CAP_POR_EP_05," +
                                      "CAP_POR_EP_06,CAP_POR_EP_07,CAP_POR_EP_08,CAP_POR_EP_09,CAP_POR_EP_10," +
                                      "CAP_POR_EP_11,CAP_POR_EP_12,CAP_POR_EP_13,CAP_POR_EP_14,CAP_POR_EP_15)values" +
                                      "('{0}',NOW(),'{1}','{2}'," +
                                       "'{3}','{4}','{5}','{6}','{7}'," +
                                       "'{8}','{9}','{10}','{11}','{12}'," +
                                       "'{13}','{14}','{15}','{16}','{17}'," +
                                       "'{18}','{19}','{20}','{21}','{22}'," +
                                       "'{23}','{24}','{25}','{26}','{27}'," +
                                       "'{28}','{29}','{30}','{31}','{32}'," +
                                       "'{33}','{34}','{35}','{36}','{37}'," +
                                       "'{38}','{39}','{40}','{41}','{42}'," +
                                       "'{43}','{44}','{45}','{46}', '{47}'," +
                                       "'{48}','{49}','{50}','{51}','{52}'," +
                                       "'{53}','{54}','{55}','{56}','{57}'," +
                                       "'{58}','{59}','{60}','{61}','{62}'," +
                                       "'{63}','{64}','{65}','{66}','{67}'," +
                                       "'{68}','{69}','{70}','{71}','{72}'," +
                                       "'{73}','{74}','{75}','{76}','{77}'," +
                                       "'{78}','{79}','{80}','{81}','{82}')"
                                       , Text_Packge_insert.Text, User_Name, Status,
                                       Text__CAP_1.Text, Text__CAP_2.Text, Text__CAP_3.Text, Text__CAP_4.Text, Text__CAP_5.Text,
                                       Text__CAP_6.Text, Text__CAP_7.Text, Text__CAP_8.Text, Text__CAP_9.Text, Text__CAP_10.Text,
                                       Text__CAP_11.Text, Text__CAP_12.Text, Text__CAP_13.Text, Text__CAP_14.Text, Text__CAP_15.Text,
                                       Text__CAP_16.Text, Text__CAP_17.Text, Text__CAP_18.Text, Text__CAP_19.Text, Text__CAP_20.Text,
                                       Text__CAP_21.Text, Text__CAP_21.Text, Text__CAP_22.Text, Text__CAP_23.Text, Text__CAP_25.Text,
                                       Text__CAP_26.Text, Text__CAP_27.Text, Text__CAP_28.Text, Text__CAP_29.Text, Text__CAP_30.Text,
                                       Text__CAP_31.Text, Text__CAP_32.Text, Text__CAP_33.Text, Text__CAP_34.Text, Text__CAP_35.Text,
                                       Text__CAP_36.Text, Text__CAP_37.Text, Text__CAP_38.Text, Text__CAP_39.Text, Text__CAP_40.Text,
                                       Text__CAP_41.Text, Text__CAP_42.Text, Text__CAP_43.Text, Text__CAP_44.Text, Text__CAP_45.Text,
                                       Text__CAP_46.Text, Text__CAP_47.Text, Text__CAP_48.Text, Text__CAP_49.Text, Text__CAP_50.Text,
                                       Text__CAP_51.Text, Text__CAP_52.Text, Text__CAP_53.Text, Text__CAP_54.Text, Text__CAP_55.Text,
                                       Text__CAP_56.Text, Text__CAP_57.Text, Text__CAP_58.Text, Text__CAP_59.Text, Text__CAP_60.Text,
                                       Text__CAP_61.Text, Text__CAP_62.Text, Text__CAP_63.Text, Text__CAP_64.Text, Text__CAP_65.Text,
                                        Text_CAP_POR_EP_01.Text, Text_CAP_POR_EP_2.Text, Text_CAP_POR_EP_3.Text, Text_CAP_POR_EP_4.Text, Text_CAP_POR_EP_5.Text,
                                      Text_CAP_POR_EP_6.Text, Text_CAP_POR_EP_7.Text, Text_CAP_POR_EP_8.Text, Text_CAP_POR_EP_9.Text, Text_CAP_POR_EP_10.Text,
                                      Text_CAP_POR_EP_11.Text, Text_CAP_POR_EP_12.Text, Text_CAP_POR_EP_13.Text, Text_CAP_POR_EP_14.Text, Text_CAP_POR_EP_15.Text);

        try
        {
            if (Text_Packge_insert.Text.Trim()=="")
            {
                string strScript = string.Format("<script language='javascript'>alert('您沒有輸入Packge_Name!');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
            }
            else if(db.QueryExecuteNonQuery(insert_cap) == true)
            {
                string strScript = string.Format("<script language='javascript'>alert('Packge:" + Text_Packge_insert.Text + "新增成功');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
                Panel_CAP_table.Visible = false;
                Panel_Packge.Visible = true;
                DBint();
            }
            else
            {
                string strScript = string.Format("<script language='javascript'>alert('Packge:" + Text_Packge_insert.Text + "新增失敗');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void Button_Cancel_Click(object sender, EventArgs e)
    {
        Panel_Packge.Visible = true;
        Panel_CAP_table.Visible = false;
        Panel_CAP_Table_Update.Visible = false;
        Panel_CAP_Table_View.Visible = false;
    }



    

    protected void GD_CAP_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
    }

    protected void GD_CAP_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        clsMySQL db = new clsMySQL();
        try
        {

            GridViewRow gvrow = GD_CAP.Rows[e.RowIndex];

            //lblError.Text = gvrow.Cells[1].Text + "////" + gvrow.Cells[2].Text;
            string strSQL_Delete = string.Format("Delete from npi_cap_ep where CAP_EP_Name='{0}'",
                                                gvrow.Cells[1].Text.Trim());

            if (db.QueryExecuteNonQuery(strSQL_Delete))
            {
                RegisterStartupScript("訊息通知", "<script> alert('資料已刪除，成功！！');</script>");
                DBint();
                //ChangeViewMode();
            }
            else
            {
                //lblError.Text = strSQL_Delete;
                RegisterStartupScript("訊息通知", "<script> alert('資料刪除，失敗！！');</script>");
            }
        }
        catch (FormatException ex)
        {
            lblError.Text = "[Error Message::NPI Manual Form Delete Function]: " + ex.ToString();
        }
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Panel_CAP_Table_View.Visible = false;
        Panel_CAP_table.Visible = false;
        Panel_Packge.Visible = true;
        Panel_CAP_Table_Update.Visible = false;
    }

    protected void GD_CAP_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
            clsMySQL db = new clsMySQL();
            

            GridViewRow gvrow = GD_CAP.Rows[e.RowIndex];

            string temp = gvrow.Cells[1].Text.Trim();
        HttpContext.Current.Session["value_cap_pkgname"] = temp ;
        receiver_CAP_data_Update(temp);


    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        clsMySQL db = new clsMySQL();

        string temp = "";
        temp = Session["value_cap_pkgname"].ToString();

        string Status = "Y";
        string User_Name = "CIM";
        String update_cap = string.Format("update  npi_cap_ep set " +
                                   "CAP_EP_Name='{0}',Update_Time=NOW(),npiuser='{1}',CAP_EP_Status='{2}'," +
                                 "CAP_EP_01='{3}',CAP_EP_02='{4}',CAP_EP_03='{5}',CAP_EP_04='{6}',CAP_EP_05='{7}'," +
                                 "CAP_EP_06='{8}',CAP_EP_07='{9}',CAP_EP_08='{10}',CAP_EP_09='{11}',CAP_EP_10='{12}'," +
                                 "CAP_EP_11='{13}',CAP_EP_12='{14}',CAP_EP_13='{15}',CAP_EP_14='{16}',CAP_EP_15='{17}'," +
                                 "CAP_EP_16='{18}',CAP_EP_17='{19}',CAP_EP_18='{20}',CAP_EP_19='{21}',CAP_EP_20='{22}'," +
                                 "CAP_EP_21='{23}',CAP_EP_22='{24}',CAP_EP_23='{25}',CAP_EP_24='{26}',CAP_EP_25='{27}'," +
                                 "CAP_EP_26='{28}',CAP_EP_27='{29}',CAP_EP_28='{30}',CAP_EP_29='{31}',CAP_EP_30='{32}'," +
                                 "CAP_EP_31='{33}',CAP_EP_32='{34}',CAP_EP_33='{35}',CAP_EP_34='{36}',CAP_EP_35='{37}'," +
                                 "CAP_EP_36='{38}',CAP_EP_37='{39}',CAP_EP_38='{40}',CAP_EP_39='{41}',CAP_EP_40='{42}'," +
                                 "CAP_EP_41='{43}',CAP_EP_42='{44}',CAP_EP_43='{45}',CAP_EP_44='{46}',CAP_EP_45='{47}'," +
                                 "CAP_EP_46='{48}',CAP_EP_47='{49}',CAP_EP_48='{50}',CAP_EP_49='{51}',CAP_EP_50='{52}'," +
                                 "CAP_EP_51='{53}',CAP_EP_52='{54}',CAP_EP_53='{55}',CAP_EP_54='{56}',CAP_EP_55='{57}'," +
                                 "CAP_EP_56='{58}',CAP_EP_57='{59}',CAP_EP_58='{60}',CAP_EP_59='{61}',CAP_EP_60='{62}'," +
                                 "CAP_EP_61='{63}',CAP_EP_62='{64}',CAP_EP_63='{65}',CAP_EP_64='{66}',CAP_EP_65='{67}'," +
                                 "CAP_POR_EP_01='{68}',CAP_POR_EP_02='{69}',CAP_POR_EP_03='{70}',CAP_POR_EP_04='{71}',CAP_POR_EP_05='{72}'," +
                                 "CAP_POR_EP_06='{73}',CAP_POR_EP_07='{74}',CAP_POR_EP_08='{75}',CAP_POR_EP_09='{76}',CAP_POR_EP_10='{77}'," +
                                 "CAP_POR_EP_11='{78}',CAP_POR_EP_12='{79}',CAP_POR_EP_13='{80}',CAP_POR_EP_14='{81}',CAP_POR_EP_15='{82}' where CAP_EP_Name='" + temp + "'"
                                  , Text_UP_PK_Name.Text, User_Name, Status,
                                  Text__UP_CAP_1.Text, Text__UP_CAP_2.Text, Text__UP_CAP_3.Text, Text__UP_CAP_4.Text, Text__UP_CAP_5.Text,
                                  Text__UP_CAP_6.Text, Text__UP_CAP_7.Text, Text__UP_CAP_8.Text, Text__UP_CAP_9.Text, Text__UP_CAP_10.Text,
                                  Text__UP_CAP_11.Text, Text__UP_CAP_12.Text, Text__UP_CAP_13.Text, Text__UP_CAP_14.Text, Text__UP_CAP_15.Text,
                                  Text__UP_CAP_16.Text, Text__UP_CAP_17.Text, Text__UP_CAP_18.Text, Text__UP_CAP_19.Text, Text__UP_CAP_20.Text,
                                  Text__UP_CAP_21.Text, Text__UP_CAP_21.Text, Text__UP_CAP_22.Text, Text__UP_CAP_23.Text, Text__UP_CAP_25.Text,
                                  Text__UP_CAP_26.Text, Text__UP_CAP_27.Text, Text__UP_CAP_28.Text, Text__UP_CAP_29.Text, Text__UP_CAP_30.Text,
                                  Text__UP_CAP_31.Text, Text__UP_CAP_32.Text, Text__UP_CAP_33.Text, Text__UP_CAP_34.Text, Text__UP_CAP_35.Text,
                                  Text__UP_CAP_36.Text, Text__UP_CAP_37.Text, Text__UP_CAP_38.Text, Text__UP_CAP_39.Text, Text__UP_CAP_40.Text,
                                  Text__UP_CAP_41.Text, Text__UP_CAP_42.Text, Text__UP_CAP_43.Text, Text__UP_CAP_44.Text, Text__UP_CAP_45.Text,
                                  Text__UP_CAP_46.Text, Text__UP_CAP_47.Text, Text__UP_CAP_48.Text, Text__UP_CAP_49.Text, Text__UP_CAP_50.Text,
                                  Text__UP_CAP_51.Text, Text__UP_CAP_52.Text, Text__UP_CAP_53.Text, Text__UP_CAP_54.Text, Text__UP_CAP_55.Text,
                                  Text__UP_CAP_56.Text, Text__UP_CAP_57.Text, Text__UP_CAP_58.Text, Text__UP_CAP_59.Text, Text__UP_CAP_60.Text,
                                  Text__UP_CAP_61.Text, Text__UP_CAP_62.Text, Text__UP_CAP_63.Text, Text__UP_CAP_64.Text, Text__UP_CAP_65.Text,
                                   Text_UP_CAP_POR_1.Text, Text_UP_CAP_POR_2.Text, Text_UP_CAP_POR_3.Text, Text_UP_CAP_POR_4.Text, Text_UP_CAP_POR_5.Text,
                                 Text_UP_CAP_POR_6.Text, Text_UP_CAP_POR_7.Text, Text_UP_CAP_POR_8.Text, Text_UP_CAP_POR_9.Text, Text_UP_CAP_POR_10.Text,
                                 Text_UP_CAP_POR_11.Text, Text_UP_CAP_POR_12.Text, Text_UP_CAP_POR_13.Text, Text_UP_CAP_POR_14.Text, Text_UP_CAP_POR_15.Text);


        try
        {

            if (db.QueryExecuteNonQuery(update_cap))
            {
                RegisterStartupScript("訊息通知", "<script> alert('資料更新，成功！！');</script>");
                Panel_CAP_Table_View.Visible = false;
                Panel_CAP_Table_Update.Visible = false;
                Panel_CAP_table.Visible = false;
                Panel_Packge.Visible = true;
                DBint();
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
}
