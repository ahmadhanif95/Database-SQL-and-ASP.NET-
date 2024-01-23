using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace MyWebSite.DAL
{
    public class myDAL
    {
        private static readonly string connString =
            System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;

        public DataSet SelectItem() //to get the values of all the items from table Items and return the Dataset
        {

            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Select * from Items order by itemno", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                }
            }
            catch (SqlException ex)
            { Console.WriteLine("SQL Error" + ex.Message.ToString()); }
            finally
            { con.Close(); }

            return ds; //return the dataset

        }

        public int SearchItem(String Name, ref DataTable DT)
        {

            int Found = 0;
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("searchitem ", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@ItemName", SqlDbType.VarChar, 15);
                cmd.Parameters.Add("@Found", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd.Parameters["@ItemName"].Value = Name;


                cmd.ExecuteNonQuery();

                // read output value 
                Found = Convert.ToInt32(cmd.Parameters["@Found"].Value); //convert to output parameter to interger format

                if (Found == 1)
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);

                    }

                    DT = ds.Tables[0];

                }


                con.Close();


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }

            return Found;

        }
        public int insertItem(int id, int totalUnits, string itemName)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            int result = 0;
            try
            {
                cmd = new SqlCommand("InsertItem", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@itemNo", SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@itemname", SqlDbType.VarChar).Value = itemName;
                cmd.Parameters.Add("@totalUnits", SqlDbType.Int).Value = totalUnits;

                result = cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return result;
        }//end of insert function
        public int DeleteItem(int id)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            int result = 0;
            try
            {
                cmd = new SqlCommand("deleteItem", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                result = cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();

            }

            return result;
        }


        public int UpdateItem(int id, int totalUnits, string itemName)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            int result = 0;
            try
            {
                cmd = new SqlCommand("UpdateItem", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@itemNo", SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@itemname", SqlDbType.VarChar).Value = itemName;
                cmd.Parameters.Add("@totalUnits", SqlDbType.Int).Value = totalUnits;
                result = cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return result;
        }

    }
}