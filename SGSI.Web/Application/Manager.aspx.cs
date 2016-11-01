using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace MeuTcc.Application
{
    public partial class Manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EMAIL"] != null)
            {
               
                TabPanel1.Title = "Bem vindo(a) " + Session["EMAIL"].ToString();
            }
            else
            {
                Response.Redirect("Inicio.aspx");
            }
        }

        [DirectMethod]
        public void Sair()
        {
            Session.Clear();
            Response.Redirect("Inicio.aspx");


        }
    }
}