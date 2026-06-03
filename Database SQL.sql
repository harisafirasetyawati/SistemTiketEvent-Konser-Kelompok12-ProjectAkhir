CREATE DATABASE db_tiket_event;
USE db_tiket_event;

-- Tabel Master 1: Tabel Admin
CREATE TABLE admin_acara (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    nama_admin VARCHAR(100),
    email VARCHAR(100),
    PASSWORD VARCHAR(255),
    no_hp VARCHAR(20)
);

-- Data Tabel Admin
INSERT INTO admin_acara (nama_admin, email, PASSWORD, no_hp) VALUES
('Admin 1','admin1@gmail.com','admin123','0811111111'),
('Admin 2','admin2@gmail.com','admin123','0822222222'),
('Admin 3','admin3@gmail.com','admin123','0833333333'),
('Admin 4','admin4@gmail.com','admin123','0844444444'),
('Admin 5','admin5@gmail.com','admin123','0855555555'),
('Admin 6','admin6@gmail.com','admin123','0866666666'),
('Admin 7','admin7@gmail.com','admin123','0877777777'),
('Admin 8','admin8@gmail.com','admin123','0888888888'),
('Admin 9','admin9@gmail.com','admin123','0899999999'),
('Admin 10','admin10@gmail.com','admin123','0812121212');


-- Tabel Master 2: Tabel Kategori_event
CREATE TABLE kategori_event (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100),
    deskripsi TEXT
);

-- Data Tabel Kategori_event
INSERT INTO kategori_event (nama_kategori, deskripsi) VALUES
('Konser Musik','Acara konser musik artis'),
('Festival','Festival tahunan'),
('Seminar','Acara seminar edukasi'),
('Workshop','Pelatihan dan workshop'),
('Pameran','Pameran seni dan teknologi'),
('Olahraga','Pertandingan olahraga'),
('Komedi','Stand up comedy'),
('Teater','Pertunjukan teater'),
('Fan Meeting','Meet and greet artis'),
('Kompetisi','Ajang perlombaan');


-- PINDAH KE SINI: Tabel Master 5: Kota (Harus di atas sebelum lokasi)
CREATE TABLE kota (
    id_kota INT AUTO_INCREMENT PRIMARY KEY,
    nama_kota VARCHAR(100),
    provinsi VARCHAR(100),
    kode_pos VARCHAR(10),
    pulau VARCHAR(100)
);

-- Data Tabel Kota
INSERT INTO kota (nama_kota, provinsi, kode_pos, pulau) VALUES
('Surabaya','Jawa Timur','60111','Jawa'),
('Jakarta','DKI Jakarta','10110','Jawa'),
('Bandung','Jawa Barat','40111','Jawa'),
('Yogyakarta','DI Yogyakarta','55111','Jawa'),
('Semarang','Jawa Tengah','50111','Jawa'),
('Malang','Jawa Timur','65111','Jawa'),
('Denpasar','Bali','80111','Bali'),
('Makassar','Sulawesi Selatan','90111','Sulawesi'),
('Medan','Sumatera Utara','20111','Sumatera'),
('Palembang','Sumatera Selatan','30111','Sumatera');


-- Sekarang Tabel Lokasi aman dibuat karena tabel kota sudah ada
CREATE TABLE lokasi (
    id_lokasi INT PRIMARY KEY AUTO_INCREMENT,
    nama_lokasi VARCHAR(100),
    id_kota INT, 
    kapasitas INT,
    alamat TEXT,
    CONSTRAINT fk_lokasi_kota FOREIGN KEY (id_kota) REFERENCES kota(id_kota) 
    ON UPDATE CASCADE 
    ON DELETE RESTRICT
);

-- Data Tabel Lokasi
INSERT INTO lokasi (nama_lokasi, id_kota, kapasitas, alamat) VALUES
('Gelora Bung Karno',1,50000,'Jakarta Pusat'),
('Jatim Expo',2,10000,'Surabaya Timur'),
('ICE BSD',3,20000,'BSD City'),
('Saparua Hall',4,5000,'Bandung'),
('Jogja Expo Center',5,8000,'Yogyakarta'),
('Bali Nusa Dua',6,7000,'Nusa Dua'),
('Manahan Stadium',7,15000,'Solo'),
('Makassar Hall',8,6000,'Makassar'),
('Palembang Sport Hall',9,9000,'Palembang'),
('Semarang Convention Center',10,12000,'Semarang');


-- Tabel Master 4: Tabel Acara
CREATE TABLE acara (
    id_event INT AUTO_INCREMENT PRIMARY KEY,
    nama_event VARCHAR(100),
    tanggal_event DATE,
    jam_event TIME,
    harga_tiket INT,
    stok_tiket INT,
    tiket_tersedia INT,
    id_kategori INT,
    id_lokasi INT,
    FOREIGN KEY (id_kategori) REFERENCES kategori_event(id_kategori),
    FOREIGN KEY (id_lokasi) REFERENCES lokasi(id_lokasi)
);

