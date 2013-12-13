<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApplication3.Account.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
       <link href="../StyleSheets/CustomRegister.css" rel="stylesheet" />
        <div class="content pure-g-r">
            <div class="pure-u-1-2">
      <div class="pure-form pure-form-stacked">
    <fieldset>
       <legend>Register</legend>
        <asp:Label ID="Msg" runat="server"  Text="" ForeColor="#FF4F4F"></asp:Label>
        <% if (Msg.Text.Equals("Usuario de Uva no esta registrado"))
           {
               %>   <br /><a href="http://uva.onlinejudge.org/index.php">Registrate en Uva</a> <%
           } 
                %>
                <br />
                <br />
        <label for="Uva User">UVa Username</label>
        <asp:TextBox ID="txt_uvauser" runat="server"></asp:TextBox>
        <label for="Name">Nombre</label>
        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
        <label for="Universidad">Universidad</label>
        <asp:TextBox ID="txt_uni" runat="server"></asp:TextBox>
        <label for="Email">Email</label>
        <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
        <label for="password">Password</label>
        <asp:TextBox  ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="Registerbtn" runat="server" CssClass="pure-button pure-button-primary" Text="Sign Up" OnClick="SignUp_Click" />
        

    </fieldset>
    </div>
                </div>

               <div class="pure-u-1-2">
              <br />
              <br />
         
              <p class="comment">“The purpose of computing is insight, not numbers.”
                  <br />
                  -Richard Hamming.
              </p>
          </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
