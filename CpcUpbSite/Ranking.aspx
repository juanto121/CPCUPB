<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ranking.aspx.cs" Inherits="WebApplication3.Ranking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="StyleSheets/CustomRanking.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
      <div class="hero">
       <div class="hero-titles">
           <h1>
               Users Ranking
           </h1>
           <br />
          
       </div>
   </div>

    <asp:ListView ID="ListView1" runat="server" DataSourceID="LinqDataSource1">
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        
          <ItemTemplate>
           
                    <tr>
                        <td> <%# Eval("UvaUserName") %> </td>
                        <td> <%# Eval("Solved") %> </td>  
                    </tr>
                
          
        </ItemTemplate>

        <LayoutTemplate>
            <table runat="server" class="pure-table-horizontal">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer"  runat="server" border="0" style="">
                            <thead>
                            <tr runat="server" style=""> 
                                <th runat="server">Usuario</th>
                                <th runat="server">Solved</th>
                            </tr>
                                </thead>
                               <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
            
            </table>
        </LayoutTemplate>
      
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication3.ModelDataContext" EntityTypeName="" OrderBy="Solved desc" Select="new (Solved, UvaUserName)" TableName="Ranks">
    </asp:LinqDataSource>
    
</asp:Content>
