﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Assignment4.WebForm2" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="1104px" />
        
            <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                <Report FileName="Departments.rpt">
                </Report>
            </CR:CrystalReportSource>
        
        </div>
    </form>
</body>
</html>
