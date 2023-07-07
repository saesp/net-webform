<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="net_webform._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" OnRowEditing="Edit" OnRowCancelingEdit="CancelingEdit"
    OnRowUpdating="Update" OnRowDeleting="Delete" EmptyDataText="No records have been added.">
            <Columns>
                <%--<asp:BoundField DataField="Id" HeaderText="ID" />--%>
                <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" />
                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="InsertionDate" HeaderText="Insertion Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="ChangedDate" HeaderText="Changed Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" ItemStyle-Width="300" />
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>

        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
            <tr>
                <%--<th>ID</th>--%>
                <th>Name</th>
                <th>Order Date</th>
                <th>Insertion Date</th>
                <th>Changed Date</th>
                <th>Notes</th>
                <th>Typology</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtId" runat="server" Width="80" />
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Width="140" />
                </td>
                <td>
                    <asp:TextBox ID="txtOrderDate" runat="server" Width="100" />
                </td>
                <td>
                    <asp:TextBox ID="txtInsertionDate" runat="server" Width="100" />
                </td>
                <td>
                    <asp:TextBox ID="txtChangedDate" runat="server" Width="100" />
                </td>
                <td>

                    <asp:TextBox ID="txtNotes" runat="server" Width="200" />
                </td>
                <td>
                    <asp:TextBox ID="txtTypology" runat="server" Width="100" />
                </td>
                <td>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("Id") %>' />
                </td>
            </tr>
        </table>
    </main>

</asp:Content>
