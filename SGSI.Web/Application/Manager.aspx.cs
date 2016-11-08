using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using SGSI.Web.Business;

namespace SGSI.Web.Application
{
    public partial class Manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EMAIL"] != null)
            {

                TabPanel1.Title = "Bem vindo(a) " + Session["EMAIL"].ToString();
                Initializer();
            }
            else
            {
                Response.Redirect("Inicio.aspx");
            }
        }

        public void Initializer()
        {
            int userId = Convert.ToInt32(Session["USER_ID"]);
            string nome = Convert.ToString(Session["NOME"]);
           
            SGSIBusiness ca = new SGSIBusiness();
            storeProcedimentos.DataSource = ca.CarregarProcedimentos(userId);
            storeProcedimentos.DataBind();
            HUserName.Value = Convert.ToString(Session["NOME"]);

        }

        [DirectMethod]
        public void Sair()
        {

            Session.Clear();
            Response.Redirect("Inicio.aspx");
        }

        [DirectMethod]
        public void CarregaHistoricoProc(string procId)
        {
            int procedimentoId = Convert.ToInt32(procId);
            SGSIBusiness ca = new SGSIBusiness();
            storeHistoricoProc.DataSource = ca.CarregaHistoricoProc(procedimentoId);
            storeHistoricoProc.DataBind();
        }


    }
}