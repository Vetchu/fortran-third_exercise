MODULE INTERFACES
    IMPLICIT NONE
    private

    INTEGER:: N=100
    public :: rectangular
    private :: integration
    interface integration
        function integrate  ( ibeg ,  iend , myfun , p)result( value)
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

    public :: fun_int
    interface fun_int
        function fun_int ( x )result( y )
            implicit  none
            real(kind= 8) ,intent(in)  ::  x
            real(kind= 8)  ::  y
        end function fun_int
    end  interface

CONTAINS
    function rectangular(ibeg,iend,myfun,p) result (value)
        IMPLICIT NONE
        real(kind=8),intent(in)  ::  ibeg
        real(kind=8),intent(in)  ::  iend
        procedure(fun_int) ::  myfun
        integer(kind=4),intent(in)  ::  p
        real(kind=8) ::  value

        value=(myfun(ibeg)+myfun(iend))/2*abs(ibeg-iend)
    end function rectangular
END MODULE INTERFACES

