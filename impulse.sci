// SANCHIT GUPTA , Netaji Subhas Institute of Technology, New Delhi
// Function 1: tf(numerator,denominator) similar to tf() in matlab
// Function 3: ss(A,B,C,D) similar to ss in matlab
// Function 2: impulse(function, start_time, end_time)
// Sources : http://spoken-tutorial.org , https://help.scilab.org/docs/5.5.2/en_US/index.html
// EXAMPLE 1  
// a = tf([1 2],[4 7 2 2]) ;
// impulse(a,0,120);

// EXAMPLE 2
// A = [-0.5572 -0.7814 ; 0.7814  0];
// B = [1 -1 ; 0 2];
// C = [1.9691  6.4493];
// f = ss(a,b,c,0);
// impulse(f)

//Defining a function tf(numerator,denominator) similar to tf() in matlab. 
function [f] = tf(num,den);
    s=poly(0,'s') ;
    num2=0 ;
    den2=0 ;
    for i = 1:length(num)
        num1(i)=num(i)*s^(length(num)-i)
        num2=num2+num1(i)
    end
    for i = 1:length(den)
        den1(i)=den(i)*s^(length(den)-i)
        den2=den2+den1(i)
    end
    f = num2/den2  // f is the required transfer function
endfunction

// Defining default values of A, B, C and D 
A = [] ;
B = [] ;
C = [] ;
D = [] ;
x0 = 0 ;

// ss(A,B,C,D,Initial_Conditions) 
function[f] = ss(A,B,C,D,x0) ;
    f = syslin('c',A,B,C) ;  // Here we are assuming initial state values to be zero.
    f = ss2tf(f) ;
endfunction

// Defining default start_time and end_time of the impulse plot if not given by the user. 
t_start = 0 ;
t_end = 10 ;

// impulse(function, start_time, end_time)
function[] = impulse(f,t_start,t_end); 
    s = %s
    f1 = syslin('c',f);  // Assuming the system to be linear
    t=t_start:0.01:t_end ;
    for i=1:length(f)/2 ;
        y = csim('impulse',t,f1(1,i)) ;
        plot(t,y);
        mtlb_hold on ;
    end
    mtlb_hold off ;
endfunction
 
