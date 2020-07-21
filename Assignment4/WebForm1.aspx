<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Assignment4.WebForm1" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style>
        .Label1{
            margin:auto;
        }
        .auto-style1 {
            width: 100%;
        }
    </style>
    <form id="form1" runat="server">
        
        
        
    <table class="auto-style1">
        <tr>
            <td>&nbsp;
                <div>
                    <div>
            <asp:Label ID="Label1" runat="server" style="margin: Auto;font-size:20px;font-weight:700" Text="DEPARTMENTS"></asp:Label>

        </div>
        <asp:GridView
        OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
        OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" ID="GridView1" runat="server" AllowPaging="True"  AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Dept_ID" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
            <AlternatingRowStyle BackColor="White"  />
            <Columns>
               
                <asp:BoundField DataField="Dept_ID" HeaderText="Dept_ID" InsertVisible="False" ReadOnly="True" SortExpression="Dept_ID" />
                <%--<asp:BoundField DataField="Depatment_Name" HeaderText="Depatment_Name" SortExpression="Depatment_Name" />--%>
                <%--<asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton OnClick="DeleteDepartmentRow" runat="server">Delete</asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton OnClick="DeleteDepartmentRow" runat="server">Delete</asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>--%>
                
               
                
                <asp:TemplateField>
                    <ItemTemplate>
            <asp:Label ID="Dept_NameLbl" runat="server" Text='<%# Eval("Depatment_Name") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="Dept_Nametxt" runat="server" Text='<%# Eval("Depatment_Name") %>'></asp:TextBox>
        </EditItemTemplate>
                </asp:TemplateField>
                
               
                <asp:CommandField  ShowEditButton="true" ShowDeleteButton="true" />
                
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" DeleteCommand="" ConnectionString="<%$ ConnectionStrings:Assignment4ConnectionString2 %>" SelectCommand="SELECT * FROM [Departments]"></asp:SqlDataSource>
        <asp:TextBox ID="NewDept" placeholder="Department" runat="server" />  
        <button runat="server" onserverclick="AddNewDepartment" >Add new Department</button>
        <button runat="server" onserverclick="ViewReport"  >ViewReport</button>
        <label id="InfoLabel" runat="server" style="color:red;margin:20px" visible="false"> TEXT </label>
                </div>
            </td>
            <td>
                <div>
                    <div>
            <asp:Label ID="Label2" runat="server" style="margin: Auto;font-size:20px;font-weight:700" Text="STUDENTS"></asp:Label>

        </div>
        <asp:GridView
        OnRowDataBound="SOnRowDataBound" OnRowEditing="SOnRowEditing" OnRowCancelingEdit="SOnRowCancelingEdit"
        OnRowUpdating="SOnRowUpdating" OnRowDeleting="SOnRowDeleting" ID="GridView2" runat="server" AllowPaging="True"  AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Dept_ID" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView2_PageIndexChanging">
            <AlternatingRowStyle BackColor="White"  />
            <Columns>
               
                <asp:BoundField DataField="Student_ID" HeaderText="Student_ID" InsertVisible="False" ReadOnly="True" SortExpression="Student_ID" />
                <%--<asp:BoundField DataField="Depatment_Name" HeaderText="Depatment_Name" SortExpression="Depatment_Name" />--%>
                <%--<asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton OnClick="DeleteDepartmentRow" runat="server">Delete</asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton OnClick="DeleteDepartmentRow" runat="server">Delete</asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>--%>
                
               
                
                <asp:TemplateField>
                    <ItemTemplate>
            <asp:Label ID="NameLbl" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="Nametxt" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
        </EditItemTemplate>
                </asp:TemplateField>
                
                 <asp:TemplateField>
                    <ItemTemplate>
            <asp:Label ID="AddressLbl" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="Addresstxt" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox>
        </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
            <asp:Label ID="DeptIDLbl" runat="server" Text='<%# Eval("Dept_ID") %>'></asp:Label>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="DeptIDtxt" runat="server" Text='<%# Eval("Dept_ID") %>'></asp:TextBox>
        </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField  ShowEditButton="true" ShowDeleteButton="true" />
               
                
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" DeleteCommand="" ConnectionString="<%$ ConnectionStrings:Assignment4ConnectionString2 %>" SelectCommand="SELECT * FROM [Departments]"></asp:SqlDataSource>
        <asp:TextBox ID="NewName" placeholder="Name"  runat="server" />  
        <asp:TextBox ID="NewDeptID" placeholder="Department ID" runat="server" />  
        <asp:TextBox ID="NewAddress" placeholder="Address" runat="server" />  
        <button runat="server" onserverclick="AddNewStudent" >Add new Student</button>
        <button runat="server" onserverclick="ViewReport"  >ViewReport</button>
        <label id="Label3" runat="server" style="color:red;margin:20px" visible="false"> TEXT </label>
                </div>
            </td>
        </tr>
    </table>
    </form>

</body>
</html>
