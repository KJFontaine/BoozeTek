<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="BoozeTEKv4.AdminPages.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin Home Page</h3>
    <br />
    <br />

    <div class="row">
        <div class="col-md-12">
            <asp:LinkButton ID="lbtnViewAllDrinks" runat="server" Style="margin-left: 200px; width: 210px" OnClick="lbtnViewAllDrinks_Click" CssClass="btn btn-default btn-lg" CausesValidation="False">View All Drinks</asp:LinkButton>
            <asp:LinkButton ID="lbtnAddDrink" runat="server" Style="margin-left: 100px; width: 210px" OnClick="lbtnAddDrink_Click" CssClass="btn btn-default btn-lg" CausesValidation="False">Add A New Drink</asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton ID="lbtnViewAllIngredients" runat="server" Style="margin-left: 200px; width: 210px; margin-top: 100px" OnClick="lbtnViewAllIngredients_Click" CssClass="btn btn-primary btn-lg" CausesValidation="False">View All Ingredients</asp:LinkButton>
            <asp:LinkButton ID="lbtnAddIngredient" runat="server" Style="margin-left: 100px; width: 210px; margin-top: 100px" OnClick="lbtnAddIngredient_Click" CssClass="btn btn-primary btn-lg" CausesValidation="False">Add A New Ingredient</asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton ID="lbtnViewAllMixTables" runat="server" Style="margin-left: 200px; width: 210px; margin-top: 100px" OnClick="lbtnViewAllMixTables_Click" CssClass="btn btn-info btn-lg" CausesValidation="False">View All Mix Tables</asp:LinkButton>
            <asp:LinkButton ID="lbtnViewAllVirtualBars" runat="server" Style="margin-left: 100px; width: 210px; margin-top: 100px" OnClick="lbtnViewAllVirtualBars_Click" CssClass="btn btn-info btn-lg" CausesValidation="False">View All Virtual Bars</asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton ID="lbtnViewAllUsers" runat="server" Style="margin-left: 200px; width: 210px; margin-top: 100px" OnClick="lbtnViewAllUsers_Click" CssClass="btn btn-warning btn-lg" CausesValidation="False">View All Users</asp:LinkButton>
            <asp:LinkButton ID="lbtnAddUser" runat="server" Style="margin-left: 100px; width: 210px; margin-top: 100px" OnClick="lbtnAddUser_Click" CssClass="btn btn-warning btn-lg" CausesValidation="False">Add A New User</asp:LinkButton>

        </div>
    </div>
</asp:Content>
