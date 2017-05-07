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