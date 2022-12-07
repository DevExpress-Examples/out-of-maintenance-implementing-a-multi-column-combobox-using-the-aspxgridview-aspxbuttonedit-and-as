using DevExpress.Web;
using System;

public partial class _Default : System.Web.UI.Page
{
    protected virtual void Page_Load(object sender, EventArgs e)
    {
        ASPxGridView1.Width = ASPxButtonEdit1.Width;
    }
    protected void ASPxGridView1_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
    {
        if (e.RowType == GridViewRowType.Data)
            e.Row.Attributes["data"] = e.GetValue("CategoryName").ToString();
    }
}