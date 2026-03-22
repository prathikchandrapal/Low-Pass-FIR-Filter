# Low-Pass-FIR-Filter
A verilog code was written for a simple low pass filter which takes two signals and removes the low frequency signal, using both Xilinx Vivado and modelsim to check the waveform and digital representation respectively

A Finite Impulse Response filter is one of the two primary types of digital filters used in signal processing. Unlike an IIR (Infinite Impulse Response) filter, an FIR filter has no feedback, its output depends only on a finite window of past and present input samples. This makes FIR filters inherently stable and easy to implement in hardware.     

The general output equation of an N-tap FIR filter is:     
y[n] = h[0]·x[n] + h[1]·x[n-1] + h[2]·x[n-2] + ... + h[N-1]·x[n-(N-1)]      
where h[k] are the filter coefficients and x[n-k] are the delayed input samples. In this implementation all coefficients are set to 1, so the output is simply the sum of the last five input samples — a moving average, which is the simplest form of a low-pass filter.

A high-frequency signal oscillates rapidly, meaning within any 5 consecutive samples it will swing both positive and negative. When you sum those samples, the positive and negative values cancel each other out, driving the output close to zero.     
A low-frequency signal changes slowly, so all 5 samples stay roughly the same sign and magnitude — their sum remains large, passing the signal through. The filter is essentially too slow to track rapid oscillations, and that sluggishness is what makes it a low-pass filter.

Block Diagram:     
<img width="1428" height="562" alt="image" src="https://github.com/user-attachments/assets/985f7976-e9ea-41a5-8ea8-d89f4850f593" />

It's for fourth order filter , where all the coefficients are set to 1 . It just addes the last five samples

This just models the function of a fir filter , by changing the coefficients it can be turned in to low pass or high pass. Window function is used to remove ripples in frequency response curve. But is not implemented in the Project.

Output:    
![WhatsApp Image 2024-12-02 at 19 18 29](https://github.com/user-attachments/assets/2cdc7474-4df1-4dd1-bc58-0a5ec1dd4d0b)
Like in the output the last value 35 is the sum of sum of last five inputs which is all seven, for 31 the sum of 7,7,7,7,3. 
Window method comes in when narrowing the frequency response curve which can't be implemented with modelsim

References:
https://youtu.be/_WoqwSBkhj0
