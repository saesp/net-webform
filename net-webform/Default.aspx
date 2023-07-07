<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="net_webform._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main class="container">
        <%--Griglia per Edit e Delete--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" OnRowEditing="Edit" OnRowCancelingEdit="CancelingEdit"
    OnRowUpdating="Update" OnRowDeleting="Delete" EmptyDataText="No records have been added.">
            <Columns>
                <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="OrderDate" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtOrderDate" runat="server" Text='<%# Eval("OrderDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="InsertionDate" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblInsertionDate" runat="server" Text='<%# Eval("InsertionDate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtInsertionDate" runat="server" Text='<%# Eval("InsertionDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ChangedDate" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblChangedDate" runat="server" Text='<%# Eval("ChangedDate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtChangedDate" runat="server" Text='<%# Eval("ChangedDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Notes" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblNotes" runat="server" Text='<%# Eval("Notes") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNotes" runat="server" Text='<%# Eval("Notes") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Typology" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblTypology" runat="server" Text='<%# Eval("Typology") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlTypology" runat="server" Width="140">
                        <asp:ListItem Text="Dockstation" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Workstation" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150"/>
            </Columns>
        </asp:GridView>


        <%--Griglia per Create--%>
        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
            <tr>
                <td style="width: 150px">
                    Name:<br />
                    <asp:TextBox ID="txtName" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    OrderDate:<br /> 
                    <asp:TextBox Id="txtOrderDate" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    InsertionDate:<br />
                    <asp:TextBox Id="txtInsertionDate" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    ChangedDate:<br />
                    <asp:TextBox Id="txtChangedDate" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    Notes:<br />
                    <asp:TextBox Id="txtNotes" runat="server" Width="140" />
                </td>
                
                <td style="width: 150px">
                    Typology:<br>
                    <asp:DropDownList ID="ddlTypology" runat="server" Width="140">
                        <asp:ListItem Text="Dockstation" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Workstation" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>

                <td style="width: 100px">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Create" />
                </td>
            </tr>
        </table>
    </main>

</asp:Content>
