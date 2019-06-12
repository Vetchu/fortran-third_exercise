PROGRAM MAIN
    use interfaces
    IMPLICIT NONE

    procedure (integrate), pointer :: i_ptr => null ()
    procedure (fun_int), pointer :: f_ptr =>null()
    real :: input

    real(kind=8) :: ibeg, iend
    f_ptr => polynomial
    ibeg=0
    iend=10

    write (*, '( / "Input test value: ")', advance="no" )
    read (*, *) input

    if ( input < 0 ) then
        i_ptr => rectangular 
    else
        i_ptr => trapezoid
    end if

    write (*, *)  i_ptr(ibeg,iend,f_ptr,0)

    !procedure(fun_int):: sinus,square
END PROGRAM MAIN
