function [A_union_B_x, A_union_B_y, int_A_union_B, int_B_union_A] = ...
    union_FL(A_inter_B_x, A_inter_B_y, A_minus_B_x, A_minus_B_y, B_minus_A_x, B_minus_A_y, ...
    int_i_A_B, int_i_B_A, int_A_minus_B, int_B_minus_A)

A_union_B_x = [A_inter_B_x' A_minus_B_x' B_minus_A_x']';
A_union_B_y = [A_inter_B_y' A_minus_B_y' B_minus_A_y']';
int_A_union_B = [int_i_A_B' int_A_minus_B' zeros(1,length(int_B_minus_A))]';
int_B_union_A = [int_i_B_A' zeros(1,length(int_A_minus_B)) int_B_minus_A']';