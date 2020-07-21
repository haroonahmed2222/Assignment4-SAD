using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public void AddNewDepartment(object sender, EventArgs e)
        {
            using(Assignment4Entities entities=new Assignment4Entities())
            {

                Department dept = new Department
                {
                    Depatment_Name = NewDept.Text,
                };
                entities.Departments.Add(dept);
                entities.SaveChanges();
                InfoLabel.Visible = true;
                InfoLabel.InnerText = "Value Inserted";
                NewDept.Text = "";
                BindGrid();

            }


        }

        private void BindGrid()
        {
            using (Assignment4Entities entities = new Assignment4Entities())
            {
                GridView1.DataSource = (from a in entities.Departments
                                       select a).ToList();
                GridView1.DataBind();

                GridView2.DataSource = (from a in entities.Students
                                        select a).ToList();
                GridView2.DataBind();
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid(); 
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
           
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            using (Assignment4Entities entities = new Assignment4Entities())
            {
                Department Dept= (from c in entities.Departments
                                     where c.Dept_ID == id
                                     select c).FirstOrDefault();
                entities.Departments.Remove(Dept);
                entities.SaveChanges();
            }
            this.BindGrid();
            this.GridView1.DataBind();
            this.GridView2.DataBind();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("Dept_Nametxt") as TextBox).Text;

            using (Assignment4Entities entities = new Assignment4Entities())
            {
                Department Dept = (from c in entities.Departments
                                     where c.Dept_ID == Id
                                     select c).FirstOrDefault();
                Dept.Depatment_Name = name;
                
                entities.SaveChanges();
            }
            GridView1.EditIndex = -1;
            this.BindGrid();
        }
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BindGrid();
            }
        }

        protected void ViewReport(object sender, EventArgs e)
        {
           
            Response.Redirect("~/WebForm2.aspx");
        }


        #region Student


        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            BindGrid();
        }
        

        protected void SOnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Int32.Parse(GridView2.Rows[e.RowIndex].Cells[0].Text);
            using (Assignment4Entities entities = new Assignment4Entities())
            {
                Student Student = (from c in entities.Students
                                   where c.Student_ID == id
                                   select c).FirstOrDefault();
                entities.Students.Remove(Student);
                entities.SaveChangesAsync();
            }
            this.BindGrid();
            this.GridView1.DataBind();
            this.GridView2.DataBind();
        }

        protected void SOnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView2.EditIndex = -1;
            this.BindGrid();
        }

        protected void SOnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView2.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView2.Rows[e.RowIndex].Cells[0].Text);
            string name = (row.FindControl("Nametxt") as TextBox).Text;
            string Address = (row.FindControl("Addresstxt") as TextBox).Text;
            string ID = (row.FindControl("DeptIDtxt") as TextBox).Text;

            using (Assignment4Entities entities = new Assignment4Entities())
            {
                Student student = (from c in entities.Students
                                   where c.Student_ID == Id
                                   select c).FirstOrDefault();
                student.Name = name;
                student.Address = Address;
                student.Dept_ID = Convert.ToInt32(ID);
                

                entities.SaveChanges();
            }
            GridView2.EditIndex = -1;
            this.BindGrid();
        }
        protected void SOnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }


        public void AddNewStudent(object sender, EventArgs e)
        {
            using (Assignment4Entities entities = new Assignment4Entities())
            {

                Student dept = new Student
                {
                    Name = NewName.Text,
                    Address = NewAddress.Text,
                    Dept_ID = int.Parse(NewDeptID.Text),
                };
                entities.Students.Add(dept);
                entities.SaveChanges();
                InfoLabel.Visible = true;
                InfoLabel.InnerText = "Value Inserted";
                NewDept.Text = "";
                NewName.Text = "";
                NewAddress.Text = "";
                NewDeptID.Text = "";
                BindGrid();

            }


        }
        #endregion
    }
}