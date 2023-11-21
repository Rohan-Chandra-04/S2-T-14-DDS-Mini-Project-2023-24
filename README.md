# Patient-Friendly-Digital-Medical-Remainder

<!-- First Section -->
## Team Details
<details>
  <summary>Detail</summary>

  > Semester: 3rd Sem B. Tech. CSE

  > Section: S2

  > Member-1: 221CS215, D R Vikas, drvikas.221cs215@nitk.edu.in,9380745737

  > member-2: 221CS221, H Vignesh, hanumanlavignesh.221cs221@nitk.edu.in, 6281971681

  > Member-3: 221CS241, R Rohan Chandra, regulagaddarohanchandra.221cs241@nitk.edu.in,
8639884378
</details>

<!-- Second Section -->
## Abstract
<details>
  <summary>Detail</summary>
  
> 
IDEA:-
The central idea behind our project is to develop a patient-
friendly medication reminder system that eliminates the
complexities associated with medication scheduling and
enhances adherence
> 
OBJECTIVES:-
To address the issue, we have developed a patient-friendly
medication reminder system using a digital clock interface and
LED indicator. The system requires patients to input their
preferred dosing time, which can be either morning, afternoon,
or evening.

The core functionality of the system is to compare the current
time with the patient's selected dosing time and activate an
LED indicator when it's time to take the medication. This visual
cue makes it easier for patients to adhere to their medication
regimen.

The system incorporates real-time clock synchronization to
ensure accurate dosing time notifications. Patients can easily
set their dosing preferences and adjust them as needed. The
LED indicator serves as an intuitive and non-intrusive reminder,
enhancing medication adherence while minimizing the risk of
missed doses.

This innovative solution provides a user-friendly approach to
medication management, improving patient engagement, and
potentially contributing to better health outcomes. The
abstract outlines the core features of the patient-friendly
medication reminder system, which offers a simple and
effective way for patients to stay on track with their medication
schedules.

COMPONENTS:-
1)T - FLIP - FLOP

2)REGISTERS

3)COMPARTORS

4)LED FLASH LIGHT

5)DECODERS

![image](https://github.com/Rohan-Chandra-04/S2-T-14-DDS-Mini-Project-2023-24/assets/129037115/55f96c7c-5158-4e5a-b0f2-437c55f60efd)


</details>

<!-- Third Section -->
## Working
<details>
  <summary>Detail</summary>

  The Patient-Friendly Digital Clock with Alarm is a

specialized digital clock designed to cater to the unique

needs of patients. It provides a binary display, ensuring

patients can easily keep track of time. The clock is

equipped with customizable alarm settings, making it an

essential tool for individuals who require timely

medication, appointments, or rest.

Key Features:

Customizable Alarms: Patients can set 3 alarms throughout
the day, helping them remember important tasks such as
medication schedules.

Components Description:-

3 Registers: -Each Registers comprising 7 bits. These

registers are activated by a single 'enable' bit, granting them

functionality. Within their structure, 3 bits are dedicated to

timekeeping. Additionally, 2 sets of 2 bits are reserved for

storing up to 4 different medicines. The flexibility of these

registers allows any combination of 2 of 4 medicines to be

stored at a time.

the registers. When a match occurs, the system suggests the

medicines stored in the corresponding registers to the

patient.

6 Decoders:- each decoder converts binary to decimal

equivalent which represents to take which medicines.

LED flash-lights:- The LED Flashlights in our system serve

as instant visual indicators. When the comparators

successfully match the timings, these LED flashlights

illuminate, providing a clear and immediate signal to the

patient.

3 T flip-flop:- They are employed to facilitate the up-
counting process of the three bits.

Working:-

Flowchart
![image](https://github.com/Rohan-Chandra-04/S2-T-14-DDS-Mini-Project-2023-24/assets/129037115/e782e36f-fc21-439f-b3d2-a61516775726)


Working Model:

1) Clock Pulse Trigger:
A clock pulse initiates and synchronizes the circuit's operation, serving
as the system's heartbeat.

2) T Flip-Flop Up-Counter (Counts 0-7):
   
• Three T flip-flops work in tandem, enabling the up-counter to
cycle through values from 0 to 7.

• These values represent different time intervals in the patient's
daily schedule.

3) Display of 3 Bits:
 
• A display module showcases the 3 bits from the up-counter,
which together represent the current time interval.

4) Comparator Operation:

• Dedicated comparators diligently compare the 3 bits from the
up-counter with the 3 bits stored within each of the three
registers.

