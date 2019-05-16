using QuanLyQuanCafe.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyQuanCafe
{
    public partial class fAdmin : Form
    {
        public fAdmin()
        {
            InitializeComponent();
            LoadCategory();
            LoadDrinks(2);
            LoadFoods(1);
        }

        private void LoadCategory()
        {
            DataTable dt = DataProvider.Instance.ExecuteQuery("Select * from LoaiSP where MaPhanLoai = " + 2);
            cbbDrinkType.DataSource = dt;
            cbbDrinkType.DisplayMember = "TenLoaiSP";

            DataTable dt2 = DataProvider.Instance.ExecuteQuery("Select * from LoaiSP where MaPhanLoai = " + 1);
            cbbFoodType.DataSource = dt2;
            cbbFoodType.DisplayMember = "TenLoaiSP";
        }

        private void LoadFoods(int maphanloai)
        {
            DataTable data = DataProvider.Instance.ExecuteQuery("exec SanPham_PhanLoai @MaPhanLoai = " + maphanloai);

            dgvFoods.DataSource = data;
        }

        private void LoadDrinks(int maphanloai)
        {
            DataTable data = DataProvider.Instance.ExecuteQuery("exec SanPham_PhanLoai @MaPhanLoai = " + maphanloai);

            dgvDrinks.DataSource = data;
        }

        private void btnSearchDrinks_Click(object sender, EventArgs e)
        {
            DataTable dt = DataProvider.Instance.ExecuteQuery("exec search_drinks @TenSP = N'" + txtSearchDrinks.Text + "'");

            dgvSearchDrinks.DataSource = dt;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string str1 = "Select * from LoaiSP where TenLoaiSP = N'" + cbbDrinkType.Text + "'";
            DataTable dt = DataProvider.Instance.ExecuteQuery(str1);
            int maloaisp = Int32.Parse(dt.Rows[0][0].ToString());
            string str = "insert into SanPham (TenSP, Gia, MaLoaiSP) values (N'" + txtDrinkName.Text + "'," + txtDrinkPrice.Text + "," + maloaisp + ")";
            DataProvider.Instance.ExecuteQuery(str);

            MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OKCancel);
            LoadDrinks(2);
            txtDrinkName.Text = "";
            txtDrinkPrice.Text = "";
        }

        private void btnUpdateDrinks_Click(object sender, EventArgs e)
        {
            int masp = Int32.Parse(txtIdDrinks.Text);
            string str1 = "Select * from LoaiSP where TenLoaiSP = N'" + cbbDrinkType.Text + "'";
            DataTable dt = DataProvider.Instance.ExecuteQuery(str1);
            int maloaisp = Int32.Parse(dt.Rows[0][0].ToString());

            string str = "update SanPham set TenSP = N'" + txtDrinkName.Text + "', Gia = " + txtDrinkPrice.Text + ", MaLoaiSP = " + maloaisp + "where MaSP = " + masp;
            DataProvider.Instance.ExecuteQuery(str);

            LoadDrinks(2);
            txtDrinkName.Text = "";
            txtDrinkPrice.Text = "";
        }

        private void btnDelDrinks_Click(object sender, EventArgs e)
        {
            int masp = Int32.Parse(txtIdDrinks.Text);

            if (MessageBox.Show("Bạn có muốn xóa bỏ món ?", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
            {
                string str = "delete from SanPham where MaSP = " + masp;
                DataProvider.Instance.ExecuteQuery(str);

                LoadDrinks(2);
                txtIdDrinks.Text = "";
                txtDrinkName.Text = "";
                txtDrinkPrice.Text = "";
            }
            else { }
        }
        /// <summary>
        /// FOODS
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSearchFoods_Click(object sender, EventArgs e)
        {
            DataTable dt = DataProvider.Instance.ExecuteQuery("exec search_foods @TenSP = N'" + txtSearchFoods.Text + "'");

            dgvSearchFoods.DataSource = dt;
        }

        private void btnAddFood_Click(object sender, EventArgs e)
        {
            string str1 = "Select * from LoaiSP where TenLoaiSP = N'" + cbbFoodType.Text + "'";
            DataTable dt = DataProvider.Instance.ExecuteQuery(str1);
            int maloaisp = Int32.Parse(dt.Rows[0][0].ToString());
            string str = "insert into SanPham (TenSP, Gia, MaLoaiSP) values (N'" + txtFoodName.Text + "'," + txtFoodPrice.Text + "," + maloaisp + ")";
            DataProvider.Instance.ExecuteQuery(str);

            MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OKCancel);
            LoadFoods(1);
            txtFoodName.Text = "";
            txtFoodPrice.Text = "";
        }

        private void btnUpdateFood_Click(object sender, EventArgs e)
        {
            int masp = Int32.Parse(txtIdFood.Text);
            string str1 = "Select * from LoaiSP where TenLoaiSP = N'" + cbbFoodType.Text + "'";
            DataTable dt = DataProvider.Instance.ExecuteQuery(str1);
            int maloaisp = Int32.Parse(dt.Rows[0][0].ToString());

            string str = "update SanPham set TenSP = N'" + txtFoodName.Text + "', Gia = " + txtFoodPrice.Text + ", MaLoaiSP = " + maloaisp + "where MaSP = " + masp;
            DataProvider.Instance.ExecuteQuery(str);

            LoadFoods(1);
            txtFoodName.Text = "";
            txtFoodPrice.Text = "";
        }

        private void btnDelFood_Click(object sender, EventArgs e)
        {
            int masp = Int32.Parse(txtIdFood.Text);

            if (MessageBox.Show("Bạn có muốn xóa bỏ món ?", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
            {
                string str = "delete from SanPham where MaSP = " + masp;
                DataProvider.Instance.ExecuteQuery(str);

                LoadDrinks(2);
                txtIdFood.Text = "";
                txtFoodName.Text = "";
                txtFoodPrice.Text = "";
            }
            else { }
        }
        /// <summary>
        /// THỐNG KÊ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        CultureInfo culture = new CultureInfo("vi-VN");
        private void btnLoc_Click(object sender, EventArgs e)
        {
            string ngay = dateTimePicker1.Text;
            string[] time = dateTimePicker1.Text.Split('-');
            string thang = time[1];
            string nam = time[0];

            if (radioButton1.Checked)
            {
                DataTable data = DataProvider.Instance.ExecuteQuery("exec thongke_ngay @Thoigian = '" + ngay + "'");
                dgvThongke.DataSource = data;
                int sc = dgvThongke.Rows.Count;
                float thanhtien = 0;
                for (int i = 0; i < sc - 1; i++)
                {
                    thanhtien += float.Parse(dgvThongke.Rows[i].Cells["Thành Tiền"].Value.ToString());

                }
                lblTongTien.Text = thanhtien.ToString("c", culture);
            }

            if (radioButton2.Checked)
            {
                DataTable data = DataProvider.Instance.ExecuteQuery("exec thongke_thang @Thang = '" + thang + "', @Nam = '" + nam + "'");
                dgvThongke.DataSource = data;
                int sc = dgvThongke.Rows.Count;
                float thanhtien = 0;
                for (int i = 0; i < sc - 1; i++)
                {
                    thanhtien += float.Parse(dgvThongke.Rows[i].Cells["Thành Tiền"].Value.ToString());

                }
                lblTongTien.Text = thanhtien.ToString("c", culture);
            }

            if (radioButton3.Checked)
            {
                DataTable data = DataProvider.Instance.ExecuteQuery("exec thongke_nam @Nam = '" + nam + "'");
                dgvThongke.DataSource = data;
                int sc = dgvThongke.Rows.Count;
                float thanhtien = 0;
                for (int i = 0; i < sc - 1; i++)
                {
                    thanhtien += float.Parse(dgvThongke.Rows[i].Cells["Thành Tiền"].Value.ToString());

                }
                lblTongTien.Text = thanhtien.ToString("c", culture);
            }

        }
        
        
        private void txtIdBill_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsNumber(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void btnIDBill_Click(object sender, EventArgs e)
        {
            if (txtIdBill.Text == "")
            {

            }
            else
            {
                string mabill = txtIdBill.Text;
                DataTable data = DataProvider.Instance.ExecuteQuery("exec thongke_id @MaBill = " + mabill );
                dgvThongke.DataSource = data;
                int sc = dgvThongke.Rows.Count;
                float thanhtien = 0;
                for (int i = 0; i < sc - 1; i++)
                {
                    thanhtien += float.Parse(dgvThongke.Rows[i].Cells["Thành Tiền"].Value.ToString());

                }
                lblTongTien.Text = thanhtien.ToString("c", culture);
            }
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }
    }
}