-- Data Tabel Acara
INSERT INTO acara (nama_event,tanggal_event,jam_event,harga_tiket,stok_tiket,tiket_tersedia,id_kategori,id_lokasi) VALUES
('Java Music Fest','2026-06-01','19:00:00',250000,1000,850,1,1),
('Rock Surabaya','2026-06-10','20:00:00',300000,800,600,1,2),
('Tech Expo','2026-06-15','09:00:00',100000,500,450,5,3),
('Creative Workshop','2026-06-20','13:00:00',75000,300,250,4,4),
('Stand Up Night','2026-06-22','19:30:00',120000,400,320,7,5),
('Football Championship','2026-07-01','16:00:00',200000,2000,1500,6,6),
('Drama Theater','2026-07-05','18:00:00',90000,350,280,8,7),
('Anime Fan Meeting','2026-07-10','15:00:00',180000,600,500,9,8),
('National Competition','2026-07-15','08:00:00',50000,700,650,10,9),
('Summer Festival','2026-07-20','17:00:00',220000,1200,1000,2,10);


-- Tabel Master 6: Kategori_tiket
CREATE TABLE kategori_tiket (
    id_kategori_tiket INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100),
    fasilitas TEXT
);

-- Data Tabel Kategori_tiket
INSERT INTO kategori_tiket (nama_kategori, fasilitas) VALUES
('VIP','Akses depan panggung'),
('Festival','Area berdiri'),
('Regular','Kursi biasa'),
('Tribun','Tempat duduk tribun'),
('VVIP','Meet and greet'),
('Silver','Area standar'),
('Gold','Area premium'),
('Platinum','Kursi eksklusif'),
('Early Entry','Masuk lebih awal'),
('Bundling','Merchandise eksklusif');


-- Tabel Master 7: Tabel Metode_pembayaran
CREATE TABLE metode_pembayaran (
    id_metode INT AUTO_INCREMENT PRIMARY KEY,
    nama_metode VARCHAR(100),
    provider VARCHAR(100)
);

-- Data Tabel Metode_pembayaran
INSERT INTO metode_pembayaran (nama_metode, provider) VALUES
('Transfer Bank','BCA'),
('Transfer Bank','BRI'),
('Transfer Bank','Mandiri'),
('E-Wallet','OVO'),
('E-Wallet','GoPay'),
('E-Wallet','Dana'),
('Virtual Account','BNI VA'),
('Kartu Kredit','Visa'),
('Kartu Kredit','Mastercard'),
('QRIS','QRIS Indonesia');


-- Tabel Master 8: Tabel Customer
CREATE TABLE customer (
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    nama_customer VARCHAR(100),
    email VARCHAR(100),
    PASSWORD VARCHAR(255),
    no_hp VARCHAR(20),
    alamat TEXT,
    id_kota INT,
    FOREIGN KEY (id_kota) REFERENCES kota(id_kota)
);

-- Data Tabel Customer
INSERT INTO customer (nama_customer,email,PASSWORD,no_hp,alamat,id_kota) VALUES
('Andi','andi@gmail.com','12345','0811111111','Jl Mawar',1),
('Budi','budi@gmail.com','12345','0822222222','Jl Melati',2),
('Citra','citra@gmail.com','12345','0833333333','Jl Kenanga',3),
('Dina','dina@gmail.com','12345','0844444444','Jl Anggrek',4),
('Eko','eko@gmail.com','12345','0855555555','Jl Dahlia',5),
('Fajar','fajar@gmail.com','12345','0866666666','Jl Flamboyan',6),
('Gina','gina@gmail.com','12345','0877777777','Jl Sakura',7),
('Hendra','hendra@gmail.com','12345','0888888888','Jl Tulip',8),
('Intan','intan@gmail.com','12345','0899999999','Jl Cemara',9),
('Joko','joko@gmail.com','12345','0810101010','Jl Merpati',10);


-- Tabel Transaksi 1: Pemesanan
CREATE TABLE pemesanan (
    id_pemesanan INT AUTO_INCREMENT PRIMARY KEY,
    tanggal_pemesanan DATE,
    kode_tiket VARCHAR(20),
    nomor_kursi VARCHAR(10),
    jumlah_tiket INT,
    harga_satuan INT,
    total_harga INT,
    status_pemesanan ENUM('pending','lunas','dibatalkan'),
    status_tiket ENUM('aktif','digunakan','expired'),
    id_customer INT,
    id_event INT,
    id_metode INT,
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
    FOREIGN KEY (id_event) REFERENCES acara(id_event),
    FOREIGN KEY (id_metode) REFERENCES metode_pembayaran(id_metode)
);

