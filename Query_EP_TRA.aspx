<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Query_EP_TRA.aspx.cs" Inherits="Query_EP_TRA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Query_npiEATra</title>
     <link rel="stylesheet" href="..\css\styles.css" type="text/css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://jqueryui.com/resources/demos/external/jquery.bgiframe-2.1.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>

<script type="text/javascript">
     $(function () {
         $("[id$=Customer_TB]").autocomplete({
             source: function (request, response) {
                 $.ajax({
                     url: '<%=ResolveUrl("Query_EP_TRA.aspx/GetCustomer") %>',
                     data: "{ 'prefix': '" + request.term + "'}",
                     dataType: "json",
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     success: function (data) {
                         response($.map(data.d, function (item) {
                             return {
                                 label: item.split(',')[0],
                                 val: item.split(',')[1]
                             }
                         }))
                     },
                     error: function (response) {
                         alert(response.responseText);
                     },
                     failure: function (response) {
                         alert(response.responseText);
                     }
                 });
             },         
             minLength: 1
         });
     });

     $(function () {
         $("[id$=ND_TB]").autocomplete({
             source: function (request, response) {
                 $.ajax({
                     url: '<%=ResolveUrl("Query_EP_TRA.aspx/GetNewDevice") %>',
                     data: "{ 'prefix': '" + request.term + "'}",
                     dataType: "json",
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     success: function (data) {
                         response($.map(data.d, function (item) {
                             return {
                                 label: item.split(',')[0],
                                 val: item.split(',')[1]
                             }
                         }))
                     },
                     error: function (response) {
                         alert(response.responseText);
                     },
                     failure: function (response) {
                         alert(response.responseText);
                     }
                 });
             },
             minLength: 1
         });
     });


        function error_msg( error_sentence) {
            alert(error_sentence);
        }



   </script>      




