﻿using System;
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
    public partial class SecurityOffice : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["EMAIL"] != null)
            {

                LabelEmail.Text = Session["EMAIL"].ToString();
                //TabPanel1.Title = Session["EMAIL"].ToString();
                X.Msg.Notify("Aviso", "Bem vindo" + Session["NOME"]).Show();
                Initializer();
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
        protected void Initializer()
        {
            int userId = Convert.ToInt32(Session["USER_ID"]);
            string nome = Convert.ToString(Session["NOME"]);
            SGSIBusiness ca = new SGSIBusiness();
            storeUsuarios.DataSource = ca.CarregarUsuarios();
            storeUsuarios.DataBind();
            storeDepartamentos.DataSource = ca.CarregarCmbDepartamentos();
            storeDepartamentos.DataBind();
            storeGrupoUsuarios.DataSource = ca.CarregarCmbGrupos();
            storeGrupoUsuarios.DataBind();
            storeCarregaNormas.DataSource = ca.CarregarNormas();
            storeCarregaNormas.DataBind();
            storeCmbNormas.DataSource = ca.CarregarCmbNormas();
            storeCmbNormas.DataBind();
            storeProcedimentos.DataSource = ca.CarregarProcedimentos(userId);
            storeProcedimentos.DataBind();

        }

        [DirectMethod]
        public int SalvarNorma(string nome)
        {
            
            int retorno;
            string autor = LabelEmail.Text;
            string destino = "/Normas/";
            HttpPostedFile file = this.UploadNorma.PostedFile; // or this.Request.Files[0]
            string fileName = file.FileName;
            string path = Server.MapPath(null) + destino + nome + ".pdf";
            file.SaveAs(path);
            SGSIBusiness ca = new SGSIBusiness();
            DateTime criacao = DateTime.Now;
            retorno = ca.SalvarNorma(nome, path, criacao, autor);
            //storeCarregaNormas.Reload();
            return retorno;
            

        }
        [DirectMethod]
        public void AbrirNorma(string caminho) {
            System.Diagnostics.Process.Start(caminho);

        }

        [DirectMethod]
        public int AdicionarUsuario(string nome, string cargo, string departamento, string email, int tipo, string senha)
        {
            
            int departamentoId = Convert.ToInt32(departamento);
            SGSIBusiness ca = new SGSIBusiness();

            return ca.AdicionarUsuario(nome, cargo, departamentoId, email, tipo, senha);

            

        }

        protected void CarregaUsuarios(object sender, StoreReadDataEventArgs e)
        {
            SGSIBusiness ca = new SGSIBusiness();
            storeUsuarios.DataSource = ca.CarregarUsuarios();
            storeUsuarios.DataBind();
        }

        [DirectMethod]
        public void CarregaComboFuncionario(string dpId)
        {
            int dptoId = Convert.ToInt32(dpId);
            SGSIBusiness ca = new SGSIBusiness();
            storeFuncionarios.DataSource = ca.CarregarCmbFuncionarios(dptoId);
            storeFuncionarios.DataBind();

        }

        [DirectMethod]
        public int SalvarProcedimento(string nome, string norma, string dpId, DateTime dtInicial, DateTime dtFinal)
        {
            int situacaoId = 1;
            double progresso = 0.0;
            int dptoId = Convert.ToInt32(dpId);
            SGSIBusiness ca = new SGSIBusiness();
            return ca.SalvarProcedimento(nome, norma, dptoId, dtInicial, dtFinal, situacaoId, progresso);
            

        }

        //[DirectMethod]
        //public void CarregaComboGrupos()
        //{

        //    SGSIBusiness ca = new SGSIBusiness();
        //    storeGrupoUsuarios.DataSource = ca.CarregarCmbGrupos();
        //    storeGrupoUsuarios.DataBind();

        //}


        [DirectMethod]
        public void CarregaEmailCargoFuncionario(string nome, string dpId)
        {
            int departamentoId = Convert.ToInt32(dpId);
            SGSIBusiness ca = new SGSIBusiness();
            List<EntityFuncionarios> dados = new List<EntityFuncionarios>();
            dados = ca.CarregarEmailCargo(nome, departamentoId);
            TextNewUserEmail.Value = dados[0].email;
            TextNewUserCargo.Value = dados[0].cargo;
        }


        [DirectMethod]
        public int RemoverUsuario(string email)
        {
            SGSIBusiness ca = new SGSIBusiness();

            return ca.RemoverUsuario(email);
        }

        [DirectMethod]
        public int AlterarSenhaUsuario(string email, string senha)
        {
            
            SGSIBusiness ca = new SGSIBusiness();

            return ca.AlterarSenhaUsuario(email, senha);
            

          
        }
    }
}