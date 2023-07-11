<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="net_webform._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main class="container">

        <%--Finestra popup modale--%>
        <asp:Button ID="ClientButton" CssClass="mb-3 btn btn-dark" runat="server" Text="Add" />

        <asp:Panel ID="ModalPanel" CssClass="bg-dark rounded-4 p-3" runat="server" Width="500px">
             <%--Table Create--%>
            <table class="mb-5 m-auto" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                <tr class="d-flex flex-column justify-content-center text-white">
                    <td style="width: 150px">
                        Name:*<br />
                        <asp:TextBox ID="txtName" runat="server" Width="140" />
                    </td>
                
                    <td style="width: 150px">
                        OrderDate:*<br /> 
                        <asp:TextBox Id="txtOrderDate" runat="server" Width="140" />
                    </td>
                
                    <td style="width: 150px">
                        InsertionDate:*<br />
                        <asp:TextBox Id="txtInsertionDate" runat="server" Width="140" />
                    </td>
                
                    <td style="width: 150px">
                        ChangedDate:*<br />
                        <asp:TextBox Id="txtChangedDate" runat="server" Width="140" />
                    </td>
                
                    <td style="width: 150px">
                        Notes:<br />
                        <asp:TextBox Id="txtNotes" runat="server" Width="140" />
                    </td>
                
                    <td style="width: 150px">
                        Typology:*<br>
                        <asp:DropDownList ID="ddlTypology" runat="server" Width="140">
                            <asp:ListItem Text="Dockstation" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Workstation" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                
                    <td style="width: 100px">
                        <br />
                        <asp:Button ID="btnAdd" CssClass="btn btn-outline-success" runat="server" Text="Add" OnClick="Create" />
                    </td>
                </tr>
            </table>

            <br />
             <asp:Button ID="OKButton" CssClass="btn btn-outline-danger" runat="server" Text="Close" />
        </asp:Panel>

        <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" TargetControlId="ClientButton" PopupControlID="ModalPanel" OkControlID="OKButton" />



        <%--Griglia Read + Edit e Delete--%>
        <asp:GridView Id="GridView1" CssClass="table table-striped" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" OnRowEditing="Edit" OnRowCancelingEdit="CancelingEdit"
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

                <asp:TemplateField HeaderText="Order Date" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtOrderDate" runat="server" Text='<%# Eval("OrderDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Insertion Date" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblInsertionDate" runat="server" Text='<%# Eval("InsertionDate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtInsertionDate" runat="server" Text='<%# Eval("InsertionDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Changed Date" ItemStyle-Width="150">
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
                        <asp:Label ID="lblTypology" runat="server" Text='<%# Eval("Typology.Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlTypology" runat="server" Width="140">
                        <asp:ListItem Text="Dockstation" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Workstation" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-outline-dark" Text="Edit" CommandName="Edit" />
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-outline-danger" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');" />
                </ItemTemplate>
                </asp:TemplateField>


                <%--<asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150"/>--%>
            </Columns>
        </asp:GridView>
    </main>

</asp:Content>
