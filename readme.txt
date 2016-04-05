In this repository, I have created a code for Impulse function which plots an Impulse Response for the given system. The second code is of Get Peak Gain that gives the maximum gain for a given system in the specified range of frequencies. You should have Scilab version 5.5.2 pre-installed in your computer for running this code. If you don't have Scilab 5.5.2 then go to http://www.scilab.org/ for downloading and installing Scilab. 

Once you have all the required pre-requisites done, you are now ready to download and run the code files.
Step 1: Download the files in .SCI format. 
Step 2: Save the downloaded files in the location of your choice.  For example, you may save them to the Scilab-5.5.2 folder for convenience. 
Step 3: Now Open Scilab and in the Console Window type exec('Path_to_your_scilab_file'). This will execute your sample_file.sci . 
        For example my code looks like "exec('/home/sanchit/Downloads/scilab-5.5.2/impulse.sci')" for impulse.sci file.
Step 4: Once the files are executed successfully, you are ready to use the functions in the file.


EXAMPLE for getPeakGain.sci file. 
Download and save the file to Scilab folder named Scilab-5.5.2 . Then I wrote this code in the Scilab Console Window
exec('/home/sanchit/Downloads/scilab-5.5.2/getPeakGain.sci') ;
[g f] = getPeakGain([1 2],[2 5 7 9],1,10) ; 
OUTPUT 
g = 0.57326 and f = 1.48


EXAMPLE for impulse.sci file. 
Download and save the file to Scilab folder named Scilab-5.5.2 . Then I wrote this code in the Scilab Console Window 
exec('/home/sanchit/Downloads/scilab-5.5.2/impulse.sci') ;
f1 = tf([2 4],[1 3 4 6]) ;
f2 = tf([1 2],[3 9  12  18]) ;
impulse(f1,0,10) 
mtlb_hold on ;
impulse(f2)
OUTPUT 
Plots the impulse response of function f1 and f2 simultaneously. 



