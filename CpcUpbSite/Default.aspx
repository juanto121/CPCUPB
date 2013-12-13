<%@ Page Title="Competitive Programming UPB" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <link href="StyleSheets/CustomDefault.css" rel="stylesheet" type="text/css" />
    <div class="pure-u-1">
        <div class="hero">
            <div class="hero-titles">
                <h1>Competitive Programming UPB
                </h1>
                <br />
                <h2>Semillero de maratones de programacion de la Universidad Pontificia Bolivariana.
                </h2>
            </div>
        </div>
        <hr />


        <div class="content">
            <h3>You are Three steps away from learning : </h3>
        </div>

        <div class="pure-g-r marketing-ribbon">
            <div class="pure-u-1-3">
                <div class="l-box">

                    <h3>Sign up for UVa</h3>

                    <p>
                        An extensive archive of problems, upload your solutions and stay on top of your skills.     
                    </p>
                    <a href="http://uva.onlinejudge.org/index.php">
                        <img src="Assets/images/UVaLogoRound.png"></a>
                </div>
            </div>

            <div class="pure-u-1-3">
                <div class="l-box">
                    <h3>Sign up here</h3>
                    <p>
                        Not sure where to start? Here you'll find basic guidance. To keep track of progress use your UVa username.
                    </p>
                    <a runat="server" href="~/Account/SignUp.aspx">
                        <img src="Assets/images/CPCLogo2_200.png"></a>
                </div>
            </div>

            <div class="pure-u-1-3">
                <div class="l-box">
                    <h3>Nail it!</h3>
                    <p>
                        That was easy, now it's time to solve problems. Use the Knowledge map for guidance. Happy Coding!.
                    </p>
                    <a runat="server" href="KnowledgeMap.aspx">
                        <img src="Assets/Images/CodeLogo.png" /></a>
                </div>
            </div>


        </div>
    </div>

    <div class="legal pure-g-r">

        <div class="pure-u-2-5">
            <div class="1-box legal-license">
                Programming II Course UPB University.
                <br />
                <3 Medellín, Colombia.       
            </div>
        </div>

        <div class="pure-u-1-5">
            <div class="1-box legal-logo">
                <img src="Assets/Images/CPCDark_64.png" alt="CPC" />
            </div>
        </div>


        <div class="pure-u-2-5">
            <div class="1-box legal-links">
                <div class="externalLink">
                    <img class="legalImage" src="Assets/Images/GitHub-Mark-32px.png" />
                    <a class="externalLink" href="https://github.com/array0001">See on GitHub
                    </a>
                </div>
                <div class="externalLink">
                    <img class="legalImage" src="Assets/Images/Facebook-32.png" />
                    <a class="externalLink" href="https://www.facebook.com/groups/638583482830652/?bookmark_t=group">Add us on Facebook
                    </a>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
</asp:Content>
