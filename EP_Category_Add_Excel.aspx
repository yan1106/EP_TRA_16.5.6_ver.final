<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EP_Category_Add_Excel.aspx.cs" Inherits="EP_Category_Add" %>

<!DOCTYPE html>

   <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Category_Data Import Excel  </title>
      <link rel="stylesheet" href="..\css\styles.css" type="text/css" />
      <link rel="stylesheet" href="..\css\styles.css" type="text/css" />
      <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
      <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
      <script src="http://jqueryui.com/resources/demos/external/jquery.bgiframe-2.1.2.js"></script>
      <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
      <script type="text/javascript">

</script>
    <style type="text/css">
        .style1
        {
            font-size: large;
        }
        .style2
        {
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
        <asp:Label ID="excp" runat="server" ></asp:Label>
     <fieldset style="margin:auto;" class="fieldset">
    <legend class="legend" style="font-weight: 700; font-size: large;">Import Excel&nbsp; Category_Data</legend>
        <table style="width:100%;">           
            <tr>
                <td>
                    <strong><span class="style1">匯入Excel時,請您注意下列事項:</span></strong><br />
                    1.Excel檔案類型必須是[.xlsx].<br />
                    2.檔名名稱不影響存放資料的結果<br />
                    3.Stage的名稱是以工作表的名稱為命名<br />
                    4.工作表裡共有五欄位，名稱依序為<span style="color:blue;">(Effect stage,Input Items,Special Characteristics,Methodology,Category,Key parameter)</span><br />
                    5.範例下載:<asp:HyperLink ID="HyperLink1" NavigateUrl="stage.xlsx" runat="server">Category_Sample</asp:HyperLink><br />

                </td>
            </tr>
            <tr>
                <td class="style2">              
                </td>
            </tr>
            <tr>
                <td>
    <asp:FileUpload runat="server" ID="FileUploadToServer" Width="382px" Height="36px">
        </asp:FileUpload>
        <asp:Button runat="server" Text="Import" ID="btnUpload" onclick="btnUpload_Click" 
                        Height="25px" class="blueButton button2" />
                </td>
                
            </tr>
            <tr>
                <td>成功新增筆數:<asp:Label ID="Lab_item" runat="server"></asp:Label></td>              
            </tr>
            <tr>
                <td>新增Stage名稱有:<asp:Label ID="Lab_Stage" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
        <asp:Label ID="lblMsg" runat="server" ForeColor="Green" Text=""></asp:Label>        
                </td>
            </tr>
            <tr>
                <td>
                
           
                </td>
            </tr>
        </table>
         </fieldset>    
        <hr/>
        </div>
        <!--
        <asp:Panel ID="Panel1" runat="server">
           <table><tr>
                <td><h3 style="color:red">重複匯入紀錄顯示</h3></td>
            <td><asp:GridView runat="server" ID="gvRecord2" EmptyDataText="No record found!"
            Height="25px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" 
            BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False">
               <Columns>
                   <asp:BoundField DataField="npi_EP_Cate_Username" HeaderText="Username" />
                   <asp:BoundField DataField="npi_EP_Cate_UpdateTime" HeaderText="UpdateTime" />
                   <asp:BoundField DataField="EP_Cate_Stage" HeaderText="Effect stage" />
                   <asp:BoundField DataField="EP_Cate_Iiitems" HeaderText="Input Items" />
                   <asp:BoundField DataField="EP_Cate_SpeChar" HeaderText="Special Characteristics" />
                   <asp:BoundField DataField="EP_Cate_Md" HeaderText="Methodology" />
                   <asp:BoundField DataField="EP_Cate_Cate" HeaderText="Category" />
                   <asp:BoundField DataField="EP_Cate_KP" HeaderText="Key parameter" />
               </Columns>
               <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
               <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
               <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
               <RowStyle ForeColor="#330099" BackColor="White" />
               <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
               <sortedascendingcellstyle backcolor="#FEFCEB" />
               <sortedascendingheaderstyle backcolor="#AF0101" />
               <sorteddescendingcellstyle backcolor="#F6F0C0" />
               <sorteddescendingheaderstyle backcolor="#7E0000" />
        </asp:GridView></td>
        </tr>
        </table>
        </asp:Panel>-->

        <!--hr /-->

        <asp:Panel ID="Panel2" runat="server">
           
            <td><asp:GridView runat="server" ID="gvRecord" EmptyDataText="No record found!"
            Height="25px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
            BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False">
               <Columns>
                   <asp:BoundField DataField="npi_EP_Cate_Username" HeaderText="Username" />
                   <asp:BoundField DataField="npi_EP_Cate_UpdateTime" HeaderText="UpdateTime" />
                   <asp:BoundField DataField="EP_Cate_Stage" HeaderText="Effect stage" />
                   <asp:BoundField DataField="EP_Cate_Iiitems" HeaderText="Input Items" />
                   <asp:BoundField DataField="EP_Cate_SpeChar" HeaderText="Special Characteristics" />
                   <asp:BoundField DataField="EP_Cate_Md" HeaderText="Methodology" />
                   <asp:BoundField DataField="EP_Cate_Cate" HeaderText="Category" />
                   <asp:BoundField DataField="EP_Cate_KP" HeaderText="Key parameter" />
               </Columns>
               <FooterStyle BackColor="White" ForeColor="#000066" />
               <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
               <RowStyle ForeColor="#000066" />
               <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
               <sortedascendingcellstyle backcolor="#F1F1F1" />
               <sortedascendingheaderstyle backcolor="#007DBB" />
               <sorteddescendingcellstyle backcolor="#CAC9C9" />
               <sorteddescendingheaderstyle backcolor="#00547E" />
        </asp:GridView></td>
            <!--
             <table><tr>
                <td><h3 style="color:blue">未重覆匯入紀錄顯示</h3></td>
        </tr>
        </table>-->
        </asp:Panel>
           

        
  

    </form>
</body>
</html>

  