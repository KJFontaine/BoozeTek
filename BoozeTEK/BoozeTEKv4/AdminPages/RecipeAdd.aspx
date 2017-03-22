<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RecipeAdd.aspx.cs" Inherits="BoozeTEKv4.AdminPages.RecipeAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin MIX Page</h3>
    <br />
    <br />
    <div class="container-fluid">
        <div class="form-horizontal">
            <fieldset>
                <br />

                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <p></p>
                    </div>
                    <asp:Label ID="lblDrinkName" runat="server" Text="Drink Name:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="txtDrinkName" runat="server"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDrinkName" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtDrinkName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblDrinkDescription" runat="server" Text="Drink Description:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="txtDrinkDescription" runat="server"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDrinkDescription" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtDrinkDescription"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>
                <br />

                <asp:Label ID="lblNumOfIngredients" runat="server" Text="Number of Ingredients:" CssClass="col-lg-2 control-label"></asp:Label>
                <asp:DropDownList ID="ddlOptions" runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlOptions_SelectedIndexChanged1">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                Options:
                <br />
                <asp:PlaceHolder runat="server" ID="ctrlPlaceholder"></asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="ctrlPlaceHolder1"></asp:PlaceHolder>
                <br />

                <div class="form-group">
                    <%--spacing for text to aline with textboxes--%>
                    <asp:Label ID="lblIngredientType" runat="server" Text="Ingredient Type:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-5">

                        <asp:DropDownList ID="ddlIngredientType" runat="server" CssClass="form-control" DataSourceID="sdsIngredientType" DataTextField="Ingredient_Type" DataValueField="Ingredient_Type" OnSelectedIndexChanged="ddlIngredientType_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true"></asp:DropDownList>
                        <asp:SqlDataSource ID="sdsIngredientType" runat="server" ConnectionString="<%$ ConnectionStrings:SE265_BoozeTekConnectionString %>" SelectCommand="IngredientTypes_Get_All" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="rfvIngredientType" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="ddlIngredientType"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
                <br />

                <asp:DropDownList ID="IngredientName" runat="server" AutoPostBack="true">
                </asp:DropDownList>

                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <br />
                        <br />
                        <br />
                        <h2>
                            <asp:Label ID="lblMessage" runat="server" /></h2>
                        <br />

                    </div>
                </div>
            </fieldset>
        </div>
    </div>

</asp:Content>
