# Traffic-Light-Controller-using-Verilog

A Verilog implementation of a four-state traffic light controller for a highway and country road intersection.

## Description

This project implements a simple traffic light controller for an intersection between a highway and a country road. The controller alternates the right-of-way between the highway and country road with appropriate timing for green and yellow signals.

## State Diagram

The controller follows a four-state sequence:
- **State 0**: Highway Green, Country Road Red (8 clock cycles)
- **State 1**: Highway Yellow, Country Road Red (3 clock cycles)
- **State 2**: Highway Red, Country Road Green (8 clock cycles)
- **State 3**: Highway Red, Country Road Yellow (3 clock cycles)

After completing State 3, the system returns to State 0 and repeats the cycle.

## Files

- `TLC.v` - Main module implementation
- `TLC_test.v` - Testbench for simulation

## Implementation Details

- The traffic lights are encoded as 3-bit signals (RGB):
  - `3'b100`: Red
  - `3'b010`: Yellow
  - `3'b001`: Green
- Timing parameters are configurable in the code
- The controller uses a finite state machine (FSM) design pattern

## How to Simulate

Run the following commands to simulate the traffic light controller:

```bash
# Compile the design and testbench with Icarus Verilog
iverilog -o traffic_sim traffic_light_controller.v traffic_light_controller_tb.v

# Execute the simulation
vvp traffic_sim

# View the waveform
gtkwave traffic_light.vcd
```

## Waveform Visualization

The testbench generates a VCD file that can be viewed with GTKWave. The waveform shows the state transitions and corresponding light changes over time, demonstrating the complete cycle through all four states.

## Requirements

- Icarus Verilog (for compilation and simulation)
- GTKWave (for viewing the waveform file)

## Future Improvements

- Add pedestrian crossing functionality
- Implement sensors for vehicle detection
- Add emergency vehicle override mode
- Optimize timing parameters based on traffic patterns

