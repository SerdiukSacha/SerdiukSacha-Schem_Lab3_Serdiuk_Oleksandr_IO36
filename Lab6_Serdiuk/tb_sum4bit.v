`timescale 1ns/1ps

module tb_sum4bit;

    // DUT ? ??????
    reg  [3:0] A, B;
    reg        cin;
    wire [3:0] S_dut, S_ref;
    wire       cout_dut, cout_ref;

    sum4bit     dut (.A(A), .B(B), .cin(cin), .S(S_dut), .cout(cout_dut));
    ref_sum4bit ref (.A(A), .B(B), .cin(cin), .S(S_ref), .cout(cout_ref));

    // (???????) ????? ? ModelSim/VCD
    initial begin
        $dumpfile("sum4bit.vcd");
        $dumpvars(0, tb_sum4bit);
    end

    task apply_and_print;
        input [3:0] a, b;
        input       c;
        begin
            {A, B, cin} = {a, b, c};
            #5;
            $display(" %b  %b   %b | %b  %b | %b  %b | %s",
                     a, b, c, S_dut, cout_dut, S_ref, cout_ref,
                     ({cout_dut, S_dut} == {cout_ref, S_ref}) ? "OK" : "FAIL");
        end
    endtask

    initial begin
        $display(" A     B   cin |  S  cout | refS refC | STATUS");
        $display("------------------------------------------------");
        apply_and_print(4'b0000, 4'b0000, 1'b0); // 0+0
        apply_and_print(4'b0101, 4'b0011, 1'b0); // 5+3
        apply_and_print(4'b1111, 4'b0001, 1'b0); // 15+1
        apply_and_print(4'b1010, 4'b0101, 1'b1); // 10+5+cin
        $display("------------------------------------------------");
        $finish;
    end
endmodule
