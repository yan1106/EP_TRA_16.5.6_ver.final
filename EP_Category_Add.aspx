<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EP_Category_Add.aspx.cs" Inherits="EP_Category_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>EP_Category_Add</title>
<link rel="stylesheet" href="..\css\styles.css" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="../JS/jquery.bgiframe-2.1.2.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.9.1.js"></script>
<script src="../JS/jquery-ui-1.9.2/jquery-1.10.0.min.js" type="text/javascript"></script>    
<script src="../JS/jquery-ui-1.9.2/jquery-ui.min.js" type="text/javascript"></script>
<link href="../JS/jquery-ui-1.9.2/jquery-ui.css" rel="stylesheet" type="text/css" />  

<script type="text/javascript">
    function ConfirmDelManual(strMsg, strData) {
        var isOK = confirm(strMsg)//確認對話框,isOK==true
        if (isOK) {
            //PageMethods.DEL_Category(strData , OnSuccess, OnFail);
            PageMethods.DEL_Category(strData,OnSuccess,OnFail);
            
        }
    }
    function OnSuccess(receiveData, userContext, methodName) {
        //成功時，目地控制項顯示所接收結果   
        if (receiveData == "") {
            window.$('#cmdFilter').click();
           
                   

        } else {
            alert(methodName + ": " + receiveData);
        }
    }

    function OnFail(error, userContext, methodName) {
        if (error != null) {
            alert(methodName + ": " + error.get_message());
        }
    }

</script> 
    <style type="text/css">
         table#t01 {
    border: 0px solid #d4d4d4;
    border-collapse: collapse;
}
table#t01, th {
    border: 1px solid #d4d4d4;
    padding: 1px;
    text-align: left;     
}
table#t01, td 
{    
                    
} 
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th	{
    background-color:#778899;
    color: white;
    height: 30px;
}
    .style3
    {
        width: 50%; 
        border: 1px solid white; 
        text-align:left;          
    }    
    .Data-Content {
    width: 100%; /* 表單寬度 */
    line-height: 18px;    
    }   
    .style6
    {
        width: 100px;
    }   
    .style7
    {
        width: 50px;
    }


    </style>


</head>
    



