# 🧠 Kimia Farma Performance Analytics

Proyek ini bertujuan untuk mengevaluasi kinerja bisnis Kimia Farma dari tahun 2020 hingga 2023.

Dataset yang digunakan berasal dari Kaggle:  
👉 [Dataset kinerja bisnis](https://drive.google.com/file/d/1d502en6EG6AxAtbIUKM9WFZN7UeQ0OjZ/view?usp=sharing)


---

## 📦 Dataset Overview

Dataset ini berisi data pelanggan dari perusahaan pemasaran langsung. Kolom-kolom utama meliputi:

| Fitur             | Deskripsi |
|------------------|-----------|
| `ID`             | ID unik untuk setiap pelanggan |
| `Year_Birth`     | Tahun kelahiran pelanggan |
| `Education`      | Tingkat pendidikan pelanggan |
| `Marital_Status` | Status pernikahan |
| `Income`         | Pendapatan tahunan |
| `Kidhome`        | Jumlah anak kecil di rumah |
| `Teenhome`       | Jumlah remaja di rumah |
| `Dt_Customer`    | Tanggal pertama menjadi pelanggan |
| `Recency`        | Hari sejak pembelian terakhir |
| `MntWines` hingga `MntGoldProds` | Total pembelian per kategori produk |
| `NumWebPurchases`, dll | Jumlah pembelian melalui kanal tertentu |
| `AcceptedCmp1`–`AcceptedCmp5` | Indikator penerimaan kampanye 1–5 |
| `Response`       | Penerimaan kampanye terakhir |
| `Z_CostContact`, `Z_Revenue` | Nilai tetap (tidak informatif) |
| `Complain`       | Apakah pelanggan pernah komplain |

---

## 🎯 Tujuan Proyek

- Menganalisis perilaku pelanggan berdasarkan pengeluaran dan aktivitas belanja.
- Membuat model klasifikasi untuk memprediksi apakah pelanggan akan menerima kampanye.
- Membuat model regresi untuk memprediksi **TotalSpend (CLV)**.
- Membandingkan performa model:
  - `LinearRegression`
  - `GradientBoostingRegressor`
  - `XGBoost`
  - `RandomForestRegressor`

---



📌 Catatan Tambahan
- Z_CostContact dan Z_Revenue dihapus dari modeling karena berisi nilai tetap.
