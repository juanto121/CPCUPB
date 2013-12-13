using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using WebApplication3.Application_Code;

namespace WebApplication3.Account
{
    public partial class Login : System.Web.UI.Page
    {
        public Datamanager dtmanager { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            dtmanager = new Datamanager();
        }

        protected void SignIn_Click(object sender, EventArgs e)
        {
            
            if (Membership.ValidateUser(txt_uvauser.Text, txt_password.Text)){
                aspnet_User cuser = dtmanager.GetUserByUname(txt_uvauser.Text);
                dtmanager.UpdateRankingForSpecificUser(cuser,cuser.Usuario.Uid);
                dtmanager.UpdateSolutionsForSpecificUser(cuser, cuser.Usuario.Uid);
                FormsAuthentication.RedirectFromLoginPage(txt_uvauser.Text, true);
            }             
            else
                Msg.Text = "Login failed. Please check your user name and password and try again.";
        }
    }
}