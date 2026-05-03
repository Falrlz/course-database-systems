-- Membuat DB
CREATE DATABASE pendaftaran_klinik;

-- Menggunakan DB
USE pendaftaran_klinik;

-- Membuat tabel pasien
CREATE TABLE Pasien (
    id_pasien CHAR(6) PRIMARY KEY,
    ktp CHAR(16),
    nama_pasien VARCHAR(50),
    tanggal_lahir DATE,
    jenis_kelamin ENUM('L', 'P'),
    telepon VARCHAR(15),
    alamat TEXT
);

-- Membuat tabel pegawai
CREATE TABLE Pegawai (
    id_pegawai CHAR(6) PRIMARY KEY,
    nama_pegawai VARCHAR(50),
    status_pegawai VARCHAR(25),
    telepon VARCHAR(15),
    alamat TEXT
);

-- Membuat tabel poli
CREATE TABLE Poli (
    id_poli CHAR(6) PRIMARY KEY,
    nama_poli VARCHAR(25)
);

-- Membuat tabel dokter
CREATE TABLE Dokter (
    id_dokter CHAR(6) PRIMARY KEY,
    nama_dokter VARCHAR(50),
    spesialisasi VARCHAR(20),
    telepon VARCHAR(15),
    alamat TEXT,
    poli_id_poli CHAR(6),
    FOREIGN KEY (poli_id_poli) REFERENCES Poli(id_poli)
);

-- Membuat tabel pendaftaran
CREATE TABLE Pendaftaran (
    id_pendaftaran CHAR(6) PRIMARY KEY,
    no_antrian SMALLINT,
    tanggal DATETIME,
    poli_id_poli CHAR(6),
    Pegawai_id_pegawai CHAR(6),
    Pasien_id_pasien CHAR(6),
    FOREIGN KEY (poli_id_poli) REFERENCES Poli(id_poli),
    FOREIGN KEY (Pegawai_id_pegawai) REFERENCES Pegawai(id_pegawai),
    FOREIGN KEY (Pasien_id_pasien) REFERENCES Pasien(id_pasien)
);

-- Insert data pada tabel poli
INSERT INTO Poli VALUES 
('PL001', 'Umum'),
('PL002', 'Gigi'),
('PL003', 'Anak'),
('PL004', 'Penyakit Dalam'),
('PL005', 'THT'),
('PL006', 'Mata'),
('PL007', 'Kulit'),
('PL008', 'Saraf'),
('PL009', 'Jantung'),
('PL010', 'Bedah');

-- Insert data pada tabel pasien
INSERT INTO Pasien VALUES 
('PS001', '1234567890123456', 'Budi Santoso', '1990-01-01', 'L', '081234567890', 'Jl. Merpati No.1'),
('PS002', '1234567890123457', 'Siti Aminah', '1985-02-02', 'P', '081234567891', 'Jl. Kenari No.2'),
('PS003', '1234567890123458', 'Ahmad Fauzi', '2000-03-03', 'L', '081234567892', 'Jl. Elang No.3'),
('PS004', '1234567890123459', 'Dina Rahma', '1992-04-04', 'P', '081234567893', 'Jl. Garuda No.4'),
('PS005', '1234567890123460', 'Rudi Hartono', '1975-05-05', 'L', '081234567894', 'Jl. Rajawali No.5'),
('PS006', '1234567890123461', 'Nina Kurnia', '1995-06-06', 'P', '081234567895', 'Jl. Cendrawasih No.6'),
('PS007', '1234567890123462', 'Andi Wijaya', '1988-07-07', 'L', '081234567896', 'Jl. Kutilang No.7'),
('PS008', '1234567890123463', 'Lina Marlina', '1993-08-08', 'P', '081234567897', 'Jl. Pipit No.8'),
('PS009', '1234567890123464', 'Bayu Saputra', '2001-09-09', 'L', '081234567898', 'Jl. Beo No.9'),
('PS010', '1234567890123465', 'Rina Kusuma', '1999-10-10', 'P', '081234567899', 'Jl. Jalak No.10');

