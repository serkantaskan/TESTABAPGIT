CLASS z_grp_495_week3_challenge DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun .
PROTECTED SECTION.

PRIVATE SECTION.
    TYPES: BEGIN OF training,
            training_no TYPE i,
            Subject     TYPE string,
           END OF training.
    TYPES trainings TYPE STANDARD TABLE OF training WITH DEFAULT KEY.

    TYPES: BEGIN OF training_list,
            type       TYPE string,
            instructor TYPE string,
            trainings  TYPE trainings,
           END OF training_list.
ENDCLASS.



CLASS z_grp_495_week3_challenge IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
CONSTANTS: nl TYPE abap_char1 VALUE cl_abap_char_utilities=>newline.
DATA training_lists TYPE STANDARD TABLE OF training_list WITH DEFAULT KEY.

    APPEND INITIAL LINE TO training_lists REFERENCE INTO DATA(training_list).
    training_list->type = 'CLOUD'.
    training_list->instructor = 'Instructor 1'.
    training_list->trainings = VALUE trainings(
        ( training_no = 1 Subject = 'Cloud In-App')
        ( training_no = 2 Subject = 'RESTfull ABAP Programming')
        ( training_no = 3 Subject = 'BTP')
        ( training_no = 4 Subject = 'DevOps for ABAP with gCTS')
    ).
        APPEND INITIAL LINE TO training_lists REFERENCE INTO training_list.
    training_list->type = 'ABAP'.
    training_list->instructor = 'Instructor 2'.
    training_list->trainings = VALUE trainings(
        ( training_no = 1 Subject = 'ABAP 7.5')
        ( training_no = 2 Subject = 'Workflow')
        ( training_no = 3 Subject = 'IDOC')
        ( training_no = 4 Subject = 'HANA DB/ HANA Cloud/ SQL Script')
    ).

    TRY.
    DATA(lo_mustache) = zcl_mustache=>create( iv_template =
        'Technology: {{type}}' && nl &&
        'Insructor: {{ instructor }}' && nl &&
        '{{#trainings}}' &&
        '* Training {{training_no}} : {{Subject}}' && nl &&
        '{{/trainings}}  '
    ).
    DATA(output) = lo_mustache->render( training_lists ).
    out->write( output ).
    ENDTRY.
ENDMETHOD.
ENDCLASS.
