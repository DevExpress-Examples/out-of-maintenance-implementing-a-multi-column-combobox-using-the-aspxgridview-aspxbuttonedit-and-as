<%-- BeginRegion Page setup --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Editors_ExtLookup"%>

<%@ Register Assembly="DevExpress.Web.v8.2" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
	Namespace="System.Web.UI" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.2" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>Implementing a Multi-Column ComboBox using the ASPxGridView, ASPxButtonEdit and ASPxPopupControl</title>
</head>
<body>
	<form id="form1" runat="server">

		<dxe:ASPxButtonEdit ID="ASPxButtonEdit1" runat="server" Width="430px">
			<Buttons>
<dxe:EditButton>
<Image Url="Images/edtDropDown.gif"></Image>
</dxe:EditButton>
</Buttons>
			<ClientSideEvents ButtonClick="function(s, e) {
	ASPxPopupControl1.Show();
}" />
		</dxe:ASPxButtonEdit>
		<dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server"
			PopupElementID="ASPxButtonEdit1" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Below"
			ShowCloseButton="False" ShowHeader="False" Height="0px" Width="0px">
			<ContentCollection>
<dxpc:PopupControlContentControl runat="server">
<dxwgv:ASPxGridView runat="server" KeyFieldName="CategoryID" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" Width="428px" ID="ASPxGridView1" OnHtmlRowCreated="ASPxGridView1_HtmlRowCreated">
<ClientSideEvents RowClick="function(s, e) {
	var row = s.GetRow(e.visibleIndex);
	ASPxButtonEdit1.SetValue(row.attributes[&quot;data&quot;].nodeValue);
}" RowDblClick="function(s, e) {
	var row = s.GetRow(e.visibleIndex);
	ASPxButtonEdit1.SetValue(row.attributes[&quot;data&quot;].nodeValue);
	ASPxPopupControl1.Hide();
}"></ClientSideEvents>
<Columns>
<dxwgv:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1"></dxwgv:GridViewDataTextColumn>
</Columns>

<SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

<SettingsPager PageSize="20"></SettingsPager>
	<Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="150" />
</dxwgv:ASPxGridView>
 </dxpc:PopupControlContentControl>
</ContentCollection>
			<contentstyle>
<Paddings Padding="0px"></Paddings>
</contentstyle>
			<border borderstyle="None"></border>
		</dxpc:ASPxPopupControl>
		<br />
		&nbsp;&nbsp;&nbsp;
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:AccessDataSource>
		&nbsp;<br />
	</form>
</body>
</html>