-- Data Tabel Pemesanan
INSERT INTO pemesanan (tanggal_pemesanan,kode_tiket,nomor_kursi,jumlah_tiket,harga_satuan,total_harga,status_pemesanan,status_tiket,id_customer,id_event,id_metode)VALUES
('2026-05-01','TKT001','A01',2,250000,500000,'lunas','aktif',1,1,1),
('2026-05-02','TKT002','B01',1,300000,300000,'pending','aktif',2,2,2),
('2026-05-03','TKT003','C01',3,100000,300000,'lunas','digunakan',3,3,3),
('2026-05-04','TKT004','D01',2,75000,150000,'lunas','aktif',4,4,4),
('2026-05-05','TKT005','E01',1,120000,120000,'pending','aktif',5,5,5),
('2026-05-06','TKT006','F01',4,200000,800000,'lunas','digunakan',6,6,6),
('2026-05-07','TKT007','G01',2,90000,180000,'dibatalkan','expired',7,7,7),
('2026-05-08','TKT008','H01',1,180000,180000,'lunas','aktif',8,8,8),
('2026-05-09','TKT009','I01',5,50000,250000,'pending','aktif',9,9,9),
('2026-05-10','TKT010','J01',2,220000,440000,'lunas','aktif',10,10,10);


-- Tabel Transaksi 2: Pembayaran
CREATE TABLE pembayaran (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    tanggal_pembayaran DATE,
    jumlah_bayar INT,
    status_pembayaran ENUM('berhasil','gagal','menunggu'),
    id_pemesanan INT,
    id_metode INT,
    FOREIGN KEY (id_pemesanan) REFERENCES pemesanan(id_pemesanan),
    FOREIGN KEY (id_metode) REFERENCES metode_pembayaran(id_metode)
);

-- Data Tabel Pembayaran
INSERT INTO pembayaran (tanggal_pembayaran, jumlah_bayar, status_pembayaran, id_pemesanan, id_metode) VALUES
('2026-05-01',500000,'berhasil',1,1),
('2026-05-02',300000,'menunggu',2,2),
('2026-05-03',300000,'berhasil',3,3),
('2026-05-04',150000,'berhasil',4,4),
('2026-05-05',120000,'menunggu',5,5),
('2026-05-06',800000,'berhasil',6,6),
('2026-05-07',180000,'gagal',7,7),
('2026-05-08',180000,'berhasil',8,8),
('2026-05-09',250000,'menunggu',9,9),
('2026-05-10',440000,'berhasil',10,10);


-- Proses penyesuaian ALTER TABLE & UPDATE setelah semua tabel terbentuk
ALTER TABLE pemesanan ADD COLUMN id_kategori_tiket INT;
ALTER TABLE pemesanan ADD CONSTRAINT fk_kategori_tiket FOREIGN KEY (id_kategori_tiket) REFERENCES kategori_tiket(id_kategori_tiket);

UPDATE pemesanan SET id_kategori_tiket = 1 WHERE id_pemesanan = 1;
UPDATE pemesanan SET id_kategori_tiket = 2 WHERE id_pemesanan = 2;
UPDATE pemesanan SET id_kategori_tiket = 3 WHERE id_pemesanan = 3;
UPDATE pemesanan SET id_kategori_tiket = 4 WHERE id_pemesanan = 4;
UPDATE pemesanan SET id_kategori_tiket = 5 WHERE id_pemesanan = 5;
UPDATE pemesanan SET id_kategori_tiket = 6 WHERE id_pemesanan = 6;
UPDATE pemesanan SET id_kategori_tiket = 7 WHERE id_pemesanan = 7;
UPDATE pemesanan SET id_kategori_tiket = 8 WHERE id_pemesanan = 8;
UPDATE pemesanan SET id_kategori_tiket = 9 WHERE id_pemesanan = 9;
UPDATE pemesanan SET id_kategori_tiket = 10 WHERE id_pemesanan = 10;

ALTER TABLE acara ADD COLUMN id_admin INT;
ALTER TABLE acara ADD CONSTRAINT fk_admin_acara FOREIGN KEY (id_admin) REFERENCES admin_acara(id_admin);

UPDATE acara SET id_admin = 1 WHERE id_event = 1;
UPDATE acara SET id_admin = 2 WHERE id_event = 2;
UPDATE acara SET id_admin = 3 WHERE id_event = 3;
UPDATE acara SET id_admin = 4 WHERE id_event = 4;
UPDATE acara SET id_admin = 5 WHERE id_event = 5;
UPDATE acara SET id_admin = 6 WHERE id_event = 6;
UPDATE acara SET id_admin = 7 WHERE id_event = 7;
UPDATE acara SET id_admin = 8 WHERE id_event = 8;
UPDATE acara SET id_admin = 9 WHERE id_event = 9;
UPDATE acara SET id_admin = 10 WHERE id_event = 10;

ALTER TABLE pemesanan DROP FOREIGN KEY pemesanan_ibfk_3;
ALTER TABLE pemesanan DROP COLUMN id_metode;

-- Query pembuktian relasi rekomendasi nomor 1
SELECT 
    lokasi.id_lokasi,
    lokasi.nama_lokasi,
    kota.nama_kota,
    kota.provinsi,
    lokasi.kapasitas,
    lokasi.alamat
FROM lokasi
INNER JOIN kota ON lokasi.id_lokasi = kota.id_kota;