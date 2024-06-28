-- CREATE TABLE detail (
--    id_seminar INT(3) NOT NULL,
--    nip VARCHAR(20) NOT NULL,
--    nim VARCHAR(11) NOT NULL,
--    id_kategori VARCHAR(3) NOT NULL,
--    id_status VARCHAR(3) NOT NULL
-- );

ALTER TABLE detail
ADD CONSTRAINT detail_pk PRIMARY KEY (id_seminar, nip, id_kategori, id_status, nim);

CREATE TABLE dosen (
   nip VARCHAR(20) NOT NULL,
   nama VARCHAR(50) NOT NULL
);

ALTER TABLE dosen ADD CONSTRAINT dosen_pk PRIMARY KEY (nip);

CREATE TABLE kategori (
   id VARCHAR(3) NOT NULL,
   jenis VARCHAR(2) NOT NULL,
   id_status VARCHAR(3) NOT NULL
);

ALTER TABLE kategori ADD CONSTRAINT kategori_pk PRIMARY KEY (id, id_status);

CREATE TABLE kriteria (
   id VARCHAR(5) NOT NULL,
   id_kategori VARCHAR(3) NOT NULL,
   id_status VARCHAR(3) NOT NULL
);

ALTER TABLE kriteria
ADD CONSTRAINT kriteria_pk PRIMARY KEY (id, id_kategori, id_status);

CREATE TABLE mahasiswa (
   nim VARCHAR(11) NOT NULL,
   nama VARCHAR(50) NOT NULL
);

ALTER TABLE mahasiswa ADD CONSTRAINT mahasiswa_pk PRIMARY KEY (nim);

CREATE TABLE penilaian (
   nilai INT(3) NOT NULL,
   nim VARCHAR(11) NOT NULL,
   nip VARCHAR(20) NOT NULL,
   id_kriteria VARCHAR(5) NOT NULL,
   id_kategori VARCHAR(3) NOT NULL,
   id_status VARCHAR(3) NOT NULL
);

ALTER TABLE penilaian
ADD CONSTRAINT penilaian_pk PRIMARY KEY (nim, nip, id_kriteria, id_kategori, id_status);

CREATE TABLE seminar (
   id INT(3) NOT NULL,
   judul VARCHAR(100) NOT NULL,
   tempat VARCHAR(20) NOT NULL,
   tanggal DATE NOT NULL
);

ALTER TABLE seminar ADD CONSTRAINT seminar_pk PRIMARY KEY (id);

CREATE TABLE status (
   id VARCHAR(3) NOT NULL,
   jenis VARCHAR(10) NOT NULL
);

ALTER TABLE status ADD CONSTRAINT status_pk PRIMARY KEY (id);

ALTER TABLE detail
ADD CONSTRAINT detail_dosen_fk FOREIGN KEY (nip)
REFERENCES dosen (nip);

ALTER TABLE detail
ADD CONSTRAINT detail_kategori_fk FOREIGN KEY (id_kategori, id_status)
REFERENCES kategori (id, id_status);

ALTER TABLE detail
ADD CONSTRAINT detail_mahasiswa_fk FOREIGN KEY (nim)
REFERENCES mahasiswa (nim);

ALTER TABLE detail
ADD CONSTRAINT detail_seminar_fk FOREIGN KEY (id_seminar)
REFERENCES seminar (id);

ALTER TABLE kategori
ADD CONSTRAINT kategori_status_fk FOREIGN KEY (id_status)
REFERENCES status (id);

ALTER TABLE kriteria
ADD CONSTRAINT kriteria_kategori_fk FOREIGN KEY (id_kategori, id_status)
REFERENCES kategori (id, id_status);

ALTER TABLE penilaian
ADD CONSTRAINT penilaian_dosen_fk FOREIGN KEY (nip)
REFERENCES dosen (nip);

ALTER TABLE penilaian
ADD CONSTRAINT penilaian_kriteria_fk FOREIGN KEY (id_kriteria, id_kategori, id_status)
REFERENCES kriteria (id, id_kategori, id_status);

ALTER TABLE penilaian
ADD CONSTRAINT penilaian_mahasiswa_fk FOREIGN KEY (nim)
REFERENCES mahasiswa (nim);