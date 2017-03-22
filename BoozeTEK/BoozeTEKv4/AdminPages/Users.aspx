<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="BoozeTEKv4.AdminPages.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin All Users Page</h3>
    <br />
    <br />

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <asp:GridView ID="gvUsersAll" runat="server" AutoGenerateColumns="False" DataSourceID="sdsUsersAll" CssClass="table" AllowSorting="True" AllowPaging="True" DataKeyNames="User_ID" PageSize="15">
                    <Columns>
                        <asp:BoundField DataField="User_ID" HeaderText="User ID" SortExpression="User_ID" InsertVisible="False" ReadOnly="True" HeaderStyle-Width="150px" />
                        <asp:BoundField DataField="User_Email" HeaderText="User Email" SortExpression="User_Email" HeaderStyle-Width="300px" />
                        <asp:BoundField DataField="User_Pwd" HeaderText="User Hashed Password" SortExpression="User_Pwd" InsertVisible="False" HeaderStyle-Width="400px" />
                        <asp:BoundField DataField="User_Salt" HeaderText="User Password Salt" SortExpression="User_Salt" InsertVisible="False" HeaderStyle-Width="400px" />
                        <asp:BoundField DataField="Admin_Rights" HeaderText="Admin Rights" SortExpression="Admin_Rights" HeaderStyle-Width="150px" />

                        <asp:HyperLinkField DataNavigateUrlFields="User_ID" HeaderText="View Edit" DataNavigateUrlFormatString="~/Admin/User/{0}" Text="View/Edit" HeaderStyle-Width="150px" />



                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" Position="TopAndBottom" />
                    <PagerStyle BackColor="WhiteSmoke" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="sdsUsersAll" runat="server" ConnectionString="<%$ ConnectionStrings:SE265_BoozeTekConnectionString %>" SelectCommand="Users_Get_All" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
