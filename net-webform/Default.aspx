<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="net_webform.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">

        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Insertion Date</th>
                        <th scope="col">Changed Date</th>
                        <th scope="col">Notes</th>
                        <th scope="col">Typology</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="GridView" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("OrderDate") %></td>
                                <td><%# Eval("InsertionDate") %></td>
                                <td><%# Eval("ChangedDate") %></td>
                                <td><%# Eval("Notes") %></td>
                                <td><%# Eval("Typology.Name") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

    </main>
</asp:Content>
