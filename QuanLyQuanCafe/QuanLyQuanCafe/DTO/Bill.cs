using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DTO
{
    public class Bill
    {
        public Bill(int maBill, DateTime thoiGian, bool trangThai)
        {
            this.MaBill = maBill;
            this.ThoiGian = thoiGian;
            this.TrangThai = trangThai;
        }

        public Bill(DataRow row){
            this.MaBill = (int)row["MaBill"];
            this.ThoiGian = (DateTime)row["ThoiGian"];
            this.TrangThai = (bool)row["TrangThai"];
        }


        private int maBill;

        public int MaBill
        {
            get { return maBill; }
            set { maBill = value; }
        }

        private DateTime thoiGian;

        public DateTime ThoiGian
        {
            get { return thoiGian; }
            set { thoiGian = value; }
        }

        private bool trangThai;

        public bool TrangThai
        {
            get { return trangThai; }
            set { trangThai = value; }
        }
    }
}
