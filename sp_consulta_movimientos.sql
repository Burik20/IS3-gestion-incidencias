--G.7- Obtener los ultimos n movimientos sobre la cuenta x, agrupados por tipoOp
CREATE OR REPLACE FUNCTION sp_count_mov 
	(_nrcuenta in out integer,
	_tipoop out integer,
	_cantidad out bigint)
RETURNS setof record
AS
$body$
declare
    _existe numeric;
begin   
    --se verifica que el numero de cuenta
    if (NOT exists(select 'existe' from cuentas where nrcuenta = _nrcuenta))then
        raise exception 'El numero de cuenta % no existe', _nrcuenta;
    end if;
	
	return QUERY select nrcuenta, tipoop, count (nrmov) as _cantidad from movimientos 
	where nrcuenta = _nrcuenta
	group by nrcuenta, tipoop;
end;
$body$
LANGUAGE plpgsql;