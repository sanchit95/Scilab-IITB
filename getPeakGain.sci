// SANCHIT GUPTA , Netaji Subhas Institute of Technology, New Delhi.
// Function : [Peak_Gain Frequency] = getPeakGain(tf_numerator,tf_denominator,start_frequency, end_frequency)  
// Sources : http://spoken-tutorial.org , https://help.scilab.org/docs/5.5.2/en_US/index.html
// EXAMPLE 1
// [g f] = getPeakGain([1 2],[2 5 7 9],1,10) 

// EXAMPLE 2
// num = [52 66] 
// den = [31 43 21 70] 
// getPeakGain(num,den) 

// defining default values of start frequency and end frequency
w_start = 0.001 ;
w_end = 100   ;

// Function getPeakGain(tf_numerator,tf_denominator,start_frequency, end_frequency)  
function[peak_gain, freq] = getPeakGain(num,den,w_start,w_end) ;
    w = w_start:0.01:w_end ;    //Range of frequencies
    peak_gain = 0 ;
    freq = 0 ;
    j = sqrt(-1) ;
    for i=1:1:length(w) ;
        num2=0 ;
        den2=0 ;
        for k = 1:length(num) ;
            num1(k)=num(k)*(j*w(i))^(length(num)-k) ;
            num2=num2+num1(k) ;
        end
        for k = 1:length(den) ;
            den1(k)=den(k)*(j*w(i))^(length(den)-k) ;
            den2=den2+den1(k) ;
        end
        f = num2/den2 ; // f is the required transfer function in jw form

        mag(i) = round(abs(f)*100000)/100000 ;    // Gain
        if mag(i) > peak_gain  ;
            peak_gain = mag(i) ;
            freq  = w(i) ; 
        end
    end
endfunction

     
