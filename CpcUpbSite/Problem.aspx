<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Problem.aspx.cs" Inherits="WebApplication3.Problem1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="StyleSheets/CustomProblem.css" rel="stylesheet" />
    <link href="css/Home.css" rel="stylesheet" />
    <script src="js/jquery-1.10.2.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="pure-u-1">
        <div class="pure-g-r marketing-ribbon">
            <div class="pure-u-1-2">
                <div class="l-box">
                    <asp:ListView ID="ListProblem" runat="server" DataSourceID="LinqDataSource1">

                        <EmptyDataTemplate>
                            <div class="l-centered l-box">
                                <h3><span>Esto no debería haber ocurrido, Vuelve al knowledge Map y selecciona un problema</span></h3>
                            </div>
                        </EmptyDataTemplate>

                        <ItemTemplate>

                            <h1>
                                <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /></h1>
                            <br />
                            IdUva:
                <asp:Label Text='<%# Eval("IdUva") %>' runat="server" ID="IdUvaLabel" /><br />
                            Description:
                <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /><br />
                            <a href="'<%# Eval("URL") %>'">Link To PDF</a><br />
                            <br />
                            <iframe height="700" class="framing" src='<%# Eval("URL") %>'></iframe>
                            <br />

                            <input id="identificador" type="hidden" value="<%# Eval("IdUva") %>" />
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                            <div style="">
                            </div>
                        </LayoutTemplate>


                    </asp:ListView>
                </div>
            </div>

            <div class="pure-u-1-2">
                <div class="l-box">
                      <h5>Writing code in comment? Please refer here for guidelines.</h5>
                    <div id="disqus_thread"></div>
                  
                    <script type="text/javascript">
                        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                        var disqus_identifier = $("#identificador").val();
                        var disqus_shortname = 'upbcpc'; // Required - Replace example with your forum shortname

                        /* * * DON'T EDIT BELOW THIS LINE * * */
                        (function () {
                            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                        })();
                    </script>
                    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                    <a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
                </div>
            </div>

        </div>

    </div>
    <asp:LinqDataSource runat="server" EntityTypeName="" ID="LinqDataSource1" ContextTypeName="WebApplication3.ModelDataContext" Select="new (URL, Name, IdUva, Description)" TableName="Problems" OnSelecting="LinqDataSource1_Selecting"></asp:LinqDataSource>

</asp:Content>
