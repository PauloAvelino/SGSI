using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SGSI.Web.Data;
using System.Data;
using SGSI.Data;
using SGSI.Web.Entity;

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

        public List<object> CarregarCmbDepartamentos()
        {
            DBSGSI db = new DBSGSI();
            return db.CarregarCmbDepartamentos<object>(delegate (IDataReader dr)
            {
                return new
                {
                    Id = SqlHelper.GetInt(dr, "Id"),
                    Nome = SqlHelper.GetString(dr, "Nome")
                };
            });

        }

        public List<object> CarregarCmbFuncionarios(int dptoId)
        {
            DBSGSI db = new DBSGSI();
            return db.CarregarCmbFuncionarios<object>(delegate (IDataReader dr)
            {
                return new
                {
                    Nome = SqlHelper.GetString(dr, "Nome"),
                    Email = SqlHelper.GetString(dr, "Email"),
                    Cargo = SqlHelper.GetString(dr, "Cargo"),
                };
            }, dptoId);

        }

        public List<EntityFuncionarios> CarregarEmailCargo(string nome, int dpId)
        {
            DBSGSI db = new DBSGSI();
            return db.CarregarEmailCargo<EntityFuncionarios>(EntityFuncionarios.Binding, nome, dpId);
        }
    }
}