% plot script

% fig 1.0

% plot(t,y,'g')
% hold on
% plot(t,SmoothSignal(y,100),'r')
% hold off
% title('Plot of Unprocessed and Processed signals');
% xlabel('time (seconds)');
% ylabel('signal strength');

% processed - original
% unprocessed - post hundred

subplot(1,3,1)
plot(t,y,'black')
title('Plot of Unprocessed signal');
xlabel('time (seconds)');
ylabel('signal strength');

subplot(1,3,2)
plot(t,SmoothSignalPass(y),'black')
title('Plot of Processed signal (1 pass)');
xlabel('time (seconds)');
ylabel('signal strength');

subplot(1,3,3)
plot(t,SmoothSignal(y,100),'black')
title('Plot of Processed signal (100 passes)');
xlabel('time (seconds)');
ylabel('signal strength');
