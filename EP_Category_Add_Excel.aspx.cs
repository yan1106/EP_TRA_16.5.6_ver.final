using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using NPOI.XSSF.UserModel;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using MySql.Data.MySqlClient;



public partial class EP_Category_Add : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //DBint();
    }

   /* protected void DBint()
    {
        string sql_category = "";
        //string mySQL = "select * from npi_ep_category where EP_Cate_Stage='PI1'";
        int number=0;
        
       

        catch (Exception ex)
        {
            Label2.Text = ex.ToString() + number.ToString();
        }
    }
   */

    protected void insert_cate(int item_num, List<string> Cate_Iiitems, List<string> Cate_SpeChar, List<string> Cate_Md, List<string> Cate_Cate, List<string> Cate_KP, string name,string status,string stage)
    {
        clsMySQL db = new clsMySQL();
        List<int> success_insert = new List<int>();
        List<int> fail_insert = new List<int>();
        int success_count = 0;
        int fail_count = 0;
        List<string> history_cate = new List<string>();

        for (int i = 0; i < item_num; i++)
        {

            String insert_cate = string.Format("insert into npi_cap_ep" +
                                           "(npi_EP_Cate_Username,npi_EP_Cate_UpdateTime,npi_EP_Cate_Status," +
                                         "EP_Cate_Stage,EP_Cate_Iiitems,EP_Cate_SpeChar," +
                                         "EP_Cate_Md,EP_Cate_Cate,EP_Cate_KP)values" +
                                         "('{0}',NOW(),'{1}'," +
                                          "'{2}','{3}','{4}','{5}','{6}','{7}')"
                                          , name, status, stage, Cate_Iiitems[i], Cate_SpeChar[i], Cate_Md[i], Cate_Cate[i], Cate_KP[i]);
            if (db.QueryExecuteNonQuery(insert_cate) == true)
            {
                success_count++;
            }
            else
            {
                fail_count++;
                history_cate.Add(Cate_Iiitems[i] + "|" + Cate_SpeChar[i] + "|" + Cate_Md[i] + "|" + Cate_Cate[i] + "|" + Cate_KP[i]);
            }
        }





        /*
        try
        {
            /*if (Text_Packge_insert.Text.Trim() == "")
            {
                string strScript = string.Format("<script language='javascript'>alert('您沒有輸入Packge_Name!');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
            }
            if ()
            {
                string strScript = string.Format("<script language='javascript'>alert('Category新增成功');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
                
            }
            else
            {
                string strScript = string.Format("<script language='javascript'>alert('Category新增成功');</script>");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

        */





    }


    protected Boolean jude_npiepcategory_amount()
    {
              
        string mySQL = "select case when npi_ep_category.EP_Cate_Stage = NULL Then 'true' else 'false' END from npi_ep_category ";
        
  
        string str_category = "";
        

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(mySQL, MySqlConn);
        MySqlDataReader SelData = MySqlCmd.ExecuteReader();

        while (SelData.Read())
        {
                       
            str_category = (String)SelData["EP_Cate_Stage"];
            
        }

       
        if (str_category==null)
            return true;
        else
            return false;



    }



    protected Boolean jude_npiepcategory_data(string excel_category,string stage)
    {
        
        //string mySQL = "select EP_Cate_Stage,EP_Cate_Iiitems,EP_Cate_SpeChar,EP_Cate_Md,EP_Cate_Cate,EP_Cate_KP from npi_ep_category";
        List<string> str_ID = new List<string>();     
        string ID = "";
        int number;
        int sign = 0;
        //string mySQL = "select * from npi_ep_category where EP_Cate_Stage='"+stage+"'";
        string mySQL = "select * from npi_ep_category";
        string sql_category = "";

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();


        MySqlCommand MySqlCmd = new MySqlCommand(mySQL, MySqlConn);
        
        MySqlDataReader SelData = MySqlCmd.ExecuteReader();
        SelData.Read();
        if (SelData.IsDBNull(0))
        {
            return true;
        }
        try
        {

            while (SelData.Read())
            {
                number = (int)SelData["npi_EP_Cate_ID"];
                sql_category = (String)SelData["EP_Cate_Stage"].ToString() + "|" + (String)SelData["EP_Cate_Iiitems"].ToString() + "|" + (String)SelData["EP_Cate_SpeChar"].ToString() + "|" + (String)SelData["EP_Cate_Md"].ToString() + "|" + (String)SelData["EP_Cate_Cate"].ToString() + "|" + (String)SelData["EP_Cate_KP"].ToString(); //只要以後碰到欄位值為NULL，就要轉成Tostring();
                if (sql_category != excel_category)
                    sign = 1;
                else {
                    sign = 0;
                    ID += query_npiepcategory_ID(sql_category);
                    break;
                }
            }


           




        }
        catch(Exception ex)
        {
            excp.Text = excp.ToString();
        }

        MySqlConn.Close();
        SelData.Close();

        if (sign == 0)
            HttpContext.Current.Session["value_ID"] = ID;


        if (sign == 1)
            return true;
        else
            return false;




    }

    protected string query_npiepcategory_ID(string sql_category)
    {
        string[] split_category = sql_category.Split('|');

        string number="";
        string temp_sql_category = "select * from npi_ep_category where EP_Cate_Stage='" + split_category[0] + "' and " +
            "EP_Cate_Iiitems='" + split_category[1] + "' and EP_Cate_SpeChar='" + split_category[2] + "' and " +
            "EP_Cate_Md='" + split_category[3] + "'and EP_Cate_Cate='" + split_category[4] + "'and " +
            "EP_Cate_KP='" + split_category[5]+"'";

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(temp_sql_category, MySqlConn);
        MySqlDataReader SelData = MySqlCmd.ExecuteReader();

        while (SelData.Read())
        {
            number += Convert.ToString((int)SelData["npi_EP_Cate_ID"])+",";
            
        }

        SelData.Close();
        MySqlConn.Close();

        return number;


    }


    protected string str_id(string[] temp_id)
    {
        string temp = "";
        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

       

      
        for (int i=0;i<temp_id.Length;i++)
        {
            string sql = "select * from npi_ep_category where npi_EP_Cate_ID='" + temp_id[i] + "'";

            MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
            MySqlDataReader SelData = MySqlCmd.ExecuteReader();

            while (SelData.Read())
            {
                temp += SelData["npi_EP_Cate_ID"].ToString() +"->"+ ",EP_Cate_Stage:" + SelData["EP_Cate_Stage"].ToString()+ ",EP_Cate_Iiitems" + "|" + SelData["EP_Cate_Iiitems"].ToString() + ",EP_Cate_SpeChar:" + "|" + SelData["EP_Cate_SpeChar"].ToString() + ",EP_Cate_Md" + "|" + SelData["EP_Cate_Md"].ToString() + ",EP_Cate_Cate" + "|" + SelData["EP_Cate_Cate"].ToString() + ",EP_Cate_KP" + "|" + SelData["EP_Cate_KP"].ToString() +"\\n";

            }
            SelData.Close();
            

        }
        MySqlConn.Close();

        return temp;
    }


    protected void btnUpload_Click(object sender, EventArgs e)
    {
        
        string sheet_name = "";
        int sheet_num;
        int dLastNum;
        int cate_items = 0;
        String Cate_Username = "CIM";
        String Cate_Status = "Y";
        DateTime dt = DateTime.Now;
        string inf_ID = "";
        List<string> List_Inf_ID = new List<string>();
        Boolean sign_count = false;
        /*List<string> Cate_Iiitems = new List<string>();
        List<string> Cate_SpeChar = new List<string>();
        List<string> Cate_Md = new List<string>();
        List<string> Cate_Cate = new List<string>();
        List<string> Cate_KP = new List<string>();
        */
        List<int> success_insert = new List<int>();
        List<int> fail_insert = new List<int>();
        int success_count = 0;
        int fail_count = 0;
        List<string> history_cate = new List<string>();
        string fileName = "";
        string time = "";
        string count_sheet_name = "";
       int debug_count=0;
        Boolean sign = false;
        Boolean sign_repeat = false;
       clsMySQL db = new clsMySQL();



        try
        {



            fileName = Path.GetFileName(FileUploadToServer.PostedFile.FileName);
            //string filePath = Server.MapPath("~\\bruno\\FileUpload_Folder\\") + Path.GetFileName(FileUploadToServer.PostedFile.FileName);
            string filePath = Server.MapPath("FileUpload_Folder\\") + Path.GetFileName(FileUploadToServer.PostedFile.FileName);
            FileUploadToServer.SaveAs(filePath);





            if (CheckExcelFile(fileName))
            {

                /*
                 if (FileUploadToServer.HasFile)
                {

                }
                 */

                XSSFWorkbook wk = new XSSFWorkbook(FileUploadToServer.FileContent);
                XSSFSheet hst;
                XSSFRow hr;
                DataTable myDT = new DataTable();

                sheet_num = wk.NumberOfSheets;

                for (int k = 0; k < sheet_num; k++) //從每張工作表開始做
                {
                    hst = (XSSFSheet)wk.GetSheetAt(k);
                    cate_items = hst.LastRowNum; //每一張工作表有幾筆資料

                    sheet_name = hst.SheetName;

                    if (k != sheet_num - 1) //顯示匯入的Stage有哪些
                        count_sheet_name += sheet_name + ",";
                    else
                        count_sheet_name += sheet_name;

                    hr = (XSSFRow)hst.GetRow(0);
                    dLastNum = hr.LastCellNum; //每一列的欄位數


                    /*  for (int i = hr.FirstCellNum; i < hr.LastCellNum; i++)
                      {
                          if (hr.GetCell(i) != null)
                          {
                              DataColumn myColumn = new DataColumn(hr.GetCell(i).StringCellValue);
                              myDT.Columns.Add(myColumn);

                          }

                      }*/



                    for (int j = 1; j <= cate_items; j++)
                    {
                        hr = (XSSFRow)hst.GetRow(j);
                        //XSSFRow row = (XSSFRow) mySheet.GetRow(i);
                        DataRow myrow = myDT.NewRow();
                        /*for(int i=1;i<dLastNum;i++)
                        {
                            //string strcell = hr.GetCell(i) == null ? "0" : hr.GetCell(i).ToString();
                            myrow = 

                        }*/



                        String insert_cate = string.Format("insert into npi_ep_category" +
                                                   "(npi_EP_Cate_Username,npi_EP_Cate_UpdateTime,npi_EP_Cate_Status," +
                                                 "EP_Cate_Stage,EP_Cate_Iiitems,EP_Cate_SpeChar," +
                                                 "EP_Cate_Md,EP_Cate_Cate,EP_Cate_KP)values" +
                                                 "('{0}',NOW(),'{1}'," +
                                                  "'{2}','{3}','{4}','{5}','{6}','{7}')"
                                                  , Cate_Username, Cate_Status, sheet_name, hr.GetCell(0), hr.GetCell(1), hr.GetCell(2), hr.GetCell(3), hr.GetCell(4));
                        string excel_sql = sheet_name +"|"+ hr.GetCell(0) + "|" + hr.GetCell(1) + "|" + hr.GetCell(2) + "|" + hr.GetCell(3) + "|" + hr.GetCell(4);
                        Label1.Text = dt.ToString("yyyy/MM/dd hh:mm:ss");
                        time = Label1.Text;

                       

                        
                        if (jude_npiepcategory_data(excel_sql, sheet_name) == true)
                        {
                            if (db.QueryExecuteNonQuery(insert_cate) == true)
                            {
                                success_count++;
                                sign = true;

                            }
                            else
                            {
                                fail_count++;
                                history_cate.Add(hr.GetCell(0) + "|" + hr.GetCell(1) + "|" + hr.GetCell(2) + "|" + hr.GetCell(3) + "|" + hr.GetCell(4));
                            }
                            debug_count++;
                        }                        
                        else
                        { 
                            List_Inf_ID.Add(Session["value_ID"].ToString());                            
                            sign_repeat = true;
                            sign_count = true;
                        }
                        Session.Clear();
                        debug_count = 0;
                    }
                }
                wk = null;
                hst = null;
                hr = null;

            }
            else {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "您選擇的[" + fileName + "]無法匯入,請重新選擇Excel檔案或檢查Excel檔案內容!!";
            }

            
            /*string strScript2 = string.Format("<script language='javascript'>alert('完成匯入\\n成功匯入筆數:" + success_count + "\\n匯入的Stage:" + count_sheet_name + "');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript2);*/
            Lab_item.Text = success_count.ToString();
            Lab_Stage.Text = count_sheet_name;
            lblMsg.Text = fileName + "上傳成功!!";
            System.IO.File.Delete(filePath);

            if (sign_count == true) { 
            for (int i = 0; i < List_Inf_ID.Count; i++)
            {
                inf_ID += List_Inf_ID[i];
            }
                string[] spilit_inf_id = inf_ID.Split(',');
                
            


            string strScript2 = string.Format("<script language='javascript'>alert('重複資料筆數:"+List_Inf_ID.Count.ToString()+"\\n資料重複編號:" + str_id(spilit_inf_id) + "');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript2);
            }

        }
        catch (Exception exfile)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            excp.Text = exfile.ToString();
            if (fileName == "")
            {
                lblMsg.Text = "[Import Error Message] 請選擇要匯入的Excel檔案!!";
            }
            else {
                lblMsg.Text = "[Import Error Message]您選擇的[" + fileName + "]無法匯入,請重新選擇Excel檔案或檢查Excel檔案內容!!";
            }
        }

        finally
        {
            /*string strScript = string.Format("<script language='javascript'>alert('您沒有輸入Packge_Name!');</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);*/
            
        }

        string sql_cate_datetime = "select * from npi_ep_category where npi_ep_category.npi_EP_Cate_UpdateTime >= DATE_FORMAT('" + time+ "', '%Y/%m/%d %H:%i:%s')";
        //DATE_FORMAT('2016/04/28 11:26:00', '%Y/%m/%d %H:%i:%s')
        

        if (sign == true)
        {
            clsMySQL ds = new clsMySQL();
            clsMySQL.DBReply dr = ds.QueryDS(sql_cate_datetime);
            gvRecord.DataSource = dr.dsDataSet.Tables[0].DefaultView;
            gvRecord.DataBind();
            ds.Close();
        }
        /*if(sign==true)
        {
            clsMySQL ds = new clsMySQL();
            clsMySQL.DBReply dr = ds.QueryDS(sql_cate_datetime);
            gvRecord2.DataSource = dr.dsDataSet.Tables[0].DefaultView;
            gvRecord2.DataBind();
            ds.Close();
        }*/







    }


    public Boolean CheckExcelFile(string filename)
    {
        string[] allowdFile = { ".xlsx" };
        bool isValidFile = allowdFile.Contains(System.IO.Path.GetExtension(filename));
        if (!isValidFile)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "[Import Error Message] 您選擇檔案:" + filename + ",並不是.xlsx的檔案類型!!!<br/>請重新選擇正確檔案類型.";
        }
        return isValidFile;

    }



}