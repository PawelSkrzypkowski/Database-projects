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