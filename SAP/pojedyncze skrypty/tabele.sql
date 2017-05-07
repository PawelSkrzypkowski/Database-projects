create table kategorie(
	idkategorii	   numeric(7) primary key,
	nazwa          varchar(40) not null
);
create table klienci (
    idklienta      numeric(7) primary key,
    imie           varchar(20),
    nazwisko       varchar(40),
    adres          varchar(50),
    rokurodzenia   date,
    plec           varchar(1)
);
create table stanowiska (
    idstanowiska   numeric(7) primary key,
    nazwa          varchar(40) not null,
    pensja         numeric(7,2) not null
);
create table pracownicy (
    idpracownika       numeric(7) primary key,
    imie               varchar(20) not null,
    nazwisko           varchar(40) not null,
    rokurodzenia       date not null,
    datazatrudnienia   date not null,
    idstanowiska       numeric(7) references stanowiska(idstanowiska)
);
create table rachunki (
    idrachunku      numeric(7) primary key,
    datazakupu      date not null,
    idklienta       numeric(7) references klienci(idklienta),
    idpracownika    numeric(7) references pracownicy(idpracownika),
    czytransport    varchar(1) not null,
    cenacalkowita   numeric(7)
);
create table produkty (
    idproduktu    numeric(7) primary key,
    nazwa         varchar(100) not null,
    cena          numeric(7,2) not null,
	cenahurtowa	  numeric(7,2) not null,
    idkategorii   numeric(7) references kategorie(idkategorii)
);
create table rachunek_poz (
    ilosc         numeric(6) not null,
    cenapozycji   numeric(7) not null,
    idrachunku    numeric(7) references rachunki(idrachunku),
    idproduktu    numeric(7) references produkty(idproduktu)
);
create table transport (
    idtransport    numeric(7) primary key,
    cena           numeric(7,2),
    adres          varchar(50) not null,
    datadostawy    date,
    idrachunku     numeric(7) references rachunki(idrachunku),
    idpracownika   numeric(7) references pracownicy(idpracownika)
);