<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MyWebSite.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="TextBox1" runat="server" Width="247px"></asp:TextBox>&nbsp&nbsp
    <asp:Button ID="Button1" runat="server" Text="Search" Width="119px" OnClick="Search_Button_Click" />
    <br/> <br/>
    <div id="message" runat="server">
    </div>
    <br/>
    <asp:GridView ID="ItemGrid" runat="server">
    </asp:GridView>
</asp:Content>