<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KnowledgeMap.aspx.cs" Inherits="WebApplication3.KnowledgeMap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="StyleSheets/CustomKnowledgeMap.css" rel="stylesheet" />
    <script src="Assets/JS/jquery-2.0.3.js"></script>
    <script type="text/javascript" src="Assets/JS/knowledgemap.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"> </script>
   
  <script type="text/javascript">
      var markers = [
          <asp:Repeater ID="rptMarkers" runat="server">
              <ItemTemplate>
                    {
                        "title": '<%# Eval("Name")%>',
                        "id": '<%# Eval("IdUva")%>',
                        "lat": '<%# Eval("Latitude") %>',
                        "lng": '<%# Eval("Longitude") %>',
                        "description": '<%# Eval("Description") %>',
                        "url": '<%#Eval("URL")%>',
                        "micon": '<%#Eval("MarkerIcon")%>'
                    }
                </ItemTemplate>
            <SeparatorTemplate>,
            </SeparatorTemplate>
            </asp:Repeater>
      ];

      var edges = [
         <asp:Repeater ID="rptEdges" runat="server">
             <ItemTemplate>
                   {
                       "SLat": '<%# Eval("SourceLat")%>',
                       "SLng": '<%# Eval("SourceLng")%>',
                       "TLat": '<%# Eval("DstLat")%>',
                       "TLng": '<%# Eval("DstLng")%>'
                    }
                </ItemTemplate>
            <SeparatorTemplate>,
            </SeparatorTemplate>
            </asp:Repeater>
      ];

      window.onload = initialize;
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">

   
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="pure-u-1">
        <div class="pure-u-1-2 l-box">
        <h1>Code Map</h1>
            <div id="map-canvas">   
            </div>
        </div>
        <div class="pure-u-1-4 l-box">
            <h1>Problem List</h1>
            <h4>If Lost in the galaxy</h4>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
               <asp:ListView ID="ProblemList" runat="server" DataSourceID="LinqProblems" OnPagePropertiesChanged="ProblemList_PagePropertiesChanged">  
               <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
               
                <ItemTemplate>
                     <a href=<%#Eval("IdUva", "Problem.aspx?p={0}") %>>
                      <div class="l-box problem">
                        <img class="pure-u-1-8 problemMark" src='<%#Eval("MarkerIcon") %>' />
                        <span style="">
                        <asp:Label Text='<%# Eval("IdUva") %>' runat="server" ID="IdUvaLabel" /><br />
                        
                        <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /><br />
                        Description:
                        <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /><br />
                        Difficulty:
                        <asp:Label Text='<%# Eval("Difficulty") %>' runat="server" ID="DifficultyLabel" /><br />
                        <br />
                    </span>
                          </div>
                         </a>
                </ItemTemplate>
                <LayoutTemplate>
                    <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                    <div class="paginator">
                        <asp:DataPager runat="server" ID="DataPager1" PageSize="4" >
                            <Fields>
                                
                                <asp:NumericPagerField NumericButtonCssClass="pure-paginator"></asp:NumericPagerField>
                               
                            </Fields>
                        </asp:DataPager>

                    </div>
                </LayoutTemplate>

                   

            </asp:ListView>
                    </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ProblemList" EventName="PagePropertiesChanged" />
                </Triggers>
            </asp:UpdatePanel>

    
            
            <asp:LinqDataSource runat="server" EntityTypeName="" ID="LinqProblems" ContextTypeName="WebApplication3.ModelDataContext" Select="new (IdUva, Name, Description, URL, MarkerIcon, Difficulty)" TableName="Problems"></asp:LinqDataSource>
            
        </div>
        </div>
    
</asp:Content>
