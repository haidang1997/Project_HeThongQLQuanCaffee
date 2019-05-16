using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DTO
{
    public class MenuShowBill
    {
        public MenuShowBill(string tenSP, int soLuong, float gia, float thanhTien)
        {
            this.TenSP = tenSP;
            this.SoLuong = soLuong;
            this.Gia = gia;
            this.ThanhTien = thanhTien;
        }

        public MenuShowBill(DataRow row)
        {
            this.TenSP = row["TenSP"].ToString();
            this.SoLuong = (int)row["SoLuong"];
            this.Gia = (float)Convert.ToDouble(row["Gia"].ToString());
            this.ThanhTien = (float)Convert.ToDouble(row["ThanhTien"]);
        }
        
        private string tenSP;

        public string TenSP
        {
            get { return tenSP; }
            set { tenSP = value; }
        }

        private int soLuong;

        public int SoLuong
        {
            get { return soLuong; }
            set { soLuong = value; }
        }

        private float gia;

        public float Gia
        {
            get { return gia; }
            set { gia = value; }
        }

        private float thanhTien;

        public float ThanhTien
        {
            get { return thanhTien; }
            set { thanhTien = value; }
        }
    }
}
