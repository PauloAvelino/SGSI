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
        string stringConexao = ConfigurationManager.ConnectionStrings["TccConnectionString"].ConnectionString;

        public int InsereNovoUsuario(string nome, string email, string senha)
        {


            int p_retorno = 0;

            SqlHelperFactory.ExecuteNonQuery(
                SGSI.Settings.Settings.Default.InstanceDB,
                "InsereUsuario",
                new object[] {
                nome,
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