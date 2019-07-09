-- Add/modify columns 
alter table INV_MOVIMIENTO_CAB add COD_SUSTENTO varchar2(2);
alter table INV_MOVIMIENTO_CAB add COD_TIPOCOMPROBANTE number(4);

DESC inv_movimiento_cab;