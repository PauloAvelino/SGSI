﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using SGSI.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace SGSI.Web.Data
{
    public class DBSGSI
    {
        string stringConexao = ConfigurationManager.ConnectionStrings["TccConnectionString"].ConnectionString;

        public int InsereNovoUsuario(string nome, string cargo, int departamentoId, string email, string senha)
        {


            int p_retorno = 0;

            SqlHelperFactory.ExecuteNonQuery(
                SGSI.Settings.Settings.Default.InstanceDB,
                "InsereUsuario",
                new object[] {
                nome,
                cargo,
                departamentoId,
                email,
                senha,
                p_retorno},
                delegate (Database db, DbCommand commandWrapper)
                {
                    p_retorno = Convert.ToInt32(db.GetParameterValue(commandWrapper, "p_retorno"));
                }
                );


            return p_retorno;

        }

        public List<TValue> CarregarUsuarios<TValue>(CreateInstanceBindingHandler<TValue> binding)
        {
            return SqlHelperFactory.GetListCreateInstanceDB<TValue>(
                 SGSI.Settings.Settings.Default.InstanceDB,
                "CarregaUsuarios",
                binding);
        }

        public List<TValue> CarregarCmbDepartamentos<TValue>(CreateInstanceBindingHandler<TValue> binding)
        {
            return SqlHelperFactory.GetListCreateInstanceDB<TValue>(
                SGSI.Settings.Settings.Default.InstanceDB,
                "CarregaCmbDepartamento",
                binding
               );
        }

        public List<TValue> CarregarCmbFuncionarios<TValue>(CreateInstanceBindingHandler<TValue> binding, int dptoId)
        {
            return SqlHelperFactory.GetListCreateInstanceDB<TValue>(
                SGSI.Settings.Settings.Default.InstanceDB,
                "CarregaCmbFuncionario",
                binding,
                new object[] {
                dptoId
                });
        }

        public List<TValue> CarregarEmailCargo<TValue>(BindingHandler<TValue> binding, string nome, int dpId)
        {
            return SqlHelperFactory.GetListDB<TValue>(
                SGSI.Settings.Settings.Default.InstanceDB,
                "CarregaEmailCargo",
                binding,
                nome,
                dpId);
        }

        public int RemoverUsuario(string email)
        {
            int p_retorno = 0;

            SqlHelperFactory.ExecuteNonQuery(
                SGSI.Settings.Settings.Default.InstanceDB,
                "RemoverUsuarios",
                new object[] {
                email,
                p_retorno},

                delegate (Database db, DbCommand commandWrapper)
                {
                    p_retorno = Convert.ToInt32(db.GetParameterValue(commandWrapper, "p_retorno"));
                }
                );

            return p_retorno;

        }

        public int AlterarSenhaUsuario(string email, string senha)
        {
            int p_retorno = 0;

            SqlHelperFactory.ExecuteNonQuery(
                SGSI.Settings.Settings.Default.InstanceDB,
                "AlterarSenhaUsuarios",
                new object[] {
                email,
                senha,
                p_retorno},

                delegate (Database db, DbCommand commandWrapper)
                {
                    p_retorno = Convert.ToInt32(db.GetParameterValue(commandWrapper, "p_retorno"));
                }
                );

            return p_retorno;

        }

    }
}