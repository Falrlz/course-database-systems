-- Membuat DB
CREATE DATABASE pemeriksaan_klinik;

-- Menggunakan DB
USE pemeriksaan_klinik;

-- Membuat tabel pasien
CREATE TABLE Pasien (
    id_pasien CHAR(6) PRIMARY KEY,
    ktp CHAR(16),
    nama_pasien VARCHAR(50),
    tgl_lahir DATE,
    jenis_kelamin ENUM('L', 'P'),
    telepon VARCHAR(15),
    alamat TEXT
);

-- Membuat tabel dokter
CREATE TABLE Dokter (
    id_dokter CHAR(6) PRIMARY KEY,
    nama_dokter VARCHAR(50),
    spesialisasi VARCHAR(20),
    telepon VARCHAR(15),
    alamat TEXT
);

-- Membuat tabel perawat
CREATE TABLE Perawat (
    id_perawat CHAR(6) PRIMARY KEY,
    nama_perawat VARCHAR(50),
    telepon VARCHAR(15),
    alamat TEXT
);

-- Membuat tabel pemeriksaan
CREATE TABLE Pemeriksaan (
    id_pemeriksaan CHAR(6) PRIMARY KEY,
    waktu_kunjungan DATETIME,
    keluhan TEXT,
    diagnosis TEXT,
    Pasien_id_pasien CHAR(6),
    Perawat_id_perawat CHAR(6),
    Dokter_id_dokter CHAR(6),
    FOREIGN KEY (Pasien_id_pasien) REFERENCES Pasien(id_pasien),
    FOREIGN KEY (Perawat_id_perawat) REFERENCES Perawat(id_perawat),
    FOREIGN KEY (Dokter_id_dokter) REFERENCES Dokter(id_dokter)
);

-- Membuat tabel resep
CREATE TABLE Resep (
    no_resep CHAR(16) PRIMARY KEY,
    kode_obat VARCHAR(45),
    nama_obat VARCHAR(45),
    jumlah VARCHAR(45),
    Pemeriksaan_id_pemeriksaan CHAR(6),
    FOREIGN KEY (Pemeriksaan_id_pemeriksaan) REFERENCES Pemeriksaan(id_pemeriksaan)
);

-- Insert data pada tabel pasien
INSERT INTO Pasien VALUES
('PS001', '1234567890123456', 'Budi Santoso', '1990-01-01', 'L', '081234567890', 'Jl. Melati No.1'),
('PS002', '1234567890123457', 'Siti Aminah', '1985-02-02', 'P', '081234567891', 'Jl. Kenanga No.2'),
('PS003', '1234567890123458', 'Ahmad Fauzi', '2000-03-03', 'L', '081234567892', 'Jl. Anggrek No.3'),
('PS004', '1234567890123459', 'Dina Rahma', '1992-04-04', 'P', '081234567893', 'Jl. Dahlia No.4'),
('PS005', '1234567890123460', 'Rudi Hartono', '1975-05-05', 'L', '081234567894', 'Jl. Teratai No.5'),
('PS006', '1234567890123461', 'Nina Kurnia', '1995-06-06', 'P', '081234567895', 'Jl. Mawar No.6'),
('PS007', '1234567890123462', 'Andi Wijaya', '1988-07-07', 'L', '081234567896', 'Jl. Kamboja No.7'),
('PS008', '1234567890123463', 'Lina Marlina', '1993-08-08', 'P', '081234567897', 'Jl. Tulip No.8'),
('PS009', '1234567890123464', 'Bayu Saputra', '2001-09-09', 'L', '081234567898', 'Jl. Bougenville No.9'),
('PS010', '1234567890123465', 'Rina Kusuma', '1999-10-10', 'P', '081234567899', 'Jl. Sakura No.10');

