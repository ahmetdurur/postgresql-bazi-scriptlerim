create function audit_log.tri_auditlog()
returns trigger
language plpgsql 
as $$
declare kullanici name =  user ;
		tarih TIMESTAMP = CURRENT_TIMESTAMP;
		tip numeric ; 
		tablo name = TG_TABLE_NAME;
		trig_name name = TG_NAME;
		islem_tipi text = TG_OP;
begin 
	if (TG_OP = 'INSERT' ) then tip = 1 ;
	elseif (TG_OP = 'DELETE') then tip = 2; 
	elseif (TG_OP = 'UPDATE') then tip = 3; 
	end if; 
	insert into audit_log.audit_log 
	(
		t_table_name , 
		t_islem_tipi , 
		t_tarih , 
		t_kullanici, 
		t_trigger_name , 
		t_islem_text
	) 
	values 
	(
		tablo ,
		tip , 
		tarih ,
		kullanici ,
		trig_name , 
		islem_tipi  
	) ;
	return null;
end $$ ; 