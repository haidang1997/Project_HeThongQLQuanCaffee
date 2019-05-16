using QuanLyQuanCafe.DAO;
using QuanLyQuanCafe.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace QuanLyQuanCafe
{
    public partial class fMainProgram : Form
    {
        public fMainProgram()
        {
            InitializeComponent();
            LoadTable();
            LoadCategory();
        }

        #region Method
        void LoadCategory()
        {
            List<Category> listCategory = CategoryDAO.Instance.getListCategory();
            cbbLoaiSP.DataSource = listCategory;
            cbbLoaiSP.DisplayMember = "Name";
        }

        void LoadProductsByCategoryID(int id)
        {
            List<Product> listProduct = ProductDAO.Instance.getProductByCategoryID(id);
            cbbSanPham.DataSource = listProduct;
            cbbSanPham.DisplayMember = "Name";
        }

        void LoadTable()
        {
            string str = "Select * from Ban";
            DataTable dt = DataProvider.Instance.ExecuteQuery(str);
            cbbListTable.DataSource = dt;
            cbbListTable.DisplayMember = "TenBan";

            fLayoutTakeAway.Controls.Clear();
            fLayoutThuong.Controls.Clear();
            fLayoutVip.Controls.Clear();
            string status;

            //ListTable TAKEAWAY
            List<Table> takeAway = TableDAO.Instance.LoadTakeAway();
            foreach (Table item in takeAway)
            {
                Button btn = new Button { Width = TableDAO.TableWidth, Height = TableDAO.TableHeight };
                btn.Click += btn_Click;
                btn.Tag = item;
                if(item.TrangThai == true)
                {
                    status = "Có Người";
                    btn.BackColor = Color.Yellow;
                    btn.Text = item.TenBan + Environment.NewLine + "(" + status + ")";
                }
                else
                {
                    status = "Trống";
                    btn.BackColor = Color.White;
                    btn.Text = item.TenBan + Environment.NewLine + "(" + status + ")";
                }
                fLayoutTakeAway.Controls.Add(btn);

            }

            //ListTable Thường
            List<Table> tableListThuong = TableDAO.Instance.LoadTableListThuong();
            foreach (Table item in tableListThuong)
            {
                Button btn = new Button { Width = TableDAO.TableWidth, Height = TableDAO.TableHeight };
                btn.Click += btn_Click;
                btn.Tag = item;

                if (item.TrangThai == false)
                {
                    status = "Trống";
                    btn.BackColor = Color.Aqua;
                }
                else
                {
                    status = "Có Người";
                    btn.BackColor = Color.Yellow;
                }
                btn.Text = item.TenBan + Environment.NewLine + "("+ status + ")";
                fLayoutThuong.Controls.Add(btn);
                
            }

            //ListTable Vip
            List<Table> tableListVip = TableDAO.Instance.LoadTableListVip();
            foreach (Table item in tableListVip)
            {
                Button btn = new Button { Width = TableDAO.TableWidth, Height = TableDAO.TableHeight };
                btn.Click += btn_Click;
                btn.Tag = item;

                if (item.TrangThai == false)
                {
                    status = "Trống";
                    btn.BackColor = Color.YellowGreen;
                }
                else
                {
                    status = "Có Người";
                    btn.BackColor = Color.Green;
                }
                btn.Text = item.TenBan + Environment.NewLine + "(" + status + ")";
                fLayoutVip.Controls.Add(btn);

            }

        }
        CultureInfo culture = new CultureInfo("vi-VN");
        void ShowBill(int maBan)
        {
            lsvBill.Items.Clear();
            List<MenuShowBill> listBillInfo = MenuShowBillDAO.Instance.getListMenuByTable(maBan);

            float tienThanhToan = 0;

            foreach (MenuShowBill item in listBillInfo)
            {
                ListViewItem lsvItem = new ListViewItem(item.TenSP.ToString());
                lsvItem.SubItems.Add(item.SoLuong.ToString());
                lsvItem.SubItems.Add(item.Gia.ToString());
                lsvItem.SubItems.Add(item.ThanhTien.ToString());
                tienThanhToan += item.ThanhTien;

                lsvBill.Items.Add(lsvItem);
            }

            
            //Thread.CurrentThread.CurrentCulture = culture;

            //txtTongTien.Text = tienThanhToan.ToString("c", culture);

            txtTongTien.Text = tienThanhToan.ToString();
        }

        
        #endregion



        #region Events
        void btn_Click(object sender, EventArgs e)
        {
            int maban = ((sender as Button).Tag as Table).MaBan;
            lsvBill.Tag = (sender as Button).Tag;
            ShowBill(maban);
        }
       
        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fAdmin f = new fAdmin();
            f.ShowDialog();
        }
        

        private void btnMoBan_Click(object sender, EventArgs e)
        {
            fProductMenu f = new fProductMenu();
            f.ShowDialog();
        }

        private void cbbLoaiSP_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = 0;

            ComboBox combo = sender as ComboBox;
            if (combo.SelectedItem == null)
                return;
            Category selected = combo.SelectedItem as Category;
            id = selected.Id;

            LoadProductsByCategoryID(id);
        }

        private void btnChonmon_Click(object sender, EventArgs e)
        {
            Table table = lsvBill.Tag as Table;

            int mabill = BillDAO.Instance.GetUncheckedBillIDByTableID(table.MaBan);
            int masp = (cbbSanPham.SelectedItem as Product).Id;
            int soluong = (int)nmSoLuong.Value;
            //int matv = Int32.Parse(txtIdkh.Text);

            if (mabill == -1)
            {
                BillDAO.Instance.InsertBill(table.MaBan);
                BillInfoDAO.Instance.InsertBillinfo(BillDAO.Instance.getLatestIdBill(), masp, soluong);
            }
            else
            {
                BillInfoDAO.Instance.InsertBillinfo(mabill, masp, soluong);
            }
            ShowBill(table.MaBan);
            LoadTable();
        }

        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            Table table = lsvBill.Tag as Table;
            if (table != null)
            {
                int idBill = BillDAO.Instance.GetUncheckedBillIDByTableID(table.MaBan);

                if (idBill != -1)
                {
                    if (MessageBox.Show("Thực hiện thanh toán cho " + table.TenBan + " ?", "Thông Báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                    {
                        if (txtIdkh.Text != "0")
                        {
                            int matv = Int32.Parse(txtIdkh.Text);
                            string str = "Update CTBill set MaTV = " + matv + " where MaBill = " + idBill;
                            DataProvider.Instance.ExecuteNonQuery(str);
                        }
                        string[] tien = txtThanhToan.Text.Split(',');
                        string tongtien = tien[0].Replace(".","");
                        string str1 = "Update Bill set TongTien = " + tongtien + " where MaBill = " + idBill;
                        DataProvider.Instance.ExecuteNonQuery(str1);

                        BillDAO.Instance.ThanhToan(idBill);

                        ShowBill(table.MaBan);
                        LoadTable();

                        txtThanhToan.Text = "0";
                        txtGiamGia.Text = "0%";
                        txtIdkh.Text = "0";
                    }
                }
            }
        }

        private void btnGiamGia_Click(object sender, EventArgs e)
        {
            if (txtIdkh.Text != "")
            {
                int matv = Int32.Parse(txtIdkh.Text);
                string query = "Select * from ThanhVien, LoaiTV where ThanhVien.MaLoaiTV = LoaiTV.MaLoaiTV and MaTV = " + matv;
                DataTable data = DataProvider.Instance.ExecuteQuery(query);

                float tienthanhtoan = 0;

                if (data.Rows.Count != 0)
                {
                    int uudai = Int32.Parse(data.Rows[0][9].ToString());
                    float ptuudai = (float)uudai / 100;
                    txtGiamGia.Text = uudai.ToString() + "%";

                    float tongtien = float.Parse(txtTongTien.Text);
                    tienthanhtoan = tongtien - (tongtien * ptuudai);
                }
                else
                {
                    txtGiamGia.Text = "0%";
                    tienthanhtoan = float.Parse(txtTongTien.Text);
                }
                txtThanhToan.Text = tienthanhtoan.ToString("c", culture);
            }
            else
            {

            }
            
        }

        private void btnHuyBan_Click(object sender, EventArgs e)
        {
            Table table = lsvBill.Tag as Table;
            if (table != null)
            {
                int idBill = BillDAO.Instance.GetUncheckedBillIDByTableID(table.MaBan);

                string str1 = "Delete from CTBill where MaBill = " + idBill;
                string str2 = "Delete from Bill where MaBill = " + idBill;
                string str3 = "Update Ban set TrangThai = 0 where MaBan = " + table.MaBan;

                DataProvider.Instance.ExecuteNonQuery(str1);
                DataProvider.Instance.ExecuteNonQuery(str2);
                DataProvider.Instance.ExecuteNonQuery(str3);

                ShowBill(table.MaBan);
                LoadTable();
            }
            else { }
            
        }

        #endregion

        

        private void txtIdkh_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsNumber(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        

        private void btnChuyenBan_Click(object sender, EventArgs e)
        {
            Table table = lsvBill.Tag as Table;
            if (table != null)
            {
                int idBill = BillDAO.Instance.GetUncheckedBillIDByTableID(table.MaBan);

                string str1 = "Select * from Ban where TenBan = N'" + cbbListTable.Text + "'";
                DataTable dt = DataProvider.Instance.ExecuteQuery(str1);
                int mabanmoi = Int32.Parse(dt.Rows[0][0].ToString());

                string str = "Update Bill set MaBan = " + mabanmoi + " where MaBill = " + idBill;
                DataProvider.Instance.ExecuteQuery(str);

                DataProvider.Instance.ExecuteQuery("Update Ban set TrangThai = 1 where MaBan = " + mabanmoi);
                DataProvider.Instance.ExecuteQuery("Update Ban set TrangThai = 0 where MaBan = " + table.MaBan);

                LoadTable();
            }
            else { }
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void thôngTinCáNhânToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }
    }
}
