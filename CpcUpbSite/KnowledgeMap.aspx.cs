using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication3;


namespace WebApplication3
{
    public partial class KnowledgeMap : System.Web.UI.Page
    {
        ModelDataContext mdb = new ModelDataContext();
        public List<Problem> markers { get; set; }
        public List<Edge> edges { get; set; }

        
        
        protected void Page_Load(object sender, EventArgs e)
        {

                Guid userId = (Guid)(Membership.GetUser().ProviderUserKey);
            
                
                markers = new List<Problem>();
                foreach (var problem in mdb.Problems)
                {
                    var isSolved = problem.SolutionsPerUsers.Where(x => x.Usuario.aspnet_User.UserId == userId);
                    if ( isSolved.FirstOrDefault() == null)
                        markers.Add(problem);
                    else
                    {
                        //Color 74FF2E
                        problem.MarkerIcon = problem.MarkerIconSolved;
                        markers.Add(problem);
                    }

                }
                rptMarkers.DataSource = markers;
                rptMarkers.DataBind();

                edges = new List<Edge>();
                foreach (var edge in mdb.MapEdges)
                {
                    Problem sp = mdb.Problems.Where(x => x.IdUva == edge.IdSourceProblem).FirstOrDefault();
                    Problem tp = mdb.Problems.Where(x => x.IdUva == edge.IdDestProblem).FirstOrDefault();
                    Edge ed = new Edge();
                   
                    ed.SourceLat = sp.Latitude;
                    ed.SourceLng = sp.Longitude;
                    ed.DstLat = tp.Latitude;
                    ed.DstLng = tp.Longitude;
                    edges.Add(ed);
                    
                }

                rptEdges.DataSource = edges;
                rptEdges.DataBind();

        }

        protected void ProblemList_PagePropertiesChanged(object sender, EventArgs e)
        {
            //LinqProblems.DataBind();
            
        }
    }
}