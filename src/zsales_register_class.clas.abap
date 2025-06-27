CLASS zsales_register_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES : if_sadl_exit_calc_element_read .
    INTERFACES : if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZSALES_REGISTER_CLASS IMPLEMENTATION.


 METHOD if_sadl_exit_calc_element_read~calculate.
    DATA lt_original_data TYPE STANDARD TABLE OF ZSALES_REGISTER_CDS  .
    lt_original_data = CORRESPONDING #( it_original_data ).


    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<ls_original_data>).

*       <ls_original_data>-Testt = 'Sales Register Report'  .

       if <ls_original_data>-BillingDocumentIsCancelled = 'X' .
       <ls_original_data>-jocg_amt = <ls_original_data>-jocg_amt * ( -1 ) .
       ENDIF .

    ENDLOOP.


    ct_calculated_data = CORRESPONDING #( lt_original_data ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.
ENDCLASS.
