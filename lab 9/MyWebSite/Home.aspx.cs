using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyWebSite.DAL;

namespace MyWebSite
{
    public partial class Home : System.Web.UI.Page
    {

       protected void Page_Load(object sender, EventArgs e)
        {            LoadGrid();
        }





        protected void Button1_Click(object sender, EventArgs e)
        {
            int itemNoValue = Convert.ToInt32(TxtItmNo.Text.ToString());
            string itemNameValue = TxtItmName.Text.ToString();
            int totalUnits = Convert.ToInt32(TxtUnits.Text.ToString());

            //=====updating the newly entered values in database====
            myDAL objMyDal = new myDAL();
            objMyDal.insertItem(itemNoValue, totalUnits, itemNameValue);

            LoadGrid();
        }
       public void LoadGrid()
        {myDAL md = new myDAL();
ItemGrid.DataSource = md.SelectItem();
ItemGrid.DataBind();
        }
protected void ItemGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
GridViewRow row = (GridViewRow)ItemGrid.Rows[e.RowIndex];
            //==== getting the value from the respective controls=====
            Label itemNo = (Label)ItemGrid.Rows[e.RowIndex].FindControl("txtItemNo");
            TextBox ItemName = (TextBox)ItemGrid.Rows[e.RowIndex].FindControl("txtItemName");
            TextBox TotalUnits = (TextBox)ItemGrid.Rows[e.RowIndex].FindControl("txtTotalUnits");
            //========================================================
            int itemNoValue = Convert.ToInt32(itemNo.Text.ToString());
            string itemNameValue = ItemName.Text.ToString();
            int totalUnits = Convert.ToInt32(TotalUnits.Text.ToString());

            //=====updating the newly entered values in database====
            myDAL objMyDal = new myDAL();
            objMyDal.UpdateItem(itemNoValue, totalUnits, itemNameValue);
            //======================================================
            ItemGrid.EditIndex = -1;
            LoadGrid();      }


protected void ItemGrid_RowCancellingEdit(object sender, GridViewCancelEditEventArgs e)
{
ItemGrid.EditIndex = -1;
LoadGrid();
}

protected void ItemGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
ItemGrid.EditIndex = e.NewEditIndex;
LoadGrid();
        }

        protected void ItemGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            myDAL objMyDal = new myDAL();
            GridViewRow row = ItemGrid.Rows[e.RowIndex];
            int ItemID = Convert.ToInt32(row.Cells[2].Text.ToString());
            Label itemNo = (Label)ItemGrid.Rows[e.RowIndex].FindControl("lblItemNo");
                 //    int ItemID = Convert.ToInt32(itemNo.Text.ToString());
            int result = objMyDal.DeleteItem(ItemID);
            if (result == -1)
            {
                ItemGrid.DataSource = objMyDal.SelectItem();
                ItemGrid.DataBind();
            }
            else
            {
                string message = "No row deleted";
                ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert",

                message.ToString());
            }


        }

    }
}