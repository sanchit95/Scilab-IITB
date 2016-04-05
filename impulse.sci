// SANCHIT GUPTA , Netaji Subhas Institute of Technology, New Delhi
// Function 1: tf(numerator,denominator) similar to tf() in matlab
// Function 2: impulse(function, start_time, end_time)
// EXAMPLE 1  
// a = tf([1 2],[4 7 2 2]) ;
// impulse(a,0,120);

// EXAMPLE 2
// impulse(tf([3],[1 2 0])) ;
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

// Defining default start_time and end_time of the impulse plot if not given by the user. 
t_start = 0 ;
t_end = 10 ;

// impulse(function, start_time, end_time)
function[] = impulse(f,t_start,t_end); 
    s = %s
    f1 = syslin('c',f);  // Assuming the system to be linear
    t=t_start:0.01:t_end ;
    y = csim('impulse',t,f1) ;
    plot(t,y);
endfunction
 
