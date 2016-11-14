using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using SGSI.Web.Business;
using SGSI.Web.Entity;
using Newtonsoft;
using System.Security.Permissions;

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
            storeCarregaNormas.DataSource = ca.CarregarNormas();
            storeCarregaNormas.DataBind();
            storeCmbNormas.DataSource = ca.CarregarCmbNormas();
            storeCmbNormas.DataBind();
            storeDepartamentos.DataSource = ca.CarregarCmbDepartamentos();
            storeDepartamentos.DataBind();
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

     
        [DirectMethod]
        public int SalvarNorma(string nome)
        {

            int retorno;
            string autor = TabPanel1.Title;
            string destino = "/Normas/";
            HttpPostedFile file = this.UploadNorma.PostedFile; // or this.Request.Files[0]
            string fileName = file.FileName;
            string path = Server.MapPath(null) + destino + nome + ".pdf";
            file.SaveAs(path);
            SGSIBusiness ca = new SGSIBusiness();
            DateTime criacao = DateTime.Now;
            retorno = ca.SalvarNorma(nome, path, criacao, autor);
            return retorno;


        }

        [DirectMethod]
        public void AbrirNorma(string caminho)
        {
            System.Diagnostics.Process.Start(caminho);

        }

        [DirectMethod]
        public int SalvarProcedimento(string nome, string norma, string dpId, DateTime dtInicial, DateTime dtFinal, string descricao)
        {
            string solicitante = Convert.ToString(Session["NOME"]);
            int situacaoId = 1;
            int situacaoHistoricoId = 1;
            double progresso = 0.0;
            int dptoId = Convert.ToInt32(dpId);
            SGSIBusiness ca = new SGSIBusiness();
            return ca.SalvarProcedimento(solicitante, nome, norma, dptoId, dtInicial, dtFinal, situacaoId, progresso, descricao, situacaoHistoricoId);
        }

        [DirectMethod]
        public int AtualizarProcedimento(string procedimento, int departamentoId, int situacaoId, double progresso, int situacaoHistoricoId)
        {
            int retorno;
            int procedimentoId = Convert.ToInt32(procedimento);
            //int departamentoId = Convert.ToInt32(departamento);
            string responsavelAtual = Convert.ToString(Session["NOME"]);
            string cargo = Convert.ToString(Session["CARGO"]);
            SGSIBusiness ca = new SGSIBusiness();
            retorno = ca.AtualizarProcedimento(procedimentoId, departamentoId, responsavelAtual, cargo, situacaoId, progresso, situacaoHistoricoId);
            if (retorno == 1)
            {
                storeProcedimentos.Reload();
            }
            return retorno;
        }


    }
}