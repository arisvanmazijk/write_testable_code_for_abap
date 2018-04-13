CLASS zcl_wtc_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_wtc_factory_injector.

  PUBLIC SECTION.
    CLASS-METHODS get_cash_provider
      RETURNING VALUE(r_instance) TYPE REF TO zif_wtc_cash_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA g_cash_provider TYPE REF TO zif_wtc_cash_provider.
ENDCLASS.



CLASS zcl_wtc_factory IMPLEMENTATION.

  METHOD get_cash_provider.
    IF g_cash_provider IS NOT BOUND.
      g_cash_provider = NEW zcl_wtc_cash_provider_managed( ).
    ENDIF.
    r_instance = g_cash_provider.
  ENDMETHOD.

ENDCLASS.
