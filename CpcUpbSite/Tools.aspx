<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tools.aspx.cs" Inherits="WebApplication3.Tools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="StyleSheets/CustomTools.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="pure-u-1">
        <div class="l-box">
        <h1>Useful sites for practicing</h1>
        <div class="l-box">
            <div class="pure-u-1-3">
            <a href="http://www.spoj.com/"><img class="LogoImage" src="Assets/Images/SpojLogo.png"/></a>
             </div>
            <div class="pure-u-1-2">
            <h3>What is SPOJ? </h3>
             SPOJ – Sphere Online Judge – is a problemset archive, online judge and contest hosting service accepting solutions in many languages.</p>
             </div>
        </div>
        <div class="l-box">
             <a href="http://www.spoj.com/"><img class="LogoImage" src="/Assets/Images/TopCodeLogo.png"/></a>
        </div>
        <div class="l-box">
            <a href="http://www.spoj.com/"><img class="LogoImage" src="/Assets/Images/UhuntLogo.png"/></a>
        </div>
        </div>

    </div>


</asp:Content>
