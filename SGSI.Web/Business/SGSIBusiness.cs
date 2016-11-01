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

        //public int ConsultarLogin(string email, string senha)
        //{
        //    DBSGSI db = new DBSGSI();

        //    return db.ConsultarLogin(email, senha);

        //}
        public int AdicionarUsuario(string nome, string cargo, int departamentoId, string email, int tipo, string senha)
        {

            DBSGSI db = new DBSGSI();

            return db.InsereNovoUsuario(nome, cargo, departamentoId, email, tipo, senha);
        }

        public int SalvarNorma(string nome, string local, DateTime criacao, string autor)
        {

            DBSGSI db = new DBSGSI();

           return db.SalvaNorma(nome, local, criacao, autor);
        }
        public List<object> CarregarUsuarios()
        {
            DBSGSI db = new DBSGSI();

            return db.CarregarUsuarios<object>(delegate (IDataReader dr)
            {
                return new
                {
                    Nome = SqlHelper.GetString(dr, "Nome"),
                    Departamento = SqlHelper.GetString(dr, "Departamento"),
                    Cargo = SqlHelper.GetString(dr, "Cargo"),
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

        

            public List<object> CarregarCmbGrupos()
        {
            DBSGSI db = new DBSGSI();
            return db.CarregaCmbGrupos<object>(delegate (IDataReader dr)
            {
                return new
                {
                    AcessoId = SqlHelper.GetInt(dr, "AcessoId"),
                    Descricao = SqlHelper.GetString(dr, "Descricao")
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

        public List<object> CarregarNormas()
        {
            DBSGSI db = new DBSGSI();
            return db.CarregaNormas<object>(delegate (IDataReader dr)
            {
                return new
                {
                    NormaId = SqlHelper.GetInt(dr, "NormaId"),
                    Nome = SqlHelper.GetString(dr, "Nome"),
                    Criacao = SqlHelper.GetDateTime(dr, "DataCriacao"),
                    Autor = SqlHelper.GetString(dr, "Autor"),
                    Caminho = SqlHelper.GetString(dr, "Caminho"),
                    Atualizacao = SqlHelper.GetDateTime(dr, "DataAtualizacao")
                };
            });

        }

        public List<EntityFuncionarios> CarregarEmailCargo(string nome, int dpId)
        {
            DBSGSI db = new DBSGSI();
            return db.CarregarEmailCargo<EntityFuncionarios>(EntityFuncionarios.Binding, nome, dpId);
        }

        public List<EntityUsuarios> ConsultarLogin(string email, string senha)
        {
            DBSGSI db = new DBSGSI();
            return db.ConsultarLogin<EntityUsuarios>(EntityUsuarios.Binding, email, senha);
        }

        public int RemoverUsuario(string email)
        {

            DBSGSI db = new DBSGSI();

            return db.RemoverUsuario(email);
                            }

        public int AlterarSenhaUsuario(string email, string senha)
        {
            
            DBSGSI db = new DBSGSI();

            return db.AlterarSenhaUsuario(email, senha);

        
        }
    }
}