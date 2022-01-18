CREATE TRIGGER trg_crypto_trade_detail
    AFTER INSERT 
    ON public.crypto_trade_detail
    FOR EACH ROW
    EXECUTE FUNCTION public.tri_detail_to_master();