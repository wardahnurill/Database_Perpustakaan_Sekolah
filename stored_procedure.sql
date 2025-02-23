create database db_perpus;
use db_perpus;

-- tabel buku
create table buku (
id_buku int primary key auto_increment,
judul_buku varchar(50),
penulis varchar(50),
kategori varchar(50),
stok int);

-- tabel siswa
create table siswa (
id_siswa int primary key auto_increment,
nama varchar(50),
kelas varchar(10));

-- tabel peminjaman
create table peminjaman(
id_peminjaman int primary key auto_increment,
id_siswa int,
id_buku int,
tanggal_pinjam date,
tanggal_kembali date,
status varchar(50));

-- insert 5 record tabel buku
insert into buku (id_buku, judul_buku, 
penulis, kategori, stok) value
(1, 'Algoritma dan Pemograman', 'Andi Wijaya', 'Teknologi', 5),
(2, 'Dasar-dasar Database', 'Budi Santoso', 'Teknologi', 7),
(3, 'Matematika Diskrit', 'Rina Sari', 'Matematika', 4),
(4, 'Sejarah Dunia', 'John Smith', 'Sejarah', 3),
(5, 'Pemograman Web dengan PHP', 'Eko Prasetyo', 'Teknologi', 8);
select * from buku;

-- insert 5 record tabel siswa
insert into siswa (nama, kelas) values
('Andi Saputra', 'X-RPL'),
('Budi Wijaya', 'X-TKJ'),
('Citra Lestari', 'XI-RPL'),
('Dewi Kurniawan', 'XI-TKJ'),
('Eko Prasetyo', 'XII-TKJ');
select * from siswa;

-- insert 5 record tabel peminjaman
insert into peminjaman (id_siswa, id_buku, tanggal_pinjam,
tanggal_kembali, status) values
(11, 2, '2025-02-01', '2025-02-08', 'Dipinjam'),
(2, 5, '2025-01-28', '2025-02-04', 'Dikembalikan'),
(3, 8, '2025-02-02', '2025-02-09', 'Dipinjam'),
(4, 10, '2025-01-30', '2025-02-06', 'Dikembalikan'),
(5, 3, '2025-01-25', '2025-02-01', 'Dikembalikan');
select * from peminjaman;

-- stored procedure INSERT (buku)
DELIMITER $$
create procedure insert_buku(
pJudul_buku varchar(50),
pPenulis varchar (50),
pKategori varchar(50), 
pStok int)
BEGIN 
insert into buku (judul_buku, penulis, kategori, 
stok) values
(pJudul_buku, pPenulis, pKategori, pStok);
END $$
DELIMITER ;
CALL insert_buku('Sistem Operasi', 'Dian Kurniawan', 'Teknologi', 6);
CALL insert_buku('Jaringan Komputer', 'Ahmad Fauzi', 'Teknologi', 5);
CALL insert_buku('Cerita Rakyat Nusantara', 'Lestari Dewi', 'Sastra', 9);
CALL insert_buku('Bahasa Inggris untuk Pemula', 'Jane Doe', 'Bahasa', 10);
CALL insert_buku('Biologi Dasar', 'Budi Rahman', 'Sains', 7);
CALL insert_buku('Kimia Organik', 'Siti Aminah', 'Sains', 5);
CALL insert_buku('Teknik Elektro', 'Ridwan Hakim', 'Teknik', 6);
CALL insert_buku('Fisika Modern', 'Albert Einstein', 'Sains', 4);
CALL insert_buku('Manajemen Waktu', 'Steven Covey', 'Pengembangan', 8);
CALL insert_buku('Strategi Belajar Efektif', 'Tony Buzan', 'Pendidikan', 6); 
select * from buku;

-- stored procedure INSERT (kelas)
DELIMITER $$
create procedure insert_siswa(
pNama varchar(50),
pKelas varchar(10))
BEGIN
insert into siswa (nama, kelas) values (pNama, pKelas);
END $$
DELIMITER ;

CALL insert_siswa('Farhan Maulana', 'XII-TKJ');
CALL insert_siswa('Gita Permata', 'X-RPL');
CALL insert_siswa('Hadi Sucipto', 'X-TKJ');
CALL insert_siswa('Intan Permadi', 'XI-RPL');
CALL insert_siswa('Joko Santoso', 'XI-TKJ');
CALL insert_siswa('Kartika Sari', 'XII-RPL');
CALL insert_siswa('Lintang Putri', 'XII-TKJ');
CALL insert_siswa('Muhammad Rizky', 'X-RPL');
CALL insert_siswa('Novi Andriana', 'X-TKJ');
CALL insert_siswa('Olivia Hernanda', 'XI-RPL');
select * from siswa;

-- stored procedure INSERT (kelas)
DELIMITER $$
create procedure insert_peminjaman(
pId_siswa int,
pId_buku int,
pTanggal_pinjam date,
pTanggal_kembali date,
pStatus varchar(50))
BEGIN 
insert into peminjaman (id_siswa, id_buku, tanggal_pinjam, tanggal_kembali, status)
values (pId_siswa, pId_buku, pTanggal_pinjam, pTanggal_kembali, pStatus);
END $$
DELIMITER ;

