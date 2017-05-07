drop table transport;
drop table rachunek_poz;
drop table produkty;
drop table rachunki;
drop table pracownicy;
drop table stanowiska;
drop table klienci;
drop table kategorie;

drop procedure DODAJ_KLIENTA;
drop procedure DODAJ_PRACOWNIKA;
drop procedure DODAJ_PRODUKT;
drop procedure GENERATOR_TRANSAKCJI;
drop sequence SEQ_KATEGORIE;
drop sequence SEQ_KLIENCI;
drop sequence SEQ_PRACOWNICY;
drop sequence SEQ_PRODUKTY;
drop sequence SEQ_RACHUNKI;
drop sequence SEQ_TRANSPORT;
drop sequence SEQ_STANOWISKA;

drop view Roczna_sprzedaz;
drop view Polroczna_sprzedaz;
drop view Kwartalna_sprzedaz;
drop view Miesieczna_sprzedaz;
drop view Roczny_zysk;
drop view Polroczny_zysk;
drop view Kwartalny_zysk;
drop view Miesieczny_zysk;
drop view Przeglad_produktow;
drop view Analiza_klientow;
drop view Analiza_biznesowa_firmy;
drop view faktura;

begin
  DBMS_SCHEDULER.drop_job (job_name => 'JOB_MALI');
  DBMS_SCHEDULER.drop_job (job_name => 'JOB_DUZI');
end;