<style type="text/css">

     .style-querymain-table
     {
        
        background:#FFFFFF;
        border:1.0pt solid blue;

     }
             
     .style-querymain-head {
         text-align: center;        
         font-size: 12.0pt; 
         color:white;  
         border-bottom: 1.0pt solid blue;
         border-left:1.0pt solid blue;
         border-right:1.0pt solid blue;
         padding: 0px;
         font-weight:bolder;
         background:#003C9D;
         
     }
      .style-querymain-head-main {
         text-align: center;        
         font-size: 12.0pt; 
         color:white;  
         border-bottom: 1.0pt solid blue;
         border-left:1.0pt solid blue;
         border-right:1.0pt solid blue;
         padding: 0px;
         font-weight:bolder;
         background:#0066FF;
         
     }
      .style-querymain-head-NewDevice {
         text-align: center;        
         font-size: 12.0pt; 
         color:white;  
         border-bottom: 1.0pt solid blue;
         border-left:1.0pt solid blue;
         border-right:1.0pt solid blue;
         padding: 0px;
         font-weight:bolder;
         background:#254061;
         
     }
     .style-space
     {
         background:transparent;
         color:windowtext;
     }
     .style-querymain-content
     {
        text-align: center;        
         font-size: 12.0pt; 
         color:#000066;
         border: .5pt solid white;
         padding: 0px;
        font-weight:bold;
                    
                

     }
     .style-querymain-content-two {
         text-align: center;        
         font-size: 12.0pt;                  
         padding: 0px;
         border-left:1.0pt solid gray;
         border-right:1.0pt solid gray;
         
     }



      .style-querymain-content-two
     {
       
        
        padding: 0px;        
        border-bottom: 1.0pt solid blue;               
        border-left: 1.0pt solid blue;
        border-right:1.0pt solid blue;
        

     }
     .div-eptramain {
         width: 100%;
         float:left
         
     }  


   .style2
        {
            color: #FFFFFF;            
        }
     .div-por {
         width: 70%;
         float: inherit;
         
     }  
    .left 
        {
            float: left;
            width: 100%;
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

      
        .style-PProcessTRA {
            width: 500pt;
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
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top: 1.0pt solid white;
            border-bottom: 1.0pt solid white;
            padding: 0px;
            background: #254061;
        }
        .style-Effect {
            width: 400pt;
            color: white;
            font-size: 12.0pt;
            font-weight: 700;
            font-style: normal;
            text-decoration: none;
            font-family: "Times New Roman", serif;
            text-align: center;
            vertical-align: middle;
            white-space: normal;
            border: 1.0pt solid white;
            padding: 0px;
            background: #254061;
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
        .style-td-red
        {
            color: #C0504D;
           
            
        }
        .style-td-blue
        {
            color: #1F497D;
            
        }
        
        
   
        
    .auto-style1 {
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
        left: 1px;
        top: 0px;
    }
            
        
   
        
 </style>  

  


</head>
<body>
    <form id="form1" runat="server">


        <div class="left">
            <fieldset class="auto-style1" style="margin:auto;">
                <legend class="legend" style="font-size:medium;"><strong>Query_EPTra_table</strong></legend>  
                
                 <table >
                    
                     <tr>
                          
                         <th >Customer:</th>
                        <td  class="td_newDevice"><asp:TextBox ID="Customer_TB" runat="server" Height="20px" 
                                 OnTextChanged="Customer_TB_TextChanged" Width="160px"></asp:TextBox></td>
                         <th >New_Device:</th>
                        <td class="td_newDevice"><asp:TextBox ID="ND_TB" runat="server" Height="20px" 
                                 OnTextChanged="ND_TB_TextChanged1" Width="160px"></asp:TextBox></td>
                         <th >Status:</th>
                        <td class="td_newDevice"><asp:DropDownList ID="DDList_Status" runat="server" Width="120px">
                             <asp:ListItem>Enable</asp:ListItem>
                             <asp:ListItem>Disable</asp:ListItem>
                             </asp:DropDownList></td>
                         <td><asp:Button ID="Search_Device" runat="server" class="blueButton button2" 
                                 Height="30px" OnClick="Search_Device_Eptra_table" Text="Search" Width="70px"/></td>
                     </tr>
                     
                    

                 </table>    
             


             </fieldset>
            <br />
               
            </div>       
        
     <asp:Panel ID="Panel_eptraview" runat="server">
        <div class="div-eptramain">
           
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableTheming="True" OnRowCommand="GridView1_RowCommand" OnRowCreated="GridView1_RowCreated" Height="170px">
                <Columns>
                    <asp:ButtonField CommandName="View" Text="View">
                    <HeaderStyle ForeColor="White" />
                    </asp:ButtonField>
                    <asp:BoundField DataField="Ver_Name" HeaderText="Version" />
                    <asp:BoundField DataField="UpdateTime" HeaderText="Update_Time" />
                    <asp:BoundField DataField="UserName" HeaderText="User" />
                    <asp:BoundField DataField="Ver_Status" HeaderText="Status" />
                    <asp:BoundField DataField="Ver_POR_Customer" HeaderText="Customer" />
                    <asp:BoundField DataField="Ver_POR_Device" HeaderText="Device" />
                    <asp:BoundField DataField="Ver_POR_Site" HeaderText="Site" />
                    <asp:BoundField DataField="Ver_POR_PKG" HeaderText="PKG" />
                    <asp:BoundField DataField="Ver_POR_WT" HeaderText="WaferTech" />
                    <asp:BoundField DataField="Ver_POR_FAB" HeaderText="FAB" />
                    <asp:BoundField DataField="Ver_POR_PSV" HeaderText="PSV" />
                    <asp:BoundField DataField="Ver_POR_RVSI" HeaderText="RVSI" />
                    <asp:BoundField DataField="Ver_New_Customer" HeaderText="New_Customer" />
                    <asp:BoundField DataField="Ver_New_Device" HeaderText="New_Device" />
                </Columns>
            </asp:GridView>
        
            
       <br />
       
        </div>
        
         </asp:Panel>

       
    <asp:Panel ID="Panel_EPTRA" runat="server">
       
           <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse;width:1000pt">
                
                 <tr >
                     <td class="style-head" colspan="4" rowspan="2" width="404">Key item</td>
                     <td class="style-head" rowspan="2" >Capability<span style="mso-spacerun:yes">&nbsp;</span></td>
                     <td class="style-head" rowspan="2" >POR (Baseline)</td>
                     <td class="style-head" rowspan="2" >New Device</td>
                     <td class="style-head" rowspan="2">Gap<br /> (Y/N)</td>
                     <td colspan="6" class="style-PProcessTRA">Package/ProcessTRA</td>
                 </tr>
                 <tr height="43">
                     <td class="style-Effect" >Effect  stage</td>
                     <td class="style-Effect">Potential Effect<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                     </td>
                     <td class="style-Effect">TRA Lv.</td>
                     <td class="style-Effect" >Recommend action</td>
                     <td class="style-Effect" >Owner</td>
                     <td class="style-Effect" >Due Date</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details" style="text-align:center;" colspan="4" height="22">PROD</td>
                     <td width="160">-</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_1" runat="server"></asp:Label>
                     </td>
                     <td>                                                 
                     </td>
                     <td>
                         <asp:Label ID="lab_gap1" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_01" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_01" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_01" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_01" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray">
                     <td  class="style-keyitem" height="126" rowspan="5" >                         
                         <span  style="-webkit-writing-mode: vertical-rl;width:45pt;text-align:center;"><br />Device Information</span></td>
                     <td class="style-keyitem-number">1</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_02" runat="server" Text="Customer&nbsp;"></asp:Label>
                     </td>
                     <td>-</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_2" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_2" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap2" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_02" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_02" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_02" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_02" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number">2</td>
                     <td class="style-keyitem-details" colspan="2"><span style="mso-spacerun:yes">&nbsp;<asp:Label ID="Lab_keyitem_03" runat="server">Device</asp:Label>
                         </span></td>
                     <td>-</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_3" runat="server"></asp:Label>
                         
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_3" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap3" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_03" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_03" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_03" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_03" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="12">
                     <td class="style-keyitem-number">3</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_04" runat="server">Die size(mm*mm)</asp:Label>
                     </td>
                     <td>4*4~23*23</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_4" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">&nbsp;<asp:Label ID="lab_Ver_New_4" runat="server"></asp:Label>
                         &nbsp;&nbsp;</td>
                     <td>
                         <asp:Label ID="lab_gap4" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_04" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_04" runat="server"></asp:Panel>
                         
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_04" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_04" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="38">
                     <td class="style-keyitem-number" height="38">4</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_05" runat="server">C/P probe card type</asp:Label>
                     </td>
                     <td>Vertical probe<br /> Membrane</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_5" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_5" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap5" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_05" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Eff_05" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_05" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_05" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">5</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_06" runat="server">Probing on bump pad (Y/N)</asp:Label>
                     </td>
                     <td>Not Allowed</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_6" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_6" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap6" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_06" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_06" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_06" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_06" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem" rowspan="7">
                        <span style="-webkit-writing-mode: vertical-lr;">Wafer Information</span> </td>
                     <td class="style-keyitem-number">6</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_07" runat="server">Wafer Fab</asp:Label>
                     </td>
                     <td width="160">TSMC,UMC,GF,SMIC</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_7" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_7" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap7" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_07" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_07" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_07" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_07" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">7</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_08" runat="server">Wafer tech.(nm)</asp:Label>
                     </td>
                     <td>28~130</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_8" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_8" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap8" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_08" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_08" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_08" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_08" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">8</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_09" runat="server">Low K Type</asp:Label>
                     </td>
                     <td width="160">ELK</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_9" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_9" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap9" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_09" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_09" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_09" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_09" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="38">
                     <td class="style-keyitem-number" height="38">9</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_10" runat="server">Final Metal Pad type</asp:Label>
                     </td>
                     <td width="160">Al<br /> Cu</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_10" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_10" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap10" runat="server"></asp:Label>
                     </td>
                     <td>
                         
                         <asp:Label ID="lab_Eff_10" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_10" runat="server"></asp:Panel>
                         
                     </td>
                     <td>
                                                
                         <asp:Label ID="lab_Pot_10" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_10" runat="server"></asp:Panel>
                                                
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">10</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_11" runat="server">RV hole(Y/N)</asp:Label>
                     </td>
                     <td class="auto-style243" width="160">Not Allowed</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_11" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_11" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap11" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_11" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_11" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_11" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_11" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">11</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_12" runat="server">Wafer PSV type / Thickness</asp:Label>
                     </td>
                     <td>SiN</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_12" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_12" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap12" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_12" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_12" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_12" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_12" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number">12</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_13" runat="server">Seal-Ring Protected by SiN (Y/N)</asp:Label>
                     </td>
                     <td width="160">Y</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_13" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_13" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap13" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_13" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_13" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_13" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_13" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="95">
                     <td class="style-keyitem" height="234" rowspan="5">
                          <span style="-webkit-writing-mode: vertical-lr;">Bump structure</span> </td>                                                                    
                     <td class="style-keyitem-number">13</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_14" runat="server">PKG Type</asp:Label>
                     </td>
                     <td width="160">EP REPSV-12-EU<br /> EP REPSV-12-LF<br /> EP FOC-12-EU<br /> EP FOC-12-LF<br /> EP REPSV-8-LF</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_14" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_14" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap14" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_14" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_14" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_14" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_14" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">14</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_15" runat="server">PI type</asp:Label>
                     </td>
                     <td width="160">HD4104</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_15" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_15" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap15" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_15" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_15" runat="server"></asp:Panel>
                         <br />
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_15" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_15" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray">
                     <td class="style-keyitem-number" width="32">15</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_16" runat="server">PI Thickness (um)</asp:Label>
                     </td>
                     <td>5um</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_16" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_16" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap16" runat="server"></asp:Label>
                     </td>
                     <td>
                         
                         <asp:Label ID="lab_Eff_16" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_16" runat="server"></asp:Panel>
                         <br />
                     </td>
                     <td>                         
                         <asp:Label ID="lab_Pot_16" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_16" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">16</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_17" runat="server">UBM type / Thickness (um)</asp:Label>
                     </td>
                     <td width="160">Ti1K/Cu5K/Ni2um<br /> Ti1K/Cu5K/Ni3um</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_17" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_17" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap17" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_17" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_17" runat="server"></asp:Panel>
                         
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_17" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_17" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="57">
                     <td class="style-keyitem-number" height="57" width="32">17</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_18" runat="server">Bump composition</asp:Label>
                     </td>
                     <td width="160">SnAg 1.8<br /> SnAg 2.3<br /> Eu</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_18" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_18" runat="server"></asp:Label>
                     </td>
                     <td class="auto-style289">
                         <asp:Label ID="lab_gap18" runat="server"></asp:Label>
                     </td>
                     <td class="auto-style214">
                         <asp:Label ID="lab_Eff_18" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_18" runat="server"></asp:Panel>
                     </td>
                     <td class="auto-style214">
                         <asp:Label ID="lab_Pot_18" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_18" runat="server"></asp:Panel>
                     </td>
                     <td class="auto-style14">　</td>
                     <td class="auto-style14">　</td>
                     <td class="auto-style14">　</td>
                     <td class="auto-style14">　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem" height="368" rowspan="17" width="51">
                      <span style="-webkit-writing-mode: vertical-lr;">Bump design</span> </td>
                         
                        
                        
                     <td class="style-keyitem-number" width="32">18</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_19" runat="server">REPSV PI Opening Size(um)</asp:Label>
                     </td>
                     <td width="160">30~62</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_19" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_19" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap19" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_19" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_19" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_19" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_19" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">19</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_20" runat="server">Min fianl metal trace to seal ring (um)</asp:Label>
                     </td>
                     <td>6.7~20</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_20" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_20" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap20" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_20" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_20" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_20" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_20" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">20</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_21" runat="server" Text="PI via opening bottom edge to pad psv. Edge (um)"></asp:Label>
                     </td>
                     <td width="160">7~20</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_21" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_21" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap21" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_21" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_21" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_21" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_21" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">21</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_22" runat="server">PI edge inside seal ring (um)</asp:Label>
                     </td>
                     <td>5~13</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_22" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_22" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap22" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_22" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_22" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_22" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_22" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="38">
                     <td class="style-keyitem-number" height="38" width="32">22</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_23" runat="server">PR thickness(um)</asp:Label>
                     </td>
                     <td width="160">30<br /> 50</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_23" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_23" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap23" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_23" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_23" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_23" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_23" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">23</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_24" runat="server">UBM Size(um)</asp:Label>
                     </td>
                     <td>69~110</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_24" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_24" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap24" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_24" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_24" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_24" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_24" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">24</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_25" runat="server">UBM Overlap PSV (um)</asp:Label>
                     </td>
                     <td width="160">10~25</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_25" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_25" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap25" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_25" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_25" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_25" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_25" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">25</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_26" runat="server">UBM insdie final metal for FOC (um)</asp:Label>
                     </td>
                     <td>3~7</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_26" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_26" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap26" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_26" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_26" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_26" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_26" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">26</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_27" runat="server">UBM Plating Area(dm2)</asp:Label>
                     </td>
                     <td width="160">0.26~1.66</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_27" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_27" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap27" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_27" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_27" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_27" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_27" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">27</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_28" runat="server">UBM Density (UBM Area/Die Area)</asp:Label>
                     </td>
                     <td>2.52~25.06</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_28" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_28" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap28" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_28" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_28" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_28" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_28" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white">
                     <td class="style-keyitem-number" width="32">28</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_29" runat="server">Mushroom CD(um)</asp:Label>
                     </td>
                     <td width="160">105~173</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_29" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_29" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap29" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_29" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_29" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_29" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_29" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">29</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_30" runat="server">Min Mushroom space(um)</asp:Label>
                     </td>
                     <td>20~182</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_30" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_30" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap30" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_30" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_30" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_30" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_30" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">30</td>
                     <td class="style-keyitem-details" colspan="2">
                         <asp:Label ID="Lab_keyitem_31" runat="server">Min. Bump pitch (um)</asp:Label>
                     </td>
                     <td width="160">150~300</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_31" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_31" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap31" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_31" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_31" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_31" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_31" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">31</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_32" runat="server">Bump Height(um)</asp:Label>
                     </td>
                     <td>70~100</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_32" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_32" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap32" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_32" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_32" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_32" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_32" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">32</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_33" runat="server">Bump Diameter(um)</asp:Label>
                     </td>
                     <td width="160">-</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_33" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_33" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap33" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_33" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_33" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_33" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_33" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">33</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_34" runat="server">Bump Density (Bump Q&#39;ty/Die Area)</asp:Label>
                     </td>
                     <td>8.8~39.95</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_34" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_34" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap34" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_34" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_34" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_34" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_34" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" width="32">34</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_35" runat="server">BH/UBM ratio</asp:Label>
                     </td>
                     <td width="160">0.85~1.1</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_35" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_35" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap35" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_35" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_35" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_35" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_35" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem" height="200" rowspan="8" width="51">
                        <span style="-webkit-writing-mode: vertical-lr;">Outgoing criteria</span> </td>
                         
                     <td class="style-keyitem-number" width="32">35</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_36" runat="server">LF Bump Ag% target</asp:Label>
                     </td>
                     <td colspan="2">
                         <asp:Label ID="lab_Ver_POR_36" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_36" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap36" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_36" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_36" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_36" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_36" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">36</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_37" runat="server">Bump Height(um)</asp:Label>
                     </td>
                     <td  colspan="2" width="274">
                         <asp:Label ID="lab_Ver_POR_37" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_37" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap37" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_37" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_37" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_37" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_37" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22" width="32">37</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_38" runat="server">Bump diameter</asp:Label>
                     </td>
                     <td  colspan="2">
                         <asp:Label ID="lab_Ver_POR_38" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_38" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap38" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_38" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_38" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_38" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_38" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">38</td>
                     <td class="style-keyitem-details" colspan="2" width="321"><span style="mso-spacerun:yes">
                         <asp:Label ID="Lab_keyitem_39" runat="server">Bump Coplanarity</asp:Label>
                         </span></td>
                     <td  colspan="2" width="274">
                         <asp:Label ID="lab_Ver_POR_39" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_39" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap39" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_39" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_39" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_39" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_39" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="34">
                     <td class="style-keyitem-number" height="34" width="32">39</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_40" runat="server">Bump Shear Strenght</asp:Label>
                     </td>
                     <td  colspan="2">
                         <asp:Label ID="lab_Ver_POR_40" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_40" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap40" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_40" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_40" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_40" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_40" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">40</td>
                     <td class="style-keyitem-details" colspan="2" width="321"><span style="mso-spacerun:yes">
                         <asp:Label ID="Lab_keyitem_41" runat="server">Bump void</asp:Label>
                         </span></td>
                     <td  colspan="2">
                         <asp:Label ID="lab_Ver_POR_41" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_41" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap41" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_41" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_41" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_41" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_41" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="34">
                     <td class="style-keyitem-number" height="34" width="32">41</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_42" runat="server">PI Rougness (Ra)</asp:Label>
                     </td>
                     <td colspan="2">
                         <asp:Label ID="lab_Ver_POR_42" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_42" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="lab_gap42" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_42" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_42" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_42" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_42" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">42</td>
                     <td class="style-keyitem-details" colspan="2" width="321">
                         <asp:Label ID="Lab_keyitem_43" runat="server">Bump Resistance (POR capability)</asp:Label>
                     </td>
                     <td  colspan="2">
                         <asp:Label ID="lab_Ver_POR_43" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_43" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap43" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_43" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_43" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_43" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_43" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem" height="448" rowspan="15">
                          <span style="-webkit-writing-mode: vertical-lr;">Metrology tool</span> </td>
                     <td class="style-keyitem-number" rowspan="7" width="32">43</td>
                     <td class="style-keyitem-details" rowspan="7" width="129">
                         <asp:Label ID="Lab_keyitem_44" runat="server" Text="August"></asp:Label>
                     </td>
                     <td class="style-keyitem-details">
                         <asp:Label ID="Lab_keyitem_44_1" runat="server">Gross die</asp:Label>
                     </td>
                     <td>10~50000 ea</td>
                     <td >
                         <asp:Label ID="lab_Ver_POR_44" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_44" runat="server"></asp:Label>
                     </td>
                     <td >
                         <asp:Label ID="lab_gap44" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_44" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_44" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_44" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_44" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td class="auto-style14">　</td>
                     <td class="auto-style14">　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details">
                         <asp:Label ID="Lab_keyitem_44_2" runat="server">Expose pad</asp:Label>
                     </td>
                     <td>-</td>
                     <td>
                         <asp:Label ID="lab_Ver_POR_45" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_45" runat="server"></asp:Label>
                     </td>
                     <td class="auto-style290">
                         <asp:Label ID="lab_gap45" runat="server"></asp:Label>
                     </td>
                     <td class="auto-style266">
                         <asp:Label ID="lab_Eff_45" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_45" runat="server"></asp:Panel>
                     </td>
                     <td class="auto-style266">
                         <asp:Label ID="lab_Pot_45" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_45" runat="server"></asp:Panel>
                     </td>
                     <td class="auto-style265">　</td>
                     <td class="auto-style265">　</td>
                     <td class="auto-style265">　</td>
                     <td class="auto-style265">　</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192">
                         <asp:Label ID="Lab_keyitem_44_3" runat="server">PSV1(PI1/PBO1) opening</asp:Label>
                     </td>
                     <td>10~1000</td>
                     <td >
                         <asp:Label ID="lab_Ver_POR_46" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_46" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap46" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_46" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_46" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_46" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_46" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details" height="22" width="192">
                         <asp:Label ID="Lab_keyitem_44_4" runat="server">Bump diameter</asp:Label>
                     </td>
                     <td>10~1000</td>
                     <td >
                         <asp:Label ID="lab_Ver_POR_47" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_47" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap47" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_47" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_47" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_47" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_47" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192"><asp:Label ID="Lab_keyitem_44_5" runat="server" Text="Low SPEC of min RDL Width" ></asp:Label>
                     </td>
                     <td>2</td>
                     <td >
                         <asp:Label ID="lab_Ver_POR_48" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_48" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap48" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_48" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_48" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_48" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_48" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="42">
                     <td class="style-keyitem-details" height="42" width="192">
                         <asp:Label ID="Lab_keyitem_44_6" runat="server" Text="Low SPEC of min RDL Spacing" ></asp:Label>
                     </td>
                     <td class="auto-style274">2</td>
                     <td >
                         <asp:Label ID="lab_Ver_POR_49" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_49" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap49" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_49" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_49" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_49" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_49" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-details" height="42" width="192"><asp:Label ID="Lab_keyitem_44_7" runat="server" Text="Min RDL Width/Spacing pattern & location"></asp:Label>
                     </td>
                     <td class="auto-style18">-</td>
                     <td >
                         <asp:Label ID="lab_Ver_POR_50" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_50" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap50" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_50" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_50" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_50" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_50" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="88" rowspan="4" width="32">44</td>
                     <td class="style-keyitem-details" rowspan="4" width="129">
                         <asp:Label ID="Lab_keyitem_45" runat="server" Text="RVSI"></asp:Label>
                     </td>
                     <td class="style-keyitem-details"><asp:Label ID="Lab_keyitem_45_1" runat="server">Gross die</asp:Label>
                     </td>
                     <td class="auto-style274">10~50000 ea</td>
                     <td >
                         <asp:Label ID="lab_Ver_POR_51" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_51" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap51" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_51" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_51" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_51" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_51" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-details" height="22" width="192"><asp:Label ID="Lab_keyitem_45_2" runat="server">Bump count per die</asp:Label>
                     </td>
                     <td class="auto-style18">1~500K</td>
                     <td>
                         <asp:Label ID="lab_Ver_POR_52" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_52" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap52" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_52" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_52" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_52" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_52" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-details" height="22" width="192"><asp:Label ID="Lab_keyitem_45_3" runat="server">Bump height</asp:Label>
                     </td>
                     <td>3~1000</td>
                     <td >
                         <asp:Label ID="lab_Ver_POR_53" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_53" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap53" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_53" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_53" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_53" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_53" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-details" height="22" width="192"><asp:Label ID="Lab_keyitem_45_4" runat="server">Bump diameter</asp:Label>
                     </td>
                     <td>20~1000</td>
                     <td >
                         <asp:Label ID="lab_Ver_POR_54" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_54" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap54" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_54" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_54" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_54" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_54" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">45</td>
                     <td class="style-keyitem-details" width="129">
                         <asp:Label ID="Lab_keyitem_46" runat="server" Text="RS meter"></asp:Label>
                     </td>
                     <td class="style-keyitem-details" width="192"><asp:Label ID="Lab_keyitem_46_1" runat="server">Bump diameter</asp:Label>
                     </td>
                     <td>25~1000</td>
                     <td>
                         <asp:Label ID="lab_Ver_POR_55" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_55" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap55" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_55" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_55" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_55" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_55" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="38">
                     <td class="style-keyitem-number" height="38" width="32">46</td>
                     <td class="style-keyitem-details" width="129">
                         <asp:Label ID="Lab_keyitem_47" runat="server" Text="Void (X-ray)"></asp:Label>
                     </td>
                     <td class="style-keyitem-details" width="192"><asp:Label ID="Lab_keyitem_47_1" runat="server">Bump diameter</asp:Label>
                     </td>
                     <td width="160">CS/DF site: 80~1000<br /> CH site: 10~1000</td>
                     <td  width="114">
                         <asp:Label ID="lab_Ver_POR_56" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_56" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap56" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_56" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_56" runat="server"></asp:Panel>

                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_56" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_56" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">47</td>
                     <td class="style-keyitem-details" width="129">
                         <asp:Label ID="Lab_keyitem_48" runat="server" Text="Bump shear"></asp:Label>
                     </td>
                     <td class="style-keyitem-details" width="192"><asp:Label ID="Lab_keyitem_48_2" runat="server">Bump diameter</asp:Label>
                     </td>
                     <td width="160">3~400</td>
                     <td>
                         <asp:Label ID="lab_Ver_POR_57" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_57" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap57" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_57" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_57" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_57" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_57" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="44">
                     <td class="style-keyitem-number" height="44" width="32">48</td>
                     <td class="style-keyitem-details" width="129">
                         <asp:Label ID="Lab_keyitem_49" runat="server" Text="Bump pull"></asp:Label>
                     </td>
                     <td " width=" 192"="" class="style-keyitem-details"><asp:Label ID="Lab_keyitem_49_1" runat="server">Bump diameter</asp:Label>
                     </td>
                     <td width="160">83-140, 200-326</td>
                     <td >
                         <asp:Label ID="lab_Ver_POR_58" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_58" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap58" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_58" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_58" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_58" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_58" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="42">
                     <td class="style-keyitem" height="86" rowspan="3" width="51">
                         <span style="-webkit-writing-mode: vertical-lr;">AB&nbsp; requirement</span> </td>                                                
                     <td class="style-keyitem-number" width="32">49</td>
                     <td class="style-keyitem-details" width="129">
                         <asp:Label ID="Lab_keyitem_59" runat="server">Bump to bump space</asp:Label>
                     </td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">FCCSP &gt;19um<br /> FCBGA&gt;20um</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_59" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_59" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap59" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_59" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_59" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_59" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_59" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="22">
                     <td class="style-keyitem-number" height="22">50</td>
                     <td class="style-keyitem-details">
                         <asp:Label ID="Lab_keyitem_60" runat="server">SMO</asp:Label>
                     </td>
                     <td class="style-keyitem-details">　</td>
                     <td width="160">-</td>
                     <td class="style-td-red" >
                         <asp:Label ID="lab_Ver_POR_60" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_60" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap60" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_60" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_60" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_60" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_60" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22">51</td>
                     <td class="style-keyitem-details">
                         <asp:Label ID="Lab_keyitem_61" runat="server">UBM/SMO ratio</asp:Label>
                     </td>
                     <td class="style-keyitem-details">　</td>
                     <td width="160">0.85 - 1.1</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_61" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_61" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap61" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_61" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_61" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_61" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_61" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem" height="128" rowspan="4" width="51">
                          <span style="-webkit-writing-mode: vertical-lr;"> Special&nbsp; Requirement</span></td>                                                   
                     <td class="style-keyitem-number" width="32">52</td>
                     <td class="style-keyitem-details" width="129">
                         <asp:Label ID="Lab_keyitem_62" runat="server">Process/Machine</asp:Label>
                     </td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">-</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_62" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_62" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap62" runat="server"></asp:Label>                          
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_62" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_62" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_62" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_62" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">53</td>
                     <td class="style-keyitem-details" width="129">
                         <asp:Label ID="Lab_keyitem_63" runat="server">Material</asp:Label>
                     </td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">-</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_63" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_63" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap63" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_63" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_63" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_63" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_63" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-gray" height="42">
                     <td class="style-keyitem-number" height="42" width="32">54</td>
                     <td class="style-keyitem-details" width="129">
                         <asp:Label ID="Lab_keyitem_64" runat="server">Measurement tool</asp:Label>
                     </td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">-</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_64" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_64" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap64" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_64" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_64" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_64" runat="server"></asp:Label>
                          <asp:Panel ID="Panel_Pot_64" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
                 <tr class="style-td-white" height="22">
                     <td class="style-keyitem-number" height="22" width="32">55</td>
                     <td class="style-keyitem-details" width="129">
                         <asp:Label ID="Lab_keyitem_65" runat="server">Reliability</asp:Label>
                     </td>
                     <td class="style-keyitem-details" width="192">　</td>
                     <td width="160">-</td>
                     <td class="style-td-red">
                         <asp:Label ID="lab_Ver_POR_65" runat="server"></asp:Label>
                     </td>
                     <td class="style-td-blue">
                         <asp:Label ID="lab_Ver_New_65" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_gap65" runat="server"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lab_Eff_65" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Eff_65" runat="server"></asp:Panel>
                     </td>
                     <td>
                         <asp:Label ID="lab_Pot_65" runat="server"></asp:Label>
                         <asp:Panel ID="Panel_Pot_65" runat="server"></asp:Panel>
                     </td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                     <td>　</td>
                 </tr>
             </table>  
            
        


    </asp:Panel>

             
             
            
   
      



    </form>
   
</body>
</html>
