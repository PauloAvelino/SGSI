using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using SGSI.Web.Business;
using SGSI.Web.Entity;

namespace SGSI.Web.Application
{
    public partial class SecurityOffice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Initializer();
        }

        protected void Initializer() {

            SGSIBusiness ca = new SGSIBusiness();
            storeUsuarios.DataSource = ca.CarregarUsuarios();
            storeUsuarios.DataBind();
            storeDepartamentos.DataSource = ca.CarregarCmbDepartamentos();
            storeDepartamentos.DataBind();

        }

        [DirectMethod]
        public int AdicionarUsuario(string nome, string email, string senha)
        {

            SGSIBusiness ca = new SGSIBusiness();

            return ca.AdicionarUsuario(nome, email, senha);



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
        public void CarregaEmailCargoFuncionario(string nome, string dpId)
        {
            int departamentoId = Convert.ToInt32(dpId);
            SGSIBusiness ca = new SGSIBusiness();
            List<EntityFuncionarios> dados = new List<EntityFuncionarios>();
            dados = ca.CarregarEmailCargo(nome, departamentoId);
            TextNewUserEmail.Value = dados[0].email;
            TextNewUserCargo.Value = dados[0].cargo;
        }
    }
}