using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication3.Application_Code;

namespace WebApplication3
{
    public partial class Problem1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            if (Request.QueryString["p"] != null)
            {
                var modx = new ModelDataContext();
                e.Result = modx.Problems.Where(x => x.IdUva == int.Parse(Request.QueryString["p"]));
            }
            else
            {
                e.Cancel = true;
            }
        }

        protected void LinqDataSource2_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            if (Request.QueryString["p"] != null)
            {
                var modx = new ModelDataContext();
                e.Result = modx.Comments.Where(x => x.IdProblem == int.Parse(Request.QueryString["p"]));
            }
            else
            {
                e.Cancel = true;
            }
        }

        [WebMethod]
        public static Respuesta Comment(int problemId, String comment)
        {
            var modx = new ModelDataContext();
            string name = Membership.GetUser().UserName;
            Guid userId = (Guid)(Membership.GetUser().ProviderUserKey);
            var newComment = new Comment()
            {
                Commentary = comment,
                IdProblem = problemId,
                IdUser = userId,
                NameUser = name
            };

            modx.Comments.InsertOnSubmit(newComment);
            modx.SubmitChanges();
            return new Respuesta() { Estado = true, Mensaje= "Comment added succesfuly"};

        }
    }
}