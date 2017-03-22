<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ingredient.aspx.cs" Inherits="BoozeTEKv4.AdminPages.Ingredient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin Ingredient Page</h3>
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
                    <asp:Label ID="lblIngredientName" runat="server" Text="Ingredient Name:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="txtIngredientName" runat="server" CssClass="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvIngredientName" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtIngredientName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>

                <div class="form-group">
                    <%--spacing for text to aline with textboxes--%>
                    <asp:Label ID="lblIngredientType" runat="server" Text="Ingredient Type:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-5">

                        <asp:DropDownList ID="ddlIngredientType" runat="server" CssClass="form-control" DataSourceID="sdsIngredientType" DataTextField="Ingredient_Type" DataValueField="Ingredient_Type"></asp:DropDownList>
                        <asp:SqlDataSource ID="sdsIngredientType" runat="server" ConnectionString="<%$ ConnectionStrings:SE265_BoozeTekConnectionString %>" SelectCommand="IngredientTypes_Get_All" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="rfvIngredientType" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="ddlIngredientType"></asp:RequiredFieldValidator>
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
