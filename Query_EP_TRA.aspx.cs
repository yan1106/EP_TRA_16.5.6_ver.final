
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
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;




public partial class Query_EP_TRA : System.Web.UI.Page
{

    public List<string> eptramain_data = new List<string>();
    public List<string> Str_Effect = new List<string>();
    public List<string> Str_Poten = new List<string>();
    
    //protected System.Web.UI.WebControls.PlaceHolder PlaceHolder1;
    // protected System.Web.UI.WebControls.PlaceHolder PlaceHolder2;


    [System.Web.Services.WebMethod]
    public static string[] GetCustomer(string prefix)
    {
        List<string> Customer = new List<string>();
        string strSQL2 = "select DISTINCT npiapp.New_Customer,npiimportdata.New_Customer,npimanual.New_Customer  from npiapp,npiimportdata,npimanual Where npiapp.New_Customer Like '" + prefix + "%' ";
        string strSQL = " select DISTINCT npiapp.New_Customer from npiapp where npiapp.New_Customer like '" + prefix + "%' union  select  npiimportdata.New_Customer from  npiimportdata where   npiimportdata.New_Customer like '" + prefix + "%' union select  npimanual.New_Customer from npimanual where npimanual.New_Customer like'" + prefix + "%'";



        clsMySQL db = new clsMySQL();
        foreach (DataRow dr in db.QueryDataSet(strSQL).Tables[0].Rows)
        {
            //customers.Add(string.Format("{0},{1}", dr["new_customer"], dr["new_device"]));
            Customer.Add(string.Format("{0}", dr["New_Customer"]));
        }
        return Customer.ToArray();
    }
    [System.Web.Services.WebMethod]
    public static string[] GetNewDevice(string prefix)
    {
        List<string> New_Device = new List<string>();
        string strSQL = " select DISTINCT npiapp.New_Device from npiapp where npiapp.New_Device like '" + prefix + "%' union  select  npiimportdata.New_Device from  npiimportdata where   npiimportdata.New_Device like '" + prefix + "%' union select  npimanual.New_Device from npimanual where npimanual.New_Device like'" + prefix + "%'";
        clsMySQL db = new clsMySQL();
        foreach (DataRow dr in db.QueryDataSet(strSQL).Tables[0].Rows)
        {
            //customers.Add(string.Format("{0},{1}", dr["new_customer"], dr["new_device"]));
            New_Device.Add(string.Format("{0}", dr["New_Device"]));
        }
        return New_Device.ToArray();
    }















    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Panel_EPTRA.Visible = false;
            Panel_eptraview.Visible = false;
            //Panel_EPTramain.Visible = false;
        }
    }

    protected void put_effect_data()
    {

        Str_Effect.Add("Assembly");
        Str_Effect.Add("Reliability");
        Str_Effect.Add("CP");
        Str_Effect.Add("UBM<br />");
        Str_Effect.Add("PHOTO");
        Str_Effect.Add("PLAT<br />");
        Str_Effect.Add("PI1<br />");
        Str_Effect.Add("ETCH<br />");
        Str_Effect.Add("DESCUM");
        Str_Effect.Add("2RFL");
        Str_Effect.Add("PPHO");
        Str_Effect.Add("PR STRIP");
        Str_Effect.Add("FT");
        Str_Effect.Add("FV & 2D");
        Str_Effect.Add("2D");
        Str_Effect.Add("FV");
        Str_Effect.Add("3D");
        Str_Effect.Add("BH");
        Str_Effect.Add("RS");
        Str_Effect.Add("Void");
        Str_Effect.Add("Shear test");
        Str_Effect.Add("Pull test");
        Str_Effect.Add("BD");
        Str_Effect.Add("Cop");
        Str_Effect.Add("<br />");

    }

    protected void put_potential_data()
    {
        Str_Poten.Add("Bump crack");//index->0
        Str_Poten.Add("RT fail");//index->1
        Str_Poten.Add("Probe card damage");//index->2
        Str_Poten.Add("UBM poor coverage<br />");//index->3
        Str_Poten.Add("pad damage");//index->4
        Str_Poten.Add("Low k crack");//index->5
        Str_Poten.Add("BS/BP fail");//index->6
        Str_Poten.Add("RT fail");//index->7
        Str_Poten.Add("Pad damage");//index->8
        Str_Poten.Add("1.PI profile" + "<br />" + "&nbsp&nbsp" + "non-smooth");//index->9
        Str_Poten.Add("2.Metal film" + "<br />" + "&nbsp&nbsp" + "dis-continuity" + "<br>");//index->10
        Str_Poten.Add("PSV roughness" + "<br />");//index->11
        Str_Poten.Add("PI delam" + "<br />");//index->12

        Str_Poten.Add("poor step coverage<br />");//index->13
        Str_Poten.Add("1.Metal peeling<br />");//index->14
        Str_Poten.Add("2.BH / BC OOS<br />");//index->15
        Str_Poten.Add("Metal peeling<br />");//index->16

        Str_Poten.Add("1.PI CD OOS");//index->17
        Str_Poten.Add("2.PI residue");//index->18
        Str_Poten.Add("3.RS OOS");//index->19
        Str_Poten.Add("4.PI THK abnormal");//index->20
        Str_Poten.Add("5.PI Crack");//index->21
        Str_Poten.Add("6.Abnormal PI profile");//index->22

        Str_Poten.Add("1.BR OOS");//index->23
        Str_Poten.Add("2.UBM dis-connnection<br />&nbsp&nbsp&nbsp&nbsp/poor step coverage");//index->24
        Str_Poten.Add("3.UBM peeling");//index->25

        Str_Poten.Add("1.PI roughness OOS");//index->26
        Str_Poten.Add("2.Metal residue");//index->27
        Str_Poten.Add("3.Undercut OOS");//index->28
        Str_Poten.Add("4.BL OOS");//index->29
        Str_Poten.Add("5.Irregular bump<br />&nbsp&nbsp&nbsp&nbsp/Bump wrinkle");//index->30
        Str_Poten.Add("6.Solder burst");//index->31

        Str_Poten.Add("1.BR OOS");//index->32
        Str_Poten.Add("3.PI damage");//index->33
        Str_Poten.Add("4.PI roughness OOC");//index->34
        Str_Poten.Add("5.PI delamination");//index->35
        Str_Poten.Add("6.BL OOS");//index->36


        Str_Poten.Add("1.Glue residual");//index->37
        Str_Poten.Add("2.Bump crack");//index->38
        Str_Poten.Add("3.UBM crackd");//index->39
        Str_Poten.Add("4.Md/UF delam");//index->40

        //UBM type / Thickness (um)
        Str_Poten.Add("1.Metal residue");
        Str_Poten.Add("2.BL OOS");

        //Bump composition
        Str_Poten.Add("Irregular bump");
        Str_Poten.Add("1.Non-wetting");
        Str_Poten.Add("2.Bump bridge");
        //index->1

        /*REPSV PI Opening Size(um) 17*/
        Str_Poten.Add("2.RS OOS");
        Str_Poten.Add("PR bubble");

        Str_Poten.Add("");
        Str_Poten.Add("");

    }

    protected void receive_eptramain_data(string sql_eptramain)
    {

        clsMySQL db = new clsMySQL();

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql_eptramain, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();




        while (mydr.Read())
        {

            eptramain_data.Add((String)mydr["Ver_Name"]);
            eptramain_data.Add(Convert.ToString((DateTime)mydr["UpdateTime"]));
            eptramain_data.Add((String)mydr["UserName"]);
            eptramain_data.Add((String)mydr["Ver_Status"]);
            eptramain_data.Add((String)mydr["Ver_POR_Customer"]);
            eptramain_data.Add((String)mydr["Ver_POR_Device"]);
            eptramain_data.Add((String)mydr["Ver_POR_Site"]);
            eptramain_data.Add((String)mydr["Ver_POR_PKG"]);
            eptramain_data.Add((String)mydr["Ver_POR_WT"]);
            eptramain_data.Add((String)mydr["Ver_POR_FAB"]);
            eptramain_data.Add((String)mydr["Ver_POR_PSV"]);
            eptramain_data.Add((String)mydr["Ver_POR_RVSI"]);

            eptramain_data.Add((String)mydr["Ver_New_Customer"]);
            eptramain_data.Add((String)mydr["Ver_New_Device"]);

        }



    }



    protected int count_eptramain()
    {

        int count = 0;
        string sql_eptramain_count = "select count(Ver_No) from npieptraver_main where Ver_New_Customer = '" + Customer_TB.Text + "'and Ver_New_Device= '" + ND_TB.Text + "' and Ver_Status ='" + DDList_Status.SelectedValue + "'";
        clsMySQL db = new clsMySQL();

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql_eptramain_count, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();




        while (mydr.Read())
        {

            count = int.Parse(mydr[0].ToString()); //猛猛der,Parse到底是什麼,怎麼可以這樣轉~~

            //int.Parse(myReader[0].ToString());

        }
        mydr.Close();
        MySqlConn.Close();

        return count;

    }


   /* protected void put_eptramain_data()
    {

        Lab_Ver.Text = eptramain_data[0];
        Lab_UPT.Text = eptramain_data[1];
        Lab_User.Text = eptramain_data[2];
        Lab_Sta.Text = eptramain_data[3];
        Lab_Cus.Text = eptramain_data[4];
        Lab_Device.Text = eptramain_data[5];
        Lab_Site.Text = eptramain_data[6];
        Lab_PKG.Text = eptramain_data[7];
        Lab_WT.Text = eptramain_data[8];
        Lab_FAB.Text = eptramain_data[9];
        Lab_PSV.Text = eptramain_data[10];
        Lab_RVSI.Text = eptramain_data[11];
        Lab_NewCus.Text = eptramain_data[12];
        Lab_NewDev.Text = eptramain_data[13];



    }*/


    protected void display_PORGOlden_data(string sql_eptramain)
    {

        clsMySQL db = new clsMySQL();

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql_eptramain, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();




        while (mydr.Read())
        {

            lab_Ver_POR_1.Text = (String)mydr["Ver_POR_1"];
            lab_Ver_POR_2.Text = (String)mydr["Ver_POR_2"];
            lab_Ver_POR_3.Text = (String)mydr["Ver_POR_3"];
            lab_Ver_POR_4.Text = (String)mydr["Ver_POR_4"];
            lab_Ver_POR_5.Text = (String)mydr["Ver_POR_5"];
            lab_Ver_POR_6.Text = (String)mydr["Ver_POR_6"];
            lab_Ver_POR_7.Text = (String)mydr["Ver_POR_7"];
            lab_Ver_POR_8.Text = (String)mydr["Ver_POR_8"];
            lab_Ver_POR_9.Text = (String)mydr["Ver_POR_9"];
            lab_Ver_POR_10.Text = (String)mydr["Ver_POR_10"];
            lab_Ver_POR_11.Text = (String)mydr["Ver_POR_11"];
            lab_Ver_POR_12.Text = (String)mydr["Ver_POR_12"];
            lab_Ver_POR_13.Text = (String)mydr["Ver_POR_13"];
            lab_Ver_POR_14.Text = (String)mydr["Ver_POR_14"];
            lab_Ver_POR_15.Text = (String)mydr["Ver_POR_15"];
            lab_Ver_POR_16.Text = (String)mydr["Ver_POR_16"];
            lab_Ver_POR_17.Text = (String)mydr["Ver_POR_17"];
            lab_Ver_POR_18.Text = (String)mydr["Ver_POR_18"];
            lab_Ver_POR_19.Text = (String)mydr["Ver_POR_19"];
            lab_Ver_POR_20.Text = (String)mydr["Ver_POR_20"];
            lab_Ver_POR_21.Text = (String)mydr["Ver_POR_21"];
            lab_Ver_POR_22.Text = (String)mydr["Ver_POR_22"];
            lab_Ver_POR_23.Text = (String)mydr["Ver_POR_23"];
            lab_Ver_POR_24.Text = (String)mydr["Ver_POR_24"];
            lab_Ver_POR_25.Text = (String)mydr["Ver_POR_25"];
            lab_Ver_POR_26.Text = (String)mydr["Ver_POR_26"];
            lab_Ver_POR_27.Text = (String)mydr["Ver_POR_27"];
            lab_Ver_POR_28.Text = (String)mydr["Ver_POR_28"];
            lab_Ver_POR_29.Text = (String)mydr["Ver_POR_29"];
            lab_Ver_POR_30.Text = (String)mydr["Ver_POR_30"];
            lab_Ver_POR_31.Text = (String)mydr["Ver_POR_31"];
            lab_Ver_POR_32.Text = (String)mydr["Ver_POR_32"];
            lab_Ver_POR_33.Text = (String)mydr["Ver_POR_33"];
            lab_Ver_POR_34.Text = (String)mydr["Ver_POR_34"];
            lab_Ver_POR_35.Text = (String)mydr["Ver_POR_35"];
            lab_Ver_POR_36.Text = (String)mydr["Ver_POR_36"];
            lab_Ver_POR_37.Text = (String)mydr["Ver_POR_37"];
            lab_Ver_POR_38.Text = (String)mydr["Ver_POR_38"];
            lab_Ver_POR_39.Text = (String)mydr["Ver_POR_39"];
            lab_Ver_POR_40.Text = (String)mydr["Ver_POR_40"];
            lab_Ver_POR_41.Text = (String)mydr["Ver_POR_41"];
            lab_Ver_POR_42.Text = (String)mydr["Ver_POR_42"];
            lab_Ver_POR_43.Text = (String)mydr["Ver_POR_43"];
            lab_Ver_POR_44.Text = (String)mydr["Ver_POR_44"];
            lab_Ver_POR_45.Text = (String)mydr["Ver_POR_45"];
            lab_Ver_POR_46.Text = (String)mydr["Ver_POR_46"];
            lab_Ver_POR_47.Text = (String)mydr["Ver_POR_47"];
            lab_Ver_POR_48.Text = (String)mydr["Ver_POR_48"];
            lab_Ver_POR_49.Text = (String)mydr["Ver_POR_49"];
            lab_Ver_POR_50.Text = (String)mydr["Ver_POR_50"];
            lab_Ver_POR_51.Text = (String)mydr["Ver_POR_51"];
            lab_Ver_POR_52.Text = (String)mydr["Ver_POR_52"];
            lab_Ver_POR_53.Text = (String)mydr["Ver_POR_53"];
            lab_Ver_POR_54.Text = (String)mydr["Ver_POR_54"];
            lab_Ver_POR_55.Text = (String)mydr["Ver_POR_55"];
            lab_Ver_POR_56.Text = (String)mydr["Ver_POR_56"];
            lab_Ver_POR_57.Text = (String)mydr["Ver_POR_57"];
            lab_Ver_POR_58.Text = (String)mydr["Ver_POR_58"];
            lab_Ver_POR_59.Text = (String)mydr["Ver_POR_59"];
            lab_Ver_POR_60.Text = (String)mydr["Ver_POR_60"];
            lab_Ver_POR_61.Text = (String)mydr["Ver_POR_61"];
            lab_Ver_POR_62.Text = (String)mydr["Ver_POR_62"];
            lab_Ver_POR_63.Text = (String)mydr["Ver_POR_63"];
            lab_Ver_POR_64.Text = (String)mydr["Ver_POR_64"];
            lab_Ver_POR_65.Text = (String)mydr["Ver_POR_65"];

        }



    }

    protected void display_NewDevice_data(string sql_eptramain)
    {

        clsMySQL db = new clsMySQL();

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql_eptramain, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();




        while (mydr.Read())
        {

            lab_Ver_New_2.Text = (String)mydr["Ver_New_2"];
            lab_Ver_New_3.Text = (String)mydr["Ver_New_3"];
            lab_Ver_New_4.Text = (String)mydr["Ver_New_4"];
            lab_Ver_New_5.Text = (String)mydr["Ver_New_5"];
            lab_Ver_New_6.Text = (String)mydr["Ver_New_6"];
            lab_Ver_New_7.Text = (String)mydr["Ver_New_7"];
            lab_Ver_New_8.Text = (String)mydr["Ver_New_8"];
            lab_Ver_New_9.Text = (String)mydr["Ver_New_9"];
            lab_Ver_New_10.Text = (String)mydr["Ver_New_10"];
            lab_Ver_New_11.Text = (String)mydr["Ver_New_11"];
            lab_Ver_New_12.Text = (String)mydr["Ver_New_12"];
            lab_Ver_New_13.Text = (String)mydr["Ver_New_13"];
            lab_Ver_New_14.Text = (String)mydr["Ver_New_14"];
            lab_Ver_New_15.Text = (String)mydr["Ver_New_15"];
            lab_Ver_New_16.Text = (String)mydr["Ver_New_16"];
            lab_Ver_New_17.Text = (String)mydr["Ver_New_17"];
            lab_Ver_New_18.Text = (String)mydr["Ver_New_18"];
            lab_Ver_New_19.Text = (String)mydr["Ver_New_19"];
            lab_Ver_New_20.Text = (String)mydr["Ver_New_20"];
            lab_Ver_New_21.Text = (String)mydr["Ver_New_21"];
            lab_Ver_New_22.Text = (String)mydr["Ver_New_22"];
            lab_Ver_New_23.Text = (String)mydr["Ver_New_23"];
            lab_Ver_New_24.Text = (String)mydr["Ver_New_24"];
            lab_Ver_New_25.Text = (String)mydr["Ver_New_25"];
            lab_Ver_New_26.Text = (String)mydr["Ver_New_26"];
            lab_Ver_New_27.Text = (String)mydr["Ver_New_27"];
            lab_Ver_New_28.Text = (String)mydr["Ver_New_28"];
            lab_Ver_New_29.Text = (String)mydr["Ver_New_29"];
            lab_Ver_New_30.Text = (String)mydr["Ver_New_30"];
            lab_Ver_New_31.Text = (String)mydr["Ver_New_31"];
            lab_Ver_New_32.Text = (String)mydr["Ver_New_32"];
            lab_Ver_New_33.Text = (String)mydr["Ver_New_33"];
            lab_Ver_New_34.Text = (String)mydr["Ver_New_34"];
            lab_Ver_New_35.Text = (String)mydr["Ver_New_35"];
            lab_Ver_New_36.Text = (String)mydr["Ver_New_36"];
            lab_Ver_New_37.Text = (String)mydr["Ver_New_37"];
            lab_Ver_New_38.Text = (String)mydr["Ver_New_38"];
            lab_Ver_New_39.Text = (String)mydr["Ver_New_39"];
            lab_Ver_New_40.Text = (String)mydr["Ver_New_40"];
            lab_Ver_New_41.Text = (String)mydr["Ver_New_41"];
            lab_Ver_New_42.Text = (String)mydr["Ver_New_42"];
            lab_Ver_New_43.Text = (String)mydr["Ver_New_43"];
            lab_Ver_New_44.Text = (String)mydr["Ver_New_44"];
            lab_Ver_New_45.Text = (String)mydr["Ver_New_45"];
            lab_Ver_New_46.Text = (String)mydr["Ver_New_46"];
            lab_Ver_New_47.Text = (String)mydr["Ver_New_47"];
            lab_Ver_New_48.Text = (String)mydr["Ver_New_48"];
            lab_Ver_New_49.Text = (String)mydr["Ver_New_49"];
            lab_Ver_New_50.Text = (String)mydr["Ver_New_50"];
            lab_Ver_New_51.Text = (String)mydr["Ver_New_51"];
            lab_Ver_New_52.Text = (String)mydr["Ver_New_52"];
            lab_Ver_New_53.Text = (String)mydr["Ver_New_53"];
            lab_Ver_New_54.Text = (String)mydr["Ver_New_54"];
            lab_Ver_New_55.Text = (String)mydr["Ver_New_55"];
            lab_Ver_New_56.Text = (String)mydr["Ver_New_56"];
            lab_Ver_New_57.Text = (String)mydr["Ver_New_57"];
            lab_Ver_New_58.Text = (String)mydr["Ver_New_58"];
            lab_Ver_New_59.Text = (String)mydr["Ver_New_59"];
            lab_Ver_New_60.Text = (String)mydr["Ver_New_60"];
            lab_Ver_New_61.Text = (String)mydr["Ver_New_61"];
            lab_Ver_New_62.Text = (String)mydr["Ver_New_62"];
            lab_Ver_New_63.Text = (String)mydr["Ver_New_63"];
            lab_Ver_New_64.Text = (String)mydr["Ver_New_64"];
            lab_Ver_New_65.Text = (String)mydr["Ver_New_65"];
        }
        //MySqlConn.Close();
        //db.Close();

    }

    protected void display_gap_data(string sql_eptramain)
    {

        clsMySQL db = new clsMySQL();

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql_eptramain, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();




        while (mydr.Read())
        {
            lab_gap2.Text = (String)mydr["Ver_Gap2"];
            lab_gap3.Text = (String)mydr["Ver_Gap3"];
            lab_gap4.Text = (String)mydr["Ver_Gap4"];
            lab_gap5.Text = (String)mydr["Ver_Gap5"];
            lab_gap6.Text = (String)mydr["Ver_Gap6"];
            lab_gap7.Text = (String)mydr["Ver_Gap7"];
            lab_gap8.Text = (String)mydr["Ver_Gap8"];
            lab_gap9.Text = (String)mydr["Ver_Gap9"];
            lab_gap10.Text = (String)mydr["Ver_Gap10"];
            lab_gap11.Text = (String)mydr["Ver_Gap11"];
            lab_gap12.Text = (String)mydr["Ver_Gap12"];
            lab_gap13.Text = (String)mydr["Ver_Gap13"];
            lab_gap14.Text = (String)mydr["Ver_Gap14"];
            lab_gap15.Text = (String)mydr["Ver_Gap15"];
            lab_gap16.Text = (String)mydr["Ver_Gap16"];
            lab_gap17.Text = (String)mydr["Ver_Gap17"];
            lab_gap18.Text = (String)mydr["Ver_Gap18"];
            lab_gap19.Text = (String)mydr["Ver_Gap19"];
            lab_gap20.Text = (String)mydr["Ver_Gap20"];
            lab_gap21.Text = (String)mydr["Ver_Gap21"];
            lab_gap22.Text = (String)mydr["Ver_Gap22"];
            lab_gap23.Text = (String)mydr["Ver_Gap23"];
            lab_gap24.Text = (String)mydr["Ver_Gap24"];
            lab_gap25.Text = (String)mydr["Ver_Gap25"];
            lab_gap26.Text = (String)mydr["Ver_Gap26"];
            lab_gap27.Text = (String)mydr["Ver_Gap27"];
            lab_gap28.Text = (String)mydr["Ver_Gap28"];
            lab_gap29.Text = (String)mydr["Ver_Gap29"];
            lab_gap30.Text = (String)mydr["Ver_Gap30"];
            lab_gap31.Text = (String)mydr["Ver_Gap31"];
            lab_gap32.Text = (String)mydr["Ver_Gap32"];
            lab_gap33.Text = (String)mydr["Ver_Gap33"];
            lab_gap34.Text = (String)mydr["Ver_Gap34"];
            lab_gap35.Text = (String)mydr["Ver_Gap35"];
            lab_gap36.Text = (String)mydr["Ver_Gap36"];
            lab_gap37.Text = (String)mydr["Ver_Gap37"];
            lab_gap38.Text = (String)mydr["Ver_Gap38"];
            lab_gap39.Text = (String)mydr["Ver_Gap39"];
            lab_gap40.Text = (String)mydr["Ver_Gap40"];
            lab_gap41.Text = (String)mydr["Ver_Gap41"];
            lab_gap42.Text = (String)mydr["Ver_Gap42"];
            lab_gap43.Text = (String)mydr["Ver_Gap43"];
            lab_gap44.Text = (String)mydr["Ver_Gap44"];
            lab_gap45.Text = (String)mydr["Ver_Gap45"];
            lab_gap46.Text = (String)mydr["Ver_Gap46"];
            lab_gap47.Text = (String)mydr["Ver_Gap47"];
            lab_gap48.Text = (String)mydr["Ver_Gap48"];
            lab_gap49.Text = (String)mydr["Ver_Gap49"];
            lab_gap50.Text = (String)mydr["Ver_Gap50"];
            lab_gap51.Text = (String)mydr["Ver_Gap51"];
            lab_gap52.Text = (String)mydr["Ver_Gap52"];
            lab_gap53.Text = (String)mydr["Ver_Gap53"];
            lab_gap54.Text = (String)mydr["Ver_Gap54"];
            lab_gap55.Text = (String)mydr["Ver_Gap55"];
            lab_gap56.Text = (String)mydr["Ver_Gap56"];
            lab_gap57.Text = (String)mydr["Ver_Gap57"];
            lab_gap58.Text = (String)mydr["Ver_Gap58"];
            lab_gap59.Text = (String)mydr["Ver_Gap59"];
            lab_gap60.Text = (String)mydr["Ver_Gap60"];
            lab_gap61.Text = (String)mydr["Ver_Gap61"];
            lab_gap62.Text = (String)mydr["Ver_Gap62"];
            lab_gap63.Text = (String)mydr["Ver_Gap63"];
            lab_gap64.Text = (String)mydr["Ver_Gap64"];
            lab_gap65.Text = (String)mydr["Ver_Gap65"];






        }

        MySqlConn.Close();
        //db.Close();

    }


    protected int count_EffectLabel(string Key_item)
    {
        string sql = "select COUNT(DISTINCT EP_Cate_SpeChar) from npi_ep_category where EP_Cate_Iiitems='" + Key_item + "'";
        int temp=0;

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read()) {
            temp = Convert.ToInt32(mydr["COUNT(DISTINCT EP_Cate_SpeChar)"]);
        }

        mydr.Close();
        MySqlConn.Close();
        

        return temp;


    }

    protected int count_Effectstage(string Key_item)
    {
        string sql = "select COUNT(DISTINCT EP_Cate_Stage) from npi_ep_category where EP_Cate_Iiitems='" + Key_item + "'";
        int temp = 0;

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            temp = Convert.ToInt32(mydr["COUNT(DISTINCT EP_Cate_Stage)"]);
        }

        mydr.Close();
        MySqlConn.Close();


        return temp;


    }


    protected int count_EffectLabel_stage(string Key_item,string stage)
    {
        string sql = "select COUNT(DISTINCT EP_Cate_SpeChar) from npi_ep_category where EP_Cate_Iiitems='" + Key_item + "'and EP_Cate_Stage='" + stage + "'";
        int temp = 0;

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            temp = Convert.ToInt32(mydr["COUNT(DISTINCT EP_Cate_SpeChar)"]);
        }

        mydr.Close();
        MySqlConn.Close();


        return temp;


    }



    protected string display_Effectstage(string Key_item, int temp_num=0)
    {
        string sql = "select DISTINCT EP_Cate_Stage from npi_ep_category where EP_Cate_Iiitems='" + Key_item + "'";
        string temp;
        List<string> temp_effect = new List<string>();
        //temp_num = 0;

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            temp_effect.Add(Convert.ToString(mydr["EP_Cate_Stage"]));
        }

        mydr.Close();
        MySqlConn.Close();


        return temp_effect[temp_num];

    }



    protected string display_EffectLabel(string Key_item,string stage, int temp_num=0)
    {
        string sql = "select DISTINCT EP_Cate_SpeChar from npi_ep_category where EP_Cate_Iiitems='" + Key_item + "' and EP_Cate_Stage='"+stage+"'";
        string temp;
        List<string> temp_effect = new List<string>();
        

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            temp_effect.Add(Convert.ToString(mydr["EP_Cate_SpeChar"]));
        }

        mydr.Close();
        MySqlConn.Close();


        return temp_effect[temp_num];

    }

    protected Boolean jude_keyitem(string keyitem)
    {

        string sql = "select DISTINCT EP_Cate_Stage from npi_ep_category where EP_Cate_Iiitems='" + keyitem + "'";
        string temp = "";


        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            temp = mydr["EP_Cate_Stage"].ToString();
        }

        mydr.Close();
        MySqlConn.Close();


        if (temp !="")
            return true;
        else
            return false;



    }


    protected void keyitem_put_data(Panel temp_stage,Panel temp_pot,Label lab_stage,Label lab_pot,string keyitem)
    {
       
        List<int> b = new List<int>(); // 存放count_EffectLabel_stage 值
        int a = count_Effectstage(keyitem);
        //int b = count_EffectLabel(keyitem);
        string temp_effect_name = "";
        string temp_pot_name = "";
        string br = "";

        if (jude_keyitem(keyitem) == true)
        {
            for (int i = 0; i < a; i++)
            {
                Label effect = new Label();

                temp_effect_name = display_Effectstage(keyitem, i);
                effect.ID = "stage_" + temp_effect_name + i;
                b.Add(count_EffectLabel_stage(keyitem, temp_effect_name));

                for (int j = 0; j < b[i] + 1; j++)
                {
                    br += "<br />";
                }
                effect.Text = temp_effect_name + br;

                //olbtn.Click += new EventHandler(lbtn_Click); 促發Click事件
                //Controls.Add(stage);
                temp_stage.Controls.Add(effect);
                br = "";


                for (int k = 0; k < b[i]; k++)
                {
                    Label Potential = new Label();
                    temp_pot_name = display_EffectLabel(keyitem, temp_effect_name, k);
                    Potential.ID = "Potential_" + temp_pot_name + k;

                    Potential.Text = temp_pot_name + "<br />";

                    if (b[i] - 1 == k)
                    {
                        Potential.Text += "<br />";
                    }

                    //olbtn.Click += new EventHandler(lbtn_Click); 促發Click事件
                    //Controls.Add(stage);
                    temp_pot.Controls.Add(Potential);

                }
            }

        }
        else
        {
            lab_stage.Text = "NULL!";
            lab_pot.Text = "NULL!";


        }


    }


    


    protected void gap_compare()
    {

        put_effect_data();
        put_potential_data();
        if (lab_gap1.Text == "Y")
        {
            lab_Eff_01.Text = "--";
            lab_Pot_01.Text = "--";
        }
        else
        {
            lab_Eff_01.Text = "--";
            lab_Pot_01.Text = "--";
        }
        if (lab_gap2.Text == "Y")
        {
            lab_Eff_01.Text = "--";
            lab_Pot_01.Text = "--";
        }
        else
        {
            lab_Eff_01.Text = "--";
            lab_Pot_01.Text = "--";
        }
        if (lab_gap3.Text == "Y")
        {
            lab_Eff_01.Text = "--";
            lab_Pot_01.Text = "--";
        }
        else
        {
            lab_Eff_01.Text = "--";
            lab_Pot_01.Text = "--";
        }
        if (lab_gap4.Text == "Y")
        {
            lab_gap4.Text = "Y";
            lab_gap4.ForeColor = System.Drawing.Color.Red;

            keyitem_put_data(Panel_Eff_04, Panel_Pot_04,lab_Eff_04,lab_Pot_04,Lab_keyitem_04.Text);
             

        }
        else
        {
            lab_gap4.Text = "N";
            lab_gap4.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_04.Text = "--";
            lab_Pot_04.Text = "--";
        }

        if (lab_gap5.Text == "Y")
        {
            lab_gap5.Text = "Y";
            lab_gap5.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_05, Panel_Pot_05, lab_Eff_05, lab_Pot_05, Lab_keyitem_05.Text);
        }
        else
        {
            lab_gap5.Text = "N";
            lab_gap5.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_05.Text = "--";
            lab_Pot_05.Text = "--";
        }

        if (lab_gap6.Text == "Y")
        {
            lab_gap6.Text = "Y";
            lab_gap6.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_06, Panel_Pot_06, lab_Eff_06, lab_Pot_06, Lab_keyitem_06.Text);
        }
        else
        {
            lab_gap6.Text = "N";
            lab_gap6.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_06.Text = "--";
            lab_Pot_06.Text = "--";
        }
        if (lab_gap7.Text == "Y")
        {
            lab_gap7.Text = "Y";
            lab_gap7.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_07, Panel_Pot_07, lab_Eff_07, lab_Pot_07, Lab_keyitem_07.Text);
        }
        else
        {
            lab_gap7.Text = "N";
            lab_gap7.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_07.Text = "--";
            lab_Pot_07.Text = "--";
        }
        if (lab_gap8.Text == "Y")
        {
            lab_gap8.Text = "Y";
            lab_gap8.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_08, Panel_Pot_08, lab_Eff_08, lab_Pot_08, Lab_keyitem_08.Text);
        }
        else
        {
            lab_gap8.Text = "N";
            lab_gap8.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_08.Text = "--";
            lab_Pot_08.Text = "--";
        }
        if (lab_gap9.Text == "Y")
        {
            lab_gap9.Text = "Y";
            lab_gap9.ForeColor = System.Drawing.Color.Red;

            keyitem_put_data(Panel_Eff_09, Panel_Pot_09, lab_Eff_09, lab_Pot_09, Lab_keyitem_09.Text);
        }
        else
        {
            lab_gap9.Text = "N";
            lab_gap9.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_09.Text = "--";
            lab_Pot_09.Text = "--";
        }
        if (lab_gap10.Text == "Y")
        {
            lab_gap10.Text = "Y";
            lab_gap10.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_10, Panel_Pot_10, lab_Eff_10, lab_Pot_10, Lab_keyitem_10.Text);
        }
        else
        {
            lab_gap10.Text = "N";
            lab_gap10.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_10.Text = "--";
            lab_Pot_10.Text = "--";
        }
        if (lab_gap11.Text == "Y")
        {
            lab_gap11.Text = "Y";
            lab_gap11.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_11, Panel_Pot_11, lab_Eff_11, lab_Pot_11, Lab_keyitem_11.Text);
        }
        else
        {
            lab_gap11.Text = "N";
            lab_gap11.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_11.Text = "--";
            lab_Pot_11.Text = "--";
        }
        if (lab_gap12.Text == "Y")
        {
            lab_gap12.Text = "Y";
            lab_gap12.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_12, Panel_Pot_12, lab_Eff_12, lab_Pot_12, Lab_keyitem_12.Text);
        }
        else
        {
            lab_gap12.Text = "N";
            lab_gap12.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_12.Text = "--";
            lab_Pot_12.Text = "--";
        }
        if (lab_gap13.Text == "Y")
        {
            lab_gap13.Text = "Y";
            lab_gap13.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_13, Panel_Pot_13, lab_Eff_13, lab_Pot_13, Lab_keyitem_13.Text);
        }
        else
        {
            lab_gap13.Text = "N";
            lab_gap13.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_13.Text = "--";
            lab_Pot_13.Text = "--";
        }

        if (lab_gap14.Text == "Y")
        {
            lab_gap14.Text = "Y";
            lab_gap14.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_14, Panel_Pot_14, lab_Eff_14, lab_Pot_14, Lab_keyitem_14.Text);
        }
        else
        {
            lab_gap14.Text = "N";
            lab_gap14.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_14.Text = "--";
            lab_Pot_14.Text = "--";
        }
        if (lab_gap15.Text == "Y")
        {
            lab_gap15.Text = "Y";
            lab_gap15.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_15, Panel_Pot_15, lab_Eff_15, lab_Pot_15, Lab_keyitem_15.Text);
        }
        else
        {
            lab_gap15.Text = "N";
            lab_gap15.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_15.Text = "--";
            lab_Pot_15.Text = "--";
        }
        if (lab_gap16.Text == "Y")
        {
            lab_gap16.Text = "Y";
            lab_gap16.ForeColor = System.Drawing.Color.Red;
            ///PI Thickness (um)
            keyitem_put_data(Panel_Eff_16, Panel_Pot_16,lab_Eff_16,lab_Pot_16, Lab_keyitem_16.Text);

        }
        else
        {
            lab_gap16.Text = "N";
            lab_gap16.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_16.Text = "--";
            lab_Pot_16.Text = "--";
        }

        if (lab_gap17.Text == "Y")
        {
            lab_gap17.Text = "Y";
            lab_gap17.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_17, Panel_Pot_17, lab_Eff_17, lab_Pot_17, Lab_keyitem_17.Text);
        }
        else
        {
            lab_gap17.Text = "N";
            lab_gap17.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_17.Text = "--";
            lab_Pot_17.Text = "--";
        }

        if (lab_gap18.Text == "Y")
        {
            lab_gap18.Text = "Y";
            lab_gap18.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_18, Panel_Pot_18, lab_Eff_18, lab_Pot_18, Lab_keyitem_18.Text);
        }
        else
        {
            lab_gap18.Text = "N";
            lab_gap18.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_18.Text = "--";
            lab_Pot_18.Text = "--";
        }

        if (lab_gap19.Text == "Y")
        {
            lab_gap19.Text = "Y";
            lab_gap19.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_19, Panel_Pot_19, lab_Eff_19, lab_Pot_19, Lab_keyitem_19.Text);
        }

        else
        {
            lab_gap19.Text = "N";
            lab_gap19.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_19.Text = "--";
            lab_Pot_19.Text = "--";
        }

        if (lab_gap20.Text == "Y")
        {
            lab_gap20.Text = "Y";
            lab_gap20.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_20, Panel_Pot_20, lab_Eff_20, lab_Pot_20, Lab_keyitem_20.Text);
        }
        else
        {
            lab_gap20.Text = "N";
            lab_gap20.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_20.Text = "--";
            lab_Pot_20.Text = "--";
        }

        if (lab_gap21.Text == "Y")
        {
            lab_gap21.Text = "Y";
            lab_gap21.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_21, Panel_Pot_21, lab_Eff_21, lab_Pot_21, Lab_keyitem_21.Text);
        }
        else
        {
            lab_gap21.Text = "N";
            lab_gap21.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_21.Text = "--";
            lab_Pot_21.Text = "--";
        }

        if (lab_gap22.Text == "Y")
        {
            lab_gap22.Text = "Y";
            lab_gap22.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_22, Panel_Pot_22, lab_Eff_22, lab_Pot_22, Lab_keyitem_22.Text);
        }
        else
        {
            lab_gap22.Text = "N";
            lab_gap22.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_22.Text = "--";
            lab_Pot_22.Text = "--";
        }

        if (lab_gap23.Text == "Y")
        {
            lab_gap23.Text = "Y";
            lab_gap23.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_23, Panel_Pot_23, lab_Eff_23, lab_Pot_23, Lab_keyitem_23.Text);
        }
        else
        {
            lab_gap23.Text = "N";
            lab_gap23.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_23.Text = "--";
            lab_Pot_23.Text = "--";
        }
        if (lab_gap24.Text == "Y")
        {
            lab_gap24.Text = "Y";
            lab_gap24.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_24, Panel_Pot_24, lab_Eff_24, lab_Pot_24, Lab_keyitem_24.Text);
        }
        else
        {
            lab_gap24.Text = "N";
            lab_gap24.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_24.Text = "--";
            lab_Pot_24.Text = "--";
        }

        if (lab_gap25.Text == "Y")
        {
            lab_gap25.Text = "Y";
            lab_gap25.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_25, Panel_Pot_25, lab_Eff_25, lab_Pot_25, Lab_keyitem_25.Text);
        }
        else
        {
            lab_gap25.Text = "N";
            lab_gap25.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_25.Text = "--";
            lab_Pot_25.Text = "--";
        }

        if (lab_gap26.Text == "Y")
        {
            lab_gap26.Text = "Y";
            lab_gap26.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_26, Panel_Pot_26, lab_Eff_26, lab_Pot_26, Lab_keyitem_26.Text);
        }
        else
        {
            lab_gap26.Text = "N";
            lab_gap26.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_26.Text = "--";
            lab_Pot_26.Text = "--";
        }

        if (lab_gap27.Text == "Y")
        {
            lab_gap27.Text = "Y";
            lab_gap27.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_27, Panel_Pot_27, lab_Eff_27, lab_Pot_27, Lab_keyitem_27.Text);

        }
        else
        {
            lab_gap27.Text = "N";
            lab_gap27.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_27.Text = "--";
            lab_Pot_27.Text = "--";
        }

        if (lab_gap28.Text == "Y")
        {
            lab_gap28.Text = "Y";
            lab_gap28.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_28, Panel_Pot_28, lab_Eff_28, lab_Pot_28, Lab_keyitem_28.Text);
        }
        else
        {
            lab_gap28.Text = "N";
            lab_gap28.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_28.Text = "--";
            lab_Pot_28.Text = "--";
        }

        if (lab_gap29.Text == "Y")
        {
            lab_gap29.Text = "Y";
            lab_gap29.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_29, Panel_Pot_29, lab_Eff_29, lab_Pot_29, Lab_keyitem_29.Text);
        }
        else
        {
            lab_gap29.Text = "N";
            lab_gap29.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_29.Text = "--";
            lab_Pot_29.Text = "--";
        }

        if (lab_gap30.Text == "Y")
        {
            lab_gap30.Text = "Y";
            lab_gap30.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_30, Panel_Pot_30, lab_Eff_30, lab_Pot_30, Lab_keyitem_30.Text);
        }
        else
        {
            lab_gap30.Text = "N";
            lab_gap30.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_30.Text = "--";
            lab_Pot_30.Text = "--";
        }

        if (lab_gap31.Text == "Y")
        {
            lab_gap31.Text = "Y";
            lab_gap31.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_31, Panel_Pot_31, lab_Eff_31, lab_Pot_31, Lab_keyitem_31.Text);
        }
        else
        {
            lab_gap31.Text = "N";
            lab_gap31.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_31.Text = "--";
            lab_Pot_31.Text = "--";
        }

        if (lab_gap32.Text == "Y")
        {
            lab_gap32.Text = "Y";
            lab_gap32.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_32, Panel_Pot_32, lab_Eff_32, lab_Pot_32, Lab_keyitem_32.Text);
        }
        else
        {
            lab_gap32.Text = "N";
            lab_gap32.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_32.Text = "--";
            lab_Pot_32.Text = "--";
        }

        if (lab_gap33.Text == "Y")
        {
            lab_gap33.Text = "Y";
            lab_gap33.ForeColor = System.Drawing.Color.Red;
            lab_Eff_33.Text = "--";
            lab_Pot_33.Text = "--";
        }
        else
        {
            lab_gap33.Text = "N";
            lab_gap33.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_33.Text = "--";
            lab_Pot_33.Text = "--";
        }

        if (lab_gap34.Text == "Y")
        {
            lab_gap34.Text = "Y";
            lab_gap34.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_34, Panel_Pot_34, lab_Eff_34, lab_Pot_34, Lab_keyitem_34.Text);
        }
        else
        {
            lab_gap34.Text = "N";
            lab_gap34.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_34.Text = "--";
            lab_Pot_34.Text = "--";
        }

        if (lab_gap35.Text == "Y")
        {
            lab_gap35.Text = "Y";
            lab_gap35.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_35, Panel_Pot_35, lab_Eff_35, lab_Pot_35, Lab_keyitem_35.Text);
        }
        else
        {
            lab_gap35.Text = "N";
            lab_gap35.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_35.Text = "--";
            lab_Pot_35.Text = "--";
        }

        if (lab_gap36.Text == "Y")
        {
            lab_gap36.Text = "Y";
            lab_gap36.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_36, Panel_Pot_36, lab_Eff_36, lab_Pot_36, Lab_keyitem_36.Text);
        }
        else
        {
            lab_gap36.Text = "N";
            lab_gap36.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_36.Text = "--";
            lab_Pot_36.Text = "--";
        }

        if (lab_gap37.Text == "Y")
        {
            lab_gap37.Text = "Y";
            lab_gap37.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_37, Panel_Pot_37, lab_Eff_37, lab_Pot_37, Lab_keyitem_37.Text);
        }
        else
        {
            lab_gap37.Text = "N";
            lab_gap37.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_37.Text = "--";
            lab_Pot_37.Text = "--";
        }

        if (lab_gap38.Text == "Y")
        {
            lab_gap38.Text = "Y";
            lab_gap38.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_38, Panel_Pot_38, lab_Eff_38, lab_Pot_38, Lab_keyitem_38.Text);
        }
        else
        {
            lab_gap38.Text = "N";
            lab_gap38.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_38.Text = "--";
            lab_Pot_38.Text = "--";
        }

        if (lab_gap39.Text == "Y")
        {
            lab_gap39.Text = "Y";
            lab_gap39.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_39, Panel_Pot_39, lab_Eff_39, lab_Pot_39, Lab_keyitem_39.Text);
        }
        else
        {
            lab_gap39.Text = "N";
            lab_gap39.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_39.Text = "--";
            lab_Pot_39.Text = "--";
        }


        if (lab_gap40.Text == "Y")
        {
            lab_gap40.Text = "Y";
            lab_gap40.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_40, Panel_Pot_40, lab_Eff_40, lab_Pot_40, Lab_keyitem_40.Text);
        }
        else
        {
            lab_gap40.Text = "N";
            lab_gap40.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_40.Text = "--";
            lab_Pot_40.Text = "--";
        }


        if (lab_gap41.Text == "Y")
        {
            lab_gap41.Text = "Y";
            lab_gap41.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_41, Panel_Pot_41, lab_Eff_41, lab_Pot_41, Lab_keyitem_41.Text);
        }
        else
        {

            lab_gap41.Text = "N";
            lab_gap41.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_41.Text = "--";
            lab_Pot_41.Text = "--";
        }

        if (lab_gap42.Text == "Y")
        {
            lab_gap42.Text = "Y";
            lab_gap42.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_42, Panel_Pot_42, lab_Eff_42, lab_Pot_42, Lab_keyitem_42.Text);
        }
        else
        {
            lab_gap42.Text = "N";
            lab_gap42.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_42.Text = "--";
            lab_Pot_42.Text = "--";
        }

        if (lab_gap43.Text == "Y")
        {
            lab_gap43.Text = "Y";
            lab_gap43.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_43, Panel_Pot_43, lab_Eff_43, lab_Pot_43, Lab_keyitem_43.Text);
        }
        else
        {
            lab_gap43.Text = "N";
            lab_gap43.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_43.Text = "--";
            lab_Pot_43.Text = "--";
        }

        if (lab_gap44.Text == "Y")
        {
            lab_gap44.Text = "Y";
            lab_gap44.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_44, Panel_Pot_44, lab_Eff_44, lab_Pot_44, Lab_keyitem_44.Text);
        }
        else
        {
            lab_gap44.Text = "N";
            lab_gap44.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_44.Text = "--";
            lab_Pot_44.Text = "--";
        }

        if (lab_gap45.Text == "Y")
        {
            lab_gap45.Text = "Y";
            lab_gap45.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_45, Panel_Pot_45, lab_Eff_45, lab_Pot_45, Lab_keyitem_44.Text);
        }
        else
        {
            lab_gap45.Text = "N";
            lab_gap45.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_45.Text = "--";
            lab_Pot_45.Text = "--";
        }

        if (lab_gap46.Text == "Y")
        {
            lab_gap46.Text = "Y";
            lab_gap46.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_46, Panel_Pot_46, lab_Eff_46, lab_Pot_46, Lab_keyitem_44.Text);
        }
        else
        {
            lab_gap46.Text = "N";
            lab_gap46.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_46.Text = "--";
            lab_Pot_46.Text = "--";
        }


        if (lab_gap47.Text == "Y")
        {
            lab_gap47.Text = "Y";
            lab_gap47.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_47, Panel_Pot_47, lab_Eff_47, lab_Pot_47, Lab_keyitem_44.Text);
        }
        else
        {
            lab_gap47.Text = "N";
            lab_gap47.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_47.Text = "--";
            lab_Pot_47.Text = "--";

        }

        if (lab_gap48.Text == "Y")
        {
            lab_gap48.Text = "Y";
            lab_gap48.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_48, Panel_Pot_48, lab_Eff_48, lab_Pot_48, Lab_keyitem_44.Text);
        }
        else
        {
            lab_gap48.Text = "N";
            lab_gap48.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_48.Text = "--";
            lab_Pot_48.Text = "--";
        }

        if (lab_gap49.Text == "Y")
        {
            lab_gap49.Text = "Y";
            lab_gap49.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_49, Panel_Pot_49, lab_Eff_49, lab_Pot_49, Lab_keyitem_44.Text);
        }
        else
        {
            lab_gap49.Text = "N";
            lab_gap49.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_49.Text = "--";
            lab_Pot_49.Text = "--";
        }






        if (lab_gap51.Text == "Y")
        {
            lab_gap51.Text = "Y";
            lab_gap51.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_51, Panel_Pot_51, lab_Eff_51, lab_Pot_51, Lab_keyitem_45.Text);
        }
        else
        {
            lab_gap51.Text = "N";
            lab_gap51.ForeColor = System.Drawing.Color.Blue;
            lab_Pot_51.Text = "--";
            lab_Eff_51.Text = "--";
        }

        if (lab_gap52.Text == "Y")
        {
            lab_gap52.Text = "Y";
            lab_gap52.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_52, Panel_Pot_52, lab_Eff_52, lab_Pot_52, Lab_keyitem_45.Text);
        }
        else
        {
            lab_gap52.Text = "N";
            lab_gap52.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_52.Text = "--";
            lab_Pot_52.Text = "--";
        }

        if (lab_gap53.Text == "Y")
        {
            lab_gap53.Text = "Y";
            lab_gap53.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_53, Panel_Pot_53, lab_Eff_53, lab_Pot_53, Lab_keyitem_45.Text);
        }
        else
        {
            lab_gap53.Text = "N";
            lab_gap53.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_53.Text = "--";
            lab_Pot_53.Text = "--";
        }

        if (lab_gap54.Text == "Y")
        {
            lab_gap54.Text = "Y";
            lab_gap54.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_54, Panel_Pot_54, lab_Eff_54, lab_Pot_54, Lab_keyitem_45.Text);
        }
        else
        {
            lab_gap54.Text = "N";
            lab_gap54.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_54.Text = "--";
            lab_Pot_54.Text = "--";
        }

        if (lab_gap55.Text == "Y")
        {
            lab_gap55.Text = "Y";
            lab_gap55.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_55, Panel_Pot_55, lab_Eff_55, lab_Pot_55, Lab_keyitem_46.Text);
        }
        else
        {
            lab_gap55.Text = "N";
            lab_gap55.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_55.Text = "--";
            lab_Pot_55.Text = "--";
        }

        if (lab_gap56.Text == "Y")
        {
            lab_gap56.Text = "Y";
            lab_gap56.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_56, Panel_Pot_56, lab_Eff_56, lab_Pot_56, Lab_keyitem_47.Text);
        }
        else
        {
            lab_gap56.Text = "N";
            lab_gap56.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_56.Text = "--";
            lab_Pot_56.Text = "--";
        }

        if (lab_gap57.Text == "Y")
        {
            lab_gap57.Text = "Y";
            lab_gap57.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_57, Panel_Pot_57, lab_Eff_57, lab_Pot_57, Lab_keyitem_48.Text);
        }
        else
        {
            lab_gap57.Text = "N";
            lab_gap57.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_57.Text = "--";
            lab_Pot_57.Text = "--";
        }

        if (lab_gap58.Text == "Y")
        {
            lab_gap58.Text = "Y";
            lab_gap58.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_58, Panel_Pot_58, lab_Eff_58, lab_Pot_58, Lab_keyitem_49.Text);
        }
        else
        {
            lab_gap58.Text = "N";
            lab_gap58.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_58.Text = "--";
            lab_Pot_58.Text = "--";
        }


        if (lab_gap59.Text == "Y")
        {
            lab_gap59.Text = "Y";
            lab_gap59.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_59, Panel_Pot_59, lab_Eff_59, lab_Pot_59, Lab_keyitem_59.Text);
        }
        else
        {
            lab_gap59.Text = "N";
            lab_gap59.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_59.Text = "--";
            lab_Pot_59.Text = "--";
        }


        if (lab_gap60.Text == "Y")
        {
            lab_gap60.Text = "Y";
            lab_gap60.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_60, Panel_Pot_60, lab_Eff_60, lab_Pot_60, Lab_keyitem_60.Text);
        }
        else
        {
            lab_gap60.Text = "N";
            lab_gap60.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_60.Text = "--";
            lab_Pot_60.Text = "--";
        }

        if (lab_gap61.Text == "Y")
        {
            lab_gap61.Text = "Y";
            lab_gap61.ForeColor = System.Drawing.Color.Red;
            keyitem_put_data(Panel_Eff_61, Panel_Pot_61, lab_Eff_61, lab_Pot_61, Lab_keyitem_61.Text);
        }
        else
        {
            lab_gap61.Text = "N";
            lab_gap61.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_61.Text = "--";
            lab_Pot_61.Text = "--";
        }

        if (lab_gap62.Text == "Y")
        {
            lab_gap62.Text = "Y";
            lab_gap62.ForeColor = System.Drawing.Color.Red;
            lab_Eff_62.Text = "--";
            lab_Pot_62.Text = "--";
        }
        else
        {
            lab_gap62.Text = "N";
            lab_gap62.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_62.Text = "--";
            lab_Pot_62.Text = "--";
        }

        if (lab_gap63.Text == "Y")
        {
            lab_gap63.Text = "Y";
            lab_gap63.ForeColor = System.Drawing.Color.Red;
            lab_Eff_63.Text = "--";
            lab_Pot_63.Text = "--";
        }
        else
        {
            lab_gap63.Text = "N";
            lab_gap63.ForeColor = System.Drawing.Color.Blue;
            lab_Pot_63.Text = "--";
            lab_Eff_63.Text = "--";
        }

        if (lab_gap64.Text == "Y")
        {
            lab_gap64.Text = "Y";
            lab_gap64.ForeColor = System.Drawing.Color.Red;
            lab_Eff_64.Text = "--";
            lab_Pot_64.Text = "--";
        }
        else
        {
            lab_gap64.Text = "N";
            lab_gap64.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_64.Text = "--";
            lab_Pot_64.Text = "--";
        }

        if (lab_gap65.Text == "Y")
        {
            lab_gap65.Text = "Y";
            lab_gap65.ForeColor = System.Drawing.Color.Red;
            lab_Eff_65.Text = "--";
            lab_Pot_65.Text = "--";
        }
        else
        {
            lab_gap65.Text = "N";
            lab_gap65.ForeColor = System.Drawing.Color.Blue;
            lab_Eff_65.Text = "--";
            lab_Pot_65.Text = "--";
        }

    }





    /*
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        int i = 0;
        index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selecteRow = GridView1.Rows[index];
        TableCell productName_Device = selecteRow.Cells[1];
        TableCell productName_Production_Site = selecteRow.Cells[2];
        TableCell productName_PKG = selecteRow.Cells[3];
        TableCell productName_Wafer = selecteRow.Cells[4];
        TableCell productName_fab = selecteRow.Cells[5];
        TableCell productWaferPSV = selecteRow.Cells[6];
        TableCell productRVSI = selecteRow.Cells[7];
        TableCell productCustomer = selecteRow.Cells[8];



        if (e.CommandName == "search")
        {


        

     

        }
    }
    */

    protected Boolean jude_Query_EPTRA(string sql)
    {
        string Temp_Cus = "";
        string Temp_New = "";
        clsMySQL db = new clsMySQL();

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            Temp_Cus = (String)mydr["Ver_New_Customer"];
            Temp_New = (String)mydr["Ver_New_Device"];

        }

        if (Temp_Cus == Customer_TB.Text && Temp_New == ND_TB.Text)
        {
            return true;
        }
        else
            return false;

    }




    protected void Search_Device_Eptra_table(object sender, EventArgs e)
    {
        int count = 0;
        string str_eptraver_main = "select * from npieptraver_main where Ver_New_Customer = '" + Customer_TB.Text + "'and Ver_New_Device= '" + ND_TB.Text + "' and Ver_Status ='" + DDList_Status.SelectedValue + "'";
        //string str_eptraver_main_count = "select count(Ver_No) from npieptraver_main where Ver_New_Customer = '" + Customer_TB.Text + "'and Ver_New_Device= '" + ND_TB.Text + "' and Ver_Status ='" + DDList_Status.SelectedValue + "'";
        // string str_eptraver_main = "select * from npieptraver_main where Ver_New_Customer = '" + Customer_TB.Text + "'and Ver_New_Device= '" + ND_TB.Text + "' and Ver_Status ='Enable'";
        count = count_eptramain();

        if (Customer_TB.Text.Trim() != "" && ND_TB.Text.Trim() == "")
        {
            string strScript = string.Format("<script language='javascript'>error_msg('您沒輸入New_Device條件,請重新輸入!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
        }
        else if (Customer_TB.Text.Trim() == "" && ND_TB.Text.Trim() != "")
        {

            string strScript = string.Format("<script language='javascript'>error_msg('您沒輸入New_Customer條件,請重新輸入!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);


        }
        else if (Customer_TB.Text.Trim() == "" && ND_TB.Text.Trim() == "")
        {

            string strScript = string.Format("<script language='javascript'>error_msg('您沒輸入New_Customer與New_Device條件,請重新輸入!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);


        }
        else if (jude_Query_EPTRA(str_eptraver_main) && count == 1)
        {

            /* Panel_EPTramain.Visible = true;
             receive_eptramain_data(str_eptraver_main);
             put_eptramain_data();
             */
            Panel_eptraview.Visible = true;
            clsMySQL db = new clsMySQL(); //Connection MySQL
            clsMySQL.DBReply dr = db.QueryDS(str_eptraver_main);
            GridView1.DataSource = dr.dsDataSet.Tables[0].DefaultView;
            GridView1.DataBind();
            db.Close();


        }
        else if (jude_Query_EPTRA(str_eptraver_main) && count > 1)
        {


            Panel_eptraview.Visible = true;
            clsMySQL db = new clsMySQL(); //Connection MySQL
            clsMySQL.DBReply dr = db.QueryDS(str_eptraver_main);
            GridView1.DataSource = dr.dsDataSet.Tables[0].DefaultView;
            GridView1.DataBind();
            db.Close();


        }

        else
        {
            
            string strScript = string.Format("<script language='javascript'>error_msg('無此版本!!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
        }




        /*
        clsMySQL db = new clsMySQL(); //Connection MySQL
        clsMySQL.DBReply dr = db.QueryDS(str_eptraver_main);
        GridView1.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GridView1.DataBind();
        db.Close();
        */
    }

    protected void Customer_TB_TextChanged(object sender, EventArgs e)
    {

    }

    protected void ND_TB_TextChanged1(object sender, EventArgs e)
    {

    }





    /*protected void Butt_Search_Eptra_click(object sender, EventArgs e)
    {
        Panel_EPTRA.Visible = true;
        string sql_porgodlen = "select * from npieptraver_por where Ver_Name='" + Lab_Ver.Text + "'";
        string sql_newdevice = "select * from npieptraver_new where Ver_Name='" + Lab_Ver.Text + "'";
        string sql_gap = "select * from npieptraver_gap where Ver_Name='" + Lab_Ver.Text + "'";

        display_PORGOlden_data(sql_porgodlen);
        display_NewDevice_data(sql_newdevice);
        display_gap_data(sql_gap);
        gap_compare();

    }
    */
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            

            TableCellCollection oldCell = e.Row.Cells;
            oldCell.Clear();//將原有的表頭格式移除
            e.Row.Visible = false;

            GridViewRow headRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

            TableCell head2Cell = new TableCell();
            head2Cell.Text = "";
           
            //head2Cell.BackColor = Color.White;
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            head2Cell.RowSpan = 2;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "Version_Information";
            head2Cell.Font.Size = FontUnit.Larger;
            head2Cell.Font.Bold = true;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0,102,255);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            head2Cell.ColumnSpan = 4 ;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

             head2Cell = new TableCell();
            head2Cell.Text = "POR_Golden";
            head2Cell.Width = Unit.Pixel(800);
            head2Cell.Font.Size = FontUnit.Larger;
            head2Cell.Font.Bold = true;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 60, 157);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            head2Cell.ColumnSpan = 8; ;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格


            head2Cell = new TableCell();
            head2Cell.Text = "New_Device";
           
            head2Cell.Font.Size = FontUnit.Larger;
            head2Cell.Font.Bold = true;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(37, 64, 97);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            head2Cell.ColumnSpan =2;
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            GridView1.Controls[0].Controls.Add(headRow);

            headRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

           /* head2Cell = new TableCell();
            head2Cell.Text = "";
            head2Cell.BackColor = Color.LightSteelBlue;
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
           // head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格
            */
            head2Cell = new TableCell();
            head2Cell.Text = "Version";
            head2Cell.Width = Unit.Pixel(600);
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 102, 255);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "Update_Time";
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 102, 255);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "User";
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 102, 255);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
           // head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "Status";
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 102, 255);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "Customer";
            head2Cell.Width = Unit.Pixel(100);
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 60, 157);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "Device";
            head2Cell.Width = Unit.Pixel(100);
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 60, 157);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "Site";
            head2Cell.Width = Unit.Pixel(100);
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 60, 157);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "PKG";
            head2Cell.Width = Unit.Pixel(400);
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 60, 157);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "WaferTech";
            head2Cell.Width = Unit.Pixel(100);
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 60, 157);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "FAB";
            head2Cell.Width = Unit.Pixel(100);
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 60, 157);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "PSV";
            head2Cell.Width = Unit.Pixel(100);
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 60, 157);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "RVSI";
            head2Cell.Width = Unit.Pixel(100);
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(0, 60, 157);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "Customer";

            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(37, 64, 97);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            head2Cell = new TableCell();
            head2Cell.Text = "Device";
            head2Cell.Font.Size = FontUnit.Large;
            head2Cell.ForeColor = Color.White;
            head2Cell.BackColor = System.Drawing.Color.FromArgb(37, 64, 97);
            head2Cell.HorizontalAlign = HorizontalAlign.Center;
            //head2Cell.ColumnSpan = 4;//所跨的欄數
            head2Cell.Wrap = false;
            headRow.Cells.Add(head2Cell);//新增自製的儲存格

            GridView1.Controls[0].Controls.Add(headRow);


        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        int i = 0;
        index = Convert.ToInt32(e.CommandArgument);
        GridViewRow selecteRow = GridView1.Rows[index];
        TableCell Version = selecteRow.Cells[1];
        TableCell Update_Time  = selecteRow.Cells[2];
        TableCell User = selecteRow.Cells[3];
        TableCell Status = selecteRow.Cells[4];
        TableCell Customer = selecteRow.Cells[5];
        TableCell Device = selecteRow.Cells[6];
        TableCell Site = selecteRow.Cells[7];
        TableCell PKG = selecteRow.Cells[8];
        TableCell WT = selecteRow.Cells[9];
        TableCell FAB = selecteRow.Cells[10];
        TableCell RVSI = selecteRow.Cells[11];
        TableCell New_Customer = selecteRow.Cells[12];
        TableCell New_Device = selecteRow.Cells[13];

        if (e.CommandName == "View")
        {
            string sql_porgodlen = "select * from npieptraver_por where Ver_Name='" + Version.Text + "'";
            string sql_newdevice = "select * from npieptraver_new where Ver_Name='" + Version.Text + "'";
            string sql_gap = "select * from npieptraver_gap where Ver_Name='" + Version.Text + "'";

            Panel_EPTRA.Visible = true;
            display_PORGOlden_data(sql_porgodlen);
            display_NewDevice_data(sql_newdevice);
            display_gap_data(sql_gap);
            gap_compare();
        }
    }
}
