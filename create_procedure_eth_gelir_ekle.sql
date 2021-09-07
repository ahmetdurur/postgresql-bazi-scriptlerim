CREATE PROCEDURE eth_gelir_ekle
  (
    tarih DATE,
    havuztoplam NUMERIC,
    gunlukgelir NUMERIC,
    aciklama CHARACTER VARYING,
    payout BOOLEAN
  )
LANGUAGE PLPGSQL
AS $$
	begin
		insert into eth_gunluk_gelir 
		(	
			t_tarih , 
		 	t_havuz_biriken , 
		 	t_eth_income , 
		 	t_aciklama , 
		 	t_payout_day, 
		 	t_kayit_tarihi
		) 
		values 
		(
			tarih, 
			havuztoplam , 
			gunlukgelir , 
			aciklama , 
			payout , 
			(select current_timestamp)
		) ;
	end $$