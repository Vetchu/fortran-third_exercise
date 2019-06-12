MODULE INTERFACES
    IMPLICIT NONE

    interface fun_int
        function fun_int ( x )result( y )
            implicit  none
            real(kind= 8) ,intent(in)  ::  x
            real(kind= 8)  ::  y
        end function fun_int
    end  interface
    interface integrate
        function integrate  ( ibeg ,  iend , myfun , p)result( value)
                IMPORT fun_int
            implicit  none
            !  beginning  o f  i n t e g r a t i o n  i n t e r v a l
            real(kind=8),intent(in)  ::  ibeg
            !  ending  o f  i n t e g r a t i o n  i n t e r v a l
            real(kind=8) ,intent(in)  ::  iend
            !  f u n c t i o n  to  be  i n t e g r a t e d
            procedure ( fun_int )  ::  myfun
            !  polynomial  order
            integer(kind=4) ,intent(in)  ::  p
            !  r e s u l t  o f  i n t e g r a t i o n
            real(kind=8)  ::  value
        end function integrate
    end  interface


CONTAINS
    function my_pol(x) result(y)
        implicit none
        real(kind=8), intent(in) :: x
        real(kind=8) :: y
        y = x**2
    end function

    function my_exp(x) result(y)
        implicit none
        real(kind=8), intent(in) :: x
        real(kind=8) :: y
        y = exp(x)
    end function

    function my_sin(x) result(y)
        implicit none
        real(kind=8), intent(in) :: x
        real(kind=8) :: y
        y = sin(x)
    end function
    function trap(ibeg,iend,myfun,p) result (value)
            IMPLICIT NONE
        real(kind=8),intent(in)  ::  ibeg
        real(kind=8),intent(in)  ::  iend
        procedure( fun_int) ::  myfun
        !        real(kind=8) myfun
        integer(kind=4),intent(in)  ::  p
        real(kind=8) ::  value

        real::h

        h=abs(ibeg-iend)
        value=(myfun(ibeg)+myfun(iend))/2*h
    end function trap
    function rect(ibeg,iend,myfun,p) result (value)
        IMPLICIT NONE
        real(kind=8),intent(in)  ::  ibeg
        real(kind=8),intent(in)  ::  iend
        procedure(fun_int) ::  myfun
        !real(kind=8) myfun
        integer(kind=4),intent(in)  ::  p
        real(kind=8) ::  value

        real::h

        h=abs(ibeg-iend)
        value=myfun((ibeg+iend)/2)*h
    end function rect
END MODULE INTERFACES

