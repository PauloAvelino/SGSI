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

        protected void storeUsuarios_ReadData(object sender, StoreReadDataEventArgs e)
        {

        }
    }
}