<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication3.Account.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
      <link href="../StyleSheets/CustomRegister.css" rel="stylesheet" />
       <div class="content pure-g-r">
            <div class="pure-u-1-2">      
            <div class="pure-form pure-form-stacked">
            <fieldset>
                <legend>Log In</legend>
                <asp:Label ID="Msg" runat="server"  Text="" ForeColor="#FF4F4F"></asp:Label>
                <br />
                <br />
                <label for="Uva User">UVa Username</label>
                <asp:TextBox ID="txt_uvauser" runat="server"></asp:TextBox>
        
                <label for="password">Password</label>
                <asp:TextBox ID="txt_password" TextMode="Password" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="loginBtn" runat="server" CssClass="pure-button pure-button-primary" Text="Sign In" OnClick="SignIn_Click" />
             </fieldset>
             </div>
             </div>

          <div class="pure-u-1-2">
              <br />
              <br />
         
              <p class="comment">“Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program.”
                  <br />
                  -Linus Torvalds.
              </p>
          </div>

           </div>

      

</asp:Content>
