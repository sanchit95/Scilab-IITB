// SANCHIT GUPTA , Netaji Subhas Institute of Technology, New Delhi.
// Function : [Peak_Gain Frequency] = getPeakGain(tf_numerator,tf_denominator,start_frequency, end_frequency)  
// Sources : http://spoken-tutorial.org , https://help.scilab.org/docs/5.5.2/en_US/index.html
// EXAMPLE 1
// [gain frequency] = getPeakGain(tf([1 2],[2 5 7 9]),1,10) 

// EXAMPLE 2
// A = [-0.5572 -0.7814 ; 0.7814  0];
// B = [1 -1 ; 0 2];
// C = [1.9691  6.4493];
// f = ss(A,B,C,0);
// [gain frequency] = getPeakGain(f)

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

// defining default values of start frequency and end frequency
w_start = 0.001 ;
w_end = 100   ;

// Function getPeakGain(function, start_frequency, end_frequency)  
function[peak_gain , frequency] = getPeakGain(func,w_start,w_end) ;
    w = w_start:0.01:w_end ;    //Range of frequencies
    freq = 0 ;
    peak_gain = 0 ;
    j = sqrt(-1) ;
    for i=1:1:length(w) ;
        f = abs(horner(func,j*w(i))) ; 
        mag(i) = max(f);    // Gain
        if mag(i) > peak_gain  ;
            peak_gain = mag(i) ;
            frequency  = w(i) ; 
        end
    end
    if length(f) >=2 ;
        peak_gain = linf(func) ;
    end
endfunction
