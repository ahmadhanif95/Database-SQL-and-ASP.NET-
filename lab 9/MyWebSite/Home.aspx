<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MyWebSite.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Item Number<asp:TextBox ID="TxtItmNo" runat="server" ></asp:TextBox>
    <br />
    Item Name<asp:TextBox ID="TxtItmName" runat="server"></asp:TextBox>
    <br />
    Units<asp:TextBox ID="TxtUnits" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Add New Item" OnClick="Button1_Click" />
       <asp:GridView ID="ItemGrid" runat="server" OnRowDeleting="ItemGrid_RowDeleting" Width="589px" AutoGenerateColumns="False" EnableViewState="False" OnRowCancelingEdit="ItemGrid_RowCancellingEdit" OnRowEditing="ItemGrid_RowEditing" OnRowUpdating="ItemGrid_RowUpdating">


          
           <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />

            <asp:TemplateField HeaderText="ItemNo" HeaderStyle-HorizontalAlign="Left">
          <EditItemTemplate>
              <asp:Label ID="txtItemNo" runat="server" Text='<%# Bind("ItemNo") %>'></asp:Label>
           </EditItemTemplate>

            <ItemTemplate>
            <asp:Label ID="lblItemNo" runat="server" Text='<%# Bind("ItemNo") %>'></asp:Label>
            </ItemTemplate>
             <HeaderStyle HorizontalAlign="Left"></HeaderStyle>

             </asp:TemplateField>
            <asp:TemplateField HeaderText="ItemName" HeaderStyle-HorizontalAlign="Left">
	        <EditItemTemplate>
	        <asp:TextBox ID="txtItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
	        </EditItemTemplate>
	        <ItemTemplate>
	        <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
	        </ItemTemplate>
	        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
         </asp:TemplateField>

            <asp:TemplateField HeaderText="TotalUnits" HeaderStyle-HorizontalAlign="Left">
	<EditItemTemplate>
	<asp:TextBox ID="txtTotalUnits" runat="server" Text='<%# Bind("TotalUnits") %>'></asp:TextBox>
	</EditItemTemplate>
	<ItemTemplate>
	<asp:Label ID="lblTotalUnits" runat="server" Text='<%# Bind("TotalUnits") %>'></asp:Label>
	</ItemTemplate>
	<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
</asp:TemplateField>

        </Columns>

       </asp:GridView>
</asp:Content>
