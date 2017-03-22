<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ingredients.aspx.cs" Inherits="BoozeTEKv4.AdminPages.Ingredients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin All Ingredients</h3>
    <br />
    <br />

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">

                <asp:GridView ID="gvIngredientsAll" runat="server" AutoGenerateColumns="False" DataSourceID="sdsIngredientsAll" CssClass="table" AllowSorting="True" AllowPaging="True" DataKeyNames="Ingredient_ID" PageSize="15">
                    <Columns>
                        <asp:BoundField DataField="Ingredient_ID" HeaderText="Ingredient ID" SortExpression="Ingredient_ID" InsertVisible="False" ReadOnly="True" HeaderStyle-Width="150px" />
                        <asp:BoundField DataField="Ingredient_Type" HeaderText="Ingredient Type" SortExpression="Ingredient_Type" HeaderStyle-Width="300px" />
                        <asp:BoundField DataField="Ingredient_Name" HeaderText="Ingredient Name" SortExpression="Ingredient_Name" HeaderStyle-Width="300px" />

                        <asp:HyperLinkField DataNavigateUrlFields="Ingredient_ID" DataNavigateUrlFormatString="~/Admin/Ingredient/{0}" Text="View/Edit" HeaderText="View Edit" HeaderStyle-Width="150px" />

                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" Position="TopAndBottom" />
                    <PagerStyle BackColor="WhiteSmoke" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="sdsIngredientsAll" runat="server" ConnectionString="<%$ ConnectionStrings:SE265_BoozeTekConnectionString %>" SelectCommand="Ingredients_Get_All" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
