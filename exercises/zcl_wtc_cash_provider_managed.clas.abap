CLASS zcl_wtc_cash_provider_managed DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_wtc_factory.

  PUBLIC SECTION.

    INTERFACES zif_wtc_cash_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_wtc_cash_provider_managed IMPLEMENTATION.


  METHOD zif_wtc_cash_provider~get_coins.
    "not usable right now
    ASSERT 0 = 1.
  ENDMETHOD.


  METHOD zif_wtc_cash_provider~get_notes.
    "not usable right now
    ASSERT 0 = 1.
  ENDMETHOD.
ENDCLASS.
