prompt "Tworzenie tabel";
CREATE TABLE kategorie (
    idkategorii   NUMBER(7) NOT NULL,
    nazwa         VARCHAR2(40) NOT NULL
);

ALTER TABLE kategorie ADD CONSTRAINT kategorie_pk PRIMARY KEY ( idkategorii );

CREATE TABLE klienci (
    idklienta      NUMBER(7) NOT NULL,
    imie           VARCHAR2(20),
    nazwisko       VARCHAR2(40),
    adres          VARCHAR2(50),
    rokurodzenia   DATE,
    plec           VARCHAR2(1)
);

ALTER TABLE klienci ADD CONSTRAINT klienci_pk PRIMARY KEY ( idklienta );

CREATE TABLE pracownicy (
    idpracownika       NUMBER(7) NOT NULL,
    imie               VARCHAR2(20) NOT NULL,
    nazwisko           VARCHAR2(40) NOT NULL,
    rokurodzenia       DATE NOT NULL,
    datazatrudnienia   DATE NOT NULL,
    idstanowiska       NUMBER(7) NOT NULL
);

ALTER TABLE pracownicy ADD CONSTRAINT pracownicy_pk PRIMARY KEY ( idpracownika );

CREATE TABLE produkty (
    idproduktu    NUMBER(7) NOT NULL,
    nazwa         VARCHAR2(100) NOT NULL,
    cena          NUMBER(7,2) NOT NULL,
	cenahurtowa   NUMBER(7,2) NOT NULL,
    idkategorii   NUMBER(7) NOT NULL
);

ALTER TABLE produkty ADD CONSTRAINT produkty_pk PRIMARY KEY ( idproduktu );

CREATE TABLE rachunek_poz (
    ilosc         NUMBER(6) NOT NULL,
    cenapozycji   NUMBER(7) NOT NULL,
    idrachunku    NUMBER(7) NOT NULL,
    idproduktu    NUMBER(7) NOT NULL
);

CREATE TABLE rachunki (
    idrachunku      NUMBER(7) NOT NULL,
    datazakupu      DATE NOT NULL,
    idklienta       NUMBER(7) NOT NULL,
    idpracownika    NUMBER(7) NOT NULL,
    czytransport    VARCHAR2(1) NOT NULL,
    cenacalkowita   NUMBER(7)
);

ALTER TABLE rachunki ADD CONSTRAINT rachunki_pk PRIMARY KEY ( idrachunku );

CREATE TABLE stanowiska (
    idstanowiska   NUMBER(7) NOT NULL,
    nazwa          VARCHAR2(40) NOT NULL,
    pensja         NUMBER(7,2) NOT NULL
);

ALTER TABLE stanowiska ADD CONSTRAINT stanowiska_pk PRIMARY KEY ( idstanowiska );

CREATE TABLE transport (
    idtransport    NUMBER(7) NOT NULL,
    cena           NUMBER(7,2),
    adres          VARCHAR2(50) NOT NULL,
    datadostawy    DATE,
    idrachunku     NUMBER(7) NOT NULL,
    idpracownika   NUMBER(7) NOT NULL
);

ALTER TABLE transport ADD CONSTRAINT transport_pk PRIMARY KEY ( idtransport );

ALTER TABLE pracownicy ADD CONSTRAINT pracownicy_stanowiska_fk FOREIGN KEY ( idstanowiska )
    REFERENCES stanowiska ( idstanowiska );

ALTER TABLE produkty ADD CONSTRAINT produkty_kategorie_fk FOREIGN KEY ( idkategorii )
    REFERENCES kategorie ( idkategorii );

ALTER TABLE rachunek_poz ADD CONSTRAINT rachunek_poz_produkty_fk FOREIGN KEY ( idproduktu )
    REFERENCES produkty ( idproduktu );

ALTER TABLE rachunek_poz ADD CONSTRAINT rachunek_poz_rachunki_fk FOREIGN KEY ( idrachunku )
    REFERENCES rachunki ( idrachunku );

ALTER TABLE rachunki ADD CONSTRAINT rachunki_klienci_fk FOREIGN KEY ( idklienta )
    REFERENCES klienci ( idklienta );

ALTER TABLE rachunki ADD CONSTRAINT rachunki_pracownicy_fk FOREIGN KEY ( idpracownika )
    REFERENCES pracownicy ( idpracownika );

ALTER TABLE transport ADD CONSTRAINT transport_pracownicy_fk FOREIGN KEY ( idpracownika )
    REFERENCES pracownicy ( idpracownika );

ALTER TABLE transport ADD CONSTRAINT transport_rachunki_fk FOREIGN KEY ( idrachunku )
    REFERENCES rachunki ( idrachunku );
	
	
	
	
	
