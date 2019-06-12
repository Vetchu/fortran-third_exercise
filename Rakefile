# Default build:
task :default do
  puts "Bulding"
  puts "----------------------------------------"
  Rake::Task["compile_fortran"].invoke
end
task :compile_fortran do
  Fortran_Flags = '-fPIC -std=f2008 -lcaf_mpi -fcoarray=lib'
#Fortran_Compiler = `which gfortran`.chomp
 #    Fortran_Compiler="mpiifort"
  Fortran_Compiler=`which caf`.chomp
 # Fortran_Compiler="~/intel/compilers_and_libraries_2019.3.199/linux/bin/intel64/ifort"

  unless $? == 0 # $? contains output from system call. (`which gfortran`)
    "Couldn't find Fortran compiler (Checks for GFortran)"
  end

  unless Fortran_Compiler.empty?
    # Fortran_Compiler="mpiifort"
    modfile="src/interfaces.F90"

    mainfile="src/main.f90"
    `#{Fortran_Compiler} #{Fortran_Flags} -c  #{mainfile} #{modfile}`
    puts "Compiling Fortran file: #{mainfile}"
    `#{Fortran_Compiler} #{Fortran_Compiler}  -o main interfaces.o main.o `
    puts "#{Fortran_Compiler} #{Fortran_Flags} #{file}"
  end

end
