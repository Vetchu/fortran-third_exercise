PROGRAM INTERFACES



    interface
        function integrate  ( ibeg ,  iend , myfun , p)result( value)
            implicit  none
            !  beginning  o f  i n t e g r a t i o n  i n t e r v a l
            real(kind=8),intent(in)  ::  ibeg
            !  ending  o f  i n t e g r a t i o n  i n t e r v a l
            real(kind=8) ,intent(in)  ::  iend
            !  f u n c t i o n  to  be  i n t e g r a t e d
            procedure ( funint )  ::  myfun
            !  polynomial  order
            integer(kind=4) ,intent(in)  ::  p
            !  r e s u l t  o f  i n t e g r a t i o n
            real(kind=8)  : :  value
        end function integrate
    end  interface

    interface
        function fun_int ( x )result( y )
            implicit  none
            real(kind= 8) ,intent(in)  ::  x
            real(kind= 8)  ::  y
        end subroutine fun_int
    end  interface
END PROGRAM INTERFACES

