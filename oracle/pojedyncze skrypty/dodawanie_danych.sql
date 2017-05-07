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
Insert into PRACOWNICY (IDPRACOWNIKA,IMIE,NAZWISKO,ROKURODZENIA,DATAZATRUDNIENIA,IDSTANOWISKA) values ('4','Wojciech','G�bocki',to_date('75/12/19','RR/MM/DD'),to_date('15/08/31','RR/MM/DD'),'3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('1','Buty SPD SH-M089','339,39','300','1');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('2','Buty SH-RP2','293','270','1');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('3','Buty SH-XC51','400,9','350','1');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('4','Buty MTB Cape ��to-czarne','699,99','610','1');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('5','Buty SPD SH-MT34','228','205','1');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('6','GPS rowerowy Edge Touring Plus + mapa Polski TOPO','1050','900','2');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('7','Zegarek Forerunner 920 XT','1482','1350','2');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('8','Baga�nik samochodowy na hak Como 3','1100','990','2');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('9','Licznik bezprzewodowy KRC 315W czarny','76,99','69','2');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('10','Wieszak Endo','199','179','2');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('11','Kask Slant czarny mat','134,9','115','3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('12','Kask dzieci�cy MV5-2','25,9','19','3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('13','Kask MB-01','99,99','88','3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('14','Kask MB-03','110','99','3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('15','Kask Mirage','67,9','55','3');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('16','Preparat WD-40 aerozol 250ml','13','9,90','4');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('17','Stojak monta�. PRS-25 sk�adany','1399','1250','4');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('18','�rodek do czyszcznia �a�cucha Drivetrain Cleaner 500ml','64','57','4');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('19','Stojak monta�owy Biketrim','329,99','289','4');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('20','Preparat ochronny Bike Spray','35','29','4');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('21','Bluza m�ska Thermo','134,9','120','5');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('22','Skarpetki termoaktywne WARM','40','33','5');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('23','Spodenki d�ugie Fobello','200','188','5');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('24','Bluza damska Extreme Wool','210','195','5');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('25','R�kawiczki Road Windstopper Thermo Split','270','245','5');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('26','Organiczny �el energetyczny','6,9','5','6');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('27','Krem Chamois zapobiegaj�cy obtarciom 125ml','55','46','6');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('28','Koncentrat napoju Isotonic Sports Drink','55','48','6');
Insert into PRODUKTY (IDPRODUKTU,NAZWA,CENA,CENAHURTOWA,IDKATEGORII) values ('29','Rozgrzewaj�cy �el SOS','67','58','6');
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