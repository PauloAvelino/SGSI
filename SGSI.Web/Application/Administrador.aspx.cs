using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using Rejuicer;
using SGSI.Web.Business;

namespace MeuTcc.Application
{
    public partial class Administrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {




        }

        [DirectMethod]
        public int AdicionarUsuario(string nome, string email, string senha) {

            SGSIBusiness ca = new SGSIBusiness();

            return ca.AdicionarUsuario(nome, email, senha);
        }
        public void Habilitar()
    {




}

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }


}