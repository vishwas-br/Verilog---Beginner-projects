module half_subtractor_tb;
    reg a, b;
    wire diff, borrow;

    half_subtractor uut (.a(a), .b(b), .diff(diff), .borrow(borrow));

    initial begin
        $display("a b | diff borrow");
        $monitor("%b %b |  %b     %b", a, b, diff, borrow);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        #10 $finish;
    end
endmodule
