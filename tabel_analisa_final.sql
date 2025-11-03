WITH
  -- Step 1: Gabungkan tabel transaksi, cabang, dan produk
  JoinedData AS (
    SELECT
      -- Dari kf_final_transaction (t)
      t.transaction_id,
      t.date AS date, -- <-- BARIS INI DIUBAH. Tidak perlu PARSE_DATE
      t.branch_id,
      t.customer_name,
      t.product_id,
      t.price AS actual_price,
      t.discount_percentage,
      t.rating AS rating_transaksi,

      -- Dari kf_kantor_cabang (b)
      b.branch_name,
      b.kota,
      b.provinsi,
      b.rating AS rating_cabang,

      -- Dari kf_product (p)
      p.product_name
    FROM
      `rakamin-kf-analytics-477111.kimia_farma.kf_final_transaction` AS t
    LEFT JOIN
      `rakamin-kf-analytics-477111.kimia_farma.kf_kantor_cabang` AS b
      ON t.branch_id = b.branch_id
    LEFT JOIN
      `rakamin-kf-analytics-477111.kimia_farma.kf_product` AS p
      ON t.product_id = p.product_id
  ),

  -- Step 2: Hitung persentase laba dan penjualan bersih (nett_sales)
  CalculatedSales AS (
    SELECT
      *,
      -- Terapkan aturan bisnis untuk 'persentase_gross_laba'
      CASE
        WHEN actual_price <= 50000 THEN 0.10
        WHEN actual_price > 50000 AND actual_price <= 100000 THEN 0.15
        WHEN actual_price > 100000 AND actual_price <= 300000 THEN 0.20
        WHEN actual_price > 300000 AND actual_price <= 500000 THEN 0.25
        WHEN actual_price > 500000 THEN 0.30
        ELSE 0.0
      END AS persentase_gross_laba,

      -- Hitung 'nett_sales' (harga setelah diskon)
      (actual_price * (1 - discount_percentage)) AS nett_sales
    FROM
      JoinedData
  )

-- Step 3: Hitung 'nett_profit' dan pilih 16 kolom akhir
SELECT
  transaction_id,
  date,
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  customer_name,
  product_id,
  product_name,
  actual_price,
  discount_percentage,
  persentase_gross_laba,
  nett_sales,
  -- Hitung 'nett_profit'
  (nett_sales * persentase_gross_laba) AS nett_profit,
  rating_transaksi
FROM
  CalculatedSales;