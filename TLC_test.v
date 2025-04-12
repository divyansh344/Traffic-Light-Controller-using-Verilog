`timescale 1ns/1ps

module traffic_light_controller_tb;
    reg clk;
    reg reset;
    wire [2:0] highway_lights;
    wire [2:0] country_lights;
    
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .highway_lights(highway_lights),
        .country_lights(country_lights)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_controller_tb);
    end
    
    initial begin
        reset = 1;
        #20;
        reset = 0;
        #500;
        $display("Simulation complete");
        $finish;
    end
    
    initial begin
        $monitor("Time: %0t, State: %0d, Highway: %b, Country: %b", 
                  $time, uut.state, highway_lights, country_lights);
    end
    
endmodule