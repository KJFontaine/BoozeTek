<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="BoozeTEKv4.AdminPages.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin User Page</h3>
    <br />
    <br />
    <div class="container-fluid">
        <div class="form-horizontal">
            <fieldset>
                <br />
                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                    </div>
                    <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="col-lg-3 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rexEmail" runat="server" Style="color: red" ErrorMessage="Unable to Proceed. Not a valid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                    </div>
                    <div class="col-lg-5"></div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" Text="Password:" CssClass="col-lg-3 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:" CssClass="col-lg-3 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvBothPasswords2" runat="server" Style="color: red" ErrorMessage="Passwords must match" ControlToValidate="txtConfirmPassword" Operator="Equal" Type="String" ControlToCompare="txtPassword"></asp:CompareValidator>
                    </div>
                    <div class="col-lg-5"></div>
                </div>
                <br />

                <div class="form-group">
                    <asp:Label ID="lblAdmin_Rights" runat="server" Text="Admin Rights:" CssClass="col-lg-3 control-label"></asp:Label>
                    <div class="col-lg-5">
                        <asp:CheckBox ID="chkAdmin_Rights" runat="server" />
                    </div>
                    <div class="col-lg-5"></div>
                </div>

                <div class="form-group">
                    <div class="col-lg-9 col-lg-offset-3">
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