<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <asp:Panel ID="Panel_Category" runat="server">
    <fieldset style="width:95%; " class="fieldset">
    <legend class="legend" style="font-weight: 700; font-size: large;">Category Information</legend> 
      <table> 
          <tr>
              <td> <asp:Button ID="btnInsert" runat="server" CausesValidation="False" class="blueButton button2" CommandName="Insert" Text="New Category" OnClick="btnInsert_Click" /></td>
              <td></td>
              <td>Effect Stage:<asp:DropDownList ID="cate_Stage_DDL" runat="server"></asp:DropDownList></td>
              <td>Category:</td>             
              <td><asp:TextBox ID="Text_Category" runat="server"></asp:TextBox></td>
              <td><asp:Button ID="butSearch" runat="server" Text="Search" 
                    class="blueButton button2" onclick="butSearch_Click"/></td>
              
          </tr> 
          
      </table>
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label>
        <hr />     
          </fieldset>
        <asp:GridView ID="GD_CATE" runat="server" AutoGenerateColumns="False" CellPadding="3" OnRowCommand="GD_CATE_RowCommand"  BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" AllowPaging="True" OnPageIndexChanged="GD_CATE_PageIndexChanged" 
            OnPageIndexChanging="GD_CATE_PageIndexChanging" PageSize="6"  EmptyDataText="NoRecord!" OnRowDeleting="GD_CATE_RowDeleting" OnRowUpdated="GD_CATE_RowUpdated" OnRowUpdating="GD_CATE_RowUpdating">
            

    <PagerTemplate>
    <asp:LinkButton ID="cmdFirstPage" CssClass="navigate" runat="server" CommandName="Page"
        CommandArgument="First" Visible="<%# ((GridView)Container.Parent.Parent).PageIndex!=0 %>">

    <img src="icon/firstpage.png" /></asp:LinkButton>
    <asp:LinkButton ID="cmdPreview" CssClass="navigate" runat="server" CommandArgument="Prev"
        CommandName="Page" Visible="<%# ((GridView)Container.Parent.Parent).PageIndex!=0 %>"><img src="icon/per.png"  style="background-color:Transparent;"  /></asp:LinkButton>
    第
    <asp:Label ID="lblcurPage" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageIndex+1      %>'></asp:Label>頁/共<asp:Label
        ID="lblPageCount" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageCount %>'></asp:Label>頁
    <asp:LinkButton ID="cmdNext" CssClass="navigate" runat="server" CommandName="Page"
        CommandArgument="Next" Visible="<%# ((GridView)Container.Parent.Parent).PageIndex!=((GridView)Container.Parent.Parent).PageCount-1 %>"><img src="icon/nextpage.png"  style="background-color:Transparent;"  /></asp:LinkButton>
    <asp:DropDownList ID="ddlSelectPage" runat="server" AutoPostBack="True" onselectedindexchanged="ddlSelectIndexChanged">
    </asp:DropDownList>
    </PagerTemplate>




            <HeaderStyle  BorderColor="White" BorderWidth="4px"  BorderStyle="Solid"  />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <RowStyle ForeColor="#000066" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <HeaderTemplate>
                       
                    </HeaderTemplate>
                    <ItemTemplate>                        
                        <asp:ImageButton ID="ImageButton_View" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="View" ImageUrl="icon/view.jpg" />
                        <asp:ImageButton ID="ImageButton2_Update" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Update" ImageUrl="icon/update.jpg" />
                        <asp:ImageButton ID="ImageButton3_Delete" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Delete" ImageUrl="icon/delete.jpg" OnClientClick="return confirm('是否刪除？');" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EP_Cate_Stage" HeaderText="Effect  Stage" />
                <asp:BoundField DataField="EP_Cate_Iiitems" HeaderText="Input Items" />
                <asp:BoundField DataField="EP_Cate_SpeChar" HeaderText="Special Characteristics" />
                <asp:BoundField DataField="EP_Cate_Md" HeaderText="Methodology" />
                <asp:BoundField DataField="EP_Cate_Cate" HeaderText="Category" />
                <asp:BoundField DataField="EP_Cate_KP" HeaderText="Key parameter" />
                <asp:BoundField DataField="npi_EP_Cate_Username" HeaderText="User" />
            </Columns>
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#006699" CssClass="style-GD" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            
            
        </asp:GridView>
         </asp:Panel>                            
        <br />
        <asp:Panel ID="Panel_Category_View" runat="server">
             <fieldset  style="width:40%;" class="fieldset">
        <legend class="legend" style="font-weight: 700; font-size: large;">View Category Information</legend>             
    <table id="t01"   style="width:100%;">
        <tr>
            <th style="width:50%;">Category_UserName</th>
            <td class="style3">
                <asp:Label ID="Lab_view_cate_user" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
          <tr>
            <th>Category_UpdateTime</th>
            <td class="style3">
                <asp:Label ID="Lab_view_cate_uptime" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>                         
        <tr>            
            <th>Category_Status</th>            
            <td class="style3"> <asp:Label ID="Lab_view_cate_sta" runat="server" Text="Label"></asp:Label></td>
            
        </tr>
        <tr>
            <th>Stage</th>            
            <td class="style3">
                <asp:Label ID="Lab_view_cate_stage" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>Input Items</th>            
            <td class="style3">
                <asp:Label ID="Lab_view_cate_input" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>Special Characteristics</th>  
            <td class="style3">
                <asp:Label ID="Lab_view_cate_sp" runat="server" Text="Label"></asp:Label>
           </td>
        </tr>
        <tr>
            <th>Methodology</th>            
            <td class="style3">
                <asp:Label ID="Lab_view_cate_md" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>Category</th>            
            <td class="style3">
                <asp:Label ID="Lab_view_cate_cate" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>Key Parameter</th>            
            <td class="style3">
                <asp:Label ID="Lab_view_cate_kp" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>                                            
    </table>    
           <asp:LinkButton ID="CancelButton" runat="server" CausesValidation="False" 
            class="blueButton button2" CommandName="Cancel" Text="CloseDetail" OnClick="CancelButton_Click"></asp:LinkButton>            
       </fieldset>



        </asp:Panel>
        <br />
        <asp:Panel ID="Panel_Add_Category" runat="server">
             <fieldset  style="width:40%;position:absolute;top:0px;" class="fieldset">
        <legend class="legend" style="font-weight: 700; font-size: large;">Insert Category Information</legend>             
    <table id="t01"  class="style5" style="width:100%;">
        <tr>
            <th style="width:50%;">UserName</th>
            <td class="style3"><asp:TextBox ID="text_ad_cate_user" class="textbox" runat="server" Width="94%" ></asp:TextBox></td>
        </tr>
                 
        <tr>
            <th>Stage</th>            
            <td class="style3"><asp:TextBox ID="text_ad_cate_stage" class="textbox" runat="server" Width="94%" ></asp:TextBox></td>
        </tr>
        <tr>
            <th>Input Items</th>            
            <td class="style3"><asp:TextBox ID="text_ad_cate_input" class="textbox" runat="server" Width="94%"  ></asp:TextBox></td>
        </tr>
        <tr>
            <th>Special Characteristics</th>  
            <td class="style3">
                <asp:TextBox ID="text_ad_cate_sp" class="textbox" runat="server"  Width="94%" ></asp:TextBox>
           </td>
        </tr>
        <tr>
            <th>Methodology</th>            
            <td class="style3"><asp:TextBox ID="text_ad_cate_md" class="textbox" runat="server" Width="94%" ></asp:TextBox></td>
        </tr>
        <tr>
            <th>Category</th>            
            <td class="style3"><asp:TextBox ID="text_ad_cate_cate" class="textbox" runat="server" Width="94%" ></asp:TextBox></td>
        </tr>
        <tr>
            <th>Key Parameter</th>            
            <td class="style3"><asp:TextBox ID="text_ad_cate_kp" class="textbox" runat="server" Width="94%" ></asp:TextBox></td>
        </tr>
                            
    </table>                
         <asp:LinkButton ID="LinkButton_Insert_Add" runat="server" CausesValidation="True" 
      CommandName="Update" Text="新增" OnClick="LinkButton_Insert_Add_Click" ><img src="icon/Check_Ok.png" height="40px" width="40px" /></asp:LinkButton>
    <asp:LinkButton ID="LinkButton_Add_Cancel" runat="server" CausesValidation="False" 
      CommandName="Cancel" Text="取消" OnClick="LinkButton_Add_Cancel_Click"  ><img src="icon/Cancel.png" height="40px" width="40px" /></asp:LinkButton>
       </fieldset>



        </asp:Panel>


        
        <asp:Panel ID="Panel_update_category" runat="server">
             <fieldset  style="width:40%;position:absolute;top:0px;" class="fieldset">
        <legend class="legend" style="font-weight: 700; font-size: large;">Update Category Information</legend>             
    <table id="t01"  style="width:100%;">
        <tr>
            <th style="width:50%">UserName</th>
            <td class="style3"><asp:TextBox ID="text_up_cate_user" class="textbox" runat="server" Width="94%"></asp:TextBox></td>
        </tr>
          <!--
        <tr>
            <th>Category_UpdateTime</th>            
            <td class="style3"><asp:TextBox ID="text_cate_uptime" class="textbox" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <th>Category_Status</th>            
            <td class="style3"><asp:TextBox ID="text_cate_status" class="textbox" runat="server" ></asp:TextBox></td>
        </tr>-->
        <tr>
            <th>Stage</th>            
            <td class="style3"><asp:TextBox ID="text_cate_stage" class="textbox" runat="server" Width="94%"></asp:TextBox></td>
        </tr>
        <tr>
            <th>Input Items</th>
            
            <td class="style3"><asp:TextBox ID="text_cate_input" class="textbox" runat="server" Width="94%" ></asp:TextBox></td>
        </tr>
        <tr>
            <th>Special Characteristics</th>  
            <td class="style3">
                <asp:TextBox ID="text_cate_sp" class="textbox" runat="server" Width="94%"  ></asp:TextBox>
           </td>
        </tr>
        <tr>
            <th>Methodology</th>            
            <td class="style3"><asp:TextBox ID="text_cate_md" class="textbox" runat="server" Width="94%"  ></asp:TextBox></td>
        </tr>
        <tr>
            <th>Category</th>            
            <td class="style3"><asp:TextBox ID="text_cate_cate" class="textbox" runat="server" Width="94%" ></asp:TextBox></td>
        </tr>
        <tr>
            <th>Key Parameter</th>            
            <td class="style3"><asp:TextBox ID="text_cate_kp" class="textbox" runat="server" Width="94%" ></asp:TextBox></td>
        </tr>
                            
    </table>                
         <asp:LinkButton ID="Button_Update" runat="server" CausesValidation="True" 
      CommandName="Update" Text="新增" OnClick="Button_Update_Click" ><img src="icon/Check_Ok.png" height="40px" width="40px" /></asp:LinkButton>
    <asp:LinkButton ID="Button_Cancel" runat="server" CausesValidation="False" 
      CommandName="Cancel" Text="取消" OnClick="Button_Cancel_Click" ><img src="icon/Cancel.png" height="40px" width="40px" /></asp:LinkButton>
       </fieldset>
        </asp:Panel>



</form>
</body>    
</html>     