fb = dwtfilterbank;
freqz(fb);
[psi,t] = wavelets(fb);
plot(t,psi')
grid on
title('Time-Centered Wavelets')
xlabel('Time')
ylabel('Magnitude')