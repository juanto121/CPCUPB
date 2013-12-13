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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            try
            {
               Datamanager dtm = new Datamanager();
               ModelDataContext mod = new ModelDataContext();
               
                UvaRequest uvReq = new UvaRequest();
                string userUvaId = uvReq.GetUvaUserIdByUsername(txt_uvauser.Text);
                if (userUvaId != null && !userUvaId.Equals("0"))
                {
                    MembershipUser user =
                   Membership.CreateUser(txt_uvauser.Text, txt_password.Text, txt_email.Text);

                    Guid id = (Guid)user.ProviderUserKey;


                    int intUserUvaId = int.Parse(userUvaId);

                    Usuario us = new Usuario()
                    {
                        Nombre = txt_name.Text,
                        IdUser = id,
                        Universidad = txt_uni.Text,
                        Uname = txt_uvauser.Text,
                        Uid = intUserUvaId

                    };

                    mod.Usuarios.InsertOnSubmit(us);
                    mod.SubmitChanges();

                    Rank rank = new Rank()
                    {
                        IdUser = id,
                        UvaUserName = txt_uvauser.Text,
                        Solved = 0
                    };

                    mod.Ranks.InsertOnSubmit(rank);
                    mod.SubmitChanges();
                    dtm.UpdateRankingForSpecificUser(us.aspnet_User, intUserUvaId);
                    FormsAuthentication.SetAuthCookie(txt_name.Text, false);

                    Response.Redirect("../Default.aspx");
                }
                else
                {
                    Msg.Text = "Usuario de Uva no esta registrado";
                }
            }
            catch (System.Web.Security.MembershipCreateUserException ex)
            {
                switch (ex.StatusCode)
                {
                    case MembershipCreateStatus.DuplicateEmail:
                        Msg.Text = "Email está en uso";
                        break;
                    case MembershipCreateStatus.DuplicateProviderUserKey:
                        break;
                    case MembershipCreateStatus.DuplicateUserName:
                        Msg.Text = "Usuario está en uso";
                        break;
                    case MembershipCreateStatus.InvalidAnswer:
                        break;
                    case MembershipCreateStatus.InvalidEmail:
                        Msg.Text = "Email inválido";
                        break;
                    case MembershipCreateStatus.InvalidPassword:
                        Msg.Text = "Contraseña inválida";
                        break;
                    case MembershipCreateStatus.InvalidProviderUserKey:
                        break;
                    case MembershipCreateStatus.InvalidQuestion:
                        break;
                    case MembershipCreateStatus.InvalidUserName:
                        break;
                    case MembershipCreateStatus.ProviderError:
                        break;
                    case MembershipCreateStatus.Success:
                        break;
                    case MembershipCreateStatus.UserRejected:
                        break;
                    default:
                        break;
                }
            }
            //MembershipUser current =
            //    Membership.GetUser();

            //if (current != null)
            //{

            //}

            //TODO: Crear usuario en la otra tabla
        }


    }
}