using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DTO
{
    public class Table
    {
        public Table(int maBan, string tenBan, bool trangThai)
        {
            this.MaBan = maBan;
            this.TenBan = tenBan;
            this.TrangThai = trangThai;
        }

        public Table(DataRow row)
        {
            this.MaBan = (int)row["MaBan"];
            this.TenBan = row["TenBan"].ToString();
            this.TrangThai = (bool)row["TrangThai"];
        }

        private int maBan;

        public int MaBan
        {
            get { return maBan; }
            set { maBan = value; }
        }

        private string tenBan;

        public string TenBan
        {
            get { return tenBan; }
            set { tenBan = value; }
        }

        private bool trangThai;

        public bool TrangThai
        {
            get { return trangThai; }
            set { trangThai = value; }
        }
    }
}
