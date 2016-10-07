using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SGSI.Web.Data;

namespace SGSI.Web.Business
{
    public class SGSIBusiness
    {

        public int AdicionarUsuario(string nome, string email, string senha) {

            DBSGSI db = new DBSGSI();

            return db.InsereNovoUsuario(nome, email, senha);
        }

    }
}