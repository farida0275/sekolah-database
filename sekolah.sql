create table siswa(
  id SERIAL PRIMARY KEY,
  nama VARCHAR(50) NOT NULL,
  umur INT,
  jurusan VARCHAR(50)
);

create table nilai(
  id SERIAL PRIMARY KEY,
  siswa_id INT REFERENCES siswa(id),
  mata_pelajaran VARCHAR(100),
  nilai INT
);

CREATE TABLE guru (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    mata_pelajaran VARCHAR(50)
);

CREATE TABLE kelas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_kelas VARCHAR(20)
);

INSERT INTO siswa (nama, umur, jurusan) VALUES
('Andi', 16, 'IPA'),
('Budi', 17, 'IPS'),
('Citra', 16, 'IPA'),
('Dewi', 17, 'Bahasa'),
('Eko', 16, 'IPS'),
('Galuh', 17, 'IPA');

select * from siswa;

INSERT INTO nilai (siswa_id, mata_pelajaran, nilai) VALUES
(1, 'Matematika', 85),
(1, 'Fisika', 90),
(2, 'Bahasa Inggris', 88),
(2, 'Ekonomi', 92),
(3, 'Biologi', 78),
(3, 'Kimia', 80),
(4, 'Bahasa Indonesia', 95),
(4, 'Sejarah', 89),
(5, 'Sosiologi', 84),
(5, 'Geografi', 86);

select * from nilai;

INSERT INTO guru (nama, mata_pelajaran) VALUES
('Ahmad Dani', 'Matematika'),
('Khoiri', 'Bahasa Indonesia'),
('Agus Salim', 'Sejarah'),
('Bambang', 'Geografi'),
('Yuli', 'Bahasa Inggris');

INSERT INTO kelas (nama_kelas)
VALUES 
('X IPA 1'), 
('X IPS 1'), 
('XI IPA 2');

-- ini untuk menambah kolom say
ALTER TABLE siswa ADD COLUMN kelas_id INT;

ALTER TABLE siswa
ADD CONSTRAINT fk_siswa_kelas
FOREIGN KEY (kelas_id) REFERENCES kelas(id);

UPDATE siswa SET kelas_id = 1 WHERE id = 1;
UPDATE siswa SET kelas_id = 2 WHERE id = 2;
UPDATE siswa SET kelas_id = 1 WHERE id = 3;
UPDATE siswa SET kelas_id = 3 WHERE id = 4;
UPDATE siswa SET kelas_id = 2 WHERE id = 5;

select * from siswa where jurusan = 'IPA';

SELECT siswa.nama, AVG(nilai.nilai) AS rata_nilai
FROM siswa
JOIN nilai ON siswa.id = nilai.siswa_id
GROUP BY siswa.nama;

UPDATE siswa SET jurusan = 'Matematika' WHERE nama = 'Budi';

delete from siswa where id = 6;

select * from siswa;


