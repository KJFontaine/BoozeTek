<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MixTables.aspx.cs" Inherits="BoozeTEKv4.AdminPages.MixTables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BoozeTEKMain" runat="server">
    <h3>Admin All Mix Tables Page</h3>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4">

                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource2" ForeColor="Black" ShowFooter="True" AllowSorting="True" Width="613px" DataKeyNames="Drink_ID,Ingredient_ID">
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

                        <asp:TemplateField HeaderText="Drink ID" SortExpression="Drink_ID">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDrinkID" runat="server" Text='<%# Bind("Drink_ID") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDrinkID" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtDrinkID"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDrinkID" runat="server" Text='<%# Bind("Drink_ID") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="txtDrink_IDinsert" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvDrink_IDinsert" runat="server" Style="color: red" ErrorMessage="Drink ID Required*" ControlToValidate="txtDrink_IDinsert"></asp:RequiredFieldValidator>
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
                        <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAmount" runat="server" Style="color: red" ErrorMessage="Required*" ControlToValidate="txtAmount"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="txtAmountinsert" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvAmountinsert" runat="server" Style="color: red" ErrorMessage="Amount Required*" ControlToValidate="txtAmountinsert"></asp:RequiredFieldValidator>
                            </FooterTemplate>

                        </asp:TemplateField>

                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Options" />

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
                <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" ForeColor="Red" runat="server" />
                <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" />

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BoozeTEKconnection %>" DeleteCommand="MixTable_Delete" DeleteCommandType="StoredProcedure" InsertCommand="MixTable_Insert" InsertCommandType="StoredProcedure" SelectCommand="Mix_Get_All" SelectCommandType="StoredProcedure" UpdateCommand="MixTable_Update" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:ControlParameter Name="Drink_ID" ControlID="GridView4" PropertyName="SelectedDataKey.Value" DefaultValue="" Type="Int32" />
                        <asp:Parameter Name="ingredient_id" Type="Int32" />
                        <asp:Parameter Name="amount" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Drink_ID" Type="Int32" />
                        <asp:Parameter Name="Ingredient_ID" Type="Int32" />
                        <asp:Parameter Name="Amount" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Drink_id" Type="Int32" />
                        <asp:Parameter Name="Ingredient_id" Type="Int32" />
                        <asp:Parameter Name="Amount" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div class="col-sm-4" style="padding-left: 150px">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Drink_ID" DataSourceID="SqlDataSource3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="384px">
                    <Columns>
                        <asp:BoundField DataField="Drink_ID" HeaderText="Drink ID" InsertVisible="False" ReadOnly="True" SortExpression="Drink_ID" />
                        <asp:BoundField DataField="Drink_Name" HeaderText="Drink Name" SortExpression="Drink_Name" />
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
            </div>
            <div class="col-sm-4">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BoozeTEKconnection %>" SelectCommand="SELECT [Drink_ID], [Drink_Name] FROM [Drinks] ORDER BY [Drink_Name]"></asp:SqlDataSource>
            </div>

            <div class="col-sm-4">
                <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Ingredient_ID" DataSourceID="SqlDataSource4" Width="564px">
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

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BoozeTEKconnection %>" SelectCommand="SELECT * FROM [Ingredients] ORDER BY [Ingredient_Type], [Ingredient_Name]"></asp:SqlDataSource>

</asp:Content>
