<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Drinks.aspx.cs" Inherits="BoozeTEKv4.AdminPages.Drinks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin All Drinks</h3>
    <br />
    <br />

    <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">

                <asp:GridView ID="gvDrinksAll" runat="server" AutoGenerateColumns="False" DataSourceID="sdsDrinksAll" CssClass="table" AllowSorting="True" AllowPaging="True" DataKeyNames="Drink_ID" PageSize="15">
                    <Columns>
                        <asp:BoundField DataField="Drink_ID" HeaderText="Drink ID" SortExpression="Drink_ID" InsertVisible="False" ReadOnly="True" HeaderStyle-Width="150px" />
                        <asp:BoundField DataField="Drink_Name" HeaderText="Drink Name" SortExpression="Drink_Name" HeaderStyle-Width="400px" />
                        <asp:BoundField DataField="Drink_Desc" HeaderText="Drink Description" SortExpression="Drink_Desc" HeaderStyle-Width="400px" />
  
<asp:HyperLinkField DataNavigateUrlFields="Drink_ID" DataNavigateUrlFormatString="~/Admin/Drink/{0}" Text="View/Edit" HeaderText="View Edit" HeaderStyle-Width="150px"/>
<asp:HyperLinkField DataNavigateUrlFields="Drink_ID" DataNavigateUrlFormatString="~/Admin/RecipeAdd/{0}" Text="Mix Table" HeaderText="Mix" HeaderStyle-Width="150px"/>
                  
                          </Columns>
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" Position="TopAndBottom" />
                    <PagerStyle BackColor="WhiteSmoke" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="sdsDrinksAll" runat="server" ConnectionString="<%$ ConnectionStrings:SE265_BoozeTekConnectionString %>" SelectCommand="Drinks_Get_All" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    </div>


</asp:Content>
