CREATE OR REPLACE PROCEDURE transaction_ekle
  (
    hash CHARACTER VARYING,
    blocknumber NUMERIC,
    gonderici_cuzdan CHARACTER VARYING,
    alici_cuzdan CHARACTER VARYING,
    ethmiktar NUMERIC,
    gonderim_ucreti NUMERIC,
    gas NUMERIC,
    tarih TIMESTAMP
  )
LANGUAGE PLPGSQL AS
  $$
begin  insert into crypto_transactions (t_hash , t_block_number, t_from_wallet_id , t_to_Wallet_id , t_eth_value , t_eth_fee ,t_gas_price_gwei, t_tarih , t_kayit_tarihi )
		values ( hash, blocknumber 
	   , (select t_id from crypto_wallets where t_Wallet_adress = gonderici_cuzdan) 
	   , (select t_id from crypto_wallets where t_Wallet_adress = alici_cuzdan)
	   , ethmiktar , gonderim_ucreti ,gas,tarih
	   , (select current_timestamp)
	   ); 
end $$