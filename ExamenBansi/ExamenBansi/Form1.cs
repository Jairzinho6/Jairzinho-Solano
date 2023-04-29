using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ExamenBansi.Models;

namespace ExamenBansi
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            refresh();
        }

        #region HELPER
        private void refresh()
        {
            using (BdiExamenEntities db = new BdiExamenEntities())
            {
                var lst = from d in db.tblExamen
                          select d;
                dataGridView1.DataSource = lst.ToList();
            }
        }

        private int? GetId()
        {
            try
            {
                return int.Parse(dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value.ToString());
            }
            catch
            {
                return null;
            }
        }
        #endregion
    

        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void splitContainer1_SplitterMoved(object sender, SplitterEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Presentation.FormTabla oformTabla = new Presentation.FormTabla();
            oformTabla.ShowDialog();

            refresh();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            int? id = GetId();
            if (id != null)
            {
                Presentation.FormTabla oformTabla = new Presentation.FormTabla(id);
                oformTabla.ShowDialog();
            }
        }
    }
}
