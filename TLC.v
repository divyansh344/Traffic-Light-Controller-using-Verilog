module traffic_light_controller(
    input clk,
    input reset,
    output reg [2:0] highway_lights,
    output reg [2:0] country_lights
);

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    
    parameter GREEN_DURATION = 8;
    parameter YELLOW_DURATION = 3;
    
    reg [1:0] state, next_state;
    reg [3:0] counter;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            counter <= 0;
        end else begin
            case (state)
                S0: begin
                    if (counter < GREEN_DURATION - 1)
                        counter <= counter + 1;
                    else begin
                        state <= S1;
                        counter <= 0;
                    end
                end
                
                S1: begin
                    if (counter < YELLOW_DURATION - 1)
                        counter <= counter + 1;
                    else begin
                        state <= S2;
                        counter <= 0;
                    end
                end
                
                S2: begin
                    if (counter < GREEN_DURATION - 1)
                        counter <= counter + 1;
                    else begin
                        state <= S3;
                        counter <= 0;
                    end
                end
                
                S3: begin
                    if (counter < YELLOW_DURATION - 1)
                        counter <= counter + 1;
                    else begin
                        state <= S0;
                        counter <= 0;
                    end
                end
                
                default: state <= S0;
            endcase
        end
    end
    
    always @(*) begin
        case (state)
            S0: begin
                highway_lights = 3'b001;
                country_lights = 3'b100;
            end
            
            S1: begin
                highway_lights = 3'b010;
                country_lights = 3'b100;
            end
            
            S2: begin
                highway_lights = 3'b100;
                country_lights = 3'b001;
            end
            
            S3: begin
                highway_lights = 3'b100;
                country_lights = 3'b010;
            end
            
            default: begin
                highway_lights = 3'b001;
                country_lights = 3'b100;
            end
        endcase
    end
    
endmodule