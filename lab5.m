Fs = 20000; 
T = 1/Fs;
fc= 1000;
f_m=50;
m=1; 
Amp = 1;
t_1= (0:1200)*T;
y_1=sin(2*pi*f_m*t_1); 
y_2=sin(2*pi*fc*t_1);
x= (Amp+m.*sin(2*pi*f_m*t_1)).*cos(2*pi*fc*t_1);

subplot(321)
plot(t_1,y_1);xlabel('Time');ylabel('Amp');
title('Message ');grid on;
subplot(322);plot(t_1,y_2);xlabel('Time');
ylabel('Amp');title('Carrier ');
grid on;

subplot(323)
plot(t_1,x,'r');xlabel('Time');
ylabel('Amp');title(' signal');
grid on;


X = abs (x);
subplot(324);
plot (t_1,X);
xlabel('Time');
ylabel('Amp');
title(' Signal Rectified');grid on;


fp = 150; 
fs = 2000; 
f1 = [0 fp/Fs fs/Fs 1]; 
M = [1 1 0 0];
h = firpm(63,f1,M); 
[H,w] = freqz(h,1,512);
subplot(325)
plot(w/pi,abs(H));
title ('Low Pass Filter');
xlabel ('Normalized Rad Freq');
ylabel ('Mag');grid on;


subplot(326);Y = filter(h,1,X);
plot (t_1,Y);title ('Filtered ');
xlabel ('Time');ylabel ('Mag');
grid on;