-- Insert data pada tabel pegawai
INSERT INTO Pegawai VALUES 
('PG001', 'Ani Suryani', 'Admin', '081234560001', 'Jl. Mawar No.1'),
('PG002', 'Dedi Firmansyah', 'Kasir', '081234560002', 'Jl. Melati No.2'),
('PG003', 'Rina Sari', 'Admin', '081234560003', 'Jl. Kamboja No.3'),
('PG004', 'Bambang Yulianto', 'Kasir', '081234560004', 'Jl. Anggrek No.4'),
('PG005', 'Tina Agustin', 'Admin', '081234560005', 'Jl. Dahlia No.5'),
('PG006', 'Hendra Saputra', 'Kasir', '081234560006', 'Jl. Teratai No.6'),
('PG007', 'Sari Dewi', 'Admin', '081234560007', 'Jl. Kenanga No.7'),
('PG008', 'Yoga Pratama', 'Kasir', '081234560008', 'Jl. Bougenville No.8'),
('PG009', 'Winda Ayu', 'Admin', '081234560009', 'Jl. Flamboyan No.9'),
('PG010', 'Riko Hermawan', 'Kasir', '081234560010', 'Jl. Angsana No.10');

-- Insert data pada tabel dokter
INSERT INTO Dokter VALUES 
('DK001', 'dr. Andi Prasetyo', 'Umum', '081231231001', 'Jl. Dokter No.1', 'PL001'),
('DK002', 'drg. Susi Melani', 'Gigi', '081231231002', 'Jl. Dokter No.2', 'PL002'),
('DK003', 'dr. Dini Ayu', 'Anak', '081231231003', 'Jl. Dokter No.3', 'PL003'),
('DK004', 'dr. Rudi Hidayat', 'Dalam', '081231231004', 'Jl. Dokter No.4', 'PL004'),
('DK005', 'dr. Rina Kusuma', 'THT', '081231231005', 'Jl. Dokter No.5', 'PL005'),
('DK006', 'dr. Yudi Pranata', 'Mata', '081231231006', 'Jl. Dokter No.6', 'PL006'),
('DK007', 'dr. Lilis Handayani', 'Kulit', '081231231007', 'Jl. Dokter No.7', 'PL007'),
('DK008', 'dr. Indra Gunawan', 'Saraf', '081231231008', 'Jl. Dokter No.8', 'PL008'),
('DK009', 'dr. Intan Sari', 'Jantung', '081231231009', 'Jl. Dokter No.9', 'PL009'),
('DK010', 'dr. Toni Wijaya', 'Bedah', '081231231010', 'Jl. Dokter No.10', 'PL010');

-- Insert data pada tabel pendaftaran
INSERT INTO Pendaftaran VALUES 
('PN001', 1, '2025-06-20 08:00:00', 'PL001', 'PG001', 'PS001'),
('PN002', 2, '2025-06-20 08:15:00', 'PL002', 'PG002', 'PS002'),
('PN003', 3, '2025-06-20 08:30:00', 'PL003', 'PG003', 'PS003'),
('PN004', 4, '2025-06-20 08:45:00', 'PL004', 'PG004', 'PS004'),
('PN005', 5, '2025-06-20 09:00:00', 'PL005', 'PG005', 'PS005'),
('PN006', 6, '2025-06-20 09:15:00', 'PL006', 'PG006', 'PS006'),
('PN007', 7, '2025-06-20 09:30:00', 'PL007', 'PG007', 'PS007'),
('PN008', 8, '2025-06-20 09:45:00', 'PL008', 'PG008', 'PS008'),
('PN009', 9, '2025-06-20 10:00:00', 'PL009', 'PG009', 'PS009'),
('PN010', 10, '2025-06-20 10:15:00', 'PL010', 'PG010', 'PS010');