CALL insert_peminjaman(15, 7, '2025-02-01', '2025-02-08', 'Dipinjam');
CALL insert_peminjaman(7, 1, '2025-01-29', '2025-02-05', 'Dikembalikan');
CALL insert_peminjaman(8, 9, '2025-02-03', '2025-02-10', 'Dipinjam');
CALL insert_peminjaman(13, 4, '2025-01-27', '2025-02-03', 'Dikembalikan');
CALL insert_peminjaman(10, 11, '2025-02-01', '2025-02-08', 'Dipinjam');
select * from peminjaman;

-- stored procedure UPDATE (buku)
DELIMITER $$
create procedure update_buku(
new_id_buku int,
new_judul_buku varchar(50),
new_penulis varchar(50),
new_kategori varchar(50),
new_stok int)
BEGIN 
update buku set 
judul_buku = new_judul_buku,
penulis = new_penulis,
kategori = new_kategori,
stok = new_Stok 
where id_buku = new_id_buku;
END $$
DELIMITER ;

CALL update_buku(1, 'C# di Visual Studio', 'Wardah Nuril', 'Teknologi', 33);
select * from buku;

-- stored procedure DELETE (buku)
DELIMITER $$
create procedure delete_buku(
new_id_buku int)
BEGIN 
delete from buku where id_buku = new_id_buku;
end $$
DELIMITER ;

-- stored procedure UPDATE (siswa)
DELIMITER $$
create procedure update_siswa(
new_id_siswa int,
new_nama varchar(50),
new_kelas varchar(10))
BEGIN 
update siswa set 
nama = new_nama,
kelas = new_kelas
where id_siswa = new_id_siswa;
END $$
DELIMITER ;

-- stored procedure DELETE (siswa)
DELIMITER $$
create procedure delete_siswa(
new_id_siswa int)
BEGIN 
delete from buku where id_siswa = new_id_siswa;
end $$
DELIMITER ;

-- stored procedure UPDATE (peminjaman)
DELIMITER $$
create procedure update_peminjaman(
new_id_peminjaman int,
new_id_siswa int,
new_id_buku int,
new_tanggal_pinjam date,
new_tanggal_kembali date,
new_status varchar(50))
BEGIN 
update peminjaman set 
id_siswa = new_id_siswa,
id_buku = new_id_buku,
tanggal_pinjam = new_tanggal_pinjam,
tanggal_kembali = new_tanggal_kembali,
status = new_status
where id_peminjaman = new_id_peminjaman;
END $$
DELIMITER ;

-- stored procedure DELETE (peminjaman)
DELIMITER $$
create procedure delete_peminjaman(
new_id_peminjaman int)
BEGIN 
delete from peminjaman where id_peminjaman = new_id_peminjaman;
end $$
DELIMITER ;

-- menampilkan record di table buku
DELIMITER $$ 
create procedure all_buku()
BEGIN
select * from buku;
END $$
DELIMITER ;
CALL all_buku()

-- menampilkan record di table siswa
DELIMITER $$ 
create procedure all_siswa()
BEGIN
select * from siswa;
END $$
DELIMITER ;
CALL all_siswa()

-- menampilkan record di table peminjaman
DELIMITER $$ 
create procedure all_peminjaman()
BEGIN
select * from peminjaman;
END $$
DELIMITER ;
CALL all_peminjaman()

-- stok buku saat dipinjam berkurang
DELIMITER $$
create trigger stok_berkurang
before insert on peminjaman
for each row
BEGIN 
update buku set stok = stok - 1 where id_buku = NEW.id_buku;
END $$
DELIMITER ;

-- stok buku saat dikembalikan bertambah
DELIMITER $$
create trigger stok_bertambah
before insert on peminjaman
for each row
BEGIN 
if NEW.status = 'Dikembalikan' THEN 
update buku set stok = stok + 1
where id_buku = NEW.id_buku;
end if;
END $$
DELIMITER ;

-- stored procedure (CURRENT DATE)
DELIMITER $$
create procedure balikin_buku(
IN id_pinjam int)
BEGIN 
update peminjaman
set status = 'Dikembalikan',
tanggal_kembali = current_date where id_peminjaman = id_pinjam;
END $$
DELIMITER ;

-- stored procedure siswa yang pernah pinjem buku
DELIMITER $$
create procedure siswa_yang_pernah_pinjam_buku()
BEGIN
SELECT s.nama, s.kelas, p.status
from peminjaman p
inner join siswa s
on p.id_siswa = s.id_siswa;
END $$
DELIMITER ;

CALL siswa_yang_pernah_pinjam_buku()

-- stored procedur no 11
DELIMITER $$
create procedure daftar_semua_siswa()
BEGIN
select s.nama, s.kelas 
from siswa s
left join peminjaman p
on s.id_siswa = p.id_siswa
order by s.nama asc;
END $$
DELIMITER ;

-- soal no 12
DELIMITER $$
create procedure daftar_semua_buku()
BEGIN
select b.judul_buku
from buku b
left join peminjaman p
on b.id_buku = p.id_buku;
END $$
DELIMITER ;
