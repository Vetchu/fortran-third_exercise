PROGRAM MAIN
    use interfaces
    IMPLICIT NONE

    procedure (integrate), pointer :: i_ptr => null ()
    procedure (fun_int), pointer :: f_ptr =>null()
    real(kind=8) :: h
    real(kind=8),codimension[*] ::res
    integer::input,i,N,func
    real(kind=8) :: ibeg, iend
    CHARACTER(len=10) :: arg

    call get_command_argument(1,arg)
    read(arg(1:10),'(I10)')input 
    call get_command_argument(2,arg)
    read(arg(1:10),'(f10.0)')ibeg
    call get_command_argument(3,arg)
    read(arg(1:10),'(f10.0)')iend 
    call get_command_argument(4,arg)
    read(arg(1:10),'(I10)')N 
    call get_command_argument(5,arg)
    read(arg(1:10),'(I10)')func 

    if(func==0) then
        f_ptr => my_pol
    else if(func==1) then
        f_ptr => my_exp
    else
        f_ptr => my_sin
    end if 
    !    if(this_image()==1) then
    !        write (*, '( / "Input test value: ")', advance="no" )
    !        read (*, *) input
    !    end if
    syncall()
    if (input== 0 ) then
        i_ptr => rect
    else
        i_ptr => trap
    end if
    res=0.0
    h=abs(ibeg-iend)/N

    !    write(*,*) ibeg,iend, h
    !    write(*,*) f_ptr(h)

    do i=this_image(),N,num_images()
    res=res+i_ptr(ibeg+(i-1)*h,ibeg+i*h,f_ptr,0)
    end do
    syncall()

    if(this_image()==1) then
        do i=2,num_images()
        res=res+res[i]
        end do
        write (*,*) "RESULT:",res 
        write (*,*) "IMAGES:",num_images()
    end if

    !procedure(fun_int):: sinus,square

END PROGRAM MAIN
