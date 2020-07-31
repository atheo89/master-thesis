function [a] = OMP (x,D,k)
 
[m,n] = size (D) ; 
Q = zeros (m,k);
R = zeros (k,k);
Rinv = zeros (k,k) ;
w = zeros (m,k) ;
a = zeros (1,n) ;
Res = x;
 
for J = 1 : k 
    [argval_k ,argmax_k(J)] = max(abs(D'*Res)) ;
    w (:,J) = D (:,argmax_k(J)) ;
    for I = 1 : J-1
        if (J-1 ~= 0)
            R (I,J) = Q (:,I)' * w (:,J) ;
            w (:,J) = w (:,J) - R (I,J) * Q (:,I) ;
        end
    end
    R (J,J) = norm (w (:,J)) ;
    Q (:,J) = w (:,J) / R (J,J) ;
    Res = Res - (Q (:,J) * Q (:,J)' * Res) ;  
end
 
for J = 1 : k
    Rinv (J,J) = 1 / R (J,J) ;
    if (J-1 ~= 0)
        for I = 1 : J-1
            Rinv (I,J) = -Rinv (J,J) * (Rinv (I,1:J-1) * R (1:J-1,J));
        end
    end
end
 
xx = Rinv * Q' * x ;
a(argmax_k) = xx ;
a=a’;
