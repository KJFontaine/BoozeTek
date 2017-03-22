<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Drink.aspx.cs" Inherits="BoozeTEKv4.AdminPages.Drink" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin Drink Page</h3>
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
                        <asp:LinkButton ID="lbtnUpdate" runat="server" CssClass="btn btn-success" OnClick="lbtnUpdate_Click">Update</asp:LinkButton>
                        &nbsp; &nbsp; &nbsp;
                        <asp:LinkButton ID="lbtnCancel" runat="server" CssClass="btn btn-primary" OnClick="lbtnCancel_Click" CausesValidation="False">Cancel</asp:LinkButton>
                        <asp:LinkButton ID="lbtnDelete" runat="server" Style="margin-left: 200px" CssClass="btn btn-danger" OnClick="lbtnDelete_Click" CausesValidation="False">DELETE</asp:LinkButton>
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
