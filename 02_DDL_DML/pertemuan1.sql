SQL> desc mobil
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_MOBIL                                  NOT NULL CHAR(2)
 NAMA                                      NOT NULL VARCHAR2(25)
 MERK                                      NOT NULL VARCHAR2(25)
 TAHUN                                     NOT NULL NUMBER
 ID_KATEGORI                                        CHAR(5)

SQL> desc kategori_mobil
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID_KATEGORI                               NOT NULL CHAR(5)
 KATEGORI                                           VARCHAR2(60)

SQL> INSERT INTO kategori_mobil (ID_KATEGORI, KATEGORI)
  2  VALUES ('K0001', 'SUV');

1 row created.

SQL> INSERT INTO kategori_mobil (ID_KATEGORI, KATEGORI)
  2  VALUES ('K0002', 'Sedan');

1 row created.

SQL> 
SQL> INSERT INTO kategori_mobil (ID_KATEGORI, KATEGORI)
  2  VALUES ('K0003', 'Hatchback');

1 row created.

SQL> INSERT INTO kategori_mobil (ID_KATEGORI, KATEGORI)
  2  VALUES ('K0004', 'MPV');

1 row created.

SQL> SELECT * FROM kategori_mobil;

ID_KA KATEGORI                                                                  
----- ------------------------------------------------------------              
K0001 SUV                                                                       
K0002 Sedan                                                                     
K0003 Hatchback                                                                 
K0004 MPV                                                                       

SQL> INSERT INTO mobil (ID_MOBIL, NAMA, MERK, TAHUN, ID_KATEGORI)
  2  VALUES ('M1', 'Fortuner', 'Toyota', 2022, 'K0001');

1 row created.

SQL> INSERT INTO mobil (ID_MOBIL, NAMA, MERK, TAHUN, ID_KATEGORI)
  2  VALUES ('M2', 'Civic', 'Honda', 2021, 'K0002');

1 row created.

SQL> INSERT INTO mobil (ID_MOBIL, NAMA, MERK, TAHUN, ID_KATEGORI)
  2  VALUES ('M3', 'Yaris', 'Toyota', 2020, 'K0003');

1 row created.

SQL> INSERT INTO mobil (ID_MOBIL, NAMA, MERK, TAHUN, ID_KATEGORI)
  2  VALUES ('M4', 'Xpander', 'Mitsubishi', 2023, 'K0004');

1 row created.

SQL> SELECT * FROM mobil;

ID NAMA                      MERK                           TAHUN ID_KA         
-- ------------------------- ------------------------- ---------- -----         
M1 Fortuner                  Toyota                          2022 K0001         
M2 Civic                     Honda                           2021 K0002         
M3 Yaris                     Toyota                          2020 K0003         
M4 Xpander                   Mitsubishi                      2023 K0004         

SQL> UPDATE mobil
  2  SET NAMA = 'Pajero',
  3  MERK = 'Mitsubishi',
  4  TAHUN = 2023,
  5  ID_KATEGORI = 'K0001'
  6  WHERE ID_MOBIL = 'M4';

1 row updated.

SQL> DELETE FROM mobil
  2  WHERE ID_MOBIL = 'M4';

1 row deleted.

SQL> MERGE INTO mobil m
  2  USING (SELECT * FROM kategori_mobil) k
  3  ON (m.ID_KATEGORI = k.ID_KATEGORI)
  4  WHEN MATCHED THEN
  5  UPDATE SET m.NAMA = 'New Name', m.MERK = 'New Brand', m.TAHUN = 2024
  6  WHEN NOT MATCHED THEN
  7  INSERT (ID_MOBIL, NAMA, MERK, TAHUN, ID_KATEGORI)
  8  VALUES ('M5', 'New Car', 'BrandX', 2024, k.ID_KATEGORI);

4 rows merged.

SQL> CREATE VIEW MobilTahunTertentu AS
  2  SELECT ID_MOBIL, NAMA, MERK, TAHUN, ID_KATEGORI
  3  FROM mobil
  4  WHERE TAHUN = 2022;

View created.

SQL> CREATE MATERIALIZED VIEW MobilToyota AS
  2  SELECT ID_MOBIL, NAMA, MERK, TAHUN, ID_KATEGORI
  3  FROM mobil
  4  WHERE MERK = 'Toyota';

Materialized view created.

SQL> SPOOL OFF
