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