PROGRAM MAIN
    use interfaces
    IMPLICIT NONE

    procedure (integrate), pointer :: i_ptr => null ()
    procedure (fun_int), pointer :: f_ptr =>null()
    real(kind=8) :: input,res,h,Ni
    integer::i,N

    real(kind=8) :: ibeg, iend
    f_ptr => my_pol
    ibeg=0
    iend=10

    write (*, '( / "Input test value: ")', advance="no" )
    read (*, *) input

    if ( input < 0 ) then
        i_ptr => rect
    else
        i_ptr => trap
    end if

    N=100
    res=0.0
    h=abs(ibeg-iend)/N

    write(*,*) ibeg,iend, h
    write(*,*) f_ptr(h)

    do i=0,N-1
        res=res+i_ptr(ibeg+i*h,ibeg+(i+1)*h,f_ptr,0)
    end do

    write (*, *)res 

    !procedure(fun_int):: sinus,square

END PROGRAM MAIN
