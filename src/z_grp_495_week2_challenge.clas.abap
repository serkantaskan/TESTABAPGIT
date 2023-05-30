class Z_GRP_495_WEEK2_CHALLENGE definition
  public
  final
  create public .

public section.

  interfaces IF_SERIALIZABLE_OBJECT .
  interfaces Z2UI5_IF_APP .

  data USERNAME type STRING .
  data DATE type STRING .
PRIVATE SECTION.
ENDCLASS.



CLASS Z_GRP_495_WEEK2_CHALLENGE IMPLEMENTATION.


 METHOD Z2UI5_IF_APP~MAIN.

    "event handling
    CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->popup_message_toast( |{ username } { date  } - sent to the server| ).
    ENDCASE.

    "view rendering
    client->set_next( VALUE #( xml_main = z2ui5_cl_xml_view=>factory(
        )->page( title = 'SAP Developer Code Challenge Week 2'
            )->simple_form( title = 'My First App' editable = abap_true
                )->content( 'form'
                    )->title( 'Input'
                    )->label( 'username'
                    )->input( client->_bind( username  )
                    )->label( 'date'
                    )->date_picker( value = client->_bind(  date )
                    )->button( text  = 'post' press = client->_event( 'BUTTON_POST' )
         )->get_root( )->xml_get( ) ) ).

  ENDMETHOD.
ENDCLASS.
