using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SGSI.Web.Data;
using System.Data;
using SGSI.Data;

namespace SGSI.Web.Business
{
    public class SGSIBusiness
    {

        public int AdicionarUsuario(string nome, string email, string senha) {

            DBSGSI db = new DBSGSI();

            return db.InsereNovoUsuario(nome, email, senha);
        }


        public List<object> CarregarUsuarios()
        {
            DBSGSI db = new DBSGSI();

            return db.CarregarUsuarios<object>(delegate (IDataReader dr)
            {
                return new
                {
                    Nome = SqlHelper.GetString(dr, "Nome"),
                    Email = SqlHelper.GetString(dr, "Email")
                };
            });



        }

    }
}