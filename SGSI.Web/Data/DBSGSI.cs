using System;
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
        public int InsereNovoUsuario(string nome, string cargo, int departamentoId, string email, int tipo, string senha)
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
                tipo,
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

        public List<TValue> CarregaNormas<TValue>(CreateInstanceBindingHandler<TValue> binding)
        {
            return SqlHelperFactory.GetListCreateInstanceDB<TValue>(
                 SGSI.Settings.Settings.Default.InstanceDB,
                "CarregaNormas",
                binding);
        }

        public List<TValue> CarregaCmbGrupos<TValue>(CreateInstanceBindingHandler<TValue> binding)
        {
            return SqlHelperFactory.GetListCreateInstanceDB<TValue>(
                 SGSI.Settings.Settings.Default.InstanceDB,
                "CarregaCmbGrupo",
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

        public int SalvaNorma(string nome, string local, DateTime criacao, string autor)
        {
            int p_retorno = 0;
            SqlHelperFactory.ExecuteNonQuery(
                SGSI.Settings.Settings.Default.InstanceDB,
                "SalvarNorma",
                new object[] {
                nome,
                criacao,
                autor,
                local,
                p_retorno},
                        delegate (Database db, DbCommand commandWrapper)
                        {
                            p_retorno = Convert.ToInt32(db.GetParameterValue(commandWrapper, "p_retorno"));
                        }
                        );

            return p_retorno;



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

        public List<TValue> CarregarProcedimentos<TValue>(CreateInstanceBindingHandler<TValue> binding, int userId)
        {
            return SqlHelperFactory.GetListCreateInstanceDB<TValue>(
               SGSI.Settings.Settings.Default.InstanceDB,
               "CarregaProcedimentos",
                binding,
                   new object[] {
                   userId
                });
        }


        public List<TValue> CarregaCmbNormas<TValue>(CreateInstanceBindingHandler<TValue> binding)
        {
            return SqlHelperFactory.GetListCreateInstanceDB<TValue>(
                SGSI.Settings.Settings.Default.InstanceDB,
                "CarregaCmbNorma",
                binding
               );
        }

        public List<TValue> ConsultarLogin<TValue>(BindingHandler<TValue> binding, string email, string senha)
        {
            int retorno = 0;
            return SqlHelperFactory.GetListDB<TValue>(
                SGSI.Settings.Settings.Default.InstanceDB,
                "ValidarLogin",
                binding,
                email,
                senha,
                retorno
                );
        }

        //public int ConsultarLogin(string email, string senha)
        //{
        //    int p_retorno = 0;

        //    SqlHelperFactory.ExecuteNonQuery(
        //        SGSI.Settings.Settings.Default.InstanceDB,
        //        "ValidarLogin",
        //        new object[] {
        //        email,
        //        senha,
        //        p_retorno},

        //        delegate (Database db, DbCommand commandWrapper)
        //        {
        //            p_retorno = Convert.ToInt32(db.GetParameterValue(commandWrapper, "p_retorno"));
        //        }
        //        );

        //    return p_retorno;

        //}
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


        public int SalvarProcedimento(string nome, string norma, int dpId, DateTime dtInicial, DateTime dtFinal, int situacaoId, double progresso, string descricao)
        {
            int p_retorno = 0;

            SqlHelperFactory.ExecuteNonQuery(
                SGSI.Settings.Settings.Default.InstanceDB,
                "SalvarProcedimento",
                new object[] {
                nome,
                norma,
                dpId,
                dtInicial,
                dtFinal,
                situacaoId,
                progresso,
                descricao,
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