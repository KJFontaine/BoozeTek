<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="VirtualBars.aspx.cs" Inherits="BoozeTEKv4.AdminPages.UserVBar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin Virtual Bars Page</h3>
    <br />
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8" style="padding: 0px; margin: 0px; border-width: 0px;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="User_ID,Ingredient_ID" DataSourceID="SqlDataSource1" ForeColor="Black" Width="1066px" AllowSorting="True" ShowFooter="True">
                    <Columns>
                        <asp:TemplateField SortExpression="Options">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ValidationGroup="INSERT" ID="lbtnInsert" runat="server" OnClick="lbtnInsert_Click">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="User ID" SortExpression="User_ID">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtxUserID" runat="server" Text='<%# Bind("User_ID") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUserID" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtUserID"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblUserID" runat="server" Text='<%# Bind("User_ID") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="txtUser_IDinsert" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvUser_IDinsert" runat="server" Style="color: red" ErrorMessage="User ID Required*" ControlToValidate="txtUser_IDinsert"></asp:RequiredFieldValidator>
                            </FooterTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Ingredient ID" SortExpression="Ingredient_ID">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtIngredientID" runat="server" Text='<%# Bind("Ingredient_ID") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvIngredientID" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtIngredientID"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblIngredientID" runat="server" Text='<%# Bind("Ingredient_ID") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="txtIngredient_IDinsert" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvIngredient_IDinsert" runat="server" Style="color: red" ErrorMessage="Ingredient ID Required*" ControlToValidate="txtIngredient_IDinsert"></asp:RequiredFieldValidator>
                            </FooterTemplate>

                        </asp:TemplateField>
                        <asp:BoundField DataField="User_Email" HeaderText="User Email" SortExpression="User_Email" />
                        <asp:BoundField DataField="Ingredient_Name" HeaderText="Ingredient_Name" SortExpression="Ingredient_Name" />
                        <asp:BoundField DataField="Ingredient_Type" HeaderText="Ingredient_Type" SortExpression="Ingredient_Type" />
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BoozeTEKconnection %>" DeleteCommand="VBarIngredients_Delete" DeleteCommandType="StoredProcedure" InsertCommand="VBarIngredients_Insert" InsertCommandType="StoredProcedure" SelectCommand="VBarIngredients_Get_All" SelectCommandType="StoredProcedure" UpdateCommand="VBarIngredients_Update" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="User_ID" Type="Int32" />
                        <asp:Parameter Name="ingredient_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="User_ID" Type="Int32" />
                        <asp:Parameter Name="ingredient_id" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="user_id" Type="Int32" />
                        <asp:Parameter Name="Ingredient_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>



            <div class="col-lg-4">
                <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="User_ID" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="384px">
                    <Columns>
                        <asp:BoundField DataField="User_ID" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="User_ID" />
                        <asp:BoundField DataField="User_Email" HeaderText="User Email" SortExpression="User_Email" />
                        <asp:BoundField DataField="Admin_Rights" HeaderText="Admin" SortExpression="Admin_Rights" />

                    </Columns>

                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BoozeTEKconnection %>" SelectCommand="Users_Get_All" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                <br />
                <br />

                <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Ingredient_ID" DataSourceID="SqlDataSource3" Width="564px">
                    <Columns>
                        <asp:BoundField DataField="Ingredient_ID" HeaderText="Ingredient_ID" InsertVisible="False" ReadOnly="True" SortExpression="Ingredient_ID" />
                        <asp:BoundField DataField="Ingredient_Name" HeaderText="Ingredient_Name" SortExpression="Ingredient_Name" />
                        <asp:BoundField DataField="Ingredient_Type" HeaderText="Ingredient_Type" SortExpression="Ingredient_Type" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
            </div>










        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BoozeTEKconnection %>" SelectCommand="SELECT * FROM [Ingredients]"></asp:SqlDataSource>
</asp:Content>