• The purpose is to pinpoint a precise match with the time settings
stored in the registers.

5) Activation of Decoders:
   
• When a match occurs, the corresponding comparator activates
the enable bit for the associated decoder.

• This decision-making step ensures that only the decoder relevant
to the current time interval is enabled.

6) Decoder Operation:

• Enabled by the comparators, the decoders come into play.

• They convert the 2 bits assigned to medicines into a decimal
representation.

• This decimal value corresponds to a specific medicine to be

7)LED Flashlights Activation:

• The system doesn't rely solely on numeric output; it incorporates
immediate visual cues.

• When the comparators find a match, indicating the prescribed
time interval, the corresponding LED flashlights come to life.

• This serves as an unmistakable signal for the patient to take the
medicines associated with the matched timings.

By following this intricate but well-structured sequence, the system
ensures that patients receive timely and specific medication

reminders, promoting health and adherence to their prescribed

regimen.

![image](https://github.com/Rohan-Chandra-04/S2-T-14-DDS-Mini-Project-2023-24/assets/129037115/c9e197b5-fb6e-4e21-a4af-617863c2cca0)


</details>

<!-- Fourth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>
#Main Circuit Diagram
 ![Screenshot from 2023-10-24 19-49-24](https://github.com/Rohan-Chandra-04/S2-T-14-DDS-Mini-Project-2023-24/assets/129037115/a8bbeb2b-b8d7-4a33-b49f-c11d35e1269a)
#Sub-Circuit diagram:
![Screenshot from 2023-10-24 19-39-31](https://github.com/Rohan-Chandra-04/S2-T-14-DDS-Mini-Project-2023-24/assets/129037115/4f11e44b-b537-4712-9c8d-c4e2b97ef336)

</details>

<!-- Fifth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>
<verilogCode>
  module mainCounter(input wire clk,
  
input wire reset,

input wire ld_morn,

input wire [6:0] data_in_morn,

input wire ld_mid,

input wire [6:0] data_in_mid,

input wire ld_night,

input wire [6:0] data_in_night,

output reg med_0, // Output representing medical condition 0

output reg med_1, // Output representing medical condition 1

output reg med_2, // Output representing medical condition 2

output reg med_3 // Output representing medical condition 3

);
reg [2:0] count; // 3-bit counter for time

reg [5:0] data_out_morn; // Data register for morning

reg [5:0] data_out_mid; // Data register for midday

reg [5:0] data_out_night; // Data register for night

wire en_morn, en_mid, en_night; // Enable signals

wire d00, d01, d02, d03, d10, d11, d12, d13, d20, d21, d22, d23; // Decoder outputs

// Instantiate the 3-bit up counter module

up_counter_3bit time(

.clk(clk),

.reset(reset),

.count(count)

);

// Instantiate LoadableRegister modules for morning, midday, and night

LoadableRegister morn(

.clk(clk),

.ld(ld_morn),

.data_in(data_in_morn),

.data_out(data_out_morn)
);

LoadableRegister mid(

.clk(clk),

.ld(ld_mid),

.data_in(data_in_mid),

.data_out(data_out_mid));

LoadableRegister night(

.clk(clk),

.ld(ld_night),

.data_in(data_in_night),

.data_out(data_out_night)
);

// Instantiate comparators for morning, midday, and night

comparator morn_comp(

.y(en_morn),

.t1(count[0]),

.s1(data_out_morn[0]),

.t2(count[1]),

.s2(data_out_morn[1]),

.t3(count[2]),

.s3(data_out_morn[2])
);

comparator mid_comp(

.y(en_mid),

.t1(count[0]),

.s1(data_out_mid[0]),

.t2(count[1]),

.s2(data_out_mid[1]),

.t3(count[2]),

.s3(data_out_mid[2])

);

comparator night_comp(

.y(en_night),

.t1(count[0]),

.s1(data_out_night[0]),

.t2(count[1]),

.s2(data_out_night[1]),

.t3(count[2]),

.s3(data_out_night[2])

);
// Instantiate decoders for morning, midday, and nightdecoder d_morn1(

.d3(d00),

.d2(d01),

.d1(d02),

.d0(d03),

.en(en_morn),

.x(data_out_morn[3]),

.y(data_out_morn[4])
);

decoder d_morn2(

.d3(d10),

.d2(d11),

.d1(d12),

.d0(d13),

.en(en_morn),

.x(data_out_morn[5]),

.y(data_out_morn[6])

);
decoder d_mid1(

.d3(d20),

.d2(d21),

.d1(d22),

.d0(d23),

.en(en_mid),

.x(data_out_mid[3]),

.y(data_out_mid[4])
);

decoder d_mid2(

.d3(d30),

.d2(d31),

.d1(d32),

.d0(d33),

.en(en_mid),

.x(data_out_mid[5]),

.y(data_out_mid[6])
);

decoder d_night1(.d3(d40),

.d2(d41),

.d1(d42),

.d0(d43),

.en(en_night),

.x(data_out_night[3]),

.y(data_out_night[4])

);

decoder d_night2(

.d3(d50),

.d2(d51),

.d1(d52),

.d0(d53),

.en(en_night),

.x(data_out_night[5]),

.y(data_out_night[6])

);
// Combine decoder outputs to get medical condition outputs

assign med_0 = d00 + d01 + d10 + d11 + d20 + d21;

assign med_1 = d02 + d03 + d12 + d13 + d22 + d23;

assign med_2 = d30 + d31 + d40 + d41 + d50 + d51;

assign med_3 = d32 + d33 + d42 + d43 + d52 + d53;

endmodule

module decoder(

d3, d2, d1, d0, // Outputs

en, x, y // Inputs

);

input en, x, y;

output d3, d2, d1, d0;

// Decode logic for the outputs

assign d1 = en & (~x) & (~y);

assign d2 = en & (~x) & (y);

assign d3 = en & (x) & (~y);

assign d4 = en & (x) & (y);

endmodule

module comparator(
y, t1, s1, t2, s2, t3, s3 // Inputs and Output
);

input t1, s1, t2, s2, t3, s3;

output y;

// Comparator logic using XOR and AND operations

assign y = (~(t1 ^ s1)) & (~(t2 ^ s2)) & (~(t3 ^ s3));

endmodule

module LoadableRegister (

input wire clk,

input wire ld,

input wire [6:0] data_in,

output reg [5:0] data_out

);

always @(posedge clk or posedge ld)

begin

if (ld)

data_out <= data_in; // Load data on clock edge or when ld is asserted

end

endmodule

module up_counter_3bit(

input wire clk,

input wire reset,

output reg [2:0] count

);

reg t1, t2, t3;

always @(posedge clk or posedge reset) begin

if (reset)

count <= 3'b000; // Reset the counter to 0

else begint1 <= ~count[0];

t2 <= count[0] & ~count[1];

t3 <= count[0] & count[1] & ~count[2];

count[0] <= t1;

count[1] <= t2;

count[2] <= t3; // Counter logic for counting

end

end

endmodule
</verilogCode>
<Testbench>
Test Bench: -

`include "code.v"

`timescale 1s/1s

module code_tb;

reg clk;

reg reset;

reg ld_morn;

reg [6:0] data_in_morn;

reg ld_mid;

reg [6:0] data_in_mid;

reg ld_night;

reg [6:0] data_in_night;

wire med_0;

wire med_1;

wire med_2;

wire med_3;

mainCounter model1(clk,

reset,

ld_morn,

data_in_morn,

ld_mid,

data_in_mid,

ld_night,data_in_night,

med_0,

med_1,

med_2,

med_3);

initial

begin
$dumpfile("code_tb.vcd");

$dumpvars(0, code_tb);

always begin #5 clk=~clk;
end

$display("functionality of our code: ");

$display("clk, reset, ld_morn, [6:0] data_in_morn, ld_mid, [6:0] data_in_mid, ld_night, [6:0]

data_in_night, med_0, med_1, med_2, med_3");

$monitor(" %b %b %b %b%b%b %b%b %b%b %b %b%b%b %b%b %b%b %b
%b%b%b %b%b %b%b %b %b %b %b ");

reset = 1'b0;

ld_morn = 1'b0; ld_mid = 1'b1; ld_night= 1'b1; data_in_morn=6'b0000100,

data_in_mid=6'b1001000, data_in_night=6'b1110100;

end

endmodule
<\Testbench>

REFERENCES: -
Books: Morris Mano Design on Digital System

Digital Design and Computer Architecture.

https://www.sciencedirect.com/topics/engineering/load-multiple-register

https://www.tutorialspoint.com/digital_circuits/digital_circuits_decoders.htm

https://www.design-reuse.com/articles/54634/understanding-the-importance-of-prerequisites-in-the-

vlsi-physical-design-stage.html

Vote of Thanks: Actually, we are very thankful to you sir for giving us this idea of patient friendly clock

and also the idea to design our circuit in simple way using counters, registers and comparators, which

helped us to create this project.
</details>


# S2-T-14-DDS-Mini-Project-2023-24
