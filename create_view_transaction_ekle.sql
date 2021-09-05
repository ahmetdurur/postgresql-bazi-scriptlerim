create view transaction_goruntule as 
select  a.t_hash,
		a.t_block_number, 
		g.t_owner as gonderen, 
		c.t_owner as alici,	
		a.t_eth_value,
		a.t_eth_fee,
		a.t_gas_price_gwei,
		a.t_tarih,
		a.t_kayit_tarihi
from crypto_transactions a join crypto_wallets g on a.t_from_wallet_id = g.t_id join crypto_Wallets c on a.t_to_wallet_id = c.t_id