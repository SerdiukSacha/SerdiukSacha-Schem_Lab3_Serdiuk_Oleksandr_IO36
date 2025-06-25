// 4-?????? ??????????? ???????
module sum4bit (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       cin,
    output wire [3:0] S,
    output wire       cout
);
    wire c1, c2, c3;

    bitsum fa0 (.a(A[0]), .b(B[0]), .cin(cin), .sum(S[0]), .cout(c1));
    bitsum fa1 (.a(A[1]), .b(B[1]), .cin(c1 ), .sum(S[1]), .cout(c2));
    bitsum fa2 (.a(A[2]), .b(B[2]), .cin(c2 ), .sum(S[2]), .cout(c3));
    bitsum fa3 (.a(A[3]), .b(B[3]), .cin(c3 ), .sum(S[3]), .cout(cout));
endmodule

