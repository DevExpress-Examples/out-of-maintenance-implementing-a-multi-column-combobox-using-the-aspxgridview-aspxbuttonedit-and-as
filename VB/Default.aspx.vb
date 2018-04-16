Imports DevExpress.Web.ASPxGridView
Imports System

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Overridable Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        ASPxGridView1.Width = ASPxButtonEdit1.Width
    End Sub
    Protected Sub ASPxGridView1_HtmlRowCreated(ByVal sender As Object, ByVal e As ASPxGridViewTableRowEventArgs)
        If e.RowType = GridViewRowType.Data Then
            e.Row.Attributes("data") = e.GetValue("CategoryName").ToString()
        End If
    End Sub
End Class