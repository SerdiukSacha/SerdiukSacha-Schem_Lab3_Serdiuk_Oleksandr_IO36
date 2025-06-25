// 6-?????? ??????????? ???????
module sum6bit (
    input  wire [5:0] A,
    input  wire [5:0] B,
    input  wire       cin,
    output wire [5:0] S,
    output wire       cout
);
    wire c1, c2, c3, c4, c5;

    bitsum fa0 (.a(A[0]), .b(B[0]), .cin(cin), .sum(S[0]), .cout(c1));
    bitsum fa1 (.a(A[1]), .b(B[1]), .cin(c1 ), .sum(S[1]), .cout(c2));
    bitsum fa2 (.a(A[2]), .b(B[2]), .cin(c2 ), .sum(S[2]), .cout(c3));
    bitsum fa3 (.a(A[3]), .b(B[3]), .cin(c3 ), .sum(S[3]), .cout(c4));
    bitsum fa4 (.a(A[4]), .b(B[4]), .cin(c4 ), .sum(S[4]), .cout(c5));
    bitsum fa5 (.a(A[5]), .b(B[5]), .cin(c5 ), .sum(S[5]), .cout(cout));
endmodule
