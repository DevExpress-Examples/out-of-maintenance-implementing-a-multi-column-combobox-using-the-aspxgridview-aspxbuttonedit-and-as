<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script type="text/javascript">
        function OnRowClick(s, e) {
            var row = s.GetRow(e.visibleIndex);
            ASPxButtonEdit1.SetValue(row.attributes["data"].nodeValue);
        }
        function OnRowDblClick(s, e) {
            var row = s.GetRow(e.visibleIndex);
            ASPxButtonEdit1.SetValue(row.attributes["data"].nodeValue);
            ASPxPopupControl1.Hide();
        }
        function OnButtonClick(s, e) {
            ASPxPopupControl1.Show();
        }
    </script>
    <title>Implementing a Multi-Column ComboBox using the ASPxGridView, ASPxButtonEdit and ASPxPopupControl</title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxButtonEdit ID="ASPxButtonEdit1" runat="server" Width="430px">
            <Buttons>
                <dx:EditButton>
                </dx:EditButton>
            </Buttons>            
            <ClientSideEvents ButtonClick="OnButtonClick" />
        </dx:ASPxButtonEdit>
        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server"
            PopupElementID="ASPxButtonEdit1" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Below"
            ShowCloseButton="False" ShowHeader="False" Height="0px" Width="0px">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxGridView runat="server" KeyFieldName="CategoryID" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" Width="428px" ID="ASPxGridView1" OnHtmlRowCreated="ASPxGridView1_HtmlRowCreated">
                        <ClientSideEvents RowClick="OnRowClick" RowDblClick="OnRowDblClick" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1"></dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
                        <SettingsPager PageSize="20"></SettingsPager>
                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="150" />
                    </dx:ASPxGridView>
                </dx:PopupControlContentControl>
            </ContentCollection>
            <ContentStyle>
                <Paddings Padding="0px"></Paddings>
            </ContentStyle>
            <Border BorderStyle="None"></Border>
        </dx:ASPxPopupControl>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]">
        </asp:AccessDataSource>
    </form>
</body>
</html>