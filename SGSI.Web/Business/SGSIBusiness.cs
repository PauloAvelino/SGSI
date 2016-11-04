﻿using System;
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

        public List<object> CarregarProcedimentos(int userId)
        {
            DBSGSI db = new DBSGSI();
            return db.CarregarProcedimentos<object>(delegate (IDataReader dr)
            {
                return new
                {
                    ProcedimentoId = SqlHelper.GetInt(dr, "ProcedimentoId"),
                    Nome = SqlHelper.GetString(dr, "Nome"),
                    Norma = SqlHelper.GetString(dr, "Norma"),
                    DataInicial = SqlHelper.GetDateTime(dr, "DataInicial"),
                    DataFinal = SqlHelper.GetDateTime(dr, "DataFinal"),
                    Departamento = SqlHelper.GetString(dr, "Departamento"),
                    ResponsavelAtual = SqlHelper.GetString(dr, "ResponsavelAtual"),
                    Cargo = SqlHelper.GetString(dr, "Cargo"),
                    Situacao = SqlHelper.GetString(dr, "Situacao"),
                    Progresso = SqlHelper.GetDouble(dr, "Progresso")

                };
            }, userId);

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


        public int SalvarProcedimento(string nome, string norma, int dpId, DateTime dtInicial, DateTime dtFinal, int situacaoId, double progresso)
        {
            DBSGSI db = new DBSGSI();
            return db.SalvarProcedimento(nome, norma, dpId, dtInicial, dtFinal, situacaoId, progresso);

        }

        public List<object> CarregarCmbNormas()
        {
            DBSGSI db = new DBSGSI();
            return db.CarregaCmbNormas<object>(delegate (IDataReader dr)
            {
                return new
                {
                    Nome = SqlHelper.GetString(dr, "Nome"),
                    Caminho = SqlHelper.GetString(dr, "Caminho")
                };
            });

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