-- Insert data pada tabel dokter
INSERT INTO Dokter VALUES
('DK001', 'dr. Andi Prasetyo', 'Umum', '081231231001', 'Jl. Dokter No.1'),
('DK002', 'drg. Susi Melani', 'Gigi', '081231231002', 'Jl. Dokter No.2'),
('DK003', 'dr. Dini Ayu', 'Anak', '081231231003', 'Jl. Dokter No.3'),
('DK004', 'dr. Rudi Hidayat', 'Penyakit Dalam', '081231231004', 'Jl. Dokter No.4'),
('DK005', 'dr. Rina Kusuma', 'THT', '081231231005', 'Jl. Dokter No.5'),
('DK006', 'dr. Yudi Pranata', 'Mata', '081231231006', 'Jl. Dokter No.6'),
('DK007', 'dr. Lilis Handayani', 'Kulit', '081231231007', 'Jl. Dokter No.7'),
('DK008', 'dr. Indra Gunawan', 'Saraf', '081231231008', 'Jl. Dokter No.8'),
('DK009', 'dr. Intan Sari', 'Jantung', '081231231009', 'Jl. Dokter No.9'),
('DK010', 'dr. Toni Wijaya', 'Bedah', '081231231010', 'Jl. Dokter No.10');

-- Insert data pada tabel perawat
INSERT INTO Perawat VALUES
('PR001', 'Susi Herlina', '081234111111', 'Jl. Nusa Indah No.1'),
('PR002', 'Andi Maulana', '081234111112', 'Jl. Nusa Indah No.2'),
('PR003', 'Rina Safitri', '081234111113', 'Jl. Nusa Indah No.3'),
('PR004', 'Budi Santoso', '081234111114', 'Jl. Nusa Indah No.4'),
('PR005', 'Tina Wulandari', '081234111115', 'Jl. Nusa Indah No.5'),
('PR006', 'Hendra Saputra', '081234111116', 'Jl. Nusa Indah No.6'),
('PR007', 'Sari Dewi', '081234111117', 'Jl. Nusa Indah No.7'),
('PR008', 'Yoga Pratama', '081234111118', 'Jl. Nusa Indah No.8'),
('PR009', 'Winda Ayu', '081234111119', 'Jl. Nusa Indah No.9'),
('PR010', 'Riko Hermawan', '081234111120', 'Jl. Nusa Indah No.10');

-- Insert data pada tabel pemeriksaan
INSERT INTO Pemeriksaan VALUES
('PM001', '2025-06-20 08:00:00', 'Demam tinggi', 'Tifus ringan', 'PS001', 'PR001', 'DK001'),
('PM002', '2025-06-20 08:15:00', 'Gigi bengkak', 'Infeksi gusi', 'PS002', 'PR002', 'DK002'),
('PM003', '2025-06-20 08:30:00', 'Batuk pilek', 'Flu biasa', 'PS003', 'PR003', 'DK003'),
('PM004', '2025-06-20 08:45:00', 'Sesak napas', 'Asma', 'PS004', 'PR004', 'DK004'),
('PM005', '2025-06-20 09:00:00', 'Sakit telinga', 'Infeksi THT', 'PS005', 'PR005', 'DK005'),
('PM006', '2025-06-20 09:15:00', 'Mata merah', 'Konjungtivitis', 'PS006', 'PR006', 'DK006'),
('PM007', '2025-06-20 09:30:00', 'Kulit gatal', 'Alergi kulit', 'PS007', 'PR007', 'DK007'),
('PM008', '2025-06-20 09:45:00', 'Sakit kepala', 'Migrain', 'PS008', 'PR008', 'DK008'),
('PM009', '2025-06-20 10:00:00', 'Nyeri dada', 'Penyakit jantung ringan', 'PS009', 'PR009', 'DK009'),
('PM010', '2025-06-20 10:15:00', 'Luka robek', 'Butuh jahitan', 'PS010', 'PR010', 'DK010');

-- Insert data pada tabel resep
INSERT INTO Resep VALUES
('RS001', 'OB001', 'Paracetamol', '10 tablet', 'PM001'),
('RS002', 'OB002', 'Amoxicillin', '15 tablet', 'PM002'),
('RS003', 'OB003', 'Obat flu', '10 tablet', 'PM003'),
('RS004', 'OB004', 'Inhaler', '1 buah', 'PM004'),
('RS005', 'OB005', 'Tetes telinga', '1 botol', 'PM005'),
('RS006', 'OB006', 'Tetes mata', '1 botol', 'PM006'),
('RS007', 'OB007', 'Salep kulit', '1 tube', 'PM007'),
('RS008', 'OB008', 'Ibuprofen', '10 tablet', 'PM008'),
('RS009', 'OB009', 'Aspirin', '10 tablet', 'PM009'),
('RS010', 'OB010', 'Antiseptik', '1 botol', 'PM010');