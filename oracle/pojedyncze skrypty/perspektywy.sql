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