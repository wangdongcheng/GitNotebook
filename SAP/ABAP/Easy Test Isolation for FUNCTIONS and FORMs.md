# Easy Test Isolation for FUNCTIONS and FORMs (ABAP)  
Test isolation is a key element of any unit- and integration test strategy. The ASE course teaches how to do test isolation in the OO (ABAP Objects) context via classes, interfaces/inheritance and dependency injection. All this is quite natural in the context of OO code and fits to the general rules of 'good OO design', decoupling etc. However, for people not working in OO all the time the patterns can be challenging and make test isolation seem as 'too hard'.  
For code that is completely functional / non-OO and developers that work mostly with non-OO code, there is a simple solution for test isolation for FUNCTIONs and FORMs that allows you to do unit testing very easily, also in functional code.  In this blog post we will describe the test isolation part, in a later blog post how to do unit testing in non-OO code.  
Notes.  
An even better solution will be provided with ABAP release 7.4, but the patterns below can be used also in older releases (at least down to 7.0.  
We only show the solution for FUNCTIONs here, the same approach works for FORMS.  
Basic approac.  
The case we are considering is this: A piece of code calls a function F that you want to isolate from in a unit test. This means that a unit test must be able to say "do not call F but call td_F instead". Of course, F and td_F (the test double of the function) must have the same signature / parameters. You can then write unit tests with ABAP Unit and use the pattern below to isolate functions and forms as needed.  
The basic approach works as follows.  
We use the dynamic function calls of ABAP to call the productive / test code via their name.  
At places where you want to 'cut' the dependency, you change the call to this dynamic versio.  
We use a class CL_FNAME (source provided below) to return either the productive function name, or the replacement function name for the test. The default is to use the productive nam.  
In the test, you register 'replacement functions' as neede.  
The necessary code is encapsulated in a macro 'isolate_function' for convenienc.  
You will use different macros for forms and function.  
The changed call to the function F1 will then look like this (without the use of the macros).  
DATA lv_fname TYPE funcname..  
"....  
IF 0 = 1. CALL FUNCTION 'F1'. ENDIF.   .  
lv_fname = cl_fname=>function_for( 'F1' ). .  
CALL FUNCTION lv_fname EXPORTING ....  
A local variable lv_fname is used to store the function name that will actually be use.  
The "IF 0=1 ..:" statement is needed to enable the static where-used tracing to still work, i.e. it recognizes the dependency to F1 at this place.  
The call to cl_fname=>function_for( ) find the correct function name, i.e. either F1 (the default), or a test double name that was previously registere.  
Then finally comes the actual CALL FUNCTION with the parameters.  
Since this code is repetitive and kind of ugly, we want to encapsulate it in a macro. Then the usage looks like this.  
isolate_function F1. .  
CALL FUNCTION F1 EXPORTING ... .  
Step by Step Solutio.  
Prerequisite: You have a public class like the class cl_fname that implements the name indirection (source see below).  
In the TOP-include of your function pool define the following macro.  
DEFINE isolate_function. .  
  DATA &1 TYPE funcname. .  
  IF 0 = 1. CALL FUNCTION '&1'. ENDIF.  " Where-used for the function .  
  &1 = cl_fname=>function_for( '&1' ).  " Dynamic determination of the function name .  
END-OF-DEFINITION. .  
Change the productive coding by replacing the static function call (replacing 'F1' with your function name).  
CALL FUNCTION 'F1'  EXPORTING ...  
           by the following (no single quotes!): .  
     isolate_function F1. .  
     CALL FUNCTION F1  EXPORTING ... .  
Write your test double function module (for example function 'TD_F1’) having the same signature as 'F1'.  
Change the test coding: In the SETUP of your unit test do the injection (register name replacement).  
 cl_fname=>replace_function( iv_from = 'F1' iv_to = 'TD_F1' )..  

Result.  
During the execution of your unit test the test double function will be called.  
In the normal program execution the original function will be called.  
You still have a where-used for the original function.  

Source code for `CL_FNAME`
```
CLASS cl_fname DEFINITION  
  PUBLIC CREATE PUBLIC .  
  PUBLIC SECTION.  
    CLASS-METHODS reset .  
    CLASS-METHODS function_for  
      IMPORTING  
        !iv_funcname TYPE funcname  
      RETURNING  
        VALUE(rv_funcname) TYPE funcname .  
    CLASS-METHODS replace_function  
      IMPORTING  
        !iv_from TYPE funcname  
        !iv_to TYPE funcname .  
  PROTECTED SECTION.  
  PRIVATE SECTION.  
    TYPES:  
      BEGIN OF from_to_function.  
    TYPES            from TYPE funcname.  
    TYPES            to TYPE funcname.  
    TYPES END OF from_to_function .  
    CLASS-DATA:  
      mt_from_to_function TYPE SORTED TABLE OF from_to_function  
             WITH UNIQUE KEY from .  
    CLASS-METHODS assert_testmode .  
ENDCLASS.  
CLASS CL_FNAME IMPLEMENTATION.  
  METHOD assert_testmode.  
    DATA l_system_category TYPE c.  
    SELECT SINGLE cccategory FROM t000 INTO l_system_category WHERE mandt = sy-mandt .  
    ASSERT l_system_category <> 'P'. " Test not allowed in productive system  
    ASSERT sy-tcode = 'SEU_INT'  OR  
           cl_aunit_failure_assert=>stack_filter = 'FB_AUNIT_FILTER_FROM_STACK'. " ABAP unit callstack  
  ENDMETHOD.  
  METHOD function_for.  
    FIELD-SYMBOLS <line> LIKE LINE OF mt_from_to_function.  
    rv_funcname = iv_funcname. " Default is: no change  
    TRANSLATE rv_funcname TO UPPER CASE.  
    READ TABLE mt_from_to_function  
         WITH TABLE KEY from = rv_funcname  
         ASSIGNING <line>.  
    IF <line> IS ASSIGNED.  
      rv_funcname = <line>-to.  
    ENDIF.  
  ENDMETHOD.  
  METHOD replace_function.  
    DATA ls_line TYPE from_to_function.  
    assert_testmode( ).  
    CHECK iv_to IS NOT INITIAL.  
    ls_line-from = iv_from.  
    ls_line-to   = iv_to.  
    TRANSLATE ls_line-from TO UPPER CASE.  
    TRANSLATE ls_line-to   TO UPPER CASE.  
    DELETE mt_from_to_function WHERE from = iv_from.  
    INSERT ls_line INTO TABLE  mt_from_to_function.  
  ENDMETHOD.  
  METHOD reset.  
    CLEAR mt_from_to_function.  
  ENDMETHOD.  
ENDCLASS.  
```


(ref to class `CL_FUNCTION_TESTDOUBLE` in latest ABAP core)