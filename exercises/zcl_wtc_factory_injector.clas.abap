CLASS zcl_wtc_factory_injector DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
  FOR TESTING .

  PUBLIC SECTION.
    CLASS-METHODS inject_cash_provider
      IMPORTING i_test_double TYPE REF TO zif_wtc_cash_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_wtc_factory_injector IMPLEMENTATION.

  METHOD inject_cash_provider.
    zcl_wtc_factory=>g_cash_provider = i_test_double.
  ENDMETHOD.

ENDCLASS.
