<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="net_webform._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main class="container">

        <%--FINESTRA POPUP MODALE--%>

        <%--Button per aprire--%>
        <asp:LinkButton ID="ClientButton" CssClass="my-3 btn btn-dark" runat="server">
            <i class="fa-solid fa-plus"></i> Add
        </asp:LinkButton>  <%--Modo alternativo:  <asp:Button ID="ClientButton" CssClass="mb-3 btn btn-dark" runat="server" Text="Add" />--%>

        <%--Contenuto finestra--%>
        <asp:Panel ID="ModalPanel" CssClass="bg-dark rounded-4 p-3" runat="server" Width="500px">
            <%--Button close--%>
            <asp:LinkButton ID="OKButton" CssClass="btn btn-outline-danger border-0 mb-2" runat="server">
                <i class="fa-solid fa-xmark"></i>
            </asp:LinkButton>

             <%--Table Create--%>
            <table class="mb-5 m-auto" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                <tr class="d-flex flex-column justify-content-center text-white" style="width: 213px">
                    <td>
                        Name:*<br />
                        <asp:TextBox ID="txtName" runat="server" /> <br />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" CssClass="text-danger" ControlToValidate="txtName" ErrorMessage="Please enter a name." />
                    </td>

                    <td>
                        OrderDate:*<br /> 
                        <asp:TextBox ID="txtOrderDate" runat="server" /> <br />
                        <asp:RequiredFieldValidator ID="rfvOrderDate" runat="server" CssClass="text-danger" ControlToValidate="txtOrderDate" ErrorMessage="Please enter an order date." />
                        <%--<asp:CompareValidator ID="cvOrderDate" runat="server" CssClass="text-danger" ControlToValidate="txtOrderDate" Operator="DataTypeCheck" Type="Date" ErrorMessage="Please enter a valid order date." />--%>
                    </td>

                    <td>
                        InsertionDate:*<br />
                        <asp:TextBox ID="txtInsertionDate" runat="server" /> <br />
                        <asp:RequiredFieldValidator ID="rfvInsertionDate" runat="server" CssClass="text-danger" ControlToValidate="txtInsertionDate" ErrorMessage="Please enter an insertion date." />
                    </td>

                    <td>
                        ChangedDate:*<br />
                        <asp:TextBox ID="txtChangedDate" runat="server" /> <br />
                        <asp:RequiredFieldValidator ID="rfvChangedDate" runat="server" CssClass="text-danger" ControlToValidate="txtChangedDate" ErrorMessage="Please enter a changed date." />
                    </td>

                    <td>
                        Notes:<br />
                        <asp:TextBox ID="txtNotes" runat="server" />
                    </td>

                    <br>

                    <td class="mt-4">
                        Typology:*<br>
                        <asp:DropDownList ID="ddlTypology" runat="server">
                            <asp:ListItem Text="Dockstation" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Workstation" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator ID="rfvTypology" runat="server" CssClass="text-danger" ControlToValidate="ddlTypology" ErrorMessage="Please select a typology." />--%>
                    </td>

                </tr>


                <%--Button add--%>
                <td>
                    <br />
                    <asp:LinkButton ID="btnAdd" CssClass="btn btn-success" runat="server" OnClick="Create">
                        <i class="fa-solid fa-check"></i>
                    </asp:LinkButton>
                </td>
            </table>
        </asp:Panel>

        <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" TargetControlId="ClientButton" PopupControlID="ModalPanel" OkControlID="OKButton" />


        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
            <%--<ContentTemplate>--%>

                <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table" PageSize="10" OnRowEditing="Edit" OnRowDeleting="Delete">--%>
                <asp:GridView Id="GridView1" CssClass="table table-striped" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" OnRowDeleting="Delete" EmptyDataText="No records have been added.">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" HtmlEncode="true" />
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" HtmlEncode="true" />
                        <asp:BoundField DataField="InsertionDate" HeaderText="Insertion Date" HtmlEncode="true" />
                        <asp:BoundField DataField="ChangedDate" HeaderText="Changed Date" HtmlEncode="true" />
                        <asp:BoundField DataField="Notes" HeaderText="Notes" HtmlEncode="true" />
                        <asp:BoundField DataField="Typology.Name" HeaderText="Typology" HtmlEncode="true" />
                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="">
                            <ItemTemplate>
                            <div class="btn-group btn-group-sm">
                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-primary" OnClick="Edit" CommandArgument='<%#Eval("Id")%>' ToolTip="Modifica" CausesValidation="false">
                            <span class="glyphicon glyphicon-pencil"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger" CommandName="Delete" CommandArgument='<%#Eval("Id") %>' ToolTip="Elimina" CausesValidation="false">
                            <span class="glyphicon glyphicon-trash"></span>
                            </asp:LinkButton>
                                </ItemTemplate>
                        </asp:TemplateField>
                       <%--<asp:TemplateField ItemStyle-Width="30px" HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-outline-danger" CommandName="Delete" ToolTip="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');">
                                    <i class="fas fa-trash"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>
                </asp:GridView>

                <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" style="display:none">
                    <asp:Label Font-Bold="true" ID="Label4" runat="server" Text="System Details"></asp:Label>
                    <br />
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Label ID="LabelName" runat="server" Text="Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNameEdit" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="LabelOrderDate" runat="server" Text="Order Date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOrderDateEdit" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="LabelInsertDate" runat="server" Text="Insertion Date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertionDateEdit" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="LabelChangedDate" runat="server" Text="Changed Date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtChangedDateEdit" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="LabelNotes" runat="server" Text="Notes"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNotesEdit" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="LabelTypology" runat="server" Text="Typology"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="typologyEdit" runat="server">
                                    <asp:ListItem Text="Dockstation" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Workstation" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Button ID="btnSave" runat="server" Text="Save" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:LinkButton ID="lnkFake" runat="server" Text=""></asp:LinkButton>

                <ajaxToolkit:ModalPopupExtender ID="popup" runat="server" DropShadow="false" TargetControlID="lnkFake" PopupControlID="pnlAddEdit" BackgroundCssClass="modalBackground" />

                <%--<cc1:ModalPopupExtender ID="popup" runat="server" DropShadow="false" PopupControlID="pnlAddEdit"
                    TargetControlID="lnkFake" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>--%>

            <%--</ContentTemplate>--%>

        <%--</asp:UpdatePanel>--%>

    </main>

</asp:Content>

