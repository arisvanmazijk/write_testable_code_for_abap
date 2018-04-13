CLASS zcl_wtc_rebate_engine DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      tt_rules TYPE STANDARD TABLE OF REF TO zcl_wtc_rule_item_base WITH DEFAULT KEY .

    METHODS constructor
      IMPORTING
        !i_rules TYPE tt_rules OPTIONAL .
    METHODS compute_rebate
      CHANGING
        !c_cart_items TYPE zase_shop_cart .
    METHODS get_total_rebate_amount
      IMPORTING
        !c_cart_items   TYPE zase_shop_cart
      RETURNING
        VALUE(r_amount) TYPE zase_shop_rebate_amount .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA m_rules TYPE tt_rules.
ENDCLASS.



CLASS zcl_wtc_rebate_engine IMPLEMENTATION.


  METHOD compute_rebate.
    LOOP AT c_cart_items REFERENCE INTO DATA(cart_item).
      LOOP AT m_rules INTO DATA(rule).
        DATA(rebate_amount) = rule->apply( i_cart_item = cart_item->* ).
        IF rebate_amount > 0.
          cart_item->rebate_amount = rebate_amount.
        ENDIF.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.


  METHOD constructor.
    IF i_rules IS NOT INITIAL.
      m_rules = i_rules.
    ELSE.
      "TODO: should be moved to a rules provider class
      m_rules = VALUE #( ( NEW zcl_wtc_rule_item_id( i_item_id = 1  i_req_quantity = 2  i_rebate = 5 ) ) ).
    ENDIF.
  ENDMETHOD.


  METHOD get_total_rebate_amount.
    LOOP AT c_cart_items REFERENCE INTO DATA(cart_item).
        IF cart_item->rebate_amount > 0.
          r_amount = r_amount + cart_item->rebate_amount.
        ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.



CLASS ZCL_WTC_REBATE_ENGINE IMPLEMENTATION.


  METHOD compute_rebate.
    LOOP AT c_cart_items REFERENCE INTO DATA(cart_item).
      LOOP AT m_rules INTO DATA(rule).
        DATA(rebate_amount) = rule->apply( i_cart_item = cart_item->* ).
        IF rebate_amount > 0.
          cart_item->rebate_amount = rebate_amount.
        ENDIF.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.


  METHOD constructor.
    IF i_rules IS NOT INITIAL.
      m_rules = i_rules.
    ELSE.
      "TODO: should be moved to a rules provider class
      m_rules = VALUE #( ( NEW ZCL_WTC_RULE_ITEM_ID( i_item_id = 1  i_req_quantity = 2  i_rebate = 5 ) ) ).
    ENDIF.
  ENDMETHOD.


  METHOD get_total_rebate_amount.

  ENDMETHOD.
ENDCLASS.
