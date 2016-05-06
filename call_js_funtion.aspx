<%@ Page Language="C#" AutoEventWireup="true" CodeFile="call_js_funtion.aspx.cs" Inherits="call_js_funtion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script type="text/javascript">
         function CallMe(src, dest) {
             var ctrl = document.getElementById(src);
             // call server side method
             PageMethods.GetContactName(ctrl.value, CallSuccess, CallFailed, dest);
         }

         // set the destination textbox value with the ContactName
         function CallSuccess(res, destCtrl) {
             var dest = document.getElementById(destCtrl);
             dest.value = res;
         }

         // alert message on some failure
         function CallFailed(res, destCtrl) {
             alert(res.get_message());
         }
     </script>


 </head> 
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ></asp:ScriptManager>
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Width="300px"></asp:TextBox>
    </div>
    </form>
</body>
</html>
