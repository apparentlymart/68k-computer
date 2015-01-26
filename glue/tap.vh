`define ASSERT(cond, msg) ok(cond); $display(msg)

task ok;
   input ok;
   begin
      if (ok)
        $write("ok - [%4t] ", $time);
      else
        $write("not ok - [%4t] ", $time);
   end
endtask
