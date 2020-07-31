function [a] = mySlideWindow(S,L)


L = 1;                      % for half window size of 3
S = [4 8 1 1 1 7 9 3];      % input signal
N = length(S);              % length of the signal

a = ones(1, N);             % array for output
for i = 1 : N
  % calculate standard deviation using the built-in std command
  % for the current window
  a(i) = std(S(max(1, i - L) : min(N, i + L)));
end



