# Default build:
task :default do
  puts "Fortran Bridge"
  puts "----------------------------------------"
  Rake::Task["compile_fortran"].invoke
end
task :compile_fortran do
  Fortran_Flags = '-fPIC -std=f2008 -lcaf_mpi -fcoarray=lib -lm'
  Fortran_Compiler = `which gfortran`.chomp
  unless $? == 0 # $? contains output from system call. (`which gfortran`)
    "Couldn't find Fortran compiler (Checks for GFortran)"
  end

  unless Fortran_Compiler.empty?
    #  file="src/interfaces.F90"
    #  puts 'interfaces'
    #  `#{Fortran_Compiler} #{Fortran_Flags} -c #{file}`
    #    Fortran_Compiler="gfortran"

    file="src/main.f90"
    puts "Compiling Fortran file: #{file}"
    `#{Fortran_Compiler} #{Fortran_Flags} -o main #{file} src/interfaces.F90` #System call to compiler
    puts "#{Fortran_Compiler} #{Fortran_Flags} #{file}"
  end

  #puts "Didn't find any Fortran files to compile." if Fortran_Files.empty?
end
