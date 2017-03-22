<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MixTable.aspx.cs" Inherits="BoozeTEKv4.AdminPages.MixTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin Mix Table Page</h3>
    <br />
    <br />
    <div class="container-fluid">
        <div class="form-horizontal">
            <fieldset>


                <asp:PlaceHolder ID="phRecords" runat="server"></asp:PlaceHolder>


                <br />
                <div class="form-group">

                    <asp:Label ID="lblDrinkName" runat="server" Text="Drink Name:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="txtDrinkName" runat="server" CssClass="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDrinkName" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtDrinkName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>
                <br />

                <div class="form-group">
                    <asp:Label ID="lblIngredientName" runat="server" Text="Ingredient Name:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="txtIngredientName" runat="server" CssClass="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvIngredientName" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtIngredientName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>
                <br />

                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <p></p>
                    </div>
                    <asp:Label ID="lblAmount" runat="server" Text="lblAmount:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvlblAmount" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtAmount"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>


                <asp:DropDownList ID="ddlCountries" runat="server" AutoPostBack="true" DataSourceID="DropDownDataSource"
                    DataTextField="Country" DataValueField="Country" AppendDataBoundItems="true">
                    <asp:ListItem Text="All Countries" Value="" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="DropDownDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>"
                    SelectCommand="SELECT DISTINCT Country FROM Customers"></asp:SqlDataSource>



                <asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                    runat="server" AutoGenerateColumns="false" DataSourceID="GridDataSource">
                    <Columns>

                        <asp:BoundField DataField="ContactName" HeaderText="Name" ItemStyle-Width="150" />
                        <asp:BoundField DataField="City" HeaderText="City" ItemStyle-Width="150" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="GridDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>"
                    SelectCommand="SELECT Ingredient_Name, Amount FROM Mix JOIN Drinks ON Drinks.Drink_ID = Mix.Drink_ID JOIN Ingredients ON Mix.Ingredient_ID = Ingredients.Ingredient_ID WHERE Drinks.Drink_ID = @Drink_ID" FilterExpression="Drink_ID = '{0}'">
                    <FilterParameters>
                        <asp:ControlParameter Name="Country" ControlID="ddlCountries" PropertyName="SelectedValue" />
                    </FilterParameters>
                </asp:SqlDataSource>




                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnUpdate" runat="server" CssClass="btn btn-success" OnClick="lbtnUpdate_Click">Update</asp:LinkButton>
                        &nbsp; &nbsp; &nbsp;
                        <asp:LinkButton ID="lbtnCancel" runat="server" CssClass="btn btn-primary" OnClick="lbtnCancel_Click" CausesValidation="False">Cancel</asp:LinkButton>
                        <%--<asp:LinkButton ID="lbtnDelete" runat="server" Style="margin-left: 200px" CssClass="btn btn-danger" OnClick="lbtnDelete_Click" CausesValidation="False">DELETE</asp:LinkButton> --%>
                        <br />
                        <h2>
                            <asp:Label ID="lblMessage" runat="server" /></h2>
                        <br />
                    </div>
                </div>

                <asp:Table ID="mytbl" runat="server">
                </asp:Table>

            </fieldset>
        </div>
    </div>
</asp:Content>
