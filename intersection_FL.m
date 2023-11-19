function [A_inter_B_x, A_inter_B_y, int_i_A_B, int_i_B_A, ...
    A_minus_B_x, A_minus_B_y, int_A_minus_B, ...
    B_minus_A_x, B_minus_A_y, int_B_minus_A] = intersection_FL(A_x, A_y, B_x, B_y, int_A, int_B, tol)

% interaction between A and B - only those elements that are common to both A and B

% initialize

m=1;
n=1;

A_B_x=A_x;
A_B_y=A_y;
B_A_x=B_x;
B_A_y=B_y;

int_A_B = int_A;
int_B_A = int_B;

A_inter_B_x = NaN;
A_inter_B_y = NaN;
int_i_A_B = NaN;
int_i_B_A = NaN;

for i=1:length(A_B_x)
    for j=1:length(B_A_x)
        distance = abs(sqrt((A_B_x(i)-B_A_x(j))^2+(A_B_y(i)-B_A_y(j))^2 ));
        if(distance < tol)
            % taking the average of the coordinates
            A_inter_B_x(m)=0.5*(A_B_x(i)+B_A_x(j));
            A_inter_B_y(n)=0.5*(A_B_y(i)+B_A_y(j));  
            
            int_i_A_B(m)=int_A_B(i);
            int_i_B_A(n)=int_B_A(j);
            
            A_B_x(i)=NaN;
            A_B_y(i)=NaN;
            B_A_x(j)=NaN;
            B_A_y(j)=NaN;
            
            int_A_B(i)=NaN;
            int_B_A(j)=NaN;
            
            m=m+1;
            n=n+1;
        end
    end
end

A_inter_B_x=A_inter_B_x';
A_inter_B_y=A_inter_B_y';
int_i_A_B=int_i_A_B';
int_i_B_A=int_i_B_A';

% subtraction: A minus B - elements in A but not in B

A_minus_B_x = (A_B_x(~isnan(A_B_x)));
A_minus_B_y = (A_B_y(~isnan(A_B_y)));
int_A_minus_B = (int_A_B(~isnan(int_A_B)));

B_minus_A_x = (B_A_x(~isnan(B_A_x)));
B_minus_A_y = (B_A_y(~isnan(B_A_y)));
int_B_minus_A = (int_B_A(~isnan(int_B_A)));