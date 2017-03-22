<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RecipeDrinkAdd.aspx.cs" Inherits="BoozeTEKv4.AdminPages.RecipeDrinkAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">

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
                        <asp:TextBox ID="txtDrinkName" runat="server" CssClass="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDrinkName" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtDrinkName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblDrinkDescription" runat="server" Text="Drink Description:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="txtDrinkDescription" runat="server" CssClass="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDrinkDescription" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtDrinkDescription"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>
                <br />

                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnAdd" runat="server" CssClass="btn btn-success" OnClick="lbtnAdd_Click">Add Drink</asp:LinkButton>
                        &nbsp; &nbsp; &nbsp;
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
