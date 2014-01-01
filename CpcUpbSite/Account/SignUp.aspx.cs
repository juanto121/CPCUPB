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
            //txt_email.Text = "";
            //txt_name.Text = "";
            //txt_password.Text = "";
            //txt_uni.Text = "";
            //txt_uvauser.Text = "";
        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            try
            {
                Datamanager dtm = new Datamanager();
                ModelDataContext mod = new ModelDataContext();

                UvaRequest uvReq = new UvaRequest();
                string userUvaId = uvReq.GetUvaUserIdByUsername(txt_uvauser.Text);
                if (userUvaId != null && !userUvaId.Equals("0") && !userUvaId.Equals(""))
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

                    dtm.UpdateRankingForSpecificUser(us.aspnet_User, intUserUvaId);
                    FormsAuthentication.SetAuthCookie(txt_name.Text, false);
                    Response.Redirect("../Default.aspx");
                }
                else
                {
                    if (userUvaId.Equals("")) Msg.Text = "Hubo un problema con el servidor de uHunt intenta el registro más tarde.";
                    if (userUvaId == null) Msg.Text = "Usuario de Uva no esta registrado";
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
                        Msg.Text = "DPUK";
                        break;
                    case MembershipCreateStatus.DuplicateUserName:
                        Msg.Text = "Usuario está en uso";
                        break;
                    case MembershipCreateStatus.InvalidAnswer:
                        Msg.Text = "Respuesta Invalida";
                        break;
                    case MembershipCreateStatus.InvalidEmail:
                        Msg.Text = "Email inválido";
                        break;
                    case MembershipCreateStatus.InvalidPassword:
                        Msg.Text = "Contraseña inválida";
                        break;
                    case MembershipCreateStatus.InvalidProviderUserKey:
                        Msg.Text = "Invalid Provider User Key";
                        break;
                    case MembershipCreateStatus.InvalidQuestion:
                        Msg.Text = "Invalid Question";
                        break;
                    case MembershipCreateStatus.InvalidUserName:
                        Msg.Text = "Usuario Inválido";
                        break;
                    case MembershipCreateStatus.ProviderError:
                        Msg.Text = "Provider Error";
                        break;
                    case MembershipCreateStatus.Success:
                        Msg.Text = "Succes!";
                        break;
                    case MembershipCreateStatus.UserRejected:
                        Msg.Text = "User Rejected";
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