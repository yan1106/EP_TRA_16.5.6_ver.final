<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EP_Capability_Add.aspx.cs" Inherits="EP_Capability_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    function ConfirmDelManual(message,strsql)
    {
       sing=confirm(message)
       if (sing) {
           PageMethods.Delete_CAP(strsql, OnSuccess, OnFail);
       }
    }

</script>

    <title>Capability_Add</title>
    <style type="text/css">

        .style-GD
        {
             border-left: 1.0pt solid white;
            border-right: 1.0pt solid white;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
        }

           
        .style-head
        {
            width: 60pt;
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border-left: 1.0pt solid white;
            border-right: 1.0pt solid white;
            border-top: 1.0pt solid white;
            border: 1.0pt solid white;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
            padding: 0px;
            background: #254061;
        }

      
        .style-keyitem
        {
          
            color: white;          
            padding: 0px;
            background: #5A5A5A;  
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;                         
            /*border-bottom-style: solid;*/
            border-top: .5pt solid white;
            border-bottom: .5pt solid white;


        }

        

        .style-keyitem-number
        {
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            border: .4pt solid white;
            padding: 0px;
            background: #7F7F7F;
            height: 21px;

        }
        .style-keyitem-details
        {
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: left;
            vertical-align: middle;
            white-space: nowrap;
            border-left: .5pt solid white;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top: .5pt solid white;
            border-bottom: .5pt solid white;
            padding: 0px;
            background: #538ED5;
            height: 21px;
        }
        .style-td-red
        {
            color: #C0504D;
           
            
        }
                               
        .style-td-white {
           
            color: windowtext;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid white;
            padding: 0px;
            background: white;
        }
        .style-td-gray
        {
            color: windowtext;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: Arial, sans-serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: .5pt solid white;
            padding: 0px;
            background: #D8D8D8;
            height: 18pt;
         
        }
       
        .auto-style1 {
            height: 21px;
        }
        .auto-style2 {
            color: #C0504D;
            height: 21px;
        }
       
        .auto-style3 {
            border-style: none;
            border-color: inherit;
            border-width: 1;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 8px;
            -moz-border-radius: 8px;
            -webkit-border-radius: 8px;
            box-shadow: 3px 3px 10px #666;
            -moz-box-shadow: 3px 3px 10px #666;
            -webkit-box-shadow: 3px 3px 10px #666;
            position: relative;
            width: 80%;
            left: 0px;
            top: 0px;
        }
       
        </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="Panel_Packge" runat="server">
    <fieldset style="width:95%; " class="fieldset">
    <legend class="legend" style="font-weight: 700; font-size: large;">Capability Information</legend> 
      <table> 
          <tr>
              <td>Capability_Name: </td>             
              <td><asp:TextBox ID="Text_packge" runat="server"></asp:TextBox></td>
              <td><asp:Button ID="butSearch" runat="server" Text="Search" 
                    class="blueButton button2" onclick="butSearch_Click"/></td>
              
          </tr> 
          
      </table>
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label>
        <hr />     
               
        <asp:GridView ID="GD_CAP" runat="server" AutoGenerateColumns="False" CellPadding="3" OnRowCommand="GD_CAP_RowCommand" OnSelectedIndexChanged="GD_CAP_SelectedIndexChanged" OnRowDeleting="GD_CAP_RowDeleting1" OnRowUpdating="GD_CAP_RowUpdating" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            >
            <HeaderStyle  BorderColor="White" BorderWidth="4px"  BorderStyle="Solid"  />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <RowStyle ForeColor="#000066" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <HeaderTemplate>
                        <asp:Button ID="btnInsert" runat="server" CausesValidation="False" class="blueButton button2" CommandName="Insert" Text="New Capability" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton_View" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="View" ImageUrl="icon/view.jpg" />
                        <asp:ImageButton ID="ImageButton2_Update" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Update" ImageUrl="icon/update.jpg" />
                        <asp:ImageButton ID="ImageButton3_Delete" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Delete" ImageUrl="icon/delete.jpg" OnClientClick="return confirm('是否刪除？');" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CAP_EP_Name" HeaderText="Capability Name" />
                <asp:BoundField DataField="npiuser" HeaderText="User" />
                <asp:BoundField DataField="Update_Time" HeaderText="Update Time" />
            </Columns>
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#006699" CssClass="style-GD" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            
            
        </asp:GridView>
         </asp:Panel>                            
        <br />
        <asp:Panel ID="Panel_CAP_table" runat="server">
       

    <div>
    <fieldset style="width:80%;margin:auto;" class="fieldset">
    <legend class="legend" style="font-weight: 700; font-size: large;">Insert Capability Information</legend>
       <br />
         <div>
            <table>
                <tr>
                    <td>Capability_Name: </td>
                    <td><asp:TextBox ID="Text_Packge_insert" runat="server" Height="20px" MaxLength="30"></asp:TextBox></td>
                </tr>
            </table>
        </div>  
        <br /> 
        
             <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:900pt" >
                 <tr class="style-head">
                     <td class="style-head" colspan="4" rowspan="2" width="404">Key item</td>
                     <td class="style-head" rowspan="2" width="160">Capability<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td class="style-head" rowspan="2" width="114">POR (Baseline)</td>
                 </tr>
                  <tr><td ></td></tr>
                  
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem" style="background:#538ED5;"" height="22" colspan="4">PROD</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_1" runat="server" MaxLength="50"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                     
                 </tr>
                 <tr class="style-td-gray">
                     <td  class="style-keyitem" height="126" rowspan="5" >                         
                         <span  style="writing-mode: vertical-lr;width:45pt;text-align:center;"><br />Device Information</span></td>
                     <td class="style-keyitem-number">1</td>
                     <td class="style-keyitem-details" colspan="2">Customer<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td>
                         <asp:TextBox ID="Text__CAP_2" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number">2</td>
                     <td class="style-keyitem-details" colspan="2">Device<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td>
                         <asp:TextBox ID="Text__CAP_3" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="12">
                     <td class="style-keyitem-number">3</td>
                     <td class="style-keyitem-details" colspan="2">Die size(mm*mm)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_4" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="38">
                     <td class="style-keyitem-number" height="38">4</td>
                     <td class="style-keyitem-details" colspan="2">C/P probe card type</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_5" runat="server" MaxLength="40"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">5</td>
                     <td class="style-keyitem-details" colspan="2" >Probing on bump pad (Y/N)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_6" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem" rowspan="7">
                        <span style="-webkit-writing-mode: vertical-lr;">Wafer Information</span> </td>
                     <td class="style-keyitem-number">6</td>
                     <td class="style-keyitem-details" colspan="2">Wafer Fab</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_7" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">7</td>
                     <td class="style-keyitem-details" colspan="2">Wafer tech.(nm)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_8" runat="server" MaxLength="5"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">8</td>
                     <td class="style-keyitem-details" colspan="2">Low K Type</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_9" runat="server" MaxLength="5"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="38">
                     <td class="style-keyitem-number" height="38">9</td>
                     <td class="style-keyitem-details" colspan="2">Final Metal Pad type</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_10" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">10</td>
                     <td class="style-keyitem-details" colspan="2">RV hole(Y/N)</td>
                     <td class="auto-style243" width="160">
                         <asp:TextBox ID="Text__CAP_11" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">11</td>
                     <td class="style-keyitem-details" colspan="2">Wafer PSV type / Thickness</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_12" runat="server" MaxLength="5"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number">12</td>
                     <td class="style-keyitem-details" colspan="2">Seal-Ring Protected by SiN (Y/N)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_13" runat="server" MaxLength="1"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="95">
                     <td class="style-keyitem" height="234" rowspan="5">
                          <span style="-webkit-writing-mode: vertical-lr;">Bump structure</span> </td>                                                                    
                     <td class="style-keyitem-number">13</td>
                     <td class="style-keyitem-details" colspan="2">PKG Type</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_14" runat="server" MaxLength="80"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">14</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI type</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_15" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray">
                     <td class="style-keyitem-number" width="32">15</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI Thickness (um)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_16" runat="server" MaxLength="5"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">16</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM type / Thickness (um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_17" runat="server" MaxLength="50"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="57">
                     <td class="style-keyitem-number" height="57" width="32">17</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump composition</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_18" runat="server" MaxLength="30"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem" height="368" rowspan="17" width="51">
                      <span style="-webkit-writing-mode: vertical-lr;">Bump design</span> </td>
                         
                        
                        
                     <td class="style-keyitem-number" width="32">18</td>
                     <td class="style-keyitem-details" colspan="2" width="321">REPSV PI Opening Size(um)</td>
                     <td width="160" class="auto-style312">
                         <asp:TextBox ID="Text__CAP_19" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">19</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Min fianl metal trace to seal ring (um)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_20" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td class="style-td-red">NA</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">20</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI via opening bottom edge
                         <br />
                         to pad psv. Edge (um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_21" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">21</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI edge inside seal ring (um)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_22" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="38">
                     <td class="style-keyitem-number" height="38" width="32">22</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PR thickness(um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_23" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">23</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Size(um)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_24" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">24</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Overlap PSV (um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_25" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">25</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM insdie final metal for FOC (um)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_26" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">26</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Plating Area(dm<span class="auto-style321"><font class="auto-style320"><sup>2</sup></font></span>)</td>
                     <td width="160" class="auto-style312">
                         <asp:TextBox ID="Text__CAP_27" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">27</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Density (UBM Area/Die Area)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_28" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">28</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Mushroom CD(um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_29" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">29</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Min Mushroom space(um)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_30" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">30</td>
                     <td class="style-keyitem-details" colspan="2">Min. Bump pitch (um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_31" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">31</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Height(um)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_32" runat="server" Height="19px" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">32</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Diameter(um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_33" runat="server" MaxLength="2"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">33</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Density (Bump Q&#39;ty/Die Area)</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_34" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" width="32">34</td>
                     <td class="style-keyitem-details" colspan="2" width="321">BH/UBM ratio</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_35" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">1</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem" height="200" rowspan="8" width="51">
                        <span style="-webkit-writing-mode: vertical-lr;">Outgoing criteria</span> </td>
                         
                     <td class="style-keyitem-number" width="32">35</td>
                     <td class="style-keyitem-details" colspan="2" width="321">LF Bump Ag% target</td>
                     <td  colspan="2">
                         <asp:TextBox ID="Text__CAP_36" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">36</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Height(um)</td>
                     <td  colspan="2" width="274" style="text-align:center;">
                        
                         
                        
                         <asp:TextBox ID="Text__CAP_37" runat="server" Height="19px" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">37</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump diameter</td>
                     <td  colspan="2">
                         <asp:TextBox ID="Text__CAP_38" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">38</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Coplanarity<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td  colspan="2" width="274">
                         
                         <asp:TextBox ID="Text__CAP_39" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="34">
                     <td class="style-keyitem-number" height="34" width="32">39</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Shear Strenght</td>
                     <td  colspan="2">
                         <asp:TextBox ID="Text__CAP_40" runat="server" MaxLength="30"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">40</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump void<span style="mso-spacerun:yes">&nbsp;&nbsp;</span></td>
                     <td  colspan="2">
                         <asp:TextBox ID="Text__CAP_41" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="34">
                     <td class="style-keyitem-number" height="34" width="32">41</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI Rougness (Ra)</td>
                     <td colspan="2">
                         <asp:TextBox ID="Text__CAP_42" runat="server" MaxLength="30"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">42</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Resistance (POR capability)</td>
                     <td class="style-td-red" colspan="2">
                         <asp:TextBox ID="Text__CAP_43" runat="server" MaxLength="30"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray">
                     <td class="style-keyitem" height="448" rowspan="15">
                          <span style="-webkit-writing-mode: vertical-lr;">Metrology tool</span> </td>
                     <td class="style-keyitem-number" rowspan="7" width="32">43</td>
                     <td class="style-keyitem-details" rowspan="7" width="129">August</td>
                     <td class="style-keyitem-details">Gross die</td>
                     <td class="auto-style316">
                         <asp:TextBox ID="Text__CAP_44" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                     <td class="auto-style316">
                         <asp:TextBox ID="Text_CAP_POR_EP_01" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details">Expose pad</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_45" runat="server" MaxLength="2"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_2" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192">PSV1(PI1/PBO1) opening</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_46" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_3" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td class="auto-style1">
                         <asp:TextBox ID="Text__CAP_47" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="auto-style1" >
                         <asp:TextBox ID="Text_CAP_POR_EP_4" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray">
                     <td class="style-keyitem-details" width="192">Low SPEC of min RDL
                         <br />
                         Width</td>
                     <td class="auto-style1">
                         <asp:TextBox ID="Text__CAP_48" runat="server" MaxLength="3"></asp:TextBox>
                     </td>
                     <td class="auto-style1" >
                         <asp:TextBox ID="Text_CAP_POR_EP_5" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="42">
                     <td class="style-keyitem-details" height="42" width="192">Low SPEC of min RDL
                         <br />
                         Spacing</td>
                     <td class="auto-style274">
                         <asp:TextBox ID="Text__CAP_49" runat="server" MaxLength="3"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_6" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192">Min RDL Width/Spacing
                         <br />
                         pattern &amp; location</td>
                     <td >
                         <asp:TextBox ID="Text__CAP_50" runat="server" MaxLength="2"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_7" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="88" rowspan="4" width="32">44</td>
                     <td class="style-keyitem-details" rowspan="4" width="129">RVSI</td>
                     <td class="style-keyitem-details">Gross die</td>
                     <td class="auto-style274">
                         <asp:TextBox ID="Text__CAP_51" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_8" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-details" height="22" width="192">Bump count per die</td>
                     <td class="auto-style18">
                         <asp:TextBox ID="Text__CAP_52" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_9" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details" height="22" width="192">Bump height</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_53" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_10" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-details" height="22" width="192">Bump diameter</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_54" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_11" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">45</td>
                     <td class="style-keyitem-details" width="129">RS meter</td>
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td>
                         <asp:TextBox ID="Text__CAP_55" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_12" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="38">
                     <td class="style-keyitem-number" height="38" width="32">46</td>
                     <td class="style-keyitem-details" width="129">Void (X-ray)</td>
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_56" runat="server" MaxLength="50"></asp:TextBox>
                     </td>
                     <td  width="114">
                         <asp:TextBox ID="Text_CAP_POR_EP_13" runat="server" MaxLength="50"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">47</td>
                     <td class="style-keyitem-details" width="129">Bump shear</td>
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_57" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_14" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="44">
                     <td class="style-keyitem-number" height="44" width="32">48</td>
                     <td class="style-keyitem-details" width="129">Bump pull</td>
                     <td " width=" 192"="" class="style-keyitem-details">Bump diameter</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_58" runat="server"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_CAP_POR_EP_15" runat="server" MaxLength="20"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem" height="86" rowspan="3" width="51">
                         <span style="-webkit-writing-mode: vertical-lr;">AB&nbsp; requirement</span> </td>                                                
                     <td class="style-keyitem-number" width="32">49</td>
                     <td class="style-keyitem-details" width="129">Bump to bump<br /> &nbsp;space</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160" class="auto-style1">
                         <asp:TextBox ID="Text__CAP_59" runat="server" MaxLength="50"></asp:TextBox>
                     </td>
                     <td class="auto-style2">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">50</td>
                     <td class="style-keyitem-details">SMO</td>
                     <td class="style-keyitem-details">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_60" runat="server" MaxLength="10"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">51</td>
                     <td class="style-keyitem-details">UBM/SMO ratio</td>
                     <td class="style-keyitem-details">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_61" runat="server" MaxLength="15"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem" height="128" rowspan="4" width="51">
                          <span style="-webkit-writing-mode: vertical-lr;"> Special&nbsp; Requirement</span></td>                                                   
                     <td class="style-keyitem-number" width="32">52</td>
                     <td class="style-keyitem-details" width="129">Process /
                         <br />
                         Machine</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_62" runat="server" MaxLength="2"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">53</td>
                     <td class="style-keyitem-details" width="129">Material</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_63" runat="server" MaxLength="2"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-number" height="42" width="32">54</td>
                     <td class="style-keyitem-details" width="129">Measurement<br /> &nbsp;tool</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_64" runat="server" MaxLength="2"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">55</td>
                     <td class="style-keyitem-details" width="129">Reliability</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__CAP_65" runat="server" MaxLength="2"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
             </table>
        <asp:LinkButton ID="Button_Add" runat="server" CausesValidation="True" 
      CommandName="Add" Text="新增" OnClick="Button_Add_Click" ><img src="icon/Check_Ok.png" height="40px" width="40px" /></asp:LinkButton>
    <asp:LinkButton ID="Button_Cancel" runat="server" CausesValidation="False" 
      CommandName="Cancel" Text="取消" OnClick="Button_Cancel_Click"><img src="icon/Cancel.png" height="40px" width="40px" /></asp:LinkButton>
       </fieldset>
    </div>
    <br />
   </asp:Panel>
    <asp:Panel ID="Panel_CAP_Table_Update" runat="server">
     <div>
    <fieldset style="margin:auto;" class="auto-style3">
    <legend class="legend" style="font-weight: 700; font-size: large;">Update Capability Information</legend>
       <br />
         <div>
            <table>
                <tr>
                    <td>Capability_Name: </td>
                    <td><asp:TextBox ID="Text_UP_PK_Name" runat="server" Height="20px"></asp:TextBox></td>
                </tr>
            </table>
        </div>  
        <br /> 
        
             <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:900pt" >
                 <tr class="style-head">
                     <td class="style-head" colspan="4" rowspan="2" width="404">Key item</td>
                     <td class="style-head" rowspan="2" width="160">Capability<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td class="style-head" rowspan="2" width="114">POR (Baseline)</td>
                 </tr>
                  <tr><td ></td></tr>
                  
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem" style="background:#538ED5;"" height="22" colspan="4">PROD</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_1" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                     
                 </tr>
                 <tr class="style-td-gray">
                     <td  class="style-keyitem" height="126" rowspan="5" >                         
                         <span  style="writing-mode: vertical-lr;width:45pt;text-align:center;"><br />Device Information</span></td>
                     <td class="style-keyitem-number">1</td>
                     <td class="style-keyitem-details" colspan="2">Customer<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_2" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number">2</td>
                     <td class="style-keyitem-details" colspan="2">Device<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_3" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="12">
                     <td class="style-keyitem-number">3</td>
                     <td class="style-keyitem-details" colspan="2">Die size(mm*mm)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_4" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="38">
                     <td class="style-keyitem-number" height="38">4</td>
                     <td class="style-keyitem-details" colspan="2">C/P probe card type</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_5" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">5</td>
                     <td class="style-keyitem-details" colspan="2">Probing on bump pad (Y/N)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_6" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem" rowspan="7">
                        <span style="-webkit-writing-mode: vertical-lr;">Wafer Information</span> </td>
                     <td class="style-keyitem-number">6</td>
                     <td class="style-keyitem-details" colspan="2">Wafer Fab</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_7" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">7</td>
                     <td class="style-keyitem-details" colspan="2">Wafer tech.(nm)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_8" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">8</td>
                     <td class="style-keyitem-details" colspan="2">Low K Type</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_9" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="38">
                     <td class="style-keyitem-number" height="38">9</td>
                     <td class="style-keyitem-details" colspan="2">Final Metal Pad type</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_10" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">10</td>
                     <td class="style-keyitem-details" colspan="2">RV hole(Y/N)</td>
                     <td class="auto-style243" width="160">
                         <asp:TextBox ID="Text__UP_CAP_11" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">11</td>
                     <td class="style-keyitem-details" colspan="2">Wafer PSV type / Thickness</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_12" runat="server" TextMode="MultiLine" Height="24px"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number">12</td>
                     <td class="style-keyitem-details" colspan="2">Seal-Ring Protected by SiN (Y/N)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_13" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="95">
                     <td class="style-keyitem" height="234" rowspan="5">
                          <span style="-webkit-writing-mode: vertical-lr;">Bump structure</span> </td>                                                                    
                     <td class="style-keyitem-number">13</td>
                     <td class="style-keyitem-details" colspan="2">PKG Type</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_14" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">14</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI type</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_15" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray">
                     <td class="style-keyitem-number" width="32">15</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI Thickness (um)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_16" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">16</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM type / Thickness (um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_17" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="57">
                     <td class="style-keyitem-number" height="57" width="32">17</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump composition</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_18" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem" height="368" rowspan="17" width="51">
                      <span style="-webkit-writing-mode: vertical-lr;">Bump design</span> </td>
                         
                        
                        
                     <td class="style-keyitem-number" width="32">18</td>
                     <td class="style-keyitem-details" colspan="2" width="321">REPSV PI Opening Size(um)</td>
                     <td width="160" class="auto-style312">
                         <asp:TextBox ID="Text__UP_CAP_19" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">19</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Min fianl metal trace to seal ring (um)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_20" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">NA</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">20</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI via opening bottom edge
                         <br />
                         to pad psv. Edge (um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_21" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">21</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI edge inside seal ring (um)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_22" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="38">
                     <td class="style-keyitem-number" height="38" width="32">22</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PR thickness(um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_23" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">23</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Size(um)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_24" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">24</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Overlap PSV (um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_25" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">25</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM insdie final metal for FOC (um)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_26" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">26</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Plating Area(dm<span class="auto-style321"><font class="auto-style320"><sup>2</sup></font></span>)</td>
                     <td width="160" class="auto-style312">
                         <asp:TextBox ID="Text__UP_CAP_27" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">27</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Density (UBM Area/Die Area)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_28" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">28</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Mushroom CD(um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_29" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">29</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Min Mushroom space(um)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_30" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">30</td>
                     <td class="style-keyitem-details" colspan="2">Min. Bump pitch (um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_31" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">31</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Height(um)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_32" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">32</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Diameter(um)</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_33" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">33</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Density (Bump Q&#39;ty/Die Area)</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_34" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" width="32">34</td>
                     <td class="style-keyitem-details" colspan="2" width="321">BH/UBM ratio</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_35" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">1</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem" height="200" rowspan="8" width="51">
                        <span style="-webkit-writing-mode: vertical-lr;">Outgoing criteria</span> </td>
                         
                     <td class="style-keyitem-number" width="32">35</td>
                     <td class="style-keyitem-details" colspan="2" width="321">LF Bump Ag% target</td>
                     <td  colspan="2">
                         <asp:TextBox ID="Text__UP_CAP_36" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">36</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Height(um)</td>
                     <td  colspan="2" width="274" style="text-align:center;">
                        
                         
                        
                         <asp:TextBox ID="Text__UP_CAP_37" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">37</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump diameter</td>
                     <td  colspan="2">
                         <asp:TextBox ID="Text__UP_CAP_38" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">38</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Coplanarity<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td  colspan="2" width="274">
                         
                         <asp:TextBox ID="Text__UP_CAP_39" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="34">
                     <td class="style-keyitem-number" height="34" width="32">39</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Shear Strenght</td>
                     <td  colspan="2">
                         <asp:TextBox ID="Text__UP_CAP_40" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">40</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump void<span style="mso-spacerun:yes">&nbsp;&nbsp;</span></td>
                     <td  colspan="2">
                         <asp:TextBox ID="Text__UP_CAP_41" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="34">
                     <td class="style-keyitem-number" height="34" width="32">41</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI Rougness (Ra)</td>
                     <td colspan="2">
                         <asp:TextBox ID="Text__UP_CAP_42" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">42</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Resistance (POR capability)</td>
                     <td class="style-td-red" colspan="2">
                         <asp:TextBox ID="Text__UP_CAP_43" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray">
                     <td class="style-keyitem" height="448" rowspan="15">
                          <span style="-webkit-writing-mode: vertical-lr;">Metrology tool</span> </td>
                     <td class="style-keyitem-number" rowspan="7" width="32">43</td>
                     <td class="style-keyitem-details" rowspan="7" width="129">August</td>
                     <td class="style-keyitem-details">Gross die</td>
                     <td class="auto-style316">
                         <asp:TextBox ID="Text__UP_CAP_44" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="auto-style316">
                         <asp:TextBox ID="Text_UP_CAP_POR_1" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details">Expose pad</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_45" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_2" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192">PSV1(PI1/PBO1) opening</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_46" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_3" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td class="auto-style1">
                         <asp:TextBox ID="Text__UP_CAP_47" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="auto-style1" >
                         <asp:TextBox ID="Text_UP_CAP_POR_4" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192">Low SPEC of min RDL
                         <br />
                         Width</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_48" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_5" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="42">
                     <td class="style-keyitem-details" height="42" width="192">Low SPEC of min RDL
                         <br />
                         Spacing</td>
                     <td class="auto-style274">
                         <asp:TextBox ID="Text__UP_CAP_49" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_6" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192">Min RDL Width/Spacing
                         <br />
                         pattern &amp; location</td>
                     <td >
                         <asp:TextBox ID="Text__UP_CAP_50" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_7" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="88" rowspan="4" width="32">44</td>
                     <td class="style-keyitem-details" rowspan="4" width="129">RVSI</td>
                     <td class="style-keyitem-details">Gross die</td>
                     <td class="auto-style274">
                         <asp:TextBox ID="Text__UP_CAP_51" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_8" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-details" height="22" width="192">Bump count per die</td>
                     <td class="auto-style18">
                         <asp:TextBox ID="Text__UP_CAP_52" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_9" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details" height="22" width="192">Bump height</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_53" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_10" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-details" height="22" width="192">Bump diameter</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_54" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_11" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">45</td>
                     <td class="style-keyitem-details" width="129">RS meter</td>
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td>
                         <asp:TextBox ID="Text__UP_CAP_55" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_12" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="38">
                     <td class="style-keyitem-number" height="38" width="32">46</td>
                     <td class="style-keyitem-details" width="129">Void (X-ray)</td>
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_56" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td  width="114">
                         <asp:TextBox ID="Text_UP_CAP_POR_13" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">47</td>
                     <td class="style-keyitem-details" width="129">Bump shear</td>
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_57" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_14" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="44">
                     <td class="style-keyitem-number" height="44" width="32">48</td>
                     <td class="style-keyitem-details" width="129">Bump pull</td>
                     <td " width=" 192"="" class="style-keyitem-details">Bump diameter</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_58" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td >
                         <asp:TextBox ID="Text_UP_CAP_POR_15" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem" height="86" rowspan="3" width="51">
                         <span style="-webkit-writing-mode: vertical-lr;">AB&nbsp; requirement</span> </td>                                                
                     <td class="style-keyitem-number" width="32">49</td>
                     <td class="style-keyitem-details" width="129">Bump to bump<br /> &nbsp;space</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160" class="auto-style1">
                         <asp:TextBox ID="Text__UP_CAP_59" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="auto-style2">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">50</td>
                     <td class="style-keyitem-details">SMO</td>
                     <td class="style-keyitem-details">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_60" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">51</td>
                     <td class="style-keyitem-details">UBM/SMO ratio</td>
                     <td class="style-keyitem-details">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_61" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem" height="128" rowspan="4" width="51">
                          <span style="-webkit-writing-mode: vertical-lr;"> Special&nbsp; Requirement</span></td>                                                   
                     <td class="style-keyitem-number" width="32">52</td>
                     <td class="style-keyitem-details" width="129">Process /
                         <br />
                         Machine</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_62" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">53</td>
                     <td class="style-keyitem-details" width="129">Material</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_63" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-number" height="42" width="32">54</td>
                     <td class="style-keyitem-details" width="129">Measurement<br /> &nbsp;tool</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_64" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">55</td>
                     <td class="style-keyitem-details" width="129">Reliability</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:TextBox ID="Text__UP_CAP_65" runat="server" TextMode="MultiLine"></asp:TextBox>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
             </table>
        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
      CommandName="Update" Text="新增" OnClick="LinkButton1_Click"  ><img src="icon/Check_Ok.png" height="40px" width="40px" /></asp:LinkButton>
    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
      CommandName="Cancel" Text="取消" OnClick="Button_Cancel_Click"><img src="icon/Cancel.png" height="40px" width="40px" /></asp:LinkButton>
       </fieldset>
    </div>
    </asp:Panel>









        <asp:Panel ID="Panel_CAP_Table_View" runat="server">
        <div>  
        <fieldset style="width:80%;margin:auto;" class="fieldset">
    <legend class="legend" style="font-weight: 700; font-size: large;">View Capability Information</legend>
       <br />
         <div>
            <table>
                <tr>
                    <td>Capability_Name: </td>
                    <td><asp:TextBox ID="TextBox_PK_Name" runat="server" Height="20px"></asp:TextBox></td>
                </tr>
            </table>
        </div>  
        <br />   
             <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:900pt" >
                 <tr class="style-head">
                     <td class="style-head" colspan="4" rowspan="2" width="404">Key item</td>
                     <td class="style-head" rowspan="2" width="160">Capability<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td class="style-head" rowspan="2" width="114">POR (Baseline)</td>
                 </tr>
                  <tr><td ></td></tr>
                  
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem" style="background:#538ED5;"" height="22" colspan="4">PROD</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_1" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                     
                 </tr>
                 <tr class="style-td-gray">
                     <td  class="style-keyitem" height="126" rowspan="5" >                         
                         <span  style="writing-mode: vertical-lr;width:45pt;text-align:center;"><br />Device Information</span></td>
                     <td class="style-keyitem-number">1</td>
                     <td class="style-keyitem-details" colspan="2">Customer<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td>
                         <asp:Label ID="Lab_CAP_2" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number">2</td>
                     <td class="style-keyitem-details" colspan="2">Device<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td>
                         <asp:Label ID="Lab_CAP_3" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="12">
                     <td class="style-keyitem-number">3</td>
                     <td class="style-keyitem-details" colspan="2">Die size(mm*mm)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_4" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="38">
                     <td class="style-keyitem-number" height="38">4</td>
                     <td class="style-keyitem-details" colspan="2">C/P probe card type</td>
                     <td>
                         <asp:Label ID="Lab_CAP_5" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">5</td>
                     <td class="style-keyitem-details" colspan="2">Probing on bump pad (Y/N)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_6" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem" rowspan="7">
                        <span style="-webkit-writing-mode: vertical-lr;">Wafer Information</span> </td>
                     <td class="style-keyitem-number">6</td>
                     <td class="style-keyitem-details" colspan="2">Wafer Fab</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_7" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">7</td>
                     <td class="style-keyitem-details" colspan="2">Wafer tech.(nm)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_8" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">8</td>
                     <td class="style-keyitem-details" colspan="2">Low K Type</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_9" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="38">
                     <td class="style-keyitem-number" height="38">9</td>
                     <td class="style-keyitem-details" colspan="2">Final Metal Pad type</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_10" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">10</td>
                     <td class="style-keyitem-details" colspan="2">RV hole(Y/N)</td>
                     <td class="auto-style243" width="160">
                         <asp:Label ID="Lab_CAP_11" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">11</td>
                     <td class="style-keyitem-details" colspan="2">Wafer PSV type / Thickness</td>
                     <td>
                         <asp:Label ID="Lab_CAP_12" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number">12</td>
                     <td class="style-keyitem-details" colspan="2">Seal-Ring Protected by SiN (Y/N)</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_13" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="95">
                     <td class="style-keyitem" height="234" rowspan="5">
                          <span style="-webkit-writing-mode: vertical-lr;">Bump structure</span> </td>                                                                    
                     <td class="style-keyitem-number">13</td>
                     <td class="style-keyitem-details" colspan="2">PKG Type</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_14" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">14</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI type</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_15" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray">
                     <td class="style-keyitem-number" width="32">15</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI Thickness (um)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_16" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">16</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM type / Thickness (um)</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_17" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="57">
                     <td class="style-keyitem-number" height="57" width="32">17</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump composition</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_18" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem" height="368" rowspan="17" width="51">
                      <span style="-webkit-writing-mode: vertical-lr;">Bump design</span> </td>
                         
                        
                        
                     <td class="style-keyitem-number" width="32">18</td>
                     <td class="style-keyitem-details" colspan="2" width="321">REPSV PI Opening Size(um)</td>
                     <td width="160" class="auto-style312">
                         <asp:Label ID="Lab_CAP_19" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">19</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Min fianl metal trace to seal ring (um)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_20" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">NA</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">20</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI via opening bottom edge
                         <br />
                         to pad psv. Edge (um)</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_21" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">21</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI edge inside seal ring (um)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_22" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="38">
                     <td class="style-keyitem-number" height="38" width="32">22</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PR thickness(um)</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_23" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">23</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Size(um)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_24" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">24</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Overlap PSV (um)</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_25" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">25</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM insdie final metal for FOC (um)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_26" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">26</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Plating Area(dm<span class="auto-style321"><font class="auto-style320"><sup>2</sup></font></span>)</td>
                     <td width="160" class="auto-style312">
                         <asp:Label ID="Lab_CAP_27" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">27</td>
                     <td class="style-keyitem-details" colspan="2" width="321">UBM Density (UBM Area/Die Area)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_28" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">28</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Mushroom CD(um)</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_29" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">29</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Min Mushroom space(um)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_30" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">30</td>
                     <td class="style-keyitem-details" colspan="2">Min. Bump pitch (um)</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_31" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">31</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Height(um)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_32" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">32</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Diameter(um)</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_33" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">33</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Density (Bump Q&#39;ty/Die Area)</td>
                     <td>
                         <asp:Label ID="Lab_CAP_34" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" width="32">34</td>
                     <td class="style-keyitem-details" colspan="2" width="321">BH/UBM ratio</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_35" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">1</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem" height="200" rowspan="8" width="51">
                        <span style="-webkit-writing-mode: vertical-lr;">Outgoing criteria</span> </td>
                         
                     <td class="style-keyitem-number" width="32">35</td>
                     <td class="style-keyitem-details" colspan="2" width="321">LF Bump Ag% target</td>
                     <td  colspan="2">
                         <asp:Label ID="Lab_CAP_36" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">36</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Height(um)</td>
                     <td  colspan="2" width="274" style="text-align:center;">
                        
                         
                        
                         <asp:Label ID="Lab_CAP_37" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">37</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump diameter</td>
                     <td  colspan="2">
                         <asp:Label ID="Lab_CAP_38" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">38</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Coplanarity<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td  colspan="2" width="274">
                         
                         <asp:Label ID="Lab_CAP_39" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="34">
                     <td class="style-keyitem-number" height="34" width="32">39</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Shear Strenght</td>
                     <td  colspan="2">
                         <asp:Label ID="Lab_CAP_40" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">40</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump void<span style="mso-spacerun:yes">&nbsp;&nbsp;</span></td>
                     <td  colspan="2">
                         <asp:Label ID="Lab_CAP_41" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="34">
                     <td class="style-keyitem-number" height="34" width="32">41</td>
                     <td class="style-keyitem-details" colspan="2" width="321">PI Rougness (Ra)</td>
                     <td colspan="2">
                         <asp:Label ID="Lab_CAP_42" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">42</td>
                     <td class="style-keyitem-details" colspan="2" width="321">Bump Resistance (POR capability)</td>
                     <td class="style-td-red" colspan="2">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray">
                     <td class="style-keyitem" height="448" rowspan="15">
                          <span style="-webkit-writing-mode: vertical-lr;">Metrology tool</span> </td>
                     <td class="style-keyitem-number" rowspan="7" width="32">43</td>
                     <td class="style-keyitem-details" rowspan="7" width="129">August</td>
                     <td class="style-keyitem-details">Gross die</td>
                     <td class="auto-style316">
                         <asp:Label ID="Lab_CAP_43" runat="server"></asp:Label>
                     </td>
                     <td class="auto-style316">
                         <asp:Label ID="Lab_CAP_POR_1" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details">Expose pad</td>
                     <td>
                         <asp:Label ID="Lab_CAP_44" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_2" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192">PSV1(PI1/PBO1) opening</td>
                     <td>
                         <asp:Label ID="Lab_CAP_45" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_3" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details" height="22" width="192">Bump diameter</td>
                     <td>
                         <asp:Label ID="Lab_CAP_46" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_4" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192">Low SPEC of min RDL
                         <br />
                         Width</td>
                     <td>
                         <asp:Label ID="Lab_CAP_47" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_5" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="42">
                     <td class="style-keyitem-details" height="42" width="192">Low SPEC of min RDL
                         <br />
                         Spacing</td>
                     <td class="auto-style274">
                         <asp:Label ID="Lab_CAP_48" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_6" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192">Min RDL Width/Spacing
                         <br />
                         pattern &amp; location</td>
                     <td >
                         <asp:Label ID="Lab_CAP_49" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_7" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="88" rowspan="4" width="32">44</td>
                     <td class="style-keyitem-details" rowspan="4" width="129">RVSI</td>
                     <td class="style-keyitem-details">Gross die</td>
                     <td class="auto-style274">
                         <asp:Label ID="Lab_CAP_50" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_8" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-details" height="22" width="192">Bump count per die</td>
                     <td class="auto-style18">
                         <asp:Label ID="Lab_CAP_51" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_9" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details" height="22" width="192">Bump height</td>
                     <td>
                         <asp:Label ID="Lab_CAP_52" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_10" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-details" height="22" width="192">Bump diameter</td>
                     <td>
                         <asp:Label ID="Lab_CAP_53" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_11" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">45</td>
                     <td class="style-keyitem-details" width="129">RS meter</td>
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td>
                         <asp:Label ID="Lab_CAP_54" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_12" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="38">
                     <td class="style-keyitem-number" height="38" width="32">46</td>
                     <td class="style-keyitem-details" width="129">Void (X-ray)</td>
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_55" runat="server"></asp:Label>
                     </td>
                     <td  width="114">
                         <asp:Label ID="Lab_CAP_POR_13" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">47</td>
                     <td class="style-keyitem-details" width="129">Bump shear</td>
                     <td class="style-keyitem-details" width="192">Bump diameter</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_56" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_14" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-gray" height="44">
                     <td class="style-keyitem-number" height="44" width="32">48</td>
                     <td class="style-keyitem-details" width="129">Bump pull</td>
                     <td " width=" 192"="" class="style-keyitem-details">Bump diameter</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_57" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="Lab_CAP_POR_15" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem" height="86" rowspan="3" width="51">
                         <span style="-webkit-writing-mode: vertical-lr;">AB&nbsp; requirement</span> </td>                                                
                     <td class="style-keyitem-number" width="32">49</td>
                     <td class="style-keyitem-details" width="129">Bump to bump<br /> &nbsp;space</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160" class="auto-style1">
                         <asp:Label ID="Lab_CAP_58" runat="server"></asp:Label>
                     </td>
                     <td class="auto-style2">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">50</td>
                     <td class="style-keyitem-details">SMO</td>
                     <td class="style-keyitem-details">　</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_59" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">51</td>
                     <td class="style-keyitem-details">UBM/SMO ratio</td>
                     <td class="style-keyitem-details">　</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_60" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem" height="128" rowspan="4" width="51">
                          <span style="-webkit-writing-mode: vertical-lr;"> Special&nbsp; Requirement</span></td>                                                   
                     <td class="style-keyitem-number" width="32">52</td>
                     <td class="style-keyitem-details" width="129">Process /
                         <br />
                         Machine</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_61" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">53</td>
                     <td class="style-keyitem-details" width="129">Material</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_62" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-number" height="42" width="32">54</td>
                     <td class="style-keyitem-details" width="129">Measurement<br /> &nbsp;tool</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_63" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">55</td>
                     <td class="style-keyitem-details" width="129">Reliability</td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">
                         <asp:Label ID="Lab_CAP_64" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-red">
                         &nbsp;</td>
                 </tr>
                
             </table>
             <asp:LinkButton ID="CancelButton" runat="server" CausesValidation="False" 
                class="blueButton button2" CommandName="Cancel" Text="CloseDetail" OnClick="CancelButton_Click"></asp:LinkButton>
            </div>          
             
        </asp:Panel>
    </form>
</body>
</html>
