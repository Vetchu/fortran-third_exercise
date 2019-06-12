# Fortran - Exercise 3 #

Third homework for Fortran university course focusing on Integration and coarrays in Fortran.

## Project Structure ##
├── Rakefile
├── README.md
├── res
├── src
│   ├── interfaces.F90
│   └── main.f90
└── tester.sh

## QuickSetup ##

	$ git clone https://github.com/Vetchu/fortran-third_exercise
	$ cd fortran-third_exercise
	$ rake #to prepare binaries
	$ bash tester.sh #to do test

## Results ##
 Results given here are of integration in interval [0.10] with 100 equal subintervals.
 
### Rectangular Integration ###

 x^2 
 
 	333.32500496692955     
 e^x
 
 	22016.291521461022     
 sin(x)
 
 	1.8398380598531630     

### Trapezoidal Integration###
 x^2
 
	 333.35000496730208     
 e^x
 
	 22043.817619749912     
 sin(x)
 
 	1.8375387413629165     

### Analytical Integration###
 x^2
 
	 1000/3
 e^x
 
	 22024
 sin(x)
 
	 1.839
 
## Conclusion ##
Given such starting conditions, we see clear difference between two Integration styles, yet none proves to be better in all cases, yet overall Rectangular one appears to be the winner here (despite the theory).
