using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace db
{
    public partial class Form9 : Form
    {
        public Form9()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form17 f17 = new Form17();
            f17.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=MANYA\\SQLEXPRESS;Initial Catalog=IL_MARE;Integrated Security=True");
            string ID1 = textBox4.Text;
            string ID2 = textBox3.Text;
            SqlDataAdapter sqa = new SqlDataAdapter("Select count(*) from Validates_ID where Recpt_ID = '" + ID1 + "' and Book_ID= '" + ID2+"';", conn);
            DataTable dt = new DataTable();
            sqa.Fill(dt);

            if (dt.Rows[0][0].ToString() == "1")
            {
                MessageBox.Show("continue");
                Form17 f17 = new Form17();
                f17.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("please enter correct ID");
            }
        }
    }
}
