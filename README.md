# Low-Pass-FIR-Filter
A verilog code was written for a simple low pass filter which takes two signals and removes the low frequency signal, using both Xilinx Vivado and modelsim to check the waveform and digital representation respectively

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