prompt "Dodawanie danych do tabel";
Insert into KATEGORIE (IDKATEGORII,NAZWA) values ('1','Buty rowerowe');
Insert into KATEGORIE (IDKATEGORII,NAZWA) values ('2','Akcesoria');
Insert into KATEGORIE (IDKATEGORII,NAZWA) values ('3','Kaski i ochraniacze');
Insert into KATEGORIE (IDKATEGORII,NAZWA) values ('4','Narzedzia');
Insert into KATEGORIE (IDKATEGORII,NAZWA) values ('5','Odziez');
Insert into KATEGORIE (IDKATEGORII,NAZWA) values ('6','Odzywki');
Insert into KATEGORIE (IDKATEGORII,NAZWA) values ('7','Ramy rowerowe');
Insert into KATEGORIE (IDKATEGORII,NAZWA) values ('8','Rowery');
Insert into STANOWISKA (IDSTANOWISKA,NAZWA,PENSJA) values ('1','Kierownik','3700');
Insert into STANOWISKA (IDSTANOWISKA,NAZWA,PENSJA) values ('2','Sprzedawca','2000');
Insert into STANOWISKA (IDSTANOWISKA,NAZWA,PENSJA) values ('3','Kurier','2500');
Insert into STANOWISKA (IDSTANOWISKA,NAZWA,PENSJA) values ('4','Ksiegowy','2500');
Insert into PRACOWNICY (IDPRACOWNIKA,IMIE,NAZWISKO,ROKURODZENIA,DATAZATRUDNIENIA,IDSTANOWISKA) values ('5','Karolina','Wolna',to_date('97/11/13','RR/MM/DD'),to_date('15/08/31','RR/MM/DD'),'4');
Insert into PRACOWNICY (IDPRACOWNIKA,IMIE,NAZWISKO,ROKURODZENIA,DATAZATRUDNIENIA,IDSTANOWISKA) values ('1','Jaroslaw','Kowalski',to_date('89/08/27','RR/MM/DD'),to_date('14/04/18','RR/MM/DD'),'2');
Insert into PRACOWNICY (IDPRACOWNIKA,IMIE,NAZWISKO,ROKURODZENIA,DATAZATRUDNIENIA,IDSTANOWISKA) values ('2','Jan','Apacki',to_date('92/05/23','RR/MM/DD'),to_date('16/10/04','RR/MM/DD'),'2');
Insert into PRACOWNICY (IDPRACOWNIKA,IMIE,NAZWISKO,ROKURODZENIA,DATAZATRUDNIENIA,IDSTANOWISKA) values ('3','Pawel','Skrzypkowski',to_date('95/06/01','RR/MM/DD'),to_date('14/04/18','RR/MM/DD'),'1');
Insert into PRACOWNICY (IDPRACOWNIKA,IMIE,NAZWISKO,ROKURODZENIA,DATAZATRUDNIENIA,IDSTANOWISKA) values ('4','Wojciech','Gêbocki',to_date('75/12/19','RR/MM/DD'),to_date('15/08/31','RR/MM/DD'),'3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('1','Buty SPD SH-M089','339,39','300','1');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('2','Buty SH-RP2','293','270','1');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('3','Buty SH-XC51','400,9','350','1');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('4','Buty MTB Cape ¿ó³to-czarne','699,99','610','1');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('5','Buty SPD SH-MT34','228','205','1');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('6','GPS rowerowy Edge Touring Plus + mapa Polski TOPO','1050','900','2');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('7','Zegarek Forerunner 920 XT','1482','1350','2');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('8','Baga¿nik samochodowy na hak Como 3','1100','990','2');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('9','Licznik bezprzewodowy KRC 315W czarny','76,99','69','2');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('10','Wieszak Endo','199','179','2');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('11','Kask Slant czarny mat','134,9','115','3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('12','Kask dzieciêcy MV5-2','25,9','19','3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('13','Kask MB-01','99,99','88','3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('14','Kask MB-03','110','99','3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('15','Kask Mirage','67,9','55','3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('16','Preparat WD-40 aerozol 250ml','13','9,90','4');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('17','Stojak monta¿. PRS-25 sk³adany','1399','1250','4');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('18','Œrodek do czyszcznia ³añcucha Drivetrain Cleaner 500ml','64','57','4');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('19','Stojak monta¿owy Biketrim','329,99','289','4');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('20','Preparat ochronny Bike Spray','35','29','4');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('21','Bluza mêska Thermo','134,9','120','5');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('22','Skarpetki termoaktywne WARM','40','33','5');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('23','Spodenki d³ugie Fobello','200','188','5');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('24','Bluza damska Extreme Wool','210','195','5');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('25','Rêkawiczki Road Windstopper Thermo Split','270','245','5');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('26','Organiczny ¿el energetyczny','6,9','5','6');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('27','Krem Chamois zapobiegaj¹cy obtarciom 125ml','55','46','6');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('28','Koncentrat napoju Isotonic Sports Drink','55','48','6');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('29','Rozgrzewaj¹cy ¿el SOS','67','58','6');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('30','Gumy energetyczne 50g','10','8','6');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('31','Rama Volt','499','410','7');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('32','Rama damska Mitori','369','301','7');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('33','Rama Acid 27,5 niebiesko-czerwona','629','529','7');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('34','Rama Aim Pro 29','825','710','7');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('35','Rama Vision 29','1150','999','7');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('36','Rower Rambler Kid 20"','719,99','630','8');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('37','Rower EVADO 3.0 Dama','1499,99','1200','8');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('38','Kellys Rower Phanatic 90','5499,9','4100','8');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('39','Kellys Rower Phutura 10','2500','1999','8');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('40','Rower Wasper','559,36','499','8');

Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('262','Mikolaj','Samos','ul. Sloneczna 11 Katowice',to_date('62/06/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('263','Franciszek','Konsat','ul. Ogrodowa 15 Katowice',to_date('71/05/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('264','Filip','Goniec','ul. Krotka 89 Poznan',to_date('89/10/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('265','Antoni','Obloch','ul. Kwiatowa 103 Gdansk',to_date('78/07/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('266','Franciszek','Samos','ul. Brzozowa 147 Krakow',to_date('63/09/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('267','Kacper','Alerw','ul. Lesna 87 Wroclaw',to_date('89/11/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('268','Kacper','Kaszuba','ul. Lesna 119 Bialystok',to_date('86/07/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('269','Kacper','Goniec','ul. Kwiatowa 95 Katowice',to_date('71/03/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('270','Kacper','Obloch','ul. Krotka 44 Wroclaw',to_date('95/10/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('271','Kacper','Lojek','ul. Krotka 22 Katowice',to_date('84/11/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('272','Franciszek','Samos','ul. Szkolna 24 Olsztyn',to_date('68/09/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('273','Antoni','Obloch','ul. Brzozowa 43 Poznan',to_date('74/12/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('274','Franciszek','Goniec','ul. Polna 71 Krakow',to_date('74/10/12','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('275','Wojciech','Goniec','Suska108 Warszawa',to_date('90/03/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('276','Wojciech','Obloch','ul. Krotka 3 Gdansk',to_date('64/02/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('277','Franciszek','Zloto','ul. Brzozowa 3 Warszawa',to_date('76/01/31','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('278','Jan','Goniec','ul. Lipowa 110 Gdansk',to_date('64/11/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('279','Kacper','Lojek','ul. Szkolna 67 Olsztyn',to_date('86/10/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('280','Antoni','Konsat','ul. Lesna 137 Bialystok',to_date('84/04/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('281','Aleksander','Kaszuba','ul. Lesna 69 Katowice',to_date('70/07/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('282','Jan','Kaszuba','ul. Polna 142 Wroclaw',to_date('76/08/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('283','Franciszek','Goniec','ul. Szkolna 2 Krakow',to_date('79/08/05','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('284','Jan','Konsat','ul. Lipowa 52 Rzeszow',to_date('77/05/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('285','Mikolaj','Konsat','ul. Brzozowa 146 Krakow',to_date('64/01/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('286','Aleksander','Goniec','Suska66 Poznan',to_date('83/01/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('287','Mikolaj','Lojek','ul. Kwiatowa 100 Gdansk',to_date('80/10/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('288','Kacper','Kaszuba','ul. Krotka 106 Gdansk',to_date('89/06/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('289','Aleksander','Konsat','ul. Szkolna 20 Warszawa',to_date('81/09/17','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('290','Filip','Alerw','ul. Krotka 124 Katowice',to_date('72/06/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('291','Kacper','Konsat','ul. Sloneczna 77 Krakow',to_date('75/07/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('292','Antoni','Samos','ul. Szkolna 73 Wroclaw',to_date('64/08/05','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('293','Jan','Kondrat','ul. Polna 141 Krakow',to_date('95/12/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('294','Szymon','Kondrat','ul. Lesna 17 Krakow',to_date('72/08/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('295','Filip','Alerw','ul. Ogrodowa 81 Gdansk',to_date('85/04/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('296','Wojciech','Zloto','ul. Lipowa 64 Rzeszow',to_date('95/04/06','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('297','Wojciech','Suska','ul. Ogrodowa 18 Krakow',to_date('84/07/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('298','Wojciech','Konsat','ul. Polna 63 Wroclaw',to_date('94/01/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('299','Wojciech','Zloto','ul. Lipowa 70 Olsztyn',to_date('74/02/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('300','Mikolaj','Kondrat','ul. Szkolna 78 Poznan',to_date('91/10/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('301','Mikolaj','Zloto','ul. Lipowa 13 Elk',to_date('81/10/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('302','Mikolaj','Kondrat','ul. Kwiatowa 145 Bialystok',to_date('76/07/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('303','Antoni','Kondrat','ul. Krotka 107 Krakow',to_date('69/04/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('304','Wojciech','Konsat','ul. Szkolna 9 Warszawa',to_date('75/11/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('305','Szymon','Alerw','ul. Lipowa 43 Katowice',to_date('72/04/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('306','Kacper','Suska','ul. Krotka 43 Gdansk',to_date('70/02/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('307','Wojciech','Alerw','ul. Kwiatowa 59 Wroclaw',to_date('68/08/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('308','Franciszek','Alerw','ul. Krotka 56 Olsztyn',to_date('94/11/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('309','Kacper','Alerw','ul. Sloneczna 51 Poznan',to_date('92/07/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('310','Franciszek','Obloch','ul. Lipowa 105 Gdansk',to_date('78/07/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('311','Jan','Lojek','ul. Krotka 22 Katowice',to_date('91/11/17','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('312','Jan','Kondrat','ul. Szkolna 38 Poznan',to_date('64/06/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('313','Franciszek','Kondrat','ul. Krotka 16 Poznan',to_date('88/06/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('314','Filip','Zloto','ul. Szkolna 130 Rzeszow',to_date('94/01/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('315','Szymon','Samos','Suska20 Wroclaw',to_date('76/09/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('316','Franciszek','Kondrat','ul. Krotka 25 Warszawa',to_date('94/12/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('317','Mikolaj','Konsat','ul. Brzozowa 130 Katowice',to_date('80/06/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('318','Aleksander','Suska','ul. Brzozowa 56 Warszawa',to_date('88/12/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('319','Aleksander','Konsat','Suska114 Poznan',to_date('97/05/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('320','Aleksander','Goniec','ul. Lipowa 56 Wroclaw',to_date('73/06/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('321','Jan','Zloto','Suska36 Krakow',to_date('92/09/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('322','Jan','Suska','ul. Lipowa 59 Gdansk',to_date('63/10/12','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('323','Filip','Obloch','ul. Sloneczna 34 Olsztyn',to_date('70/08/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('324','Kacper','Suska','ul. Ogrodowa 94 Poznan',to_date('97/10/17','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('325','Franciszek','Obloch','ul. Brzozowa 142 Katowice',to_date('92/10/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('326','Antoni','Lojek','ul. Szkolna 136 Gdansk',to_date('78/06/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('327','Szymon','Goniec','ul. Szkolna 2 Wroclaw',to_date('86/08/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('328','Szymon','Zloto','ul. Kwiatowa 93 Bialystok',to_date('78/08/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('329','Szymon','Alerw','ul. Kwiatowa 108 Warszawa',to_date('70/02/03','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('330','Mikolaj','Zloto','ul. Krotka 102 Olsztyn',to_date('70/11/10','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('331','Filip','Kaszuba','ul. Sloneczna 56 Poznan',to_date('66/02/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('332','Szymon','Zloto','ul. Krotka 112 Warszawa',to_date('90/03/31','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('333','Szymon','Kaszuba','ul. Lesna 22 Krakow',to_date('83/04/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('334','Franciszek','Lojek','ul. Lesna 48 Poznan',to_date('74/07/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('335','Kacper','Alerw','ul. Brzozowa 109 Olsztyn',to_date('67/07/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('336','Szymon','Kaszuba','ul. Polna 98 Gdansk',to_date('74/11/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('337','Szymon','Alerw','Suska136 Olsztyn',to_date('80/07/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('338','Mikolaj','Obloch','ul. Ogrodowa 44 Gdansk',to_date('78/06/06','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('339','Filip','Obloch','ul. Krotka 57 Krakow',to_date('63/02/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('340','Franciszek','Kaszuba','ul. Polna 49 Olsztyn',to_date('72/09/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('341','Franciszek','Kaszuba','ul. Polna 129 Bialystok',to_date('87/08/05','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('342','Aleksander','Kaszuba','ul. Polna 139 Elk',to_date('92/10/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('343','Wojciech','Lojek','ul. Polna 68 Gdansk',to_date('76/04/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('344','Filip','Kondrat','ul. Polna 101 Krakow',to_date('81/11/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('345','Aleksander','Kaszuba','ul. Lesna 54 Bialystok',to_date('78/01/03','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('346','Antoni','Kondrat','ul. Lesna 6 Wroclaw',to_date('76/01/31','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('347','Jakub','Kaszuba','ul. Szkolna 138 Wroclaw',to_date('73/10/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('348','Filip','Konsat','ul. Lesna 38 Rzeszow',to_date('63/10/19','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('349','Szymon','Zloto','ul. Krotka 86 Bialystok',to_date('94/02/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('350','Szymon','Alerw','ul. Lesna 148 Wroclaw',to_date('64/04/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('351','Jan','Konsat','ul. Krotka 41 Bialystok',to_date('68/03/05','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('352','Jakub','Alerw','ul. Lesna 48 Gdansk',to_date('93/07/05','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('353','Kacper','Alerw','ul. Brzozowa 23 Warszawa',to_date('89/09/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('354','Szymon','Lojek','ul. Ogrodowa 94 Poznan',to_date('71/07/01','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('355','Szymon','Lojek','ul. Lipowa 108 Gdansk',to_date('88/05/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('356','Jan','Zloto','Suska140 Katowice',to_date('96/01/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('357','Mikolaj','Kaszuba','ul. Krotka 70 Gdansk',to_date('68/07/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('358','Aleksander','Zloto','ul. Lipowa 36 Wroclaw',to_date('82/06/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('359','Filip','Lojek','ul. Szkolna 113 Gdansk',to_date('70/10/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('360','Franciszek','Konsat','ul. Sloneczna 108 Krakow',to_date('69/02/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('364','Szymon','Samos','ul. Ogrodowa 128 Katowice',to_date('67/06/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('365','Szymon','Goniec','ul. Szkolna 130 Elk',to_date('94/05/03','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('366','Jan','Lojek','ul. Brzozowa 103 Katowice',to_date('79/11/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('367','Jan','Goniec','ul. Krotka 13 Olsztyn',to_date('68/11/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('368','Antoni','Zloto','ul. Brzozowa 29 Gdansk',to_date('66/06/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('369','Aleksander','Kaszuba','Suska144 Poznan',to_date('79/10/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('373','Aleksander','Zloto','ul. Lesna 39 Rzeszow',to_date('97/09/06','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('374','Szymon','Obloch','ul. Szkolna 73 Gdansk',to_date('91/01/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('375','Szymon','Kondrat','ul. Brzozowa 137 Bialystok',to_date('94/07/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('379','Filip','Lojek','ul. Brzozowa 76 Gdansk',to_date('84/12/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('380','Kacper','Alerw','ul. Sloneczna 58 Rzeszow',to_date('75/04/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('381','Aleksander','Kondrat','ul. Brzozowa 9 Warszawa',to_date('67/05/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('361','Jan','Obloch','ul. Lipowa 25 Bialystok',to_date('62/10/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('362','Wojciech','Lojek','ul. Szkolna 42 Gdansk',to_date('85/01/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('363','Jan','Lojek','ul. Polna 86 Krakow',to_date('89/09/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('370','Aleksander','Konsat','ul. Ogrodowa 131 Krakow',to_date('92/04/01','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('371','Antoni','Goniec','ul. Ogrodowa 15 Elk',to_date('75/10/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('372','Mikolaj','Kondrat','ul. Polna 53 Katowice',to_date('90/11/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('376','Franciszek','Konsat','ul. Ogrodowa 111 Bialystok',to_date('87/11/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('377','Filip','Alerw','Suska52 Bialystok',to_date('80/06/06','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('378','Mikolaj','Obloch','ul. Sloneczna 59 Bialystok',to_date('88/11/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('382','Franciszek','Kondrat','ul. Kwiatowa 48 Bialystok',to_date('62/11/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('383','Kacper','Kondrat','ul. Lipowa 33 Olsztyn',to_date('96/05/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('384','Mikolaj','Zloto','ul. Sloneczna 102 Bialystok',to_date('81/01/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('385','Szymon','Alerw','ul. Sloneczna 129 Katowice',to_date('67/09/05','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('386','Filip','Konsat','ul. Krotka 19 Olsztyn',to_date('79/01/03','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('387','Szymon','Alerw','ul. Krotka 57 Wroclaw',to_date('75/07/01','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('2','Jakub','Obloch','ul. Kwiatowa 64 Poznan',to_date('88/09/19','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('3','Jan','Alerw','ul. Sloneczna 125 Olsztyn',to_date('79/10/17','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('4','Antoni','Zloto','ul. Ogrodowa 79 Olsztyn',to_date('76/04/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('5','Wojciech','Goniec','ul. Lipowa 94 Katowice',to_date('94/07/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('6','Aleksander','Goniec','ul. Sloneczna 134 Krakow',to_date('66/06/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('7','Wojciech','Goniec','ul. Kwiatowa 142 Krakow',to_date('76/06/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('8','Aleksander','Zloto','ul. Krotka 45 Bialystok',to_date('95/02/03','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('9','Antoni','Alerw','ul. Polna 103 Wroclaw',to_date('73/08/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('10','Jan','Zloto','ul. Brzozowa 102 Poznan',to_date('70/03/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('11','Aleksander','Konsat','ul. Lipowa 26 Bialystok',to_date('69/06/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('12','Szymon','Alerw','ul. Sloneczna 114 Bialystok',to_date('81/11/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('13','Szymon','Alerw','ul. Brzozowa 16 Rzeszow',to_date('90/04/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('14','Szymon','Kondrat','ul. Brzozowa 102 Katowice',to_date('71/10/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('15','Kacper','Zloto','ul. Krotka 23 Gdansk',to_date('64/07/10','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('16','Kacper','Samos','ul. Lipowa 143 Krakow',to_date('62/08/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('17','Filip','Alerw','ul. Lesna 142 Gdansk',to_date('81/04/01','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('18','Jakub','Suska','ul. Brzozowa 90 Poznan',to_date('93/05/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('19','Szymon','Samos','ul. Sloneczna 46 Olsztyn',to_date('79/08/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('20','Aleksander','Konsat','ul. Polna 110 Olsztyn',to_date('89/03/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('21','Mikolaj','Obloch','ul. Krotka 25 Olsztyn',to_date('86/07/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('22','Szymon','Goniec','ul. Ogrodowa 136 Wroclaw',to_date('81/09/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('23','Szymon','Alerw','ul. Kwiatowa 10 Elk',to_date('90/11/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('24','Antoni','Lojek','ul. Sloneczna 125 Rzeszow',to_date('67/07/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('25','Aleksander','Alerw','ul. Sloneczna 105 Bialystok',to_date('76/03/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('26','Franciszek','Kaszuba','ul. Krotka 50 Krakow',to_date('84/08/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('27','Szymon','Zloto','ul. Krotka 129 Bialystok',to_date('64/05/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('28','Aleksander','Alerw','ul. Polna 22 Bialystok',to_date('71/03/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('29','Jan','Konsat','ul. Lesna 26 Poznan',to_date('88/09/22','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('30','Aleksander','Kaszuba','ul. Lesna 38 Wroclaw',to_date('86/06/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('31','Kacper','Goniec','ul. Krotka 95 Warszawa',to_date('96/03/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('32','Szymon','Alerw','Suska51 Katowice',to_date('69/10/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('33','Jan','Konsat','ul. Ogrodowa 67 Warszawa',to_date('89/11/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('34','Antoni','Konsat','ul. Ogrodowa 68 Wroclaw',to_date('80/11/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('35','Aleksander','Suska','ul. Polna 33 Rzeszow',to_date('84/04/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('36','Jakub','Alerw','ul. Krotka 72 Katowice',to_date('92/03/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('37','Filip','Kondrat','ul. Krotka 10 Krakow',to_date('71/07/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('38','Franciszek','Obloch','ul. Lipowa 125 Krakow',to_date('68/11/22','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('39','Szymon','Obloch','ul. Lesna 3 Poznan',to_date('70/10/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('40','Filip','Kaszuba','ul. Lipowa 30 Poznan',to_date('78/06/04','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('41','Antoni','Zloto','ul. Lesna 102 Wroclaw',to_date('79/03/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('42','Filip','Lojek','ul. Brzozowa 33 Katowice',to_date('74/03/06','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('43','Mikolaj','Konsat','ul. Szkolna 59 Bialystok',to_date('65/10/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('44','Antoni','Kondrat','ul. Lipowa 18 Gdansk',to_date('64/10/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('45','Antoni','Lojek','ul. Sloneczna 23 Bialystok',to_date('91/08/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('46','Filip','Kaszuba','ul. Krotka 124 Wroclaw',to_date('70/11/04','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('47','Filip','Kaszuba','ul. Ogrodowa 85 Gdansk',to_date('69/06/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('48','Antoni','Kondrat','ul. Sloneczna 141 Warszawa',to_date('68/07/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('49','Franciszek','Kaszuba','ul. Szkolna 51 Bialystok',to_date('81/03/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('50','Filip','Goniec','ul. Sloneczna 22 Poznan',to_date('70/06/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('51','Jan','Obloch','ul. Sloneczna 68 Krakow',to_date('71/09/10','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('52','Franciszek','Goniec','ul. Szkolna 100 Bialystok',to_date('97/04/10','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('53','Aleksander','Alerw','ul. Sloneczna 59 Katowice',to_date('63/11/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('54','Wojciech','Lojek','Suska36 Elk',to_date('72/06/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('55','Aleksander','Konsat','ul. Kwiatowa 27 Wroclaw',to_date('68/10/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('56','Franciszek','Kondrat','ul. Ogrodowa 22 Olsztyn',to_date('80/11/22','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('57','Jan','Suska','ul. Brzozowa 2 Olsztyn',to_date('68/01/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('58','Wojciech','Alerw','ul. Krotka 23 Wroclaw',to_date('84/03/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('59','Franciszek','Alerw','ul. Krotka 61 Gdansk',to_date('78/02/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('60','Filip','Kondrat','ul. Ogrodowa 54 Krakow',to_date('68/08/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('61','Franciszek','Obloch','ul. Krotka 70 Krakow',to_date('66/11/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('62','Jan','Obloch','ul. Ogrodowa 132 Bialystok',to_date('90/06/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('63','Szymon','Obloch','ul. Polna 147 Poznan',to_date('86/08/19','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('64','Jakub','Konsat','ul. Brzozowa 19 Warszawa',to_date('89/11/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('65','Filip','Konsat','ul. Brzozowa 132 Wroclaw',to_date('65/07/04','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('66','Jan','Alerw','ul. Ogrodowa 104 Olsztyn',to_date('84/02/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('67','Aleksander','Konsat','ul. Szkolna 135 Poznan',to_date('76/11/10','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('68','Jan','Zloto','ul. Sloneczna 134 Olsztyn',to_date('94/06/19','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('69','Jakub','Lojek','ul. Lesna 62 Katowice',to_date('88/07/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('70','Antoni','Kondrat','ul. Lipowa 109 Krakow',to_date('89/01/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('71','Mikolaj','Lojek','ul. Ogrodowa 123 Katowice',to_date('83/11/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('72','Franciszek','Obloch','ul. Polna 27 Warszawa',to_date('93/01/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('73','Jan','Samos','ul. Lipowa 105 Katowice',to_date('87/03/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('74','Szymon','Kondrat','ul. Lipowa 109 Wroclaw',to_date('86/12/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('75','Aleksander','Goniec','ul. Sloneczna 44 Gdansk',to_date('94/12/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('76','Kacper','Obloch','ul. Polna 13 Krakow',to_date('73/11/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('77','Aleksander','Konsat','ul. Ogrodowa 24 Bialystok',to_date('90/04/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('78','Franciszek','Konsat','ul. Polna 43 Olsztyn',to_date('73/11/01','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('79','Jakub','Goniec','ul. Krotka 2 Katowice',to_date('89/09/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('80','Jakub','Alerw','ul. Sloneczna 9 Krakow',to_date('72/10/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('81','Mikolaj','Alerw','ul. Sloneczna 95 Wroclaw',to_date('66/10/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('82','Franciszek','Obloch','ul. Krotka 85 Poznan',to_date('65/04/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('83','Antoni','Lojek','ul. Brzozowa 109 Poznan',to_date('68/02/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('84','Szymon','Zloto','ul. Lesna 80 Warszawa',to_date('90/08/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('85','Kacper','Suska','ul. Polna 60 Poznan',to_date('78/04/04','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('86','Franciszek','Kaszuba','ul. Krotka 74 Wroclaw',to_date('67/10/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('87','Jan','Konsat','ul. Krotka 132 Olsztyn',to_date('75/11/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('88','Jakub','Obloch','ul. Ogrodowa 24 Warszawa',to_date('93/12/03','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('89','Szymon','Lojek','ul. Lipowa 41 Bialystok',to_date('90/11/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('90','Antoni','Lojek','ul. Lesna 126 Wroclaw',to_date('91/03/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('91','Filip','Samos','ul. Brzozowa 126 Katowice',to_date('85/07/01','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('92','Kacper','Konsat','ul. Ogrodowa 120 Olsztyn',to_date('68/08/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('93','Aleksander','Obloch','ul. Polna 89 Bialystok',to_date('96/06/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('94','Franciszek','Obloch','ul. Brzozowa 20 Krakow',to_date('65/08/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('95','Jan','Zloto','ul. Szkolna 88 Poznan',to_date('63/10/06','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('96','Wojciech','Lojek','ul. Sloneczna 145 Krakow',to_date('75/08/31','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('97','Franciszek','Suska','ul. Krotka 44 Elk',to_date('95/02/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('98','Franciszek','Kaszuba','ul. Lesna 71 Wroclaw',to_date('64/09/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('99','Jan','Kondrat','ul. Brzozowa 48 Olsztyn',to_date('73/01/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('100','Franciszek','Konsat','ul. Lipowa 74 Gdansk',to_date('76/02/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('101','Jakub','Obloch','ul. Polna 8 Rzeszow',to_date('95/11/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('102','Mikolaj','Goniec','ul. Kwiatowa 142 Gdansk',to_date('76/02/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('103','Filip','Kondrat','ul. Ogrodowa 48 Bialystok',to_date('77/07/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('104','Kacper','Zloto','ul. Lipowa 9 Warszawa',to_date('96/03/12','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('105','Antoni','Lojek','ul. Lipowa 57 Wroclaw',to_date('86/12/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('106','Jan','Obloch','ul. Lesna 94 Warszawa',to_date('88/08/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('107','Jan','Konsat','ul. Szkolna 29 Gdansk',to_date('89/02/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('108','Szymon','Goniec','ul. Polna 22 Gdansk',to_date('97/02/17','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('109','Franciszek','Alerw','ul. Lesna 148 Olsztyn',to_date('76/11/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('110','Franciszek','Kondrat','ul. Ogrodowa 21 Krakow',to_date('79/10/01','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('111','Filip','Goniec','ul. Szkolna 10 Wroclaw',to_date('68/08/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('112','Jan','Suska','ul. Lesna 23 Katowice',to_date('69/04/04','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('113','Antoni','Lojek','ul. Ogrodowa 78 Warszawa',to_date('70/03/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('114','Antoni','Goniec','ul. Lesna 61 Olsztyn',to_date('71/10/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('115','Jan','Lojek','ul. Szkolna 15 Gdansk',to_date('77/09/12','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('116','Jakub','Suska','ul. Sloneczna 104 Gdansk',to_date('90/03/12','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('117','Aleksander','Konsat','ul. Sloneczna 23 Poznan',to_date('69/05/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('118','Filip','Kaszuba','Suska65 Katowice',to_date('88/12/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('119','Filip','Alerw','ul. Brzozowa 59 Krakow',to_date('79/10/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('120','Jan','Alerw','ul. Polna 32 Olsztyn',to_date('69/11/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('121','Jan','Lojek','ul. Polna 78 Wroclaw',to_date('75/10/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('122','Filip','Goniec','ul. Szkolna 135 Rzeszow',to_date('72/05/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('123','Aleksander','Alerw','ul. Szkolna 105 Rzeszow',to_date('93/02/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('124','Franciszek','Konsat','ul. Krotka 74 Warszawa',to_date('97/10/04','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('125','Szymon','Zloto','ul. Lipowa 114 Poznan',to_date('66/11/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('126','Jan','Kondrat','ul. Lesna 39 Olsztyn',to_date('92/12/28','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('127','Filip','Lojek','ul. Szkolna 138 Krakow',to_date('77/02/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('128','Szymon','Obloch','ul. Szkolna 58 Warszawa',to_date('73/03/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('129','Mikolaj','Kaszuba','ul. Lipowa 8 Warszawa',to_date('83/11/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('130','Aleksander','Kondrat','ul. Polna 6 Rzeszow',to_date('91/02/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('131','Jan','Lojek','ul. Lipowa 39 Warszawa',to_date('67/06/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('132','Mikolaj','Samos','ul. Krotka 121 Gdansk',to_date('93/12/12','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('259','Szymon','Lojek','Suska144 Elk',to_date('92/11/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('260','Franciszek','Lojek','ul. Brzozowa 113 Bialystok',to_date('64/06/17','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('261','Filip','Goniec','Suska52 Rzeszow',to_date('96/05/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('133','Jan','Kondrat','ul. Lipowa 49 Bialystok',to_date('82/09/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('134','Wojciech','Obloch','ul. Ogrodowa 7 Katowice',to_date('63/10/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('135','Szymon','Samos','ul. Ogrodowa 45 Olsztyn',to_date('96/12/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('136','Wojciech','Alerw','ul. Polna 101 Poznan',to_date('97/04/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('137','Szymon','Konsat','ul. Krotka 143 Warszawa',to_date('79/10/03','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('138','Antoni','Suska','ul. Ogrodowa 8 Bialystok',to_date('79/03/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('139','Szymon','Kondrat','ul. Brzozowa 137 Wroclaw',to_date('93/01/17','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('140','Antoni','Kondrat','ul. Kwiatowa 109 Katowice',to_date('80/12/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('141','Franciszek','Lojek','ul. Lesna 124 Gdansk',to_date('79/10/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('142','Aleksander','Lojek','ul. Ogrodowa 37 Poznan',to_date('77/04/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('143','Antoni','Konsat','ul. Polna 147 Wroclaw',to_date('85/12/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('144','Jan','Zloto','ul. Szkolna 3 Katowice',to_date('73/05/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('145','Mikolaj','Alerw','ul. Lipowa 39 Olsztyn',to_date('65/01/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('146','Kacper','Konsat','ul. Krotka 90 Katowice',to_date('66/02/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('147','Kacper','Alerw','ul. Brzozowa 42 Poznan',to_date('74/09/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('148','Mikolaj','Samos','ul. Ogrodowa 83 Gdansk',to_date('80/09/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('149','Aleksander','Kaszuba','ul. Krotka 57 Rzeszow',to_date('72/05/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('150','Jakub','Zloto','ul. Ogrodowa 67 Wroclaw',to_date('94/01/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('151','Antoni','Obloch','ul. Sloneczna 86 Gdansk',to_date('66/02/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('152','Mikolaj','Goniec','ul. Ogrodowa 142 Katowice',to_date('93/07/05','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('153','Antoni','Goniec','ul. Szkolna 39 Krakow',to_date('95/01/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('154','Jan','Kondrat','ul. Lesna 37 Poznan',to_date('64/10/31','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('155','Filip','Kaszuba','ul. Krotka 121 Bialystok',to_date('62/12/10','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('156','Szymon','Konsat','ul. Szkolna 98 Krakow',to_date('76/12/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('157','Kacper','Lojek','ul. Lesna 81 Elk',to_date('72/12/04','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('158','Mikolaj','Kondrat','ul. Szkolna 70 Poznan',to_date('75/12/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('159','Mikolaj','Konsat','ul. Sloneczna 21 Gdansk',to_date('89/11/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('160','Jan','Kaszuba','ul. Sloneczna 51 Bialystok',to_date('63/08/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('161','Wojciech','Suska','ul. Lesna 100 Gdansk',to_date('95/08/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('162','Franciszek','Goniec','ul. Brzozowa 97 Wroclaw',to_date('95/11/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('163','Szymon','Samos','ul. Sloneczna 10 Bialystok',to_date('83/08/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('164','Antoni','Goniec','ul. Kwiatowa 31 Olsztyn',to_date('93/11/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('165','Antoni','Zloto','ul. Krotka 22 Bialystok',to_date('69/11/10','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('166','Kacper','Zloto','ul. Szkolna 55 Elk',to_date('96/05/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('167','Antoni','Kaszuba','ul. Szkolna 89 Warszawa',to_date('75/07/22','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('168','Antoni','Goniec','ul. Kwiatowa 69 Elk',to_date('71/08/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('169','Kacper','Kaszuba','ul. Sloneczna 30 Krakow',to_date('88/02/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('170','Kacper','Kaszuba','ul. Szkolna 147 Poznan',to_date('85/08/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('171','Franciszek','Zloto','ul. Sloneczna 114 Rzeszow',to_date('77/01/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('172','Antoni','Alerw','ul. Kwiatowa 147 Wroclaw',to_date('63/03/31','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('173','Antoni','Kaszuba','ul. Lesna 14 Rzeszow',to_date('75/06/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('174','Kacper','Kaszuba','ul. Ogrodowa 8 Warszawa',to_date('97/07/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('175','Kacper','Kondrat','ul. Krotka 79 Bialystok',to_date('90/06/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('176','Jakub','Konsat','ul. Szkolna 142 Gdansk',to_date('92/03/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('177','Filip','Kondrat','ul. Sloneczna 55 Wroclaw',to_date('63/05/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('178','Mikolaj','Alerw','ul. Szkolna 81 Wroclaw',to_date('79/07/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('179','Mikolaj','Kondrat','ul. Lesna 127 Rzeszow',to_date('95/01/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('180','Szymon','Kaszuba','ul. Kwiatowa 12 Elk',to_date('69/08/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('181','Aleksander','Lojek','ul. Kwiatowa 16 Bialystok',to_date('69/05/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('182','Franciszek','Zloto','ul. Ogrodowa 58 Elk',to_date('75/07/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('183','Jan','Lojek','ul. Polna 82 Warszawa',to_date('93/11/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('184','Franciszek','Samos','ul. Brzozowa 68 Olsztyn',to_date('93/05/06','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('185','Jan','Alerw','ul. Ogrodowa 63 Katowice',to_date('89/07/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('186','Franciszek','Suska','ul. Kwiatowa 4 Gdansk',to_date('64/06/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('187','Kacper','Goniec','ul. Brzozowa 72 Elk',to_date('74/01/22','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('188','Filip','Lojek','ul. Szkolna 99 Katowice',to_date('94/06/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('189','Jakub','Konsat','ul. Szkolna 116 Krakow',to_date('73/01/04','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('190','Antoni','Konsat','ul. Lipowa 119 Bialystok',to_date('67/09/01','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('191','Jan','Lojek','ul. Ogrodowa 119 Wroclaw',to_date('67/05/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('192','Szymon','Samos','Suska16 Bialystok',to_date('64/11/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('193','Jan','Konsat','ul. Brzozowa 127 Olsztyn',to_date('64/12/19','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('194','Szymon','Goniec','ul. Lesna 57 Warszawa',to_date('86/04/22','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('195','Aleksander','Alerw','ul. Szkolna 135 Bialystok',to_date('88/09/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('196','Jan','Lojek','ul. Kwiatowa 116 Rzeszow',to_date('77/05/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('197','Aleksander','Obloch','ul. Krotka 88 Elk',to_date('67/04/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('198','Aleksander','Goniec','ul. Szkolna 61 Warszawa',to_date('84/12/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('199','Jan','Lojek','ul. Lesna 121 Wroclaw',to_date('87/04/23','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('200','Franciszek','Lojek','ul. Lipowa 11 Krakow',to_date('95/10/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('201','Kacper','Alerw','ul. Ogrodowa 102 Krakow',to_date('97/05/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('202','Antoni','Konsat','ul. Ogrodowa 25 Warszawa',to_date('85/05/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('203','Wojciech','Kondrat','ul. Szkolna 76 Warszawa',to_date('72/09/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('204','Jan','Kaszuba','ul. Lesna 37 Poznan',to_date('83/06/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('205','Szymon','Konsat','ul. Lipowa 93 Elk',to_date('92/02/17','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('206','Kacper','Konsat','ul. Brzozowa 53 Katowice',to_date('77/09/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('207','Mikolaj','Goniec','ul. Polna 20 Katowice',to_date('82/01/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('208','Filip','Goniec','ul. Lipowa 18 Olsztyn',to_date('85/03/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('209','Aleksander','Zloto','ul. Sloneczna 110 Katowice',to_date('76/11/22','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('210','Aleksander','Kaszuba','ul. Kwiatowa 91 Wroclaw',to_date('82/09/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('211','Jakub','Lojek','ul. Kwiatowa 52 Krakow',to_date('80/01/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('212','Filip','Obloch','ul. Krotka 125 Warszawa',to_date('91/05/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('213','Filip','Alerw','ul. Lipowa 105 Elk',to_date('64/04/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('214','Antoni','Alerw','ul. Polna 38 Bialystok',to_date('91/01/24','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('215','Filip','Konsat','ul. Brzozowa 41 Rzeszow',to_date('84/04/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('216','Jakub','Kaszuba','ul. Ogrodowa 23 Gdansk',to_date('97/07/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('217','Aleksander','Suska','ul. Krotka 49 Krakow',to_date('69/08/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('218','Jakub','Obloch','ul. Sloneczna 53 Gdansk',to_date('72/10/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('219','Filip','Zloto','ul. Szkolna 62 Wroclaw',to_date('83/04/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('220','Kacper','Alerw','ul. Ogrodowa 123 Warszawa',to_date('78/03/15','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('221','Antoni','Lojek','Suska34 Poznan',to_date('92/10/31','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('222','Wojciech','Kondrat','ul. Lesna 60 Poznan',to_date('87/08/25','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('223','Szymon','Obloch','ul. Ogrodowa 17 Warszawa',to_date('71/03/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('224','Aleksander','Alerw','ul. Sloneczna 108 Elk',to_date('91/05/22','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('225','Jakub','Zloto','ul. Lipowa 22 Elk',to_date('66/10/19','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('226','Mikolaj','Lojek','ul. Lipowa 134 Krakow',to_date('85/05/04','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('227','Mikolaj','Goniec','ul. Polna 29 Olsztyn',to_date('94/09/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('228','Jakub','Goniec','ul. Brzozowa 113 Krakow',to_date('78/02/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('229','Kacper','Suska','ul. Lesna 31 Wroclaw',to_date('90/12/18','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('230','Jakub','Zloto','ul. Sloneczna 83 Wroclaw',to_date('82/12/05','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('231','Mikolaj','Kaszuba','ul. Lesna 53 Krakow',to_date('76/10/27','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('232','Filip','Goniec','ul. Lipowa 87 Olsztyn',to_date('72/08/22','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('233','Mikolaj','Kondrat','ul. Lipowa 34 Wroclaw',to_date('82/08/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('234','Kacper','Zloto','ul. Lesna 110 Olsztyn',to_date('64/05/02','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('235','Jan','Kondrat','ul. Ogrodowa 87 Olsztyn',to_date('69/03/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('236','Jan','Zloto','ul. Lipowa 53 Gdansk',to_date('63/10/21','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('237','Szymon','Obloch','ul. Polna 135 Olsztyn',to_date('87/09/04','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('238','Szymon','Alerw','ul. Szkolna 21 Wroclaw',to_date('96/09/11','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('239','Kacper','Zloto','ul. Ogrodowa 146 Bialystok',to_date('68/01/29','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('240','Jakub','Goniec','ul. Polna 33 Wroclaw',to_date('75/09/19','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('241','Kacper','Kaszuba','ul. Szkolna 99 Bialystok',to_date('71/01/09','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('242','Filip','Goniec','ul. Szkolna 63 Katowice',to_date('90/11/10','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('243','Wojciech','Konsat','ul. Sloneczna 105 Katowice',to_date('88/10/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('244','Jan','Goniec','Suska139 Bialystok',to_date('81/04/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('245','Szymon','Zloto','ul. Polna 147 Bialystok',to_date('83/06/03','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('246','Kacper','Kondrat','ul. Sloneczna 96 Wroclaw',to_date('72/03/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('247','Kacper','Zloto','ul. Szkolna 87 Bialystok',to_date('67/05/16','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('248','Franciszek','Zloto','ul. Brzozowa 26 Olsztyn',to_date('64/09/26','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('249','Mikolaj','Suska','ul. Polna 57 Warszawa',to_date('90/04/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('250','Wojciech','Zloto','ul. Sloneczna 128 Elk',to_date('79/03/20','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('251','Kacper','Kondrat','ul. Sloneczna 121 Warszawa',to_date('81/10/13','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('252','Mikolaj','Lojek','ul. Ogrodowa 35 Elk',to_date('62/06/08','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('253','Szymon','Zloto','ul. Krotka 94 Wroclaw',to_date('97/01/07','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('254','Jakub','Goniec','ul. Lipowa 83 Bialystok',to_date('79/08/01','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('255','Kacper','Suska','ul. Sloneczna 12 Bialystok',to_date('65/12/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('256','Aleksander','Obloch','ul. Sloneczna 5 Gdansk',to_date('63/03/14','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('257','Szymon','Obloch','ul. Lesna 130 Poznan',to_date('65/09/30','RR/MM/DD'),'M');
Insert into KLIENCI (IDKLIENTA,IMIE,NAZWISKO,ADRES,ROKURODZENIA,PLEC) values ('258','Jan','Zloto','ul. Krotka 104 Elk',to_date('90/11/05','RR/MM/DD'),'M');

Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('466',to_date('17/02/05','RR/MM/DD'),'367','1','N','8892');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('467',to_date('17/02/05','RR/MM/DD'),'368','2','N','27500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('468',to_date('17/02/05','RR/MM/DD'),'369','2','N','20');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('478',to_date('17/02/06','RR/MM/DD'),'379','1','T','2806');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('479',to_date('17/02/06','RR/MM/DD'),'380','2','N','315');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('480',to_date('17/02/06','RR/MM/DD'),'381','1','N','700');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('484',to_date('17/02/06','RR/MM/DD'),'52','1','N','60216');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('460',to_date('17/02/05','RR/MM/DD'),'361','1','N','2310');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('461',to_date('17/02/05','RR/MM/DD'),'362','1','T','231');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('462',to_date('17/02/05','RR/MM/DD'),'363','2','T','280');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('469',to_date('17/02/05','RR/MM/DD'),'370','2','N','1107');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('470',to_date('17/02/05','RR/MM/DD'),'371','1','T','4600');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('471',to_date('17/02/05','RR/MM/DD'),'372','2','T','1100');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('475',to_date('17/02/06','RR/MM/DD'),'376','2','T','738');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('476',to_date('17/02/06','RR/MM/DD'),'377','1','T','28');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('477',to_date('17/02/06','RR/MM/DD'),'378','1','N','11856');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('481',to_date('17/02/06','RR/MM/DD'),'382','1','T','6995');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('482',to_date('17/02/06','RR/MM/DD'),'383','1','N','39');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('483',to_date('17/02/06','RR/MM/DD'),'384','1','T','802');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('485',to_date('17/02/06','RR/MM/DD'),'385','2','N','990');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('486',to_date('17/02/06','RR/MM/DD'),'386','1','N','495');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('487',to_date('17/02/06','RR/MM/DD'),'387','1','N','1465');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('1',to_date('16/10/13','RR/MM/DD'),'2','2','T','3321');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('2',to_date('16/11/17','RR/MM/DD'),'3','1','N','1758');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('3',to_date('16/07/15','RR/MM/DD'),'4','1','T','1980');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('4',to_date('16/04/12','RR/MM/DD'),'5','2','N','165');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('5',to_date('17/01/30','RR/MM/DD'),'6','1','T','6480');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('6',to_date('17/01/03','RR/MM/DD'),'7','1','N','70');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('7',to_date('16/04/06','RR/MM/DD'),'8','1','T','1440');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('8',to_date('16/10/30','RR/MM/DD'),'9','2','N','11856');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('9',to_date('16/09/02','RR/MM/DD'),'10','2','T','5596');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('10',to_date('16/03/03','RR/MM/DD'),'11','1','N','398');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('11',to_date('16/03/29','RR/MM/DD'),'12','1','N','110');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('12',to_date('16/10/26','RR/MM/DD'),'13','2','N','1050');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('13',to_date('16/09/08','RR/MM/DD'),'14','2','N','136');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('14',to_date('16/06/21','RR/MM/DD'),'15','1','T','2160');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('15',to_date('16/06/13','RR/MM/DD'),'16','1','N','800');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('16',to_date('16/12/22','RR/MM/DD'),'17','1','N','6300');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('17',to_date('17/02/01','RR/MM/DD'),'18','1','N','280');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('18',to_date('16/12/21','RR/MM/DD'),'19','1','T','315');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('19',to_date('16/07/22','RR/MM/DD'),'20','2','T','240');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('20',to_date('16/12/25','RR/MM/DD'),'21','1','T','2797');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('21',to_date('16/05/06','RR/MM/DD'),'22','2','T','25000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('22',to_date('17/01/17','RR/MM/DD'),'23','1','T','6290');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('23',to_date('16/07/20','RR/MM/DD'),'24','1','T','165');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('24',to_date('17/01/22','RR/MM/DD'),'25','2','N','1050');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('25',to_date('16/04/10','RR/MM/DD'),'26','2','N','1079');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('26',to_date('17/02/04','RR/MM/DD'),'27','1','N','27500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('27',to_date('16/10/22','RR/MM/DD'),'28','2','T','1368');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('28',to_date('16/05/02','RR/MM/DD'),'29','2','T','110');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('29',to_date('16/06/19','RR/MM/DD'),'30','2','N','105');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('30',to_date('16/10/27','RR/MM/DD'),'31','2','T','675');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('31',to_date('17/01/07','RR/MM/DD'),'32','2','N','675');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('32',to_date('16/05/25','RR/MM/DD'),'33','1','N','1592');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('33',to_date('16/04/03','RR/MM/DD'),'34','2','T','1497');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('34',to_date('17/01/05','RR/MM/DD'),'35','1','N','220');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('35',to_date('17/01/17','RR/MM/DD'),'36','2','T','55');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('36',to_date('16/02/27','RR/MM/DD'),'37','2','N','270');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('37',to_date('16/10/16','RR/MM/DD'),'38','1','T','308');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('38',to_date('16/11/14','RR/MM/DD'),'39','1','N','315');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('39',to_date('16/05/04','RR/MM/DD'),'40','2','T','2005');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('40',to_date('17/01/13','RR/MM/DD'),'41','1','T','256');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('41',to_date('16/07/17','RR/MM/DD'),'42','2','N','117');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('42',to_date('17/01/07','RR/MM/DD'),'43','1','T','20');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('43',to_date('16/06/12','RR/MM/DD'),'44','2','T','3916');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('44',to_date('16/10/09','RR/MM/DD'),'45','2','T','670');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('45',to_date('16/10/27','RR/MM/DD'),'46','1','T','1368');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('46',to_date('16/07/08','RR/MM/DD'),'47','1','T','4125');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('47',to_date('16/11/26','RR/MM/DD'),'48','1','N','330');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('48',to_date('16/11/08','RR/MM/DD'),'49','1','T','240');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('49',to_date('16/11/17','RR/MM/DD'),'50','1','T','944');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('50',to_date('16/11/08','RR/MM/DD'),'51','2','T','256');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('51',to_date('16/05/08','RR/MM/DD'),'52','1','N','880');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('52',to_date('16/11/25','RR/MM/DD'),'53','2','T','448');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('53',to_date('16/05/13','RR/MM/DD'),'54','1','T','1214');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('54',to_date('16/09/03','RR/MM/DD'),'55','2','N','1194');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('55',to_date('17/02/04','RR/MM/DD'),'56','1','N','586');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('56',to_date('16/08/28','RR/MM/DD'),'57','1','N','330');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('57',to_date('16/06/29','RR/MM/DD'),'58','1','N','1620');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('58',to_date('16/10/27','RR/MM/DD'),'59','2','N','700');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('59',to_date('16/06/26','RR/MM/DD'),'60','2','N','20000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('60',to_date('16/06/26','RR/MM/DD'),'61','1','T','1000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('61',to_date('16/12/24','RR/MM/DD'),'62','2','N','120');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('62',to_date('16/06/10','RR/MM/DD'),'63','2','T','228');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('63',to_date('16/03/05','RR/MM/DD'),'64','2','T','52');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('64',to_date('16/07/14','RR/MM/DD'),'65','1','N','6300');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('65',to_date('16/03/25','RR/MM/DD'),'66','1','N','440');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('66',to_date('16/04/14','RR/MM/DD'),'67','2','T','6480');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('67',to_date('16/04/17','RR/MM/DD'),'68','1','T','1200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('68',to_date('16/05/14','RR/MM/DD'),'69','1','T','1887');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('69',to_date('16/10/29','RR/MM/DD'),'70','1','T','5000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('70',to_date('16/03/29','RR/MM/DD'),'71','1','T','200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('71',to_date('16/02/21','RR/MM/DD'),'72','1','T','2000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('72',to_date('16/06/06','RR/MM/DD'),'73','1','T','330');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('73',to_date('16/11/04','RR/MM/DD'),'74','2','N','52');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('74',to_date('16/06/06','RR/MM/DD'),'75','2','T','2310');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('75',to_date('16/06/23','RR/MM/DD'),'76','1','T','40');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('76',to_date('16/07/02','RR/MM/DD'),'77','2','T','10374');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('77',to_date('17/01/07','RR/MM/DD'),'78','1','N','611');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('78',to_date('16/08/09','RR/MM/DD'),'79','2','N','26');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('79',to_date('16/03/09','RR/MM/DD'),'80','2','N','70');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('80',to_date('16/05/28','RR/MM/DD'),'81','2','T','55');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('81',to_date('16/11/30','RR/MM/DD'),'82','2','T','2994');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('82',to_date('16/06/04','RR/MM/DD'),'83','2','N','1400');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('83',to_date('17/01/01','RR/MM/DD'),'84','2','T','1200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('84',to_date('16/08/01','RR/MM/DD'),'85','1','T','3450');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('85',to_date('16/07/27','RR/MM/DD'),'86','2','N','998');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('86',to_date('16/12/31','RR/MM/DD'),'87','1','N','330');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('87',to_date('16/07/16','RR/MM/DD'),'88','1','N','7500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('88',to_date('16/10/24','RR/MM/DD'),'89','2','N','495');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('89',to_date('16/07/11','RR/MM/DD'),'90','1','T','3145');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('90',to_date('16/12/18','RR/MM/DD'),'91','1','T','1119');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('91',to_date('16/10/13','RR/MM/DD'),'92','1','N','293');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('92',to_date('16/10/02','RR/MM/DD'),'93','2','N','2516');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('93',to_date('16/02/22','RR/MM/DD'),'94','1','T','539');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('94',to_date('16/07/07','RR/MM/DD'),'95','2','N','320');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('95',to_date('16/12/24','RR/MM/DD'),'96','1','T','2500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('96',to_date('16/05/27','RR/MM/DD'),'97','1','N','16500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('97',to_date('16/12/05','RR/MM/DD'),'98','2','T','32999');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('98',to_date('17/02/02','RR/MM/DD'),'99','2','N','105');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('99',to_date('16/06/02','RR/MM/DD'),'100','1','T','16500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('100',to_date('16/03/16','RR/MM/DD'),'101','1','T','420');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('101',to_date('16/09/08','RR/MM/DD'),'102','2','N','134');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('102',to_date('16/06/02','RR/MM/DD'),'103','1','T','155');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('103',to_date('16/08/11','RR/MM/DD'),'104','2','T','384');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('104',to_date('17/01/07','RR/MM/DD'),'105','1','T','7500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('105',to_date('16/12/22','RR/MM/DD'),'106','1','T','660');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('106',to_date('16/09/01','RR/MM/DD'),'107','2','N','17500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('107',to_date('16/10/05','RR/MM/DD'),'108','2','T','1800');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('108',to_date('16/02/26','RR/MM/DD'),'109','1','T','27500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('109',to_date('17/01/23','RR/MM/DD'),'110','2','N','3394');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('110',to_date('16/09/10','RR/MM/DD'),'111','2','T','6480');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('111',to_date('17/01/09','RR/MM/DD'),'112','1','T','1119');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('112',to_date('17/01/05','RR/MM/DD'),'113','2','T','5034');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('113',to_date('16/08/18','RR/MM/DD'),'114','2','N','3055');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('114',to_date('16/07/05','RR/MM/DD'),'115','1','N','11856');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('115',to_date('16/07/19','RR/MM/DD'),'116','1','T','6290');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('116',to_date('16/09/18','RR/MM/DD'),'117','1','T','60');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('117',to_date('16/08/30','RR/MM/DD'),'118','1','N','280');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('118',to_date('16/11/19','RR/MM/DD'),'119','1','N','275');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('119',to_date('16/10/15','RR/MM/DD'),'120','2','T','586');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('120',to_date('16/12/23','RR/MM/DD'),'121','1','T','2952');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('121',to_date('16/11/04','RR/MM/DD'),'122','1','T','4403');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('122',to_date('16/11/18','RR/MM/DD'),'123','2','N','1258');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('123',to_date('16/10/29','RR/MM/DD'),'124','2','N','8250');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('124',to_date('16/06/24','RR/MM/DD'),'125','2','N','40');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('125',to_date('16/07/25','RR/MM/DD'),'126','2','N','4491');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('126',to_date('16/11/30','RR/MM/DD'),'127','1','T','1980');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('127',to_date('16/03/14','RR/MM/DD'),'128','1','N','300');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('128',to_date('16/09/29','RR/MM/DD'),'129','1','N','14820');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('129',to_date('16/07/14','RR/MM/DD'),'130','1','N','13990');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('130',to_date('16/08/11','RR/MM/DD'),'131','2','N','1890');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('131',to_date('16/06/28','RR/MM/DD'),'132','2','T','3055');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('132',to_date('16/11/11','RR/MM/DD'),'133','1','T','280');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('133',to_date('17/01/11','RR/MM/DD'),'134','1','N','5760');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('134',to_date('17/01/06','RR/MM/DD'),'135','1','T','550');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('135',to_date('16/06/18','RR/MM/DD'),'136','2','T','1476');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('136',to_date('16/05/06','RR/MM/DD'),'137','1','T','3600');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('137',to_date('16/05/08','RR/MM/DD'),'138','1','N','210');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('138',to_date('16/07/29','RR/MM/DD'),'139','2','T','400');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('139',to_date('16/12/25','RR/MM/DD'),'140','2','T','800');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('140',to_date('16/02/10','RR/MM/DD'),'141','2','T','5661');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('141',to_date('16/12/31','RR/MM/DD'),'142','2','N','2160');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('142',to_date('16/11/01','RR/MM/DD'),'143','2','N','3000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('143',to_date('16/04/09','RR/MM/DD'),'144','1','T','1470');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('144',to_date('17/01/07','RR/MM/DD'),'145','2','N','69');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('145',to_date('16/02/26','RR/MM/DD'),'146','2','N','13990');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('146',to_date('16/05/22','RR/MM/DD'),'147','1','T','4197');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('147',to_date('16/10/12','RR/MM/DD'),'148','1','T','270');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('148',to_date('16/12/11','RR/MM/DD'),'149','1','T','880');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('149',to_date('16/12/03','RR/MM/DD'),'150','2','T','9793');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('150',to_date('16/11/30','RR/MM/DD'),'151','2','T','220');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('151',to_date('16/07/08','RR/MM/DD'),'152','2','N','110');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('152',to_date('16/07/29','RR/MM/DD'),'153','2','N','402');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('153',to_date('16/06/18','RR/MM/DD'),'154','2','T','3000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('154',to_date('16/11/20','RR/MM/DD'),'155','1','N','9000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('155',to_date('16/03/18','RR/MM/DD'),'156','2','T','2405');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('156',to_date('16/06/03','RR/MM/DD'),'157','2','T','402');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('157',to_date('16/06/04','RR/MM/DD'),'158','1','T','5750');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('158',to_date('17/01/14','RR/MM/DD'),'159','2','N','809');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('159',to_date('17/01/26','RR/MM/DD'),'160','2','N','1500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('160',to_date('16/08/03','RR/MM/DD'),'161','1','N','2160');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('161',to_date('16/10/03','RR/MM/DD'),'162','2','T','91');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('162',to_date('16/06/21','RR/MM/DD'),'163','1','T','500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('163',to_date('16/10/20','RR/MM/DD'),'164','2','N','2344');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('164',to_date('16/03/05','RR/MM/DD'),'165','1','T','1320');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('165',to_date('16/04/01','RR/MM/DD'),'166','1','T','120');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('166',to_date('16/08/07','RR/MM/DD'),'167','1','T','70');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('167',to_date('16/05/26','RR/MM/DD'),'168','2','N','2880');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('168',to_date('16/09/18','RR/MM/DD'),'169','1','T','4446');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('169',to_date('17/01/27','RR/MM/DD'),'170','2','N','3300');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('170',to_date('16/03/30','RR/MM/DD'),'171','2','T','7425');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('171',to_date('17/01/07','RR/MM/DD'),'172','1','T','110');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('172',to_date('17/01/27','RR/MM/DD'),'173','1','N','13500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('173',to_date('16/09/07','RR/MM/DD'),'174','2','N','6600');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('174',to_date('16/08/18','RR/MM/DD'),'175','2','N','32999');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('175',to_date('16/07/18','RR/MM/DD'),'176','1','N','1824');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('176',to_date('16/08/30','RR/MM/DD'),'177','1','N','200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('177',to_date('17/02/02','RR/MM/DD'),'178','2','T','3300');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('178',to_date('16/03/26','RR/MM/DD'),'179','2','N','840');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('179',to_date('16/09/02','RR/MM/DD'),'180','2','T','192');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('180',to_date('16/02/17','RR/MM/DD'),'181','1','T','43999');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('181',to_date('16/08/15','RR/MM/DD'),'182','2','N','700');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('182',to_date('16/12/03','RR/MM/DD'),'183','1','T','28');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('183',to_date('16/05/29','RR/MM/DD'),'184','1','N','1080');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('184',to_date('16/10/24','RR/MM/DD'),'185','1','N','1800');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('185',to_date('16/08/25','RR/MM/DD'),'186','1','N','3493');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('186',to_date('16/03/31','RR/MM/DD'),'187','2','N','181');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('187',to_date('16/04/14','RR/MM/DD'),'188','2','T','611');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('188',to_date('16/09/29','RR/MM/DD'),'189','1','T','128');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('189',to_date('16/08/11','RR/MM/DD'),'190','2','T','1680');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('190',to_date('16/08/03','RR/MM/DD'),'191','2','T','385');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('191',to_date('16/08/24','RR/MM/DD'),'192','1','N','1350');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('192',to_date('17/01/01','RR/MM/DD'),'193','2','T','11192');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('193',to_date('16/11/09','RR/MM/DD'),'194','2','T','293');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('194',to_date('17/01/04','RR/MM/DD'),'195','1','N','495');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('195',to_date('17/02/01','RR/MM/DD'),'196','1','T','3000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('196',to_date('16/11/02','RR/MM/DD'),'197','2','N','11856');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('197',to_date('16/03/08','RR/MM/DD'),'198','2','N','200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('198',to_date('16/03/21','RR/MM/DD'),'199','2','T','5034');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('199',to_date('17/01/11','RR/MM/DD'),'200','2','N','1758');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('200',to_date('16/06/30','RR/MM/DD'),'201','2','N','1990');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('201',to_date('16/02/18','RR/MM/DD'),'202','1','N','2051');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('202',to_date('16/08/17','RR/MM/DD'),'203','1','T','120');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('203',to_date('16/08/17','RR/MM/DD'),'204','2','N','3992');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('204',to_date('16/10/25','RR/MM/DD'),'205','1','T','1400');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('205',to_date('16/11/21','RR/MM/DD'),'206','1','T','4200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('206',to_date('16/05/12','RR/MM/DD'),'207','2','N','4200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('207',to_date('16/02/16','RR/MM/DD'),'208','1','T','440');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('208',to_date('16/05/30','RR/MM/DD'),'209','1','T','207');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('209',to_date('16/11/23','RR/MM/DD'),'210','2','N','70');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('210',to_date('16/09/05','RR/MM/DD'),'211','2','T','1497');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('211',to_date('16/07/22','RR/MM/DD'),'212','2','T','3493');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('212',to_date('16/07/13','RR/MM/DD'),'213','1','T','330');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('213',to_date('16/06/24','RR/MM/DD'),'214','2','N','1465');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('214',to_date('16/09/25','RR/MM/DD'),'215','1','N','20');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('215',to_date('16/04/14','RR/MM/DD'),'216','2','T','15000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('216',to_date('16/11/24','RR/MM/DD'),'217','2','T','536');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('217',to_date('17/01/13','RR/MM/DD'),'218','1','T','1758');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('218',to_date('16/02/08','RR/MM/DD'),'219','1','N','9200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('219',to_date('17/01/03','RR/MM/DD'),'220','1','T','3992');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('220',to_date('16/11/12','RR/MM/DD'),'221','2','N','4200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('221',to_date('16/03/16','RR/MM/DD'),'222','2','T','2806');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('222',to_date('16/12/12','RR/MM/DD'),'223','2','T','55');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('223',to_date('16/05/01','RR/MM/DD'),'224','1','N','210');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('224',to_date('16/12/06','RR/MM/DD'),'225','2','T','104');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('225',to_date('16/04/08','RR/MM/DD'),'226','2','N','330');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('226',to_date('16/12/16','RR/MM/DD'),'227','2','N','5596');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('227',to_date('16/05/18','RR/MM/DD'),'228','1','T','181');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('228',to_date('16/03/05','RR/MM/DD'),'229','2','N','7410');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('229',to_date('16/07/29','RR/MM/DD'),'230','1','N','1980');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('230',to_date('16/12/06','RR/MM/DD'),'231','2','N','4197');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('231',to_date('16/07/21','RR/MM/DD'),'232','1','T','616');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('232',to_date('16/12/08','RR/MM/DD'),'233','2','N','2430');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('233',to_date('17/01/27','RR/MM/DD'),'234','2','N','55');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('234',to_date('16/12/29','RR/MM/DD'),'235','2','N','340');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('235',to_date('16/05/19','RR/MM/DD'),'236','2','N','14');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('236',to_date('16/10/24','RR/MM/DD'),'237','2','N','3608');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('237',to_date('16/09/21','RR/MM/DD'),'238','1','T','15000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('238',to_date('16/02/16','RR/MM/DD'),'239','2','T','1996');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('239',to_date('16/08/20','RR/MM/DD'),'240','1','N','2214');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('240',to_date('16/08/02','RR/MM/DD'),'241','1','T','603');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('241',to_date('16/07/28','RR/MM/DD'),'242','1','T','90');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('242',to_date('16/07/17','RR/MM/DD'),'243','1','N','700');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('243',to_date('17/01/10','RR/MM/DD'),'244','1','N','22000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('244',to_date('16/05/13','RR/MM/DD'),'245','2','N','5596');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('245',to_date('16/11/13','RR/MM/DD'),'246','1','N','693');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('246',to_date('17/01/25','RR/MM/DD'),'247','2','T','4900');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('247',to_date('16/05/24','RR/MM/DD'),'248','2','N','3000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('248',to_date('16/05/12','RR/MM/DD'),'249','1','N','1996');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('249',to_date('16/03/05','RR/MM/DD'),'250','2','T','6000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('250',to_date('16/12/18','RR/MM/DD'),'251','2','T','5000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('252',to_date('16/03/16','RR/MM/DD'),'253','2','T','2051');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('253',to_date('16/12/19','RR/MM/DD'),'254','1','N','5775');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('254',to_date('16/02/22','RR/MM/DD'),'255','2','T','330');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('251',to_date('16/09/02','RR/MM/DD'),'252','1','N','2880');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('255',to_date('16/12/15','RR/MM/DD'),'256','1','N','462');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('256',to_date('16/12/05','RR/MM/DD'),'257','2','T','10350');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('257',to_date('16/08/19','RR/MM/DD'),'258','1','N','1980');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('258',to_date('16/09/08','RR/MM/DD'),'259','2','T','1592');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('259',to_date('16/04/23','RR/MM/DD'),'260','1','T','270');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('260',to_date('16/04/28','RR/MM/DD'),'261','2','N','586');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('261',to_date('16/10/17','RR/MM/DD'),'262','1','T','160');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('262',to_date('16/11/19','RR/MM/DD'),'263','2','N','7700');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('263',to_date('16/08/02','RR/MM/DD'),'264','2','N','660');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('264',to_date('16/06/10','RR/MM/DD'),'265','2','T','2200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('265',to_date('16/06/04','RR/MM/DD'),'266','2','T','1018');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('266',to_date('16/06/23','RR/MM/DD'),'267','2','N','300');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('267',to_date('17/02/02','RR/MM/DD'),'268','2','T','4200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('268',to_date('16/06/03','RR/MM/DD'),'269','2','T','809');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('269',to_date('16/05/11','RR/MM/DD'),'270','1','T','402');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('270',to_date('16/09/14','RR/MM/DD'),'271','2','N','5775');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('271',to_date('16/12/18','RR/MM/DD'),'272','1','N','1203');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('272',to_date('16/02/29','RR/MM/DD'),'273','1','N','405');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('273',to_date('16/08/11','RR/MM/DD'),'274','1','N','405');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('274',to_date('16/08/18','RR/MM/DD'),'275','2','N','440');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('275',to_date('16/10/13','RR/MM/DD'),'276','1','N','22000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('276',to_date('16/08/22','RR/MM/DD'),'277','2','N','280');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('277',to_date('16/06/27','RR/MM/DD'),'278','2','N','1482');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('278',to_date('16/08/02','RR/MM/DD'),'279','2','T','26');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('279',to_date('16/08/14','RR/MM/DD'),'280','1','N','275');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('280',to_date('16/08/03','RR/MM/DD'),'281','2','T','272');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('281',to_date('16/08/13','RR/MM/DD'),'282','2','T','1600');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('282',to_date('16/10/23','RR/MM/DD'),'283','2','N','1119');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('283',to_date('16/11/06','RR/MM/DD'),'284','1','N','8892');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('284',to_date('16/03/22','RR/MM/DD'),'285','1','N','2160');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('285',to_date('16/10/19','RR/MM/DD'),'286','2','T','7425');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('286',to_date('16/03/17','RR/MM/DD'),'287','2','N','330');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('287',to_date('16/11/24','RR/MM/DD'),'288','1','N','22000');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('288',to_date('16/02/29','RR/MM/DD'),'289','1','T','4990');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('289',to_date('16/07/25','RR/MM/DD'),'290','1','T','11192');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('290',to_date('16/03/13','RR/MM/DD'),'291','1','T','597');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('291',to_date('16/04/23','RR/MM/DD'),'292','2','N','2036');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('292',to_date('16/09/20','RR/MM/DD'),'293','1','T','912');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('293',to_date('17/01/02','RR/MM/DD'),'294','1','T','5500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('294',to_date('16/05/26','RR/MM/DD'),'295','2','T','384');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('295',to_date('16/12/08','RR/MM/DD'),'296','1','T','155');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('296',to_date('16/12/20','RR/MM/DD'),'297','2','N','13500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('297',to_date('16/09/07','RR/MM/DD'),'298','1','N','14820');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('298',to_date('16/10/20','RR/MM/DD'),'299','1','N','5760');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('299',to_date('16/08/17','RR/MM/DD'),'300','2','N','5032');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('300',to_date('16/09/07','RR/MM/DD'),'301','2','T','2994');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('301',to_date('16/08/22','RR/MM/DD'),'302','1','T','1662');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('302',to_date('16/05/17','RR/MM/DD'),'303','2','T','6638');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('303',to_date('16/10/14','RR/MM/DD'),'304','1','T','13312');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('304',to_date('16/03/06','RR/MM/DD'),'305','2','T','15504');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('305',to_date('16/07/29','RR/MM/DD'),'306','2','T','8070');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('306',to_date('16/03/24','RR/MM/DD'),'307','2','T','11965');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('307',to_date('16/03/08','RR/MM/DD'),'308','2','N','18424');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('308',to_date('16/12/09','RR/MM/DD'),'309','1','N','2350');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('309',to_date('16/08/21','RR/MM/DD'),'310','2','N','9672');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('310',to_date('16/07/25','RR/MM/DD'),'311','1','N','2116');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('311',to_date('16/03/10','RR/MM/DD'),'312','1','N','15854');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('312',to_date('16/03/24','RR/MM/DD'),'313','1','T','9904');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('313',to_date('16/06/18','RR/MM/DD'),'314','2','N','2797');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('314',to_date('17/02/01','RR/MM/DD'),'315','2','N','15934');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('315',to_date('16/08/01','RR/MM/DD'),'316','2','T','1444');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('316',to_date('16/06/07','RR/MM/DD'),'317','1','T','10685');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('317',to_date('17/01/18','RR/MM/DD'),'318','2','T','57794');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('318',to_date('16/10/05','RR/MM/DD'),'319','1','T','4296');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('319',to_date('16/11/10','RR/MM/DD'),'320','1','T','10597');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('320',to_date('16/08/03','RR/MM/DD'),'321','1','T','609');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('321',to_date('16/02/16','RR/MM/DD'),'322','2','T','2283');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('322',to_date('16/08/24','RR/MM/DD'),'323','2','N','5259');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('323',to_date('16/05/06','RR/MM/DD'),'324','1','N','2224');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('324',to_date('16/07/04','RR/MM/DD'),'325','2','N','2535');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('325',to_date('16/07/05','RR/MM/DD'),'326','1','T','13089');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('326',to_date('16/07/19','RR/MM/DD'),'327','2','N','3243');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('327',to_date('16/02/11','RR/MM/DD'),'328','1','T','3973');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('328',to_date('17/01/22','RR/MM/DD'),'329','1','T','4849');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('329',to_date('16/09/08','RR/MM/DD'),'330','2','N','11440');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('330',to_date('16/07/22','RR/MM/DD'),'331','1','T','6738');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('331',to_date('16/12/27','RR/MM/DD'),'332','1','N','25620');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('332',to_date('16/03/24','RR/MM/DD'),'333','2','N','52299');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('333',to_date('16/12/13','RR/MM/DD'),'334','1','T','4447');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('334',to_date('16/03/14','RR/MM/DD'),'335','1','N','3565');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('335',to_date('16/11/07','RR/MM/DD'),'336','1','T','2610');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('336',to_date('16/04/01','RR/MM/DD'),'337','1','T','3408');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('337',to_date('16/09/04','RR/MM/DD'),'338','2','T','3572');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('338',to_date('16/08/15','RR/MM/DD'),'339','1','N','1997');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('339',to_date('16/08/23','RR/MM/DD'),'340','2','N','8499');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('340',to_date('16/11/13','RR/MM/DD'),'341','2','T','7867');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('341',to_date('16/07/13','RR/MM/DD'),'342','1','N','8984');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('342',to_date('16/12/17','RR/MM/DD'),'343','1','T','12377');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('343',to_date('16/09/24','RR/MM/DD'),'344','2','T','7905');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('344',to_date('16/07/08','RR/MM/DD'),'345','2','N','4105');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('345',to_date('16/08/19','RR/MM/DD'),'346','2','T','1274');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('346',to_date('17/01/31','RR/MM/DD'),'347','2','T','3122');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('347',to_date('17/01/31','RR/MM/DD'),'348','1','N','7084');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('348',to_date('16/04/11','RR/MM/DD'),'349','2','N','2557');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('349',to_date('16/04/20','RR/MM/DD'),'350','1','N','1417');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('350',to_date('16/06/20','RR/MM/DD'),'351','2','N','3455');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('351',to_date('16/02/23','RR/MM/DD'),'90','2','T','433');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('352',to_date('16/11/01','RR/MM/DD'),'183','2','N','4795');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('353',to_date('16/03/07','RR/MM/DD'),'117','1','N','1352');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('354',to_date('16/02/15','RR/MM/DD'),'301','2','T','7127');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('355',to_date('17/01/25','RR/MM/DD'),'322','2','T','4196');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('356',to_date('16/07/02','RR/MM/DD'),'107','2','T','3778');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('357',to_date('16/08/28','RR/MM/DD'),'282','2','N','25765');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('358',to_date('16/07/23','RR/MM/DD'),'157','1','N','12580');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('359',to_date('16/06/19','RR/MM/DD'),'52','2','T','13274');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('360',to_date('16/09/15','RR/MM/DD'),'226','1','T','11361');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('361',to_date('16/12/01','RR/MM/DD'),'309','2','N','9821');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('362',to_date('16/05/15','RR/MM/DD'),'186','1','T','7684');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('363',to_date('16/07/18','RR/MM/DD'),'167','1','N','26321');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('364',to_date('16/10/25','RR/MM/DD'),'126','1','N','19220');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('365',to_date('17/01/28','RR/MM/DD'),'34','1','T','3220');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('366',to_date('16/06/23','RR/MM/DD'),'234','1','N','2812');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('367',to_date('17/01/22','RR/MM/DD'),'43','1','N','8026');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('368',to_date('16/06/15','RR/MM/DD'),'75','2','N','1973');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('369',to_date('16/03/07','RR/MM/DD'),'104','2','N','9477');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('370',to_date('16/10/11','RR/MM/DD'),'217','2','T','12579');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('371',to_date('16/11/02','RR/MM/DD'),'127','2','T','2225');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('372',to_date('16/02/17','RR/MM/DD'),'103','1','N','11983');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('373',to_date('16/02/24','RR/MM/DD'),'138','2','N','7840');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('374',to_date('16/02/29','RR/MM/DD'),'170','1','T','23696');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('375',to_date('16/09/05','RR/MM/DD'),'349','1','N','10725');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('376',to_date('16/04/20','RR/MM/DD'),'82','2','N','1490');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('377',to_date('16/06/06','RR/MM/DD'),'100','1','T','11721');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('378',to_date('16/07/18','RR/MM/DD'),'86','2','T','14465');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('379',to_date('16/04/21','RR/MM/DD'),'128','1','N','43970');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('380',to_date('16/05/06','RR/MM/DD'),'79','2','T','823');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('381',to_date('16/03/22','RR/MM/DD'),'349','2','N','9611');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('382',to_date('16/12/12','RR/MM/DD'),'44','2','N','14884');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('383',to_date('16/03/22','RR/MM/DD'),'296','1','T','21315');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('384',to_date('16/04/06','RR/MM/DD'),'273','1','N','1595');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('385',to_date('16/06/25','RR/MM/DD'),'211','1','N','2468');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('386',to_date('16/12/21','RR/MM/DD'),'236','1','N','4937');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('387',to_date('17/02/01','RR/MM/DD'),'241','2','N','2805');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('388',to_date('16/04/07','RR/MM/DD'),'255','2','N','19206');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('389',to_date('16/02/18','RR/MM/DD'),'271','2','N','6696');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('390',to_date('16/09/04','RR/MM/DD'),'253','2','T','6259');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('391',to_date('17/01/20','RR/MM/DD'),'178','2','N','2699');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('392',to_date('17/01/03','RR/MM/DD'),'152','2','N','22100');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('393',to_date('16/04/10','RR/MM/DD'),'317','2','T','5169');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('394',to_date('16/12/02','RR/MM/DD'),'30','1','N','3214');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('395',to_date('16/09/01','RR/MM/DD'),'299','1','T','1711');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('396',to_date('16/07/29','RR/MM/DD'),'141','2','T','6146');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('397',to_date('16/06/01','RR/MM/DD'),'10','1','N','2536');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('398',to_date('16/02/22','RR/MM/DD'),'264','2','N','8594');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('399',to_date('16/07/22','RR/MM/DD'),'81','2','N','21172');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('400',to_date('17/02/04','RR/MM/DD'),'289','1','N','3423');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('401',to_date('16/11/23','RR/MM/DD'),'11','2','N','5091');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('402',to_date('16/12/05','RR/MM/DD'),'197','2','T','26404');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('403',to_date('16/06/07','RR/MM/DD'),'293','1','N','8639');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('404',to_date('16/03/07','RR/MM/DD'),'228','2','T','14663');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('405',to_date('16/09/13','RR/MM/DD'),'156','2','T','9426');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('406',to_date('16/03/25','RR/MM/DD'),'10','2','T','11453');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('407',to_date('16/03/04','RR/MM/DD'),'14','1','T','15537');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('408',to_date('16/03/09','RR/MM/DD'),'85','2','T','52666');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('409',to_date('16/08/16','RR/MM/DD'),'8','1','N','4854');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('410',to_date('16/03/21','RR/MM/DD'),'145','2','N','42291');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('411',to_date('16/05/06','RR/MM/DD'),'300','2','T','4852');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('412',to_date('16/07/24','RR/MM/DD'),'264','1','T','3568');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('413',to_date('16/05/13','RR/MM/DD'),'341','1','T','16173');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('414',to_date('16/12/30','RR/MM/DD'),'168','1','N','28344');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('415',to_date('16/05/04','RR/MM/DD'),'165','2','N','67180');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('416',to_date('16/10/21','RR/MM/DD'),'46','1','T','23358');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('417',to_date('16/08/01','RR/MM/DD'),'245','1','N','2091');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('418',to_date('17/01/27','RR/MM/DD'),'297','1','T','2637');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('419',to_date('17/01/03','RR/MM/DD'),'58','1','N','30642');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('420',to_date('16/02/16','RR/MM/DD'),'163','2','N','4260');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('421',to_date('16/12/15','RR/MM/DD'),'207','2','T','16478');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('422',to_date('16/11/14','RR/MM/DD'),'79','1','N','6956');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('423',to_date('17/01/11','RR/MM/DD'),'184','2','N','26123');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('424',to_date('16/04/03','RR/MM/DD'),'265','2','T','13200');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('425',to_date('16/07/13','RR/MM/DD'),'32','1','T','16485');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('426',to_date('16/07/13','RR/MM/DD'),'135','1','T','12795');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('427',to_date('16/04/23','RR/MM/DD'),'308','1','N','6356');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('428',to_date('16/02/24','RR/MM/DD'),'58','2','T','8873');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('429',to_date('16/10/09','RR/MM/DD'),'67','2','N','2670');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('430',to_date('17/02/03','RR/MM/DD'),'10','2','T','17569');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('431',to_date('16/12/04','RR/MM/DD'),'341','1','T','7544');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('432',to_date('16/10/09','RR/MM/DD'),'304','2','T','3032');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('433',to_date('16/11/08','RR/MM/DD'),'229','1','T','23528');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('434',to_date('16/03/17','RR/MM/DD'),'292','2','T','10600');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('435',to_date('16/12/13','RR/MM/DD'),'187','2','N','9650');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('436',to_date('16/12/15','RR/MM/DD'),'66','1','T','32390');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('437',to_date('16/11/20','RR/MM/DD'),'74','1','T','6892');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('438',to_date('16/12/27','RR/MM/DD'),'198','1','N','1268');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('439',to_date('16/03/11','RR/MM/DD'),'226','2','N','8406');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('440',to_date('16/05/09','RR/MM/DD'),'46','1','N','13960');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('441',to_date('16/06/02','RR/MM/DD'),'175','2','N','19046');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('442',to_date('16/12/24','RR/MM/DD'),'313','1','T','14544');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('443',to_date('17/01/11','RR/MM/DD'),'177','1','T','29783');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('444',to_date('16/04/29','RR/MM/DD'),'183','2','N','19932');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('445',to_date('16/07/11','RR/MM/DD'),'120','2','N','10213');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('446',to_date('16/10/17','RR/MM/DD'),'155','2','T','13730');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('447',to_date('16/11/17','RR/MM/DD'),'152','2','N','6889');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('448',to_date('16/07/29','RR/MM/DD'),'286','2','T','14811');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('449',to_date('16/04/17','RR/MM/DD'),'44','1','N','4113');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('450',to_date('16/09/11','RR/MM/DD'),'143','2','T','6367');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('451',to_date('17/02/05','RR/MM/DD'),'352','2','N','1980');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('452',to_date('17/02/05','RR/MM/DD'),'353','2','T','40');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('453',to_date('17/02/05','RR/MM/DD'),'354','2','N','402');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('454',to_date('17/02/05','RR/MM/DD'),'355','1','N','800');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('455',to_date('17/02/05','RR/MM/DD'),'356','1','N','10500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('456',to_date('17/02/05','RR/MM/DD'),'357','2','T','543');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('457',to_date('17/02/05','RR/MM/DD'),'358','2','T','78');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('458',to_date('17/02/05','RR/MM/DD'),'359','2','N','21');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('459',to_date('17/02/05','RR/MM/DD'),'360','1','T','5500');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('463',to_date('17/02/05','RR/MM/DD'),'364','2','T','1824');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('464',to_date('17/02/05','RR/MM/DD'),'365','2','T','810');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('465',to_date('17/02/05','RR/MM/DD'),'366','1','N','630');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('472',to_date('17/02/05','RR/MM/DD'),'373','2','T','440');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('473',to_date('17/02/05','RR/MM/DD'),'374','2','T','1845');
Insert into RACHUNKI (IDRACHUNKU,DATAZAKUPU,IDKLIENTA,IDPRACOWNIKA,CZYTRANSPORT,CENACALKOWITA) values ('474',to_date('17/02/05','RR/MM/DD'),'375','1','T','110');

Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','210','438','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','293','439','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','270','439','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','40','439','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','40','439','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1050','439','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','228','440','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','199','440','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','67','440','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1482','440','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','369','440','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1100','441','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','369','441','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1100','441','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','135','441','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','210','441','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','135','442','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','64','442','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','67','442','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','40','442','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','2500','442','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','199','443','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1482','443','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','1500','443','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1399','443','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','270','443','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','10','444','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1399','444','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','720','444','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','330','444','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','100','444','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','67','445','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','7','445','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','100','445','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1150','445','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','26','445','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','67','446','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','68','446','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','199','446','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','199','446','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','5500','446','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','210','447','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','7','447','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','26','447','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','700','447','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','55','447','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','100','448','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','67','448','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','135','448','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1050','448','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1399','448','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','270','449','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','401','449','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','35','449','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','135','449','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','110','449','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','7','450','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','629','450','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','200','450','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','26','450','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','40','450','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','330','451','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','10','452','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','67','453','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','100','454','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','1050','455','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','68','456','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','13','457','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','7','458','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','5500','459','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','228','463','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','270','464','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','210','465','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1482','466','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','5500','467','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','10','468','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','110','472','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','369','473','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','55','474','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','401','478','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','35','479','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','100','480','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1050','484','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','825','484','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','5500','484','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','1050','484','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','40','484','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','26','484','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','330','460','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','77','461','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','40','462','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','369','469','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1150','470','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','110','471','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','369','475','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','7','476','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1482','477','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','1399','481','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','13','482','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','401','483','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','110','485','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','55','486','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','293','487','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','369','1','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','293','2','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','330','3','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','55','4','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','720','5','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','10','6','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','720','7','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1482','8','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1399','9','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','199','10','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','110','11','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','210','12','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','68','13','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','270','14','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','100','15','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1050','16','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','35','17','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','35','18','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','40','19','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','559','20','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','2500','21','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','629','22','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','55','23','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','210','24','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','135','25','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','5500','26','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','228','27','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','110','28','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','35','29','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','135','30','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','135','31','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','199','32','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','499','33','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','55','34','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','55','35','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','135','36','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','77','37','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','35','38','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','401','39','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','64','40','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','13','41','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','10','42','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','559','43','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','67','44','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','228','45','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','825','46','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','330','47','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','40','48','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','135','49','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','64','50','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','110','51','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','64','52','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','135','53','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','199','54','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','293','55','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','55','56','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','270','57','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','700','58','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','2500','59','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','200','60','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','40','61','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','228','62','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','13','63','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','700','64','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','55','65','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','720','66','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','200','67','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','629','68','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','2500','69','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','40','70','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','200','71','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','55','72','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','26','73','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','330','74','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','40','75','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1482','76','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','68','77','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','26','78','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','35','79','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','55','80','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','499','81','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','700','82','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','200','83','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1150','84','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','499','85','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','110','86','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','1500','87','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','55','88','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','629','89','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','559','90','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','293','91','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','629','92','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','77','93','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','64','94','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','2500','95','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','5500','96','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','5500','97','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','35','98','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','5500','99','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','210','100','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','67','101','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','26','102','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','64','103','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','2500','104','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','110','105','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','2500','106','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','200','107','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','5500','108','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','339','109','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','720','110','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','559','111','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','559','112','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','339','113','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1482','114','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','629','115','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','10','116','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','35','117','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','55','118','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','293','119','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','369','120','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','629','121','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','629','122','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','825','123','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','10','124','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','499','125','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','330','126','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','100','127','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','1482','128','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','1399','129','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','270','130','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','339','131','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','40','132','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','720','133','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','110','134','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','369','135','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','720','136','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','35','137','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','40','138','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','100','139','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','629','140','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','270','141','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1500','142','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','210','143','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','7','144','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','1399','145','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1399','146','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','135','147','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','110','148','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1399','149','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','55','150','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','55','151','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','67','152','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1500','153','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1500','154','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','401','155','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','67','156','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','1150','157','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','135','158','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','1500','159','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','720','160','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','13','161','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','100','162','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','293','163','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','330','164','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','40','165','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','35','166','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','720','167','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1482','168','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','330','169','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','825','170','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','55','171','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','1500','172','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1100','173','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','5500','174','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','228','175','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','100','176','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','825','177','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','210','178','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','64','179','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','5500','180','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','700','181','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','7','182','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','270','183','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','200','184','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','499','185','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','26','186','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','68','187','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','64','188','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','210','189','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','55','190','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','270','191','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1399','192','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','293','193','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','55','194','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1500','195','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1482','196','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','100','197','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','559','198','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','293','199','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','199','200','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','293','201','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','40','202','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','499','203','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','200','204','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','700','205','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1050','206','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','110','207','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','26','208','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','35','209','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','499','210','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','499','211','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','330','212','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','293','213','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','10','214','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','2500','215','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','67','216','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','293','217','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1150','218','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','499','219','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1050','220','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','401','221','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','7','222','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','35','223','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','26','224','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','55','225','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1399','226','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','26','227','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','1482','228','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','330','229','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1399','230','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','77','231','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','270','232','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','7','233','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','68','234','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','7','235','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','401','236','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','2500','237','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','499','238','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','369','239','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','67','240','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','10','241','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','700','242','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','5500','243','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1399','244','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','77','245','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','700','246','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1500','247','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','499','248','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1500','249','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','2500','250','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','720','251','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','293','252','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','825','253','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','55','254','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','77','255','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','1150','256','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','330','257','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','199','258','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','135','259','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','293','260','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','40','261','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1100','262','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','110','263','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1100','264','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','339','265','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','100','266','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','700','267','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','135','268','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','67','269','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','825','270','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','401','271','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','135','272','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','135','273','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','55','274','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','5500','275','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','35','276','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','1482','277','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','26','278','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','55','279','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','68','280','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','200','281','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','559','282','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1482','283','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','720','284','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','825','285','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','55','286','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','5500','287','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','499','288','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1399','289','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','199','290','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','339','291','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','228','292','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','1100','293','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','64','294','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','26','295','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','1500','296','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','1482','297','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','720','298','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','629','299','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','499','300','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','1482','301','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','10','301','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','40','301','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','339','302','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','369','302','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','270','302','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','499','303','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1100','303','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','270','303','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','700','304','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','2500','304','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','401','304','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1050','305','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','64','305','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','629','305','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','2500','306','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','67','306','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','339','306','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1482','307','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1150','307','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1150','307','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','35','308','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','110','308','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','210','308','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','210','309','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','369','309','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','720','309','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','10','310','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','339','310','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','10','310','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1050','311','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','55','311','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1399','311','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','135','312','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1150','312','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','559','312','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','64','313','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','339','313','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','55','313','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','135','314','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1399','314','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','700','314','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','55','315','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','77','315','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','210','315','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','559','316','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','270','316','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','720','316','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','5500','317','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','26','317','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','330','317','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','559','318','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','40','318','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','10','318','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','200','319','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1150','319','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1399','319','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','26','320','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','10','320','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','64','320','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','339','321','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','55','321','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','67','321','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','330','322','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1482','322','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','35','322','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','330','323','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','64','323','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','1500','323','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','55','324','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','210','324','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','200','324','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1500','325','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','10','325','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','135','325','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','13','326','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','26','326','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','720','326','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','825','327','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','499','327','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','228','327','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','629','328','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','26','328','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1050','328','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1050','329','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','499','329','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','330','329','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','700','330','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','10','330','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','199','330','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','2500','331','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','64','331','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','100','331','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','2500','332','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','700','332','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','5500','332','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','369','333','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','10','438','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','67','438','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','55','438','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1050','333','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','559','333','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','100','334','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','629','334','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','55','334','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1050','335','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','40','335','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','135','335','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','77','336','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','330','336','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','559','336','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','559','337','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','55','337','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','67','337','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','210','338','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','40','338','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','68','338','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','720','339','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','825','339','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','293','339','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','199','340','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','825','340','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','67','340','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','68','341','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','293','341','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1050','341','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','210','342','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1150','342','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','499','342','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','210','343','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','629','343','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','228','343','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','35','344','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','369','344','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','55','344','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','135','345','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','55','345','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','110','345','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','35','346','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','720','346','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','228','346','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','200','347','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','64','347','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1050','347','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','110','348','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','228','348','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','35','348','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','200','349','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','26','349','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','68','349','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','200','350','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','199','350','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','64','350','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','26','351','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','68','351','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','55','351','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','200','352','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','499','352','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','700','352','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','77','353','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','10','353','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','200','353','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','293','354','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1482','354','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','40','354','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','100','355','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','199','355','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','401','355','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','293','356','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','330','356','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','40','356','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','5500','357','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1150','357','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','293','357','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1399','358','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','210','358','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','64','358','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','135','359','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','700','359','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1050','359','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','629','360','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1500','360','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','200','360','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1500','361','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','7','361','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','100','361','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','1150','362','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','135','362','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','330','362','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1100','363','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','2500','363','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','7','363','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','700','364','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','1399','364','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','270','364','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1500','365','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','40','365','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','10','365','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','67','366','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','293','366','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','100','366','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','339','367','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','629','367','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','1150','367','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','199','368','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','67','368','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','210','368','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','77','369','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1100','369','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','700','369','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','2500','370','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','135','370','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','1500','370','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','330','371','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','369','371','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','67','371','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','13','372','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','401','372','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','1100','372','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','100','373','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','700','373','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','64','373','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','100','374','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','2500','374','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1399','374','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','199','375','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1399','375','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','135','375','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','40','376','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','100','376','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','210','376','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1482','377','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','629','377','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1100','377','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','199','378','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','68','378','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1500','378','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','2500','379','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','5500','379','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','210','379','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','64','380','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','13','380','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','200','380','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1150','381','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','330','381','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','401','381','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','228','382','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','629','382','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','5500','382','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','7','383','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','210','383','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','2500','383','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','55','384','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','330','384','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','55','384','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','77','385','9');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','559','385','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','559','385','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','270','386','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','559','386','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','135','386','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','270','387','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','10','387','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','499','387','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','700','388','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','401','388','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','1500','388','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','64','389','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','228','389','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','700','389','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','26','390','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','26','390','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1500','390','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','369','391','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','210','391','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','293','391','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','1500','392','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','1399','392','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','629','392','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','700','393','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','293','393','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','401','393','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1482','394','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','55','394','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','10','394','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','13','395','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','700','395','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','26','395','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','228','396','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','629','396','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','64','396','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','40','397','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','199','397','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','55','397','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1100','398','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','199','398','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','200','398','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','1100','399','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','40','399','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1399','399','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','100','400','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','401','400','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','13','400','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','401','401','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','200','401','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','13','401','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','68','401','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','210','401','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','401','402','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','629','402','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','135','402','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','5500','402','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1050','402','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','10','403','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','199','403','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','1482','403','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','100','403','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','55','403','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','330','404','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','55','404','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','559','404','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','5500','404','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','100','404','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','55','405','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','559','405','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1100','405','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','369','405','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','270','405','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','1500','406','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','210','406','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','559','406','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','55','406','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','210','406','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','700','407','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','720','407','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','26','407','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','1482','407','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','200','407','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','5500','408','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','10','408','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','293','408','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','100','408','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','228','408','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','293','409','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','135','409','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','68','409','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','339','409','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','67','409','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','629','410','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','825','410','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','2500','410','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','293','410','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1399','410','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','55','411','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','110','411','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','10','411','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','499','411','31');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','67','411','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','135','412','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','26','412','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','339','412','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','35','412','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','55','412','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','40','413','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1500','413','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1399','413','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','369','413','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','68','413','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1500','414','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','401','414','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','559','414','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','110','414','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','2500','414','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','1150','415','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','700','415','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','35','415','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','5500','415','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','13','415','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','369','416','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','40','416','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','2500','416','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','55','416','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1150','416','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','67','417','29');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','10','417','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','210','417','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','135','417','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','7','417','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','26','418','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','55','418','28');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','10','418','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','100','418','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','825','418','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1050','419','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1399','419','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1100','419','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1100','419','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','135','419','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','369','420','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','270','420','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','64','420','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','135','420','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','68','420','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','135','421','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','720','421','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','339','421','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','629','421','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1100','421','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1399','422','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','7','422','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','110','422','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','293','422','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','40','422','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1500','423','37');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','35','423','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','35','423','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','1482','423','7');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','100','423','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','720','424','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','10','424','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','330','424','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','210','424','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','825','424','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','64','425','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','369','425','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','1050','425','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','55','425','27');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','1150','425','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1050','426','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','270','426','25');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','228','426','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','559','426','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','100','426','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','369','427','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','369','427','32');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','330','427','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','200','427','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','228','427','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','35','428','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','339','428','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','1100','428','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','559','428','40');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','26','428','12');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','7','429','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','228','429','5');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','7','429','26');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','64','429','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','200','429','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','5500','430','38');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','339','430','1');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','720','430','36');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','200','430','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','210','430','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','1399','431','17');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','110','431','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('10','13','431','16');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','64','431','18');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','210','431','24');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','700','432','4');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','135','432','11');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','100','432','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('9','10','432','30');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','68','432','15');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','293','433','2');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','825','433','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','2500','433','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','629','433','33');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','199','433','10');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','200','434','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','330','434','19');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','40','434','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','1100','434','8');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','135','434','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('1','1050','435','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','825','435','34');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1050','435','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('3','110','435','14');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','40','435','22');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','100','436','13');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','1150','436','35');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('4','35','436','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','1050','436','6');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','2500','436','39');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('5','401','437','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','35','437','20');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('6','200','437','23');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('2','135','437','21');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('8','401','437','3');
Insert into RACHUNEK_POZ (ILOSC,CENAPOZYCJI,IDRACHUNKU,IDPRODUKTU) values ('7','26','438','12');

Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('244','173','ul. Brzozowa 76 Gdansk',to_date('17/02/22','RR/MM/DD'),'478','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('233','241','ul. Szkolna 42 Gdansk',to_date('17/02/10','RR/MM/DD'),'461','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('234','153','ul. Polna 86 Krakow',to_date('17/02/13','RR/MM/DD'),'462','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('237','47','ul. Ogrodowa 15 Elk',to_date('17/02/19','RR/MM/DD'),'470','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('238','62','ul. Polna 53 Katowice',to_date('17/02/20','RR/MM/DD'),'471','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('242','51','ul. Ogrodowa 111 Bialystok',to_date('17/02/17','RR/MM/DD'),'475','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('243','118','Suska52 Bialystok',to_date('17/02/19','RR/MM/DD'),'476','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('245','154','ul. Kwiatowa 48 Bialystok',to_date('17/02/12','RR/MM/DD'),'481','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('246','169','ul. Sloneczna 102 Bialystok',to_date('17/02/25','RR/MM/DD'),'483','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('1','176','ul. Kwiatowa 64 Poznan',to_date('16/11/08','RR/MM/DD'),'1','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('2','190','ul. Ogrodowa 79 Olsztyn',to_date('16/08/06','RR/MM/DD'),'3','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('3','224','ul. Sloneczna 134 Krakow',to_date('17/02/18','RR/MM/DD'),'5','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('4','194','ul. Krotka 45 Bialystok',to_date('16/04/27','RR/MM/DD'),'7','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('5','244','ul. Brzozowa 102 Poznan',to_date('16/09/06','RR/MM/DD'),'9','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('6','107','ul. Krotka 23 Gdansk',to_date('16/07/02','RR/MM/DD'),'14','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('7','255','ul. Sloneczna 46 Olsztyn',to_date('16/12/28','RR/MM/DD'),'18','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('8','126','ul. Polna 110 Olsztyn',to_date('16/07/28','RR/MM/DD'),'19','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('9','78','ul. Krotka 25 Olsztyn',to_date('16/12/27','RR/MM/DD'),'20','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('10','24','ul. Ogrodowa 136 Wroclaw',to_date('16/05/09','RR/MM/DD'),'21','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('11','146','ul. Kwiatowa 10 Elk',to_date('17/02/12','RR/MM/DD'),'22','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('12','246','ul. Sloneczna 125 Rzeszow',to_date('16/08/10','RR/MM/DD'),'23','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('13','58','ul. Polna 22 Bialystok',to_date('16/11/16','RR/MM/DD'),'27','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('14','41','ul. Lesna 26 Poznan',to_date('16/05/29','RR/MM/DD'),'28','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('15','61','ul. Krotka 95 Warszawa',to_date('16/11/10','RR/MM/DD'),'30','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('16','242','ul. Ogrodowa 68 Wroclaw',to_date('16/05/01','RR/MM/DD'),'33','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('17','88','ul. Krotka 72 Katowice',to_date('17/02/02','RR/MM/DD'),'35','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('18','207','ul. Lipowa 125 Krakow',to_date('16/10/23','RR/MM/DD'),'37','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('19','213','ul. Lipowa 30 Poznan',to_date('16/05/20','RR/MM/DD'),'39','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('20','72','ul. Lesna 102 Wroclaw',to_date('17/01/25','RR/MM/DD'),'40','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('21','161','ul. Szkolna 59 Bialystok',to_date('17/01/23','RR/MM/DD'),'42','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('22','190','ul. Lipowa 18 Gdansk',to_date('16/06/18','RR/MM/DD'),'43','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('23','103','ul. Sloneczna 23 Bialystok',to_date('16/10/19','RR/MM/DD'),'44','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('24','92','ul. Krotka 124 Wroclaw',to_date('16/11/20','RR/MM/DD'),'45','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('25','106','ul. Ogrodowa 85 Gdansk',to_date('16/08/02','RR/MM/DD'),'46','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('26','44','ul. Szkolna 51 Bialystok',to_date('16/12/06','RR/MM/DD'),'48','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('27','46','ul. Sloneczna 22 Poznan',to_date('16/12/11','RR/MM/DD'),'49','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('28','72','ul. Sloneczna 68 Krakow',to_date('16/11/23','RR/MM/DD'),'50','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('29','160','ul. Sloneczna 59 Katowice',to_date('16/12/13','RR/MM/DD'),'52','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('30','239','Suska36 Elk',to_date('16/05/14','RR/MM/DD'),'53','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('31','231','ul. Krotka 70 Krakow',to_date('16/07/15','RR/MM/DD'),'60','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('32','126','ul. Polna 147 Poznan',to_date('16/06/19','RR/MM/DD'),'62','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('33','176','ul. Brzozowa 19 Warszawa',to_date('16/03/29','RR/MM/DD'),'63','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('34','86','ul. Szkolna 135 Poznan',to_date('16/04/26','RR/MM/DD'),'66','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('35','191','ul. Sloneczna 134 Olsztyn',to_date('16/04/18','RR/MM/DD'),'67','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('36','97','ul. Lesna 62 Katowice',to_date('16/06/02','RR/MM/DD'),'68','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('37','60','ul. Lipowa 109 Krakow',to_date('16/10/31','RR/MM/DD'),'69','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('38','128','ul. Ogrodowa 123 Katowice',to_date('16/04/13','RR/MM/DD'),'70','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('39','285','ul. Polna 27 Warszawa',to_date('16/02/24','RR/MM/DD'),'71','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('40','82','ul. Lipowa 105 Katowice',to_date('16/06/08','RR/MM/DD'),'72','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('41','94','ul. Sloneczna 44 Gdansk',to_date('16/06/08','RR/MM/DD'),'74','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('42','248','ul. Polna 13 Krakow',to_date('16/07/09','RR/MM/DD'),'75','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('43','101','ul. Ogrodowa 24 Bialystok',to_date('16/07/09','RR/MM/DD'),'76','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('44','116','ul. Sloneczna 95 Wroclaw',to_date('16/06/09','RR/MM/DD'),'80','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('45','231','ul. Krotka 85 Poznan',to_date('16/12/04','RR/MM/DD'),'81','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('46','152','ul. Lesna 80 Warszawa',to_date('17/01/10','RR/MM/DD'),'83','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('47','145','ul. Polna 60 Poznan',to_date('16/08/16','RR/MM/DD'),'84','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('48','254','ul. Lesna 126 Wroclaw',to_date('16/07/11','RR/MM/DD'),'89','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('49','90','ul. Brzozowa 126 Katowice',to_date('17/01/12','RR/MM/DD'),'90','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('50','293','ul. Brzozowa 20 Krakow',to_date('16/03/10','RR/MM/DD'),'93','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('51','196','ul. Sloneczna 145 Krakow',to_date('16/12/25','RR/MM/DD'),'95','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('52','149','ul. Lesna 71 Wroclaw',to_date('16/12/22','RR/MM/DD'),'97','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('53','25','ul. Lipowa 74 Gdansk',to_date('16/06/27','RR/MM/DD'),'99','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('54','153','ul. Polna 8 Rzeszow',to_date('16/03/18','RR/MM/DD'),'100','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('55','24','ul. Ogrodowa 48 Bialystok',to_date('16/06/05','RR/MM/DD'),'102','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('56','66','ul. Lipowa 9 Warszawa',to_date('16/09/04','RR/MM/DD'),'103','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('57','203','ul. Lipowa 57 Wroclaw',to_date('17/01/14','RR/MM/DD'),'104','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('58','267','ul. Lesna 94 Warszawa',to_date('17/01/17','RR/MM/DD'),'105','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('59','286','ul. Polna 22 Gdansk',to_date('16/10/22','RR/MM/DD'),'107','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('60','205','ul. Lesna 148 Olsztyn',to_date('16/03/26','RR/MM/DD'),'108','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('61','43','ul. Szkolna 10 Wroclaw',to_date('16/09/30','RR/MM/DD'),'110','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('62','27','ul. Lesna 23 Katowice',to_date('17/02/04','RR/MM/DD'),'111','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('63','292','ul. Ogrodowa 78 Warszawa',to_date('17/01/31','RR/MM/DD'),'112','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('64','172','ul. Sloneczna 104 Gdansk',to_date('16/07/25','RR/MM/DD'),'115','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('65','267','ul. Sloneczna 23 Poznan',to_date('16/10/08','RR/MM/DD'),'116','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('66','26','ul. Polna 32 Olsztyn',to_date('16/11/11','RR/MM/DD'),'119','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('67','81','ul. Polna 78 Wroclaw',to_date('17/01/22','RR/MM/DD'),'120','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('68','280','ul. Szkolna 135 Rzeszow',to_date('16/11/21','RR/MM/DD'),'121','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('69','123','ul. Szkolna 138 Krakow',to_date('16/12/25','RR/MM/DD'),'126','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('70','116','ul. Krotka 121 Gdansk',to_date('16/07/14','RR/MM/DD'),'131','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('71','23','ul. Lipowa 49 Bialystok',to_date('16/11/12','RR/MM/DD'),'132','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('72','201','ul. Ogrodowa 45 Olsztyn',to_date('17/01/07','RR/MM/DD'),'134','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('73','281','ul. Polna 101 Poznan',to_date('16/07/10','RR/MM/DD'),'135','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('74','195','ul. Krotka 143 Warszawa',to_date('16/06/03','RR/MM/DD'),'136','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('75','245','ul. Brzozowa 137 Wroclaw',to_date('16/08/07','RR/MM/DD'),'138','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('76','85','ul. Kwiatowa 109 Katowice',to_date('17/01/16','RR/MM/DD'),'139','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('77','280','ul. Lesna 124 Gdansk',to_date('16/02/12','RR/MM/DD'),'140','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('78','107','ul. Szkolna 3 Katowice',to_date('16/04/17','RR/MM/DD'),'143','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('79','82','ul. Brzozowa 42 Poznan',to_date('16/05/27','RR/MM/DD'),'146','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('80','91','ul. Ogrodowa 83 Gdansk',to_date('16/10/27','RR/MM/DD'),'147','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('81','269','ul. Krotka 57 Rzeszow',to_date('16/12/29','RR/MM/DD'),'148','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('82','63','ul. Ogrodowa 67 Wroclaw',to_date('16/12/16','RR/MM/DD'),'149','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('83','113','ul. Sloneczna 86 Gdansk',to_date('16/12/03','RR/MM/DD'),'150','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('84','46','ul. Lesna 37 Poznan',to_date('16/06/30','RR/MM/DD'),'153','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('85','260','ul. Szkolna 98 Krakow',to_date('16/04/15','RR/MM/DD'),'155','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('86','265','ul. Lesna 81 Elk',to_date('16/06/18','RR/MM/DD'),'156','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('87','279','ul. Szkolna 70 Poznan',to_date('16/06/13','RR/MM/DD'),'157','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('88','234','ul. Brzozowa 97 Wroclaw',to_date('16/10/15','RR/MM/DD'),'161','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('89','59','ul. Sloneczna 10 Bialystok',to_date('16/07/08','RR/MM/DD'),'162','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('90','251','ul. Krotka 22 Bialystok',to_date('16/04/04','RR/MM/DD'),'164','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('91','245','ul. Szkolna 55 Elk',to_date('16/04/21','RR/MM/DD'),'165','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('92','237','ul. Szkolna 89 Warszawa',to_date('16/08/12','RR/MM/DD'),'166','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('93','64','ul. Sloneczna 30 Krakow',to_date('16/09/29','RR/MM/DD'),'168','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('94','217','ul. Sloneczna 114 Rzeszow',to_date('16/04/16','RR/MM/DD'),'170','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('95','216','ul. Kwiatowa 147 Wroclaw',to_date('17/01/08','RR/MM/DD'),'171','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('96','114','ul. Szkolna 81 Wroclaw',to_date('17/02/10','RR/MM/DD'),'177','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('97','254','ul. Kwiatowa 12 Elk',to_date('16/09/20','RR/MM/DD'),'179','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('98','257','ul. Kwiatowa 16 Bialystok',to_date('16/02/27','RR/MM/DD'),'180','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('99','152','ul. Polna 82 Warszawa',to_date('16/12/22','RR/MM/DD'),'182','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('100','227','ul. Szkolna 99 Katowice',to_date('16/04/24','RR/MM/DD'),'187','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('101','137','ul. Szkolna 116 Krakow',to_date('16/10/06','RR/MM/DD'),'188','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('102','257','ul. Lipowa 119 Bialystok',to_date('16/08/20','RR/MM/DD'),'189','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('103','68','ul. Ogrodowa 119 Wroclaw',to_date('16/08/10','RR/MM/DD'),'190','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('104','96','ul. Brzozowa 127 Olsztyn',to_date('17/01/24','RR/MM/DD'),'192','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('105','150','ul. Lesna 57 Warszawa',to_date('16/11/25','RR/MM/DD'),'193','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('106','144','ul. Kwiatowa 116 Rzeszow',to_date('17/03/01','RR/MM/DD'),'195','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('107','227','ul. Lesna 121 Wroclaw',to_date('16/04/09','RR/MM/DD'),'198','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('108','66','ul. Szkolna 76 Warszawa',to_date('16/09/04','RR/MM/DD'),'202','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('109','168','ul. Lipowa 93 Elk',to_date('16/10/27','RR/MM/DD'),'204','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('110','85','ul. Brzozowa 53 Katowice',to_date('16/12/09','RR/MM/DD'),'205','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('111','214','ul. Lipowa 18 Olsztyn',to_date('16/02/28','RR/MM/DD'),'207','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('112','50','ul. Sloneczna 110 Katowice',to_date('16/06/21','RR/MM/DD'),'208','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('113','222','ul. Kwiatowa 52 Krakow',to_date('16/09/12','RR/MM/DD'),'210','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('114','159','ul. Krotka 125 Warszawa',to_date('16/08/09','RR/MM/DD'),'211','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('115','130','ul. Lipowa 105 Elk',to_date('16/07/17','RR/MM/DD'),'212','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('116','63','ul. Ogrodowa 23 Gdansk',to_date('16/04/28','RR/MM/DD'),'215','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('117','39','ul. Krotka 49 Krakow',to_date('16/12/14','RR/MM/DD'),'216','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('118','279','ul. Sloneczna 53 Gdansk',to_date('17/01/23','RR/MM/DD'),'217','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('119','31','ul. Ogrodowa 123 Warszawa',to_date('17/01/17','RR/MM/DD'),'219','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('120','199','ul. Lesna 60 Poznan',to_date('16/04/01','RR/MM/DD'),'221','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('121','120','ul. Ogrodowa 17 Warszawa',to_date('16/12/23','RR/MM/DD'),'222','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('122','51','ul. Lipowa 22 Elk',to_date('16/12/07','RR/MM/DD'),'224','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('123','252','ul. Brzozowa 113 Krakow',to_date('16/06/10','RR/MM/DD'),'227','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('124','31','ul. Lipowa 87 Olsztyn',to_date('16/07/30','RR/MM/DD'),'231','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('125','123','ul. Szkolna 21 Wroclaw',to_date('16/10/08','RR/MM/DD'),'237','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('126','25','ul. Ogrodowa 146 Bialystok',to_date('16/02/17','RR/MM/DD'),'238','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('127','71','ul. Szkolna 99 Bialystok',to_date('16/08/31','RR/MM/DD'),'240','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('128','36','ul. Szkolna 63 Katowice',to_date('16/08/18','RR/MM/DD'),'241','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('129','131','ul. Szkolna 87 Bialystok',to_date('17/02/12','RR/MM/DD'),'246','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('130','60','ul. Sloneczna 128 Elk',to_date('16/03/13','RR/MM/DD'),'249','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('131','256','ul. Sloneczna 121 Warszawa',to_date('17/01/04','RR/MM/DD'),'250','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('132','115','ul. Krotka 94 Wroclaw',to_date('16/04/09','RR/MM/DD'),'252','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('133','37','ul. Sloneczna 12 Bialystok',to_date('16/03/14','RR/MM/DD'),'254','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('134','118','ul. Lesna 130 Poznan',to_date('16/12/08','RR/MM/DD'),'256','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('135','286','Suska144 Elk',to_date('16/10/07','RR/MM/DD'),'258','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('136','185','ul. Brzozowa 113 Bialystok',to_date('16/04/29','RR/MM/DD'),'259','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('137','134','ul. Sloneczna 11 Katowice',to_date('16/11/15','RR/MM/DD'),'261','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('138','34','ul. Kwiatowa 103 Gdansk',to_date('16/07/01','RR/MM/DD'),'264','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('139','169','ul. Brzozowa 147 Krakow',to_date('16/06/22','RR/MM/DD'),'265','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('140','265','ul. Lesna 119 Bialystok',to_date('17/02/25','RR/MM/DD'),'267','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('141','145','ul. Kwiatowa 95 Katowice',to_date('16/06/12','RR/MM/DD'),'268','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('142','141','ul. Krotka 44 Wroclaw',to_date('16/06/09','RR/MM/DD'),'269','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('143','219','ul. Szkolna 67 Olsztyn',to_date('16/08/23','RR/MM/DD'),'278','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('144','85','ul. Lesna 69 Katowice',to_date('16/08/08','RR/MM/DD'),'280','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('145','132','ul. Polna 142 Wroclaw',to_date('16/08/20','RR/MM/DD'),'281','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('146','198','Suska66 Poznan',to_date('16/11/15','RR/MM/DD'),'285','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('230','57','ul. Krotka 70 Gdansk',to_date('17/03/06','RR/MM/DD'),'456','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('231','298','ul. Lipowa 36 Wroclaw',to_date('17/02/05','RR/MM/DD'),'457','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('147','41','ul. Szkolna 20 Warszawa',to_date('16/03/23','RR/MM/DD'),'288','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('148','151','ul. Krotka 124 Katowice',to_date('16/08/15','RR/MM/DD'),'289','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('149','166','ul. Sloneczna 77 Krakow',to_date('16/04/12','RR/MM/DD'),'290','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('150','59','ul. Polna 141 Krakow',to_date('16/10/11','RR/MM/DD'),'292','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('151','127','ul. Lesna 17 Krakow',to_date('17/01/26','RR/MM/DD'),'293','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('152','64','ul. Ogrodowa 81 Gdansk',to_date('16/05/30','RR/MM/DD'),'294','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('153','130','ul. Lipowa 64 Rzeszow',to_date('16/12/18','RR/MM/DD'),'295','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('154','210','ul. Lipowa 13 Elk',to_date('16/09/30','RR/MM/DD'),'300','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('155','277','ul. Kwiatowa 145 Bialystok',to_date('16/08/29','RR/MM/DD'),'301','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('156','290','ul. Krotka 107 Krakow',to_date('16/06/07','RR/MM/DD'),'302','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('157','249','ul. Szkolna 9 Warszawa',to_date('16/10/19','RR/MM/DD'),'303','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('158','217','ul. Lipowa 43 Katowice',to_date('16/03/14','RR/MM/DD'),'304','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('159','200','ul. Krotka 43 Gdansk',to_date('16/08/17','RR/MM/DD'),'305','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('160','53','ul. Kwiatowa 59 Wroclaw',to_date('16/04/04','RR/MM/DD'),'306','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('161','198','ul. Krotka 16 Poznan',to_date('16/04/14','RR/MM/DD'),'312','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('162','182','ul. Krotka 25 Warszawa',to_date('16/08/09','RR/MM/DD'),'315','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('163','158','ul. Brzozowa 130 Katowice',to_date('16/06/23','RR/MM/DD'),'316','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('164','147','ul. Brzozowa 56 Warszawa',to_date('17/01/25','RR/MM/DD'),'317','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('165','136','Suska114 Poznan',to_date('16/10/30','RR/MM/DD'),'318','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('166','75','ul. Lipowa 56 Wroclaw',to_date('16/11/24','RR/MM/DD'),'319','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('167','297','Suska36 Krakow',to_date('16/08/16','RR/MM/DD'),'320','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('168','234','ul. Lipowa 59 Gdansk',to_date('16/03/03','RR/MM/DD'),'321','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('169','259','ul. Szkolna 136 Gdansk',to_date('16/07/25','RR/MM/DD'),'325','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('170','138','ul. Kwiatowa 93 Bialystok',to_date('16/03/10','RR/MM/DD'),'327','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('171','26','ul. Kwiatowa 108 Warszawa',to_date('17/02/03','RR/MM/DD'),'328','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('172','220','ul. Sloneczna 56 Poznan',to_date('16/07/27','RR/MM/DD'),'330','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('173','191','ul. Lesna 48 Poznan',to_date('16/12/31','RR/MM/DD'),'333','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('174','257','ul. Polna 98 Gdansk',to_date('16/12/03','RR/MM/DD'),'335','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('175','24','Suska136 Olsztyn',to_date('16/04/08','RR/MM/DD'),'336','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('176','299','ul. Ogrodowa 44 Gdansk',to_date('16/09/13','RR/MM/DD'),'337','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('177','256','ul. Polna 129 Bialystok',to_date('16/11/14','RR/MM/DD'),'340','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('178','176','ul. Polna 68 Gdansk',to_date('16/12/22','RR/MM/DD'),'342','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('179','187','ul. Polna 101 Krakow',to_date('16/10/16','RR/MM/DD'),'343','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('180','217','ul. Lesna 6 Wroclaw',to_date('16/09/12','RR/MM/DD'),'345','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('181','34','ul. Szkolna 138 Wroclaw',to_date('17/02/24','RR/MM/DD'),'346','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('182','104','ul. Lesna 126 Wroclaw',to_date('16/02/29','RR/MM/DD'),'351','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('183','191','ul. Lipowa 13 Elk',to_date('16/02/16','RR/MM/DD'),'354','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('184','296','ul. Lipowa 59 Gdansk',to_date('17/02/16','RR/MM/DD'),'355','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('185','30','ul. Szkolna 29 Gdansk',to_date('16/07/21','RR/MM/DD'),'356','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('186','118','ul. Szkolna 100 Bialystok',to_date('16/07/13','RR/MM/DD'),'359','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('187','83','ul. Lipowa 134 Krakow',to_date('16/09/21','RR/MM/DD'),'360','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('188','27','ul. Kwiatowa 4 Gdansk',to_date('16/05/23','RR/MM/DD'),'362','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('189','183','ul. Ogrodowa 68 Wroclaw',to_date('17/02/10','RR/MM/DD'),'365','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('190','206','ul. Krotka 49 Krakow',to_date('16/10/31','RR/MM/DD'),'370','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('191','111','ul. Szkolna 138 Krakow',to_date('16/11/09','RR/MM/DD'),'371','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('192','140','ul. Szkolna 147 Poznan',to_date('16/03/17','RR/MM/DD'),'374','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('193','85','ul. Lipowa 74 Gdansk',to_date('16/06/25','RR/MM/DD'),'377','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('194','109','ul. Krotka 74 Wroclaw',to_date('16/07/21','RR/MM/DD'),'378','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('195','211','ul. Krotka 2 Katowice',to_date('16/05/24','RR/MM/DD'),'380','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('196','41','ul. Lipowa 64 Rzeszow',to_date('16/03/27','RR/MM/DD'),'383','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('197','77','ul. Krotka 94 Wroclaw',to_date('16/09/09','RR/MM/DD'),'390','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('198','116','ul. Brzozowa 130 Katowice',to_date('16/04/13','RR/MM/DD'),'393','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('199','39','ul. Lipowa 70 Olsztyn',to_date('16/09/05','RR/MM/DD'),'395','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('200','273','ul. Lesna 124 Gdansk',to_date('16/08/01','RR/MM/DD'),'396','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('201','160','ul. Krotka 88 Elk',to_date('16/12/29','RR/MM/DD'),'402','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('202','268','ul. Brzozowa 113 Krakow',to_date('16/03/09','RR/MM/DD'),'404','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('203','114','ul. Szkolna 98 Krakow',to_date('16/10/01','RR/MM/DD'),'405','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('204','258','ul. Brzozowa 102 Poznan',to_date('16/04/14','RR/MM/DD'),'406','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('205','181','ul. Brzozowa 102 Katowice',to_date('16/03/22','RR/MM/DD'),'407','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('206','290','ul. Polna 60 Poznan',to_date('16/03/11','RR/MM/DD'),'408','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('207','137','ul. Szkolna 78 Poznan',to_date('16/05/17','RR/MM/DD'),'411','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('208','116','ul. Krotka 89 Poznan',to_date('16/08/14','RR/MM/DD'),'412','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('209','299','ul. Polna 129 Bialystok',to_date('16/05/19','RR/MM/DD'),'413','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('210','189','ul. Krotka 124 Wroclaw',to_date('16/11/02','RR/MM/DD'),'416','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('211','38','ul. Ogrodowa 18 Krakow',to_date('17/02/01','RR/MM/DD'),'418','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('212','53','ul. Polna 20 Katowice',to_date('16/12/31','RR/MM/DD'),'421','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('213','117','ul. Kwiatowa 103 Gdansk',to_date('16/04/05','RR/MM/DD'),'424','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('214','287','Suska51 Katowice',to_date('16/08/01','RR/MM/DD'),'425','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('215','72','ul. Ogrodowa 45 Olsztyn',to_date('16/08/10','RR/MM/DD'),'426','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('216','244','ul. Krotka 23 Wroclaw',to_date('16/03/06','RR/MM/DD'),'428','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('217','118','ul. Brzozowa 102 Poznan',to_date('17/02/09','RR/MM/DD'),'430','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('218','88','ul. Polna 129 Bialystok',to_date('16/12/23','RR/MM/DD'),'431','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('219','231','ul. Szkolna 9 Warszawa',to_date('16/11/07','RR/MM/DD'),'432','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('220','56','ul. Lesna 31 Wroclaw',to_date('16/11/19','RR/MM/DD'),'433','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('221','273','ul. Szkolna 73 Wroclaw',to_date('16/04/09','RR/MM/DD'),'434','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('222','176','ul. Ogrodowa 104 Olsztyn',to_date('16/12/31','RR/MM/DD'),'436','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('223','291','ul. Lipowa 109 Wroclaw',to_date('16/11/29','RR/MM/DD'),'437','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('224','93','ul. Krotka 16 Poznan',to_date('17/01/18','RR/MM/DD'),'442','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('225','165','ul. Sloneczna 55 Wroclaw',to_date('17/01/14','RR/MM/DD'),'443','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('226','241','ul. Krotka 121 Bialystok',to_date('16/11/01','RR/MM/DD'),'446','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('227','106','Suska66 Poznan',to_date('16/08/27','RR/MM/DD'),'448','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('228','161','ul. Polna 147 Wroclaw',to_date('16/09/25','RR/MM/DD'),'450','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('229','105','ul. Brzozowa 23 Warszawa',to_date('17/02/17','RR/MM/DD'),'452','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('232','247','ul. Sloneczna 108 Krakow',to_date('17/02/19','RR/MM/DD'),'459','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('235','114','ul. Ogrodowa 128 Katowice',to_date('17/02/08','RR/MM/DD'),'463','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('236','161','ul. Szkolna 130 Elk',to_date('17/02/25','RR/MM/DD'),'464','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('239','206','ul. Lesna 39 Rzeszow',to_date('17/02/07','RR/MM/DD'),'472','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('240','112','ul. Szkolna 73 Gdansk',to_date('17/02/18','RR/MM/DD'),'473','4');
Insert into TRANSPORT (IDTRANSPORT,CENA,ADRES,DATADOSTAWY,IDRACHUNKU,IDPRACOWNIKA) values ('241','259','ul. Brzozowa 137 Bialystok',to_date('17/02/17','RR/MM/DD'),'474','4');


prompt "Dodawanie sekwencji oraz funkcji";

   CREATE SEQUENCE  "SEQ_KATEGORIE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
   CREATE SEQUENCE  "SEQ_KLIENCI"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 388 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
   CREATE SEQUENCE  "SEQ_PRACOWNICY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
   CREATE SEQUENCE  "SEQ_PRODUKTY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
   CREATE SEQUENCE  "SEQ_RACHUNKI"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 488 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
   CREATE SEQUENCE  "SEQ_STANOWISKA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
   CREATE SEQUENCE  "SEQ_TRANSPORT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 247 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
   
   
   
     CREATE OR REPLACE EDITIONABLE PROCEDURE "DODAJ_KLIENTA" 
(
  imie IN klienci.imie%type default NULL,
  nazwisko in klienci.nazwisko%type DEFAULT NULL,
  adres in klienci.adres%type default NULL,
  rokurodzenia in KLIENCI.ROKURODZENIA%type default NULL,
  plec in KLIENCI.PLEC%type default NULL
) AS 
BEGIN
  insert into klienci values(seq_klienci.nextval, imie, nazwisko, adres, rokurodzenia, plec);
END DODAJ_KLIENTA;
/
  CREATE OR REPLACE EDITIONABLE PROCEDURE "DODAJ_PRACOWNIKA" 
(
  imie IN pracownicy.imie%type,
  nazwisko in pracownicy.nazwisko%type,
  rokurodzenia in pracownicy.rokurodzenia%type,
  datazatrudnienia in pracownicy.datazatrudnienia%type,
  stanowisko in PRACOWNICY.IDSTANOWISKA%type
) AS 
BEGIN
  insert into pracownicy(IDPRACOWNIKA, imie, nazwisko, rokurodzenia, datazatrudnienia, idstanowiska) values (seq_pracownicy.nextval, imie, nazwisko, rokurodzenia, datazatrudnienia, stanowisko);
END DODAJ_PRACOWNIKA;
/
  CREATE OR REPLACE EDITIONABLE PROCEDURE "DODAJ_PRODUKT" 
(
  nazwa IN produkty.nazwa%type 
, cena IN produkty.cena%type,
cena_hurtowa in produkty.cenahurtowa%type,
  kategoria in PRODUKTY.IDKATEGORII%type
) AS 
BEGIN
  insert into produkty(idproduktu, nazwa, cena, cenahurtowa, idkategorii) values (seq_produkty.nextval, nazwa, cena, cena_hurtowa, kategoria);
END DODAJ_PRODUKT;
/
create or replace PROCEDURE "GENERATOR_TRANSAKCJI" 
(
  ilosc_rachunkow IN NUMBER,
  ilosc_produktow IN NUMBER,
  czy_generowac_klientow in boolean
) AS 
  liczba number;
  los number;
  los2 number;
  losowy_klient number;
  losowy_sprzedawca number;
  nr_rachunku number;
  losowy_produkt number;
  cena_produktu number;
  suma_cen number;
  ilosc_jednostek number;
  imie klienci.imie%type;
  nazwisko klienci.nazwisko%type;
  adres klienci.adres%type;
  data_zak rachunki.datazakupu%type;
  kurier transport.idpracownika%type;
BEGIN
  if czy_generowac_klientow = false then
    SELECT count(*) into liczba from klienci;
    if liczba = 0 then
      dbms_output.put_line('Brak klientów w bazie');
    else
      for los in 1..ilosc_rachunkow
      loop
		suma_cen := 0;
        Select idklienta, adres into losowy_klient, adres from ( SELECT idklienta, adres from klienci order by DBMS_RANDOM.value ) where rownum <= 1;
        Select idpracownika into losowy_sprzedawca from ( SELECT idpracownika from pracownicy where pracownicy.IDSTANOWISKA = 2 order by DBMS_RANDOM.value ) where rownum < 2;
        if(round(dbms_random.value(0,1)) = 0) then
          data_zak := sysdate;
          insert into rachunki values(seq_rachunki.nextval, data_zak, losowy_klient, losowy_sprzedawca, 'T', NULL);
          select max(idrachunku) into nr_rachunku from rachunki;
          Select idpracownika into kurier from ( SELECT idpracownika from pracownicy where pracownicy.IDSTANOWISKA = 3 order by DBMS_RANDOM.value ) where rownum < 2;
          insert into transport values(seq_transport.nextval, round(dbms_random.value(20,300)), adres, to_date(to_char(round(dbms_random.value(to_number(to_char(data_zak, 'J')), to_number(to_char(data_zak + 30, 'J'))))), 'J'), nr_rachunku, kurier);
        else
          insert into rachunki values(seq_rachunki.nextval, sysdate, losowy_klient, losowy_sprzedawca, 'N', NULL);
          select max(idrachunku) into nr_rachunku from rachunki;
        end if;
        for los2 in 1..ilosc_produktow
        loop
          Select idproduktu, cena into losowy_produkt, cena_produktu from ( SELECT idproduktu, cena from produkty order by DBMS_RANDOM.value ) where rownum <= 1;
          ilosc_jednostek := round(dbms_random.value(1, 10));
		  insert into rachunek_poz values(ilosc_jednostek, cena_produktu, nr_rachunku, losowy_produkt);
		  suma_cen := suma_cen+cena_produktu*ilosc_jednostek;
        end loop;
		update rachunki set cenacalkowita=suma_cen where idrachunku=nr_rachunku;
      end loop;
    end if;
  else
    for los in 1..ilosc_rachunkow
    loop
	  suma_cen := 0;
      losowy_klient := round(dbms_random.value(0,9));
      case losowy_klient
        when 0 then imie := 'Jakub';
        when 1 then imie := 'Antoni';
        when 2 then imie := 'Szymon';
        when 3 then imie := 'Jan';
        when 4 then imie := 'Filip';
        when 5 then imie := 'Kacper';
        when 6 then imie := 'Aleksander';
        when 7 then imie := 'Franciszek';
        when 8 then imie := 'Mikolaj';
        when 9 then imie := 'Wojciech';
      end case;
      losowy_klient := round(dbms_random.value(0,9));
      case losowy_klient
        when 0 then nazwisko := 'Suska';
        when 1 then nazwisko := 'Lojek';
        when 2 then nazwisko := 'Kondrat';
        when 3 then nazwisko := 'Obloch';
        when 4 then nazwisko := 'Zloto';
        when 5 then nazwisko := 'Konsat';
        when 6 then nazwisko := 'Kaszuba';
        when 7 then nazwisko := 'Goniec';
        when 8 then nazwisko := 'Alerw';
        when 9 then nazwisko := 'Samos';
      end case;
      losowy_klient := round(dbms_random.value(0,9));
      case losowy_klient
        when 0 then adres := 'Suska'; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 1 then adres := 'ul. Polna '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 2 then adres := 'ul. Lesna '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 3 then adres := 'ul. Sloneczna '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 4 then adres := 'ul. Krotka '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 5 then adres := 'ul. Szkolna '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 6 then adres := 'ul. Ogrodowa '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 7 then adres := 'ul. Lipowa '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 8 then adres := 'ul. Brzozowa '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 9 then adres := 'ul. Kwiatowa '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
      end case;
      losowy_klient := round(dbms_random.value(0,9));
      case losowy_klient
        when 0 then adres :=concat(adres, ' Elk');
        when 1 then adres :=concat(adres, ' Warszawa');
        when 2 then adres :=concat(adres, ' Bialystok');
        when 3 then adres :=concat(adres, ' Gdansk');
        when 4 then adres :=concat(adres, ' Poznan');
        when 5 then adres :=concat(adres, ' Wroclaw');
        when 6 then adres :=concat(adres, ' Krakow');
        when 7 then adres :=concat(adres, ' Katowice');
        when 8 then adres :=concat(adres, ' Olsztyn');
        when 9 then adres :=concat(adres, ' Rzeszow');
      end case;
      dodaj_klienta(imie, nazwisko, adres, to_date(to_char(round(dbms_random.value(to_number(to_char(sysdate - 20000, 'J')), to_number(to_char(sysdate - 7000, 'J'))))), 'J'), 'M');
              
        Select max(idklienta) into losowy_klient from klienci;
        Select idpracownika into losowy_sprzedawca from ( SELECT idpracownika from pracownicy where pracownicy.IDSTANOWISKA = 2 order by DBMS_RANDOM.value ) where rownum < 2;
        if(round(dbms_random.value(0,1)) = 0) then
          data_zak := sysdate;
          insert into rachunki values(seq_rachunki.nextval, data_zak, losowy_klient, losowy_sprzedawca, 'T', NULL);
          select max(idrachunku) into nr_rachunku from rachunki;
          Select idpracownika into kurier from ( SELECT idpracownika from pracownicy where pracownicy.IDSTANOWISKA = 3 order by DBMS_RANDOM.value ) where rownum < 2;
          insert into transport values(seq_transport.nextval, round(dbms_random.value(20,300)), adres, to_date(to_char(round(dbms_random.value(to_number(to_char(data_zak, 'J')), to_number(to_char(data_zak + 30, 'J'))))), 'J'), nr_rachunku, kurier);
        else
          insert into rachunki values(seq_rachunki.nextval, sysdate, losowy_klient, losowy_sprzedawca, 'N', NULL);
          select max(idrachunku) into nr_rachunku from rachunki;
        end if;
        for los2 in 1..ilosc_produktow
        loop
          Select idproduktu, cena into losowy_produkt, cena_produktu from ( SELECT idproduktu, cena from produkty order by DBMS_RANDOM.value ) where rownum <= 1;
		  ilosc_jednostek := round(dbms_random.value(1, 10));
          insert into rachunek_poz values(ilosc_jednostek, cena_produktu, nr_rachunku, losowy_produkt);
		  suma_cen := suma_cen+cena_produktu*ilosc_jednostek;
        end loop;
		update rachunki set cenacalkowita=suma_cen where idrachunku=nr_rachunku;
    end loop;
  end if;
END GENERATOR_TRANSAKCJI;
/
prompt "Dodawanie Generatora rocznego"
  CREATE OR REPLACE EDITIONABLE PROCEDURE "GENERATOR_TRANSAKCJI_NA_ROK" 
(
  ilosc_rachunkow IN NUMBER,
  ilosc_produktow IN NUMBER,
  czy_generowac_klientow in boolean
) AS 
  liczba number;
  los number;
  los2 number;
  losowy_klient number;
  losowy_sprzedawca number;
  nr_rachunku number;
  losowy_produkt number;
  cena_produktu number;
  suma_cen number;
  ilosc_jednostek number;
  imie klienci.imie%type;
  nazwisko klienci.nazwisko%type;
  adres klienci.adres%type;
  data_zak rachunki.datazakupu%type;
  kurier transport.idpracownika%type;
BEGIN
  if czy_generowac_klientow = false then
    SELECT count(*) into liczba from klienci;
    if liczba = 0 then
      dbms_output.put_line('Brak klientów w bazie');
    else
      for los in 1..ilosc_rachunkow
      loop
		suma_cen := 0;
        Select idklienta, adres into losowy_klient, adres from ( SELECT idklienta, adres from klienci order by DBMS_RANDOM.value ) where rownum <= 1;
        Select idpracownika into losowy_sprzedawca from ( SELECT idpracownika from pracownicy where pracownicy.IDSTANOWISKA = 2 order by DBMS_RANDOM.value ) where rownum < 2;
        if(round(dbms_random.value(0,1)) = 0) then
          data_zak := to_date(to_char(round(dbms_random.value(to_number(to_char(sysdate - 365, 'J')), to_number(to_char(sysdate, 'J'))))), 'J');
          insert into rachunki values(seq_rachunki.nextval, data_zak, losowy_klient, losowy_sprzedawca, 'T', NULL);
          select max(idrachunku) into nr_rachunku from rachunki;
          Select idpracownika into kurier from ( SELECT idpracownika from pracownicy where pracownicy.IDSTANOWISKA = 3 order by DBMS_RANDOM.value ) where rownum < 2;
          insert into transport values(seq_transport.nextval, round(dbms_random.value(20,300)), adres, to_date(to_char(round(dbms_random.value(to_number(to_char(data_zak, 'J')), to_number(to_char(data_zak + 30, 'J'))))), 'J'), nr_rachunku, kurier);
        else
          insert into rachunki values(seq_rachunki.nextval, to_date(to_char(round(dbms_random.value(to_number(to_char(sysdate - 365, 'J')), to_number(to_char(sysdate, 'J'))))), 'J'), losowy_klient, losowy_sprzedawca, 'N', NULL);
          select max(idrachunku) into nr_rachunku from rachunki;
        end if;
        for los2 in 1..ilosc_produktow
        loop
          Select idproduktu, cena into losowy_produkt, cena_produktu from ( SELECT idproduktu, cena from produkty order by DBMS_RANDOM.value ) where rownum <= 1;
          ilosc_jednostek := round(dbms_random.value(1, 10));
		  insert into rachunek_poz values(ilosc_jednostek, cena_produktu, nr_rachunku, losowy_produkt);
		  suma_cen := suma_cen+cena_produktu*ilosc_jednostek;
        end loop;
		update rachunki set cenacalkowita=suma_cen where idrachunku=nr_rachunku;
      end loop;
    end if;
  else
    for los in 1..ilosc_rachunkow
    loop
	  suma_cen := 0;
      losowy_klient := round(dbms_random.value(0,9));
      case losowy_klient
        when 0 then imie := 'Jakub';
        when 1 then imie := 'Antoni';
        when 2 then imie := 'Szymon';
        when 3 then imie := 'Jan';
        when 4 then imie := 'Filip';
        when 5 then imie := 'Kacper';
        when 6 then imie := 'Aleksander';
        when 7 then imie := 'Franciszek';
        when 8 then imie := 'Mikolaj';
        when 9 then imie := 'Wojciech';
      end case;
      losowy_klient := round(dbms_random.value(0,9));
      case losowy_klient
        when 0 then nazwisko := 'Suska';
        when 1 then nazwisko := 'Lojek';
        when 2 then nazwisko := 'Kondrat';
        when 3 then nazwisko := 'Obloch';
        when 4 then nazwisko := 'Zloto';
        when 5 then nazwisko := 'Konsat';
        when 6 then nazwisko := 'Kaszuba';
        when 7 then nazwisko := 'Goniec';
        when 8 then nazwisko := 'Alerw';
        when 9 then nazwisko := 'Samos';
      end case;
      losowy_klient := round(dbms_random.value(0,9));
      case losowy_klient
        when 0 then adres := 'Suska'; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 1 then adres := 'ul. Polna '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 2 then adres := 'ul. Lesna '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 3 then adres := 'ul. Sloneczna '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 4 then adres := 'ul. Krotka '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 5 then adres := 'ul. Szkolna '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 6 then adres := 'ul. Ogrodowa '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 7 then adres := 'ul. Lipowa '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 8 then adres := 'ul. Brzozowa '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
        when 9 then adres := 'ul. Kwiatowa '; adres :=concat(adres, to_char(round(dbms_random.value(1,150))));
      end case;
      losowy_klient := round(dbms_random.value(0,9));
      case losowy_klient
        when 0 then adres :=concat(adres, ' Elk');
        when 1 then adres :=concat(adres, ' Warszawa');
        when 2 then adres :=concat(adres, ' Bialystok');
        when 3 then adres :=concat(adres, ' Gdansk');
        when 4 then adres :=concat(adres, ' Poznan');
        when 5 then adres :=concat(adres, ' Wroclaw');
        when 6 then adres :=concat(adres, ' Krakow');
        when 7 then adres :=concat(adres, ' Katowice');
        when 8 then adres :=concat(adres, ' Olsztyn');
        when 9 then adres :=concat(adres, ' Rzeszow');
      end case;
      dodaj_klienta(imie, nazwisko, adres, to_date(to_char(round(dbms_random.value(to_number(to_char(sysdate - 20000, 'J')), to_number(to_char(sysdate - 7000, 'J'))))), 'J'), 'M');
              
        Select max(idklienta) into losowy_klient from klienci;
        Select idpracownika into losowy_sprzedawca from ( SELECT idpracownika from pracownicy where pracownicy.IDSTANOWISKA = 2 order by DBMS_RANDOM.value ) where rownum < 2;
        if(round(dbms_random.value(0,1)) = 0) then
          data_zak := to_date(to_char(round(dbms_random.value(to_number(to_char(sysdate - 365, 'J')), to_number(to_char(sysdate, 'J'))))), 'J');
          insert into rachunki values(seq_rachunki.nextval, data_zak, losowy_klient, losowy_sprzedawca, 'T', NULL);
          select max(idrachunku) into nr_rachunku from rachunki;
          Select idpracownika into kurier from ( SELECT idpracownika from pracownicy where pracownicy.IDSTANOWISKA = 3 order by DBMS_RANDOM.value ) where rownum < 2;
          insert into transport values(seq_transport.nextval, round(dbms_random.value(20,300)), adres, to_date(to_char(round(dbms_random.value(to_number(to_char(data_zak, 'J')), to_number(to_char(data_zak + 30, 'J'))))), 'J'), nr_rachunku, kurier);
        else
          insert into rachunki values(seq_rachunki.nextval, to_date(to_char(round(dbms_random.value(to_number(to_char(sysdate - 365, 'J')), to_number(to_char(sysdate, 'J'))))), 'J'), losowy_klient, losowy_sprzedawca, 'N', NULL);
          select max(idrachunku) into nr_rachunku from rachunki;
        end if;
        for los2 in 1..ilosc_produktow
        loop
          Select idproduktu, cena into losowy_produkt, cena_produktu from ( SELECT idproduktu, cena from produkty order by DBMS_RANDOM.value ) where rownum <= 1;
		  ilosc_jednostek := round(dbms_random.value(1, 10));
          insert into rachunek_poz values(ilosc_jednostek, cena_produktu, nr_rachunku, losowy_produkt);
		  suma_cen := suma_cen+cena_produktu*ilosc_jednostek;
        end loop;
		update rachunki set cenacalkowita=suma_cen where idrachunku=nr_rachunku;
    end loop;
  end if;
END GENERATOR_TRANSAKCJI_NA_ROK;
/

prompt "Dodawanie perspektyw";

create or replace view Roczna_sprzedaz as
select sum(cenacalkowita) as "Roczna Sprzeda¿" from rachunki where DATAZAKUPU > sysdate - 366;
create or replace view Polroczna_sprzedaz as
select sum(cenacalkowita) as "Polroczna Sprzeda¿" from rachunki where DATAZAKUPU > sysdate - 183;
create or replace view Kwartalna_sprzedaz as
select sum(cenacalkowita) as "Kwartalna Sprzeda¿" from rachunki where DATAZAKUPU > sysdate - 92;
create or replace view Miesieczna_sprzedaz as
select sum(cenacalkowita) as "Miesieczna Sprzeda¿" from rachunki where DATAZAKUPU > sysdate - 31;


create or replace view Roczny_zysk as
select sum(rachunek_poz.CENAPOZYCJI*rachunek_poz.ilosc - produkty.cenahurtowa*rachunek_poz.ilosc) as "Roczny zysk" 
from rachunek_poz, produkty, rachunki where produkty.IDPRODUKTU=rachunek_poz.IDPRODUKTU and rachunek_poz.IDRACHUNKU = rachunki.IDRACHUNKU
and rachunki.DATAZAKUPU > sysdate-366;
create or replace view Polroczny_zysk as
select sum(rachunek_poz.CENAPOZYCJI*rachunek_poz.ilosc - produkty.cenahurtowa*rachunek_poz.ilosc) as "Polroczny zysk" 
from rachunek_poz, produkty, rachunki where produkty.IDPRODUKTU=rachunek_poz.IDPRODUKTU and rachunek_poz.IDRACHUNKU = rachunki.IDRACHUNKU
and rachunki.DATAZAKUPU > sysdate-183;
create or replace view Kwartalny_zysk as
select sum(rachunek_poz.CENAPOZYCJI*rachunek_poz.ilosc - produkty.cenahurtowa*rachunek_poz.ilosc) as "Kwartalny zysk" 
from rachunek_poz, produkty, rachunki where produkty.IDPRODUKTU=rachunek_poz.IDPRODUKTU and rachunek_poz.IDRACHUNKU = rachunki.IDRACHUNKU
and rachunki.DATAZAKUPU > sysdate-92;
create or replace view Miesieczny_zysk as
select sum(rachunek_poz.CENAPOZYCJI*rachunek_poz.ilosc - produkty.cenahurtowa*rachunek_poz.ilosc) as "Miesieczny zysk" 
from rachunek_poz, produkty, rachunki where produkty.IDPRODUKTU=rachunek_poz.IDPRODUKTU and rachunek_poz.IDRACHUNKU = rachunki.IDRACHUNKU
and rachunki.DATAZAKUPU > sysdate-31;

create or replace view Przeglad_produktow as
select produkty.NAZWA, sum(ilosc) as "Ilosc sprzedanych produktow", sum(rachunek_poz.CENAPOZYCJI*rachunek_poz.ilosc) as Sprzedaz, 
sum(rachunek_poz.CENAPOZYCJI*rachunek_poz.ilosc - produkty.cenahurtowa*rachunek_poz.ilosc) as Zysk 
from rachunek_poz, produkty 
where rachunek_poz.IDPRODUKTU=produkty.IDPRODUKTU group by produkty.nazwa 
order by sum(rachunek_poz.CENAPOZYCJI*rachunek_poz.ilosc - produkty.cenahurtowa*rachunek_poz.ilosc) desc;

create or replace view Analiza_klientow as
select klienci.imie as "Imie", klienci.NAZWISKO as "Nazwisko", count(rachunki.idrachunku) as " Ilosc rachunkow", 
sum(rachunki.cenacalkowita) as "Suma rachunków", sum(rachunki.cenacalkowita)/count(rachunki.idrachunku) as "Srednia kwota na rachunku"
from klienci, rachunki where rachunki.IDKLIENTA=klienci.IDKLIENTA group by klienci.IDKLIENTA, klienci.IMIE, klienci.NAZWISKO 
order by sum(rachunki.cenacalkowita)/count(rachunki.idrachunku) desc;

create or replace view Analiza_biznesowa_firmy as
select (select * from Roczny_zysk) as "Roczny zysk", 
(select sum(pensja) from stanowiska, pracownicy where pracownicy.idstanowiska = stanowiska.idstanowiska)*12 as "Roczne wydatki na pensje",
10000*12 as "Roczne wydatki na sklep",
(select * from Roczny_zysk) - ((select sum(pensja) from stanowiska, pracownicy where pracownicy.idstanowiska = stanowiska.idstanowiska)*12 + 10000*12)
as "Roczny zysk z kosztami"
from dual;


create or replace view faktura as
select rachunki.idrachunku, klienci.IMIE as "Imie klienta", klienci.NAZWISKO as "Nazwisko klienta", klienci.ADRES as "Adres klienta", pracownicy.imie as "Imie pracownika", 
pracownicy.nazwisko as "Nazwisko pracownika", rachunki.DATAZAKUPU as "Data zakupu", rachunki.CENACALKOWITA as "Cena calkowita",
rachunek_poz.ILOSC as "Ilosc", rachunek_poz.CENAPOZYCJI "Cena pozycji", produkty.NAZWA as "Nazwa produktu"
from rachunki, rachunek_poz, klienci,pracownicy, produkty where produkty.IDPRODUKTU=rachunek_poz.IDPRODUKTU
and rachunki.IDRACHUNKU = rachunek_poz.IDRACHUNKU and rachunki.IDPRACOWNIKA=pracownicy.IDPRACOWNIKA and rachunki.IDKLIENTA=klienci.IDKLIENTA;


prompt "Dodawanie jobów"
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => 'JOB_MALI',
            job_type => 'PLSQL_BLOCK',
            job_action => 'begin
GENERATOR_TRANSAKCJI(3,1,TRUE);
END;',
            number_of_arguments => 0,
            start_date => NULL,
            repeat_interval => 'FREQ=DAILY; BYHOUR=8,9,10,11,12,13,14,15,16,17,18,19,20;',
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => 'cogodzinne zakupy zwyklych klientow');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => 'JOB_MALI', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => 'JOB_MALI', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => 'JOB_MALI');
END;
/
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => 'JOB_DUZI',
            job_type => 'PLSQL_BLOCK',
            job_action => 'begin
GENERATOR_TRANSAKCJI(1,6,FALSE);
END;',
            number_of_arguments => 0,
            start_date => NULL,
            repeat_interval => 'FREQ=DAILY; BYHOUR=10',
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => 'codzienne zakupy waznych klientow');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => 'JOB_DUZI', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => 'JOB_DUZI', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => 'JOB_DUZI');
END;