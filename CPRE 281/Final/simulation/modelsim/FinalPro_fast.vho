-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 12.1 Build 243 01/31/2013 Service Pack 1 SJ Full Version"

-- DATE "12/07/2014 19:49:08"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FinalProject IS
    PORT (
	A : OUT std_logic;
	D2 : IN std_logic;
	D1 : IN std_logic;
	D3 : IN std_logic;
	D7 : IN std_logic;
	D4 : IN std_logic;
	D5 : IN std_logic;
	D6 : IN std_logic;
	D8 : IN std_logic;
	w : IN std_logic;
	CLK : IN std_logic;
	B : OUT std_logic;
	C : OUT std_logic;
	D : OUT std_logic;
	E : OUT std_logic;
	F : OUT std_logic;
	G : OUT std_logic;
	test : OUT std_logic;
	a0 : OUT std_logic;
	decode1 : IN std_logic;
	decode2 : IN std_logic;
	a1 : OUT std_logic;
	a2 : OUT std_logic;
	a3 : OUT std_logic;
	a4 : OUT std_logic;
	a5 : OUT std_logic;
	b0 : OUT std_logic;
	b1 : OUT std_logic;
	b2 : OUT std_logic;
	b3 : OUT std_logic;
	b4 : OUT std_logic;
	b5 : OUT std_logic;
	b6 : OUT std_logic;
	c0 : OUT std_logic;
	c1 : OUT std_logic;
	c2 : OUT std_logic;
	c3 : OUT std_logic;
	c4 : OUT std_logic;
	c5 : OUT std_logic;
	c6 : OUT std_logic;
	a6 : OUT std_logic;
	e0 : OUT std_logic;
	e1 : OUT std_logic;
	e2 : OUT std_logic;
	e3 : OUT std_logic;
	e4 : OUT std_logic;
	e5 : OUT std_logic;
	e6 : OUT std_logic
	);
END FinalProject;

-- Design Ports Information
-- A	=>  Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- B	=>  Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C	=>  Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D	=>  Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- E	=>  Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- F	=>  Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- G	=>  Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- test	=>  Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a0	=>  Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a1	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a2	=>  Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a3	=>  Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a4	=>  Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a5	=>  Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- b0	=>  Location: PIN_V20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- b1	=>  Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- b2	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- b3	=>  Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- b4	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- b5	=>  Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- b6	=>  Location: PIN_AB24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- c0	=>  Location: PIN_AB23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- c1	=>  Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- c2	=>  Location: PIN_AC25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- c3	=>  Location: PIN_AC26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- c4	=>  Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- c5	=>  Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- c6	=>  Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a6	=>  Location: PIN_V13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- e0	=>  Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- e1	=>  Location: PIN_AA25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- e2	=>  Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- e3	=>  Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- e4	=>  Location: PIN_Y25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- e5	=>  Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- e6	=>  Location: PIN_W24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D8	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- w	=>  Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- decode1	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- decode2	=>  Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D7	=>  Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D6	=>  Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLK	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D5	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D4	=>  Location: PIN_AE14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D3	=>  Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D2	=>  Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D1	=>  Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF FinalProject IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic;
SIGNAL ww_D2 : std_logic;
SIGNAL ww_D1 : std_logic;
SIGNAL ww_D3 : std_logic;
SIGNAL ww_D7 : std_logic;
SIGNAL ww_D4 : std_logic;
SIGNAL ww_D5 : std_logic;
SIGNAL ww_D6 : std_logic;
SIGNAL ww_D8 : std_logic;
SIGNAL ww_w : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_B : std_logic;
SIGNAL ww_C : std_logic;
SIGNAL ww_D : std_logic;
SIGNAL ww_E : std_logic;
SIGNAL ww_F : std_logic;
SIGNAL ww_G : std_logic;
SIGNAL ww_test : std_logic;
SIGNAL ww_a0 : std_logic;
SIGNAL ww_decode1 : std_logic;
SIGNAL ww_decode2 : std_logic;
SIGNAL ww_a1 : std_logic;
SIGNAL ww_a2 : std_logic;
SIGNAL ww_a3 : std_logic;
SIGNAL ww_a4 : std_logic;
SIGNAL ww_a5 : std_logic;
SIGNAL ww_b0 : std_logic;
SIGNAL ww_b1 : std_logic;
SIGNAL ww_b2 : std_logic;
SIGNAL ww_b3 : std_logic;
SIGNAL ww_b4 : std_logic;
SIGNAL ww_b5 : std_logic;
SIGNAL ww_b6 : std_logic;
SIGNAL ww_c0 : std_logic;
SIGNAL ww_c1 : std_logic;
SIGNAL ww_c2 : std_logic;
SIGNAL ww_c3 : std_logic;
SIGNAL ww_c4 : std_logic;
SIGNAL ww_c5 : std_logic;
SIGNAL ww_c6 : std_logic;
SIGNAL ww_a6 : std_logic;
SIGNAL ww_e0 : std_logic;
SIGNAL ww_e1 : std_logic;
SIGNAL ww_e2 : std_logic;
SIGNAL ww_e3 : std_logic;
SIGNAL ww_e4 : std_logic;
SIGNAL ww_e5 : std_logic;
SIGNAL ww_e6 : std_logic;
SIGNAL \inst4|inst102|inst10~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst4|inst101|inst10~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst4|inst7~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst4|inst7~regout\ : std_logic;
SIGNAL \inst4|inst1~regout\ : std_logic;
SIGNAL \inst4|inst2~regout\ : std_logic;
SIGNAL \inst4|inst3~regout\ : std_logic;
SIGNAL \inst4|inst4~regout\ : std_logic;
SIGNAL \inst4|inst14~combout\ : std_logic;
SIGNAL \inst4|inst5~regout\ : std_logic;
SIGNAL \inst4|inst6~regout\ : std_logic;
SIGNAL \inst4|inst7~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst10~regout\ : std_logic;
SIGNAL \inst4|inst2~0_combout\ : std_logic;
SIGNAL \inst4|inst3~0_combout\ : std_logic;
SIGNAL \inst4|inst4~0_combout\ : std_logic;
SIGNAL \inst4|inst5~0_combout\ : std_logic;
SIGNAL \inst4|inst6~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst8~regout\ : std_logic;
SIGNAL \inst4|inst102|inst1~regout\ : std_logic;
SIGNAL \inst4|inst102|inst2~regout\ : std_logic;
SIGNAL \inst4|inst102|inst3~regout\ : std_logic;
SIGNAL \inst4|inst102|inst4~regout\ : std_logic;
SIGNAL \inst4|inst102|inst14~combout\ : std_logic;
SIGNAL \inst4|inst102|inst9~regout\ : std_logic;
SIGNAL \inst4|inst102|inst5~regout\ : std_logic;
SIGNAL \inst4|inst102|inst6~regout\ : std_logic;
SIGNAL \inst4|inst102|inst7~regout\ : std_logic;
SIGNAL \inst4|inst102|inst10~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst10~1_combout\ : std_logic;
SIGNAL \inst4|inst101|inst10~regout\ : std_logic;
SIGNAL \inst4|inst102|inst8~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst8~1_combout\ : std_logic;
SIGNAL \inst4|inst102|inst2~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst3~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst4~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst9~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst9~1_combout\ : std_logic;
SIGNAL \inst4|inst102|inst5~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst6~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst7~0_combout\ : std_logic;
SIGNAL \inst4|inst101|inst8~regout\ : std_logic;
SIGNAL \inst4|inst101|inst1~regout\ : std_logic;
SIGNAL \inst4|inst101|inst2~regout\ : std_logic;
SIGNAL \inst4|inst101|inst3~regout\ : std_logic;
SIGNAL \inst4|inst101|inst4~regout\ : std_logic;
SIGNAL \inst4|inst101|inst14~combout\ : std_logic;
SIGNAL \inst4|inst101|inst9~regout\ : std_logic;
SIGNAL \inst4|inst101|inst5~regout\ : std_logic;
SIGNAL \inst4|inst101|inst6~regout\ : std_logic;
SIGNAL \inst4|inst101|inst7~regout\ : std_logic;
SIGNAL \inst4|inst101|inst10~0_combout\ : std_logic;
SIGNAL \inst4|inst101|inst10~1_combout\ : std_logic;
SIGNAL \inst4|inst101|inst8~0_combout\ : std_logic;
SIGNAL \inst4|inst101|inst8~1_combout\ : std_logic;
SIGNAL \inst4|inst101|inst2~0_combout\ : std_logic;
SIGNAL \inst4|inst101|inst3~0_combout\ : std_logic;
SIGNAL \inst4|inst101|inst4~0_combout\ : std_logic;
SIGNAL \inst4|inst101|inst9~0_combout\ : std_logic;
SIGNAL \inst4|inst101|inst9~1_combout\ : std_logic;
SIGNAL \inst4|inst101|inst5~0_combout\ : std_logic;
SIGNAL \inst4|inst101|inst6~0_combout\ : std_logic;
SIGNAL \inst4|inst101|inst7~0_combout\ : std_logic;
SIGNAL \inst4|inst1~0_combout\ : std_logic;
SIGNAL \inst4|inst102|inst1~0_combout\ : std_logic;
SIGNAL \inst4|inst101|inst1~0_combout\ : std_logic;
SIGNAL \D6~combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \D4~combout\ : std_logic;
SIGNAL \inst4|inst102|inst10~clkctrl_outclk\ : std_logic;
SIGNAL \inst4|inst101|inst10~clkctrl_outclk\ : std_logic;
SIGNAL \inst4|inst7~clkctrl_outclk\ : std_logic;
SIGNAL \CLK~clkctrl_outclk\ : std_logic;
SIGNAL \w~combout\ : std_logic;
SIGNAL \D8~combout\ : std_logic;
SIGNAL \D7~combout\ : std_logic;
SIGNAL \D5~combout\ : std_logic;
SIGNAL \D3~combout\ : std_logic;
SIGNAL \D2~combout\ : std_logic;
SIGNAL \D1~combout\ : std_logic;
SIGNAL \inst6|inst~regout\ : std_logic;
SIGNAL \inst6|inst9~0_combout\ : std_logic;
SIGNAL \inst6|inst1~regout\ : std_logic;
SIGNAL \inst6|inst12~0_combout\ : std_logic;
SIGNAL \inst6|inst2~regout\ : std_logic;
SIGNAL \inst6|inst15~0_combout\ : std_logic;
SIGNAL \inst6|inst3~regout\ : std_logic;
SIGNAL \inst6|inst18~0_combout\ : std_logic;
SIGNAL \inst6|inst4~regout\ : std_logic;
SIGNAL \inst6|inst21~0_combout\ : std_logic;
SIGNAL \inst6|inst5~regout\ : std_logic;
SIGNAL \inst6|inst24~0_combout\ : std_logic;
SIGNAL \inst6|inst28~regout\ : std_logic;
SIGNAL \inst6|inst27~0_combout\ : std_logic;
SIGNAL \inst6|inst6~regout\ : std_logic;
SIGNAL \inst|inst|X1~0_combout\ : std_logic;
SIGNAL \inst|inst|X1~1_combout\ : std_logic;
SIGNAL \inst|inst4~regout\ : std_logic;
SIGNAL \inst|inst|X3~4_combout\ : std_logic;
SIGNAL \inst|inst|X3~5_combout\ : std_logic;
SIGNAL \inst|inst2~regout\ : std_logic;
SIGNAL \inst|inst|X2~4_combout\ : std_logic;
SIGNAL \inst|inst|X2~5_combout\ : std_logic;
SIGNAL \inst|inst3~regout\ : std_logic;
SIGNAL \inst|inst|X4~2_combout\ : std_logic;
SIGNAL \inst|inst|X4~3_combout\ : std_logic;
SIGNAL \inst|inst1~regout\ : std_logic;
SIGNAL \inst1|WideOr0~0_combout\ : std_logic;
SIGNAL \inst1|WideOr1~0_combout\ : std_logic;
SIGNAL \inst1|WideOr2~0_combout\ : std_logic;
SIGNAL \inst1|WideOr3~0_combout\ : std_logic;
SIGNAL \inst1|WideOr4~0_combout\ : std_logic;
SIGNAL \inst1|WideOr5~0_combout\ : std_logic;
SIGNAL \inst1|WideOr6~0_combout\ : std_logic;
SIGNAL \inst2|inst4|inst~feeder_combout\ : std_logic;
SIGNAL \decode2~combout\ : std_logic;
SIGNAL \decode1~combout\ : std_logic;
SIGNAL \inst2|inst5|inst~combout\ : std_logic;
SIGNAL \inst2|inst4|inst~regout\ : std_logic;
SIGNAL \inst2|inst4|inst2~regout\ : std_logic;
SIGNAL \inst2|inst4|inst3~regout\ : std_logic;
SIGNAL \inst2|inst4|inst1~feeder_combout\ : std_logic;
SIGNAL \inst2|inst4|inst1~regout\ : std_logic;
SIGNAL \inst7|WideOr0~0_combout\ : std_logic;
SIGNAL \inst7|WideOr1~0_combout\ : std_logic;
SIGNAL \inst7|WideOr2~0_combout\ : std_logic;
SIGNAL \inst7|WideOr3~0_combout\ : std_logic;
SIGNAL \inst7|WideOr4~0_combout\ : std_logic;
SIGNAL \inst7|WideOr5~0_combout\ : std_logic;
SIGNAL \inst2|inst5|inst2~0_combout\ : std_logic;
SIGNAL \inst2|inst3|inst3~regout\ : std_logic;
SIGNAL \inst2|inst3|inst2~regout\ : std_logic;
SIGNAL \inst2|inst3|inst~regout\ : std_logic;
SIGNAL \inst2|inst3|inst1~regout\ : std_logic;
SIGNAL \inst8|WideOr0~0_combout\ : std_logic;
SIGNAL \inst8|WideOr1~0_combout\ : std_logic;
SIGNAL \inst8|WideOr2~0_combout\ : std_logic;
SIGNAL \inst8|WideOr3~0_combout\ : std_logic;
SIGNAL \inst8|WideOr4~0_combout\ : std_logic;
SIGNAL \inst8|WideOr5~0_combout\ : std_logic;
SIGNAL \inst8|WideOr6~0_combout\ : std_logic;
SIGNAL \inst2|inst1|inst1~feeder_combout\ : std_logic;
SIGNAL \inst2|inst5|inst2~1_combout\ : std_logic;
SIGNAL \inst2|inst1|inst1~regout\ : std_logic;
SIGNAL \inst2|inst1|inst2~feeder_combout\ : std_logic;
SIGNAL \inst2|inst1|inst2~regout\ : std_logic;
SIGNAL \inst2|inst1|inst3~feeder_combout\ : std_logic;
SIGNAL \inst2|inst1|inst3~regout\ : std_logic;
SIGNAL \inst2|inst1|inst~feeder_combout\ : std_logic;
SIGNAL \inst2|inst1|inst~regout\ : std_logic;
SIGNAL \inst9|WideOr0~0_combout\ : std_logic;
SIGNAL \inst9|WideOr1~0_combout\ : std_logic;
SIGNAL \inst9|WideOr2~0_combout\ : std_logic;
SIGNAL \inst9|WideOr3~0_combout\ : std_logic;
SIGNAL \inst9|WideOr4~0_combout\ : std_logic;
SIGNAL \inst9|WideOr5~0_combout\ : std_logic;
SIGNAL \inst9|WideOr6~0_combout\ : std_logic;
SIGNAL \inst7|WideOr6~0_combout\ : std_logic;
SIGNAL \inst2|inst5|inst2~2_combout\ : std_logic;
SIGNAL \inst2|inst|inst1~regout\ : std_logic;
SIGNAL \inst2|inst|inst2~regout\ : std_logic;
SIGNAL \inst2|inst|inst~regout\ : std_logic;
SIGNAL \inst2|inst|inst3~regout\ : std_logic;
SIGNAL \inst3|WideOr0~0_combout\ : std_logic;
SIGNAL \inst3|WideOr1~0_combout\ : std_logic;
SIGNAL \inst3|WideOr2~0_combout\ : std_logic;
SIGNAL \inst3|WideOr3~0_combout\ : std_logic;
SIGNAL \inst3|WideOr4~0_combout\ : std_logic;
SIGNAL \inst3|WideOr5~0_combout\ : std_logic;
SIGNAL \inst3|WideOr6~0_combout\ : std_logic;
SIGNAL \inst8|ALT_INV_WideOr6~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_WideOr6~0_combout\ : std_logic;
SIGNAL \inst3|ALT_INV_WideOr6~0_combout\ : std_logic;
SIGNAL \inst7|ALT_INV_WideOr6~0_combout\ : std_logic;
SIGNAL \inst9|ALT_INV_WideOr6~0_combout\ : std_logic;

BEGIN

A <= ww_A;
ww_D2 <= D2;
ww_D1 <= D1;
ww_D3 <= D3;
ww_D7 <= D7;
ww_D4 <= D4;
ww_D5 <= D5;
ww_D6 <= D6;
ww_D8 <= D8;
ww_w <= w;
ww_CLK <= CLK;
B <= ww_B;
C <= ww_C;
D <= ww_D;
E <= ww_E;
F <= ww_F;
G <= ww_G;
test <= ww_test;
a0 <= ww_a0;
ww_decode1 <= decode1;
ww_decode2 <= decode2;
a1 <= ww_a1;
a2 <= ww_a2;
a3 <= ww_a3;
a4 <= ww_a4;
a5 <= ww_a5;
b0 <= ww_b0;
b1 <= ww_b1;
b2 <= ww_b2;
b3 <= ww_b3;
b4 <= ww_b4;
b5 <= ww_b5;
b6 <= ww_b6;
c0 <= ww_c0;
c1 <= ww_c1;
c2 <= ww_c2;
c3 <= ww_c3;
c4 <= ww_c4;
c5 <= ww_c5;
c6 <= ww_c6;
a6 <= ww_a6;
e0 <= ww_e0;
e1 <= ww_e1;
e2 <= ww_e2;
e3 <= ww_e3;
e4 <= ww_e4;
e5 <= ww_e5;
e6 <= ww_e6;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst4|inst102|inst10~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst4|inst102|inst10~regout\);

\inst4|inst101|inst10~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst4|inst101|inst10~regout\);

\inst4|inst7~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst4|inst7~regout\);

\CLK~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK~combout\);
\inst8|ALT_INV_WideOr6~0_combout\ <= NOT \inst8|WideOr6~0_combout\;
\inst1|ALT_INV_WideOr6~0_combout\ <= NOT \inst1|WideOr6~0_combout\;
\inst3|ALT_INV_WideOr6~0_combout\ <= NOT \inst3|WideOr6~0_combout\;
\inst7|ALT_INV_WideOr6~0_combout\ <= NOT \inst7|WideOr6~0_combout\;
\inst9|ALT_INV_WideOr6~0_combout\ <= NOT \inst9|WideOr6~0_combout\;

-- Location: LCFF_X34_Y1_N17
\inst4|inst7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst102|inst10~clkctrl_outclk\,
	datain => \inst4|inst7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst7~regout\);

-- Location: LCFF_X34_Y1_N25
\inst4|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst102|inst10~clkctrl_outclk\,
	datain => \inst4|inst1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst1~regout\);

-- Location: LCFF_X34_Y1_N23
\inst4|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst102|inst10~clkctrl_outclk\,
	datain => \inst4|inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst2~regout\);

-- Location: LCFF_X34_Y1_N21
\inst4|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst102|inst10~clkctrl_outclk\,
	datain => \inst4|inst3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst3~regout\);

-- Location: LCFF_X34_Y1_N19
\inst4|inst4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst102|inst10~clkctrl_outclk\,
	datain => \inst4|inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst4~regout\);

-- Location: LCCOMB_X34_Y1_N26
\inst4|inst14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst14~combout\ = (\inst4|inst1~regout\ & (\inst4|inst2~regout\ & (\inst4|inst3~regout\ & \inst4|inst4~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst1~regout\,
	datab => \inst4|inst2~regout\,
	datac => \inst4|inst3~regout\,
	datad => \inst4|inst4~regout\,
	combout => \inst4|inst14~combout\);

-- Location: LCFF_X34_Y1_N9
\inst4|inst5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst102|inst10~clkctrl_outclk\,
	datain => \inst4|inst5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst5~regout\);

-- Location: LCFF_X34_Y1_N11
\inst4|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst102|inst10~clkctrl_outclk\,
	datain => \inst4|inst6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst6~regout\);

-- Location: LCCOMB_X34_Y1_N16
\inst4|inst7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst7~0_combout\ = \inst4|inst7~regout\ $ (((\inst4|inst6~regout\ & (\inst4|inst5~regout\ & \inst4|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst6~regout\,
	datab => \inst4|inst5~regout\,
	datac => \inst4|inst7~regout\,
	datad => \inst4|inst14~combout\,
	combout => \inst4|inst7~0_combout\);

-- Location: LCFF_X64_Y19_N27
\inst4|inst102|inst10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst101|inst10~clkctrl_outclk\,
	datain => \inst4|inst102|inst10~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst102|inst10~regout\);

-- Location: LCCOMB_X34_Y1_N22
\inst4|inst2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst2~0_combout\ = \inst4|inst2~regout\ $ (\inst4|inst1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst2~regout\,
	datad => \inst4|inst1~regout\,
	combout => \inst4|inst2~0_combout\);

-- Location: LCCOMB_X34_Y1_N20
\inst4|inst3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst3~0_combout\ = \inst4|inst3~regout\ $ (((\inst4|inst2~regout\ & \inst4|inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4|inst2~regout\,
	datac => \inst4|inst3~regout\,
	datad => \inst4|inst1~regout\,
	combout => \inst4|inst3~0_combout\);

-- Location: LCCOMB_X34_Y1_N18
\inst4|inst4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst4~0_combout\ = \inst4|inst4~regout\ $ (((\inst4|inst2~regout\ & (\inst4|inst3~regout\ & \inst4|inst1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst2~regout\,
	datab => \inst4|inst3~regout\,
	datac => \inst4|inst4~regout\,
	datad => \inst4|inst1~regout\,
	combout => \inst4|inst4~0_combout\);

-- Location: LCCOMB_X34_Y1_N8
\inst4|inst5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst5~0_combout\ = \inst4|inst5~regout\ $ (\inst4|inst14~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst5~regout\,
	datad => \inst4|inst14~combout\,
	combout => \inst4|inst5~0_combout\);

-- Location: LCCOMB_X34_Y1_N10
\inst4|inst6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst6~0_combout\ = \inst4|inst6~regout\ $ (((\inst4|inst5~regout\ & \inst4|inst14~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4|inst5~regout\,
	datac => \inst4|inst6~regout\,
	datad => \inst4|inst14~combout\,
	combout => \inst4|inst6~0_combout\);

-- Location: LCFF_X64_Y19_N13
\inst4|inst102|inst8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst101|inst10~clkctrl_outclk\,
	datain => \inst4|inst102|inst8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst102|inst8~regout\);

-- Location: LCFF_X64_Y19_N21
\inst4|inst102|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst101|inst10~clkctrl_outclk\,
	datain => \inst4|inst102|inst1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst102|inst1~regout\);

-- Location: LCFF_X64_Y19_N3
\inst4|inst102|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst101|inst10~clkctrl_outclk\,
	datain => \inst4|inst102|inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst102|inst2~regout\);

-- Location: LCFF_X64_Y19_N9
\inst4|inst102|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst101|inst10~clkctrl_outclk\,
	datain => \inst4|inst102|inst3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst102|inst3~regout\);

-- Location: LCFF_X64_Y19_N31
\inst4|inst102|inst4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst101|inst10~clkctrl_outclk\,
	datain => \inst4|inst102|inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst102|inst4~regout\);

-- Location: LCCOMB_X64_Y19_N0
\inst4|inst102|inst14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst14~combout\ = (\inst4|inst102|inst1~regout\ & (\inst4|inst102|inst2~regout\ & (\inst4|inst102|inst3~regout\ & \inst4|inst102|inst4~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst102|inst1~regout\,
	datab => \inst4|inst102|inst2~regout\,
	datac => \inst4|inst102|inst3~regout\,
	datad => \inst4|inst102|inst4~regout\,
	combout => \inst4|inst102|inst14~combout\);

-- Location: LCFF_X64_Y19_N15
\inst4|inst102|inst9\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst101|inst10~clkctrl_outclk\,
	datain => \inst4|inst102|inst9~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst102|inst9~regout\);

-- Location: LCFF_X64_Y19_N17
\inst4|inst102|inst5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst101|inst10~clkctrl_outclk\,
	datain => \inst4|inst102|inst5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst102|inst5~regout\);

-- Location: LCFF_X64_Y19_N11
\inst4|inst102|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst101|inst10~clkctrl_outclk\,
	datain => \inst4|inst102|inst6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst102|inst6~regout\);

-- Location: LCFF_X64_Y19_N5
\inst4|inst102|inst7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst101|inst10~clkctrl_outclk\,
	datain => \inst4|inst102|inst7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst102|inst7~regout\);

-- Location: LCCOMB_X64_Y19_N6
\inst4|inst102|inst10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst10~0_combout\ = (((!\inst4|inst102|inst9~regout\) # (!\inst4|inst102|inst5~regout\)) # (!\inst4|inst102|inst7~regout\)) # (!\inst4|inst102|inst6~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst102|inst6~regout\,
	datab => \inst4|inst102|inst7~regout\,
	datac => \inst4|inst102|inst5~regout\,
	datad => \inst4|inst102|inst9~regout\,
	combout => \inst4|inst102|inst10~0_combout\);

-- Location: LCCOMB_X64_Y19_N26
\inst4|inst102|inst10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst10~1_combout\ = \inst4|inst102|inst10~regout\ $ (((!\inst4|inst102|inst10~0_combout\ & (\inst4|inst102|inst8~regout\ & \inst4|inst102|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst102|inst10~0_combout\,
	datab => \inst4|inst102|inst8~regout\,
	datac => \inst4|inst102|inst10~regout\,
	datad => \inst4|inst102|inst14~combout\,
	combout => \inst4|inst102|inst10~1_combout\);

-- Location: LCFF_X1_Y18_N13
\inst4|inst101|inst10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst4|inst101|inst10~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst101|inst10~regout\);

-- Location: LCCOMB_X64_Y19_N22
\inst4|inst102|inst8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst8~0_combout\ = (!\inst4|inst102|inst6~regout\) # (!\inst4|inst102|inst7~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst102|inst7~regout\,
	datad => \inst4|inst102|inst6~regout\,
	combout => \inst4|inst102|inst8~0_combout\);

-- Location: LCCOMB_X64_Y19_N12
\inst4|inst102|inst8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst8~1_combout\ = \inst4|inst102|inst8~regout\ $ (((\inst4|inst102|inst5~regout\ & (!\inst4|inst102|inst8~0_combout\ & \inst4|inst102|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst102|inst5~regout\,
	datab => \inst4|inst102|inst8~0_combout\,
	datac => \inst4|inst102|inst8~regout\,
	datad => \inst4|inst102|inst14~combout\,
	combout => \inst4|inst102|inst8~1_combout\);

-- Location: LCCOMB_X64_Y19_N2
\inst4|inst102|inst2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst2~0_combout\ = \inst4|inst102|inst2~regout\ $ (\inst4|inst102|inst1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst102|inst2~regout\,
	datad => \inst4|inst102|inst1~regout\,
	combout => \inst4|inst102|inst2~0_combout\);

-- Location: LCCOMB_X64_Y19_N8
\inst4|inst102|inst3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst3~0_combout\ = \inst4|inst102|inst3~regout\ $ (((\inst4|inst102|inst2~regout\ & \inst4|inst102|inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4|inst102|inst2~regout\,
	datac => \inst4|inst102|inst3~regout\,
	datad => \inst4|inst102|inst1~regout\,
	combout => \inst4|inst102|inst3~0_combout\);

-- Location: LCCOMB_X64_Y19_N30
\inst4|inst102|inst4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst4~0_combout\ = \inst4|inst102|inst4~regout\ $ (((\inst4|inst102|inst2~regout\ & (\inst4|inst102|inst3~regout\ & \inst4|inst102|inst1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst102|inst2~regout\,
	datab => \inst4|inst102|inst3~regout\,
	datac => \inst4|inst102|inst4~regout\,
	datad => \inst4|inst102|inst1~regout\,
	combout => \inst4|inst102|inst4~0_combout\);

-- Location: LCCOMB_X64_Y19_N18
\inst4|inst102|inst9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst9~0_combout\ = ((!\inst4|inst102|inst6~regout\) # (!\inst4|inst102|inst5~regout\)) # (!\inst4|inst102|inst7~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4|inst102|inst7~regout\,
	datac => \inst4|inst102|inst5~regout\,
	datad => \inst4|inst102|inst6~regout\,
	combout => \inst4|inst102|inst9~0_combout\);

-- Location: LCCOMB_X64_Y19_N14
\inst4|inst102|inst9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst9~1_combout\ = \inst4|inst102|inst9~regout\ $ (((\inst4|inst102|inst8~regout\ & (!\inst4|inst102|inst9~0_combout\ & \inst4|inst102|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst102|inst8~regout\,
	datab => \inst4|inst102|inst9~0_combout\,
	datac => \inst4|inst102|inst9~regout\,
	datad => \inst4|inst102|inst14~combout\,
	combout => \inst4|inst102|inst9~1_combout\);

-- Location: LCCOMB_X64_Y19_N16
\inst4|inst102|inst5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst5~0_combout\ = \inst4|inst102|inst5~regout\ $ (\inst4|inst102|inst14~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst102|inst5~regout\,
	datad => \inst4|inst102|inst14~combout\,
	combout => \inst4|inst102|inst5~0_combout\);

-- Location: LCCOMB_X64_Y19_N10
\inst4|inst102|inst6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst6~0_combout\ = \inst4|inst102|inst6~regout\ $ (((\inst4|inst102|inst5~regout\ & \inst4|inst102|inst14~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4|inst102|inst5~regout\,
	datac => \inst4|inst102|inst6~regout\,
	datad => \inst4|inst102|inst14~combout\,
	combout => \inst4|inst102|inst6~0_combout\);

-- Location: LCCOMB_X64_Y19_N4
\inst4|inst102|inst7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst7~0_combout\ = \inst4|inst102|inst7~regout\ $ (((\inst4|inst102|inst5~regout\ & (\inst4|inst102|inst6~regout\ & \inst4|inst102|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst102|inst5~regout\,
	datab => \inst4|inst102|inst6~regout\,
	datac => \inst4|inst102|inst7~regout\,
	datad => \inst4|inst102|inst14~combout\,
	combout => \inst4|inst102|inst7~0_combout\);

-- Location: LCFF_X1_Y18_N25
\inst4|inst101|inst8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst4|inst101|inst8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst101|inst8~regout\);

-- Location: LCFF_X1_Y18_N17
\inst4|inst101|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst4|inst101|inst1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst101|inst1~regout\);

-- Location: LCFF_X1_Y18_N9
\inst4|inst101|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst4|inst101|inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst101|inst2~regout\);

-- Location: LCFF_X1_Y18_N31
\inst4|inst101|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst4|inst101|inst3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst101|inst3~regout\);

-- Location: LCFF_X1_Y18_N27
\inst4|inst101|inst4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst4|inst101|inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst101|inst4~regout\);

-- Location: LCCOMB_X1_Y18_N22
\inst4|inst101|inst14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst14~combout\ = (\inst4|inst101|inst2~regout\ & (\inst4|inst101|inst4~regout\ & (\inst4|inst101|inst1~regout\ & \inst4|inst101|inst3~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst101|inst2~regout\,
	datab => \inst4|inst101|inst4~regout\,
	datac => \inst4|inst101|inst1~regout\,
	datad => \inst4|inst101|inst3~regout\,
	combout => \inst4|inst101|inst14~combout\);

-- Location: LCFF_X1_Y18_N21
\inst4|inst101|inst9\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst4|inst101|inst9~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst101|inst9~regout\);

-- Location: LCFF_X1_Y18_N15
\inst4|inst101|inst5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst4|inst101|inst5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst101|inst5~regout\);

-- Location: LCFF_X1_Y18_N19
\inst4|inst101|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst4|inst101|inst6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst101|inst6~regout\);

-- Location: LCFF_X1_Y18_N5
\inst4|inst101|inst7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \inst4|inst101|inst7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4|inst101|inst7~regout\);

-- Location: LCCOMB_X1_Y18_N28
\inst4|inst101|inst10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst10~0_combout\ = (((!\inst4|inst101|inst6~regout\) # (!\inst4|inst101|inst5~regout\)) # (!\inst4|inst101|inst7~regout\)) # (!\inst4|inst101|inst9~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst101|inst9~regout\,
	datab => \inst4|inst101|inst7~regout\,
	datac => \inst4|inst101|inst5~regout\,
	datad => \inst4|inst101|inst6~regout\,
	combout => \inst4|inst101|inst10~0_combout\);

-- Location: LCCOMB_X1_Y18_N12
\inst4|inst101|inst10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst10~1_combout\ = \inst4|inst101|inst10~regout\ $ (((\inst4|inst101|inst8~regout\ & (!\inst4|inst101|inst10~0_combout\ & \inst4|inst101|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst101|inst8~regout\,
	datab => \inst4|inst101|inst10~0_combout\,
	datac => \inst4|inst101|inst10~regout\,
	datad => \inst4|inst101|inst14~combout\,
	combout => \inst4|inst101|inst10~1_combout\);

-- Location: LCCOMB_X1_Y18_N2
\inst4|inst101|inst8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst8~0_combout\ = (!\inst4|inst101|inst6~regout\) # (!\inst4|inst101|inst7~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst101|inst7~regout\,
	datad => \inst4|inst101|inst6~regout\,
	combout => \inst4|inst101|inst8~0_combout\);

-- Location: LCCOMB_X1_Y18_N24
\inst4|inst101|inst8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst8~1_combout\ = \inst4|inst101|inst8~regout\ $ (((\inst4|inst101|inst5~regout\ & (!\inst4|inst101|inst8~0_combout\ & \inst4|inst101|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst101|inst5~regout\,
	datab => \inst4|inst101|inst8~0_combout\,
	datac => \inst4|inst101|inst8~regout\,
	datad => \inst4|inst101|inst14~combout\,
	combout => \inst4|inst101|inst8~1_combout\);

-- Location: LCCOMB_X1_Y18_N8
\inst4|inst101|inst2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst2~0_combout\ = \inst4|inst101|inst2~regout\ $ (\inst4|inst101|inst1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst101|inst2~regout\,
	datad => \inst4|inst101|inst1~regout\,
	combout => \inst4|inst101|inst2~0_combout\);

-- Location: LCCOMB_X1_Y18_N30
\inst4|inst101|inst3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst3~0_combout\ = \inst4|inst101|inst3~regout\ $ (((\inst4|inst101|inst2~regout\ & \inst4|inst101|inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4|inst101|inst2~regout\,
	datac => \inst4|inst101|inst3~regout\,
	datad => \inst4|inst101|inst1~regout\,
	combout => \inst4|inst101|inst3~0_combout\);

-- Location: LCCOMB_X1_Y18_N26
\inst4|inst101|inst4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst4~0_combout\ = \inst4|inst101|inst4~regout\ $ (((\inst4|inst101|inst2~regout\ & (\inst4|inst101|inst3~regout\ & \inst4|inst101|inst1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst101|inst2~regout\,
	datab => \inst4|inst101|inst3~regout\,
	datac => \inst4|inst101|inst4~regout\,
	datad => \inst4|inst101|inst1~regout\,
	combout => \inst4|inst101|inst4~0_combout\);

-- Location: LCCOMB_X1_Y18_N10
\inst4|inst101|inst9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst9~0_combout\ = ((!\inst4|inst101|inst5~regout\) # (!\inst4|inst101|inst7~regout\)) # (!\inst4|inst101|inst6~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst4|inst101|inst6~regout\,
	datac => \inst4|inst101|inst7~regout\,
	datad => \inst4|inst101|inst5~regout\,
	combout => \inst4|inst101|inst9~0_combout\);

-- Location: LCCOMB_X1_Y18_N20
\inst4|inst101|inst9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst9~1_combout\ = \inst4|inst101|inst9~regout\ $ (((!\inst4|inst101|inst9~0_combout\ & (\inst4|inst101|inst8~regout\ & \inst4|inst101|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst101|inst9~0_combout\,
	datab => \inst4|inst101|inst8~regout\,
	datac => \inst4|inst101|inst9~regout\,
	datad => \inst4|inst101|inst14~combout\,
	combout => \inst4|inst101|inst9~1_combout\);

-- Location: LCCOMB_X1_Y18_N14
\inst4|inst101|inst5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst5~0_combout\ = \inst4|inst101|inst5~regout\ $ (\inst4|inst101|inst14~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst101|inst5~regout\,
	datad => \inst4|inst101|inst14~combout\,
	combout => \inst4|inst101|inst5~0_combout\);

-- Location: LCCOMB_X1_Y18_N18
\inst4|inst101|inst6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst6~0_combout\ = \inst4|inst101|inst6~regout\ $ (((\inst4|inst101|inst5~regout\ & \inst4|inst101|inst14~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst101|inst5~regout\,
	datac => \inst4|inst101|inst6~regout\,
	datad => \inst4|inst101|inst14~combout\,
	combout => \inst4|inst101|inst6~0_combout\);

-- Location: LCCOMB_X1_Y18_N4
\inst4|inst101|inst7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst7~0_combout\ = \inst4|inst101|inst7~regout\ $ (((\inst4|inst101|inst6~regout\ & (\inst4|inst101|inst5~regout\ & \inst4|inst101|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst101|inst6~regout\,
	datab => \inst4|inst101|inst5~regout\,
	datac => \inst4|inst101|inst7~regout\,
	datad => \inst4|inst101|inst14~combout\,
	combout => \inst4|inst101|inst7~0_combout\);

-- Location: LCCOMB_X34_Y1_N24
\inst4|inst1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst1~0_combout\ = !\inst4|inst1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst1~regout\,
	combout => \inst4|inst1~0_combout\);

-- Location: LCCOMB_X64_Y19_N20
\inst4|inst102|inst1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst102|inst1~0_combout\ = !\inst4|inst102|inst1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst102|inst1~regout\,
	combout => \inst4|inst102|inst1~0_combout\);

-- Location: LCCOMB_X1_Y18_N16
\inst4|inst101|inst1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|inst101|inst1~0_combout\ = !\inst4|inst101|inst1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|inst101|inst1~regout\,
	combout => \inst4|inst101|inst1~0_combout\);

-- Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\D6~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_D6,
	combout => \D6~combout\);

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: PIN_AE14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\D4~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_D4,
	combout => \D4~combout\);

-- Location: CLKCTRL_G7
\inst4|inst102|inst10~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst4|inst102|inst10~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst4|inst102|inst10~clkctrl_outclk\);

-- Location: CLKCTRL_G3
\inst4|inst101|inst10~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst4|inst101|inst10~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst4|inst101|inst10~clkctrl_outclk\);

-- Location: CLKCTRL_G14
\inst4|inst7~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst4|inst7~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst4|inst7~clkctrl_outclk\);

-- Location: CLKCTRL_G2
\CLK~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~clkctrl_outclk\);

-- Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\w~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_w,
	combout => \w~combout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\D8~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_D8,
	combout => \D8~combout\);

-- Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\D7~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_D7,
	combout => \D7~combout\);

-- Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\D5~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_D5,
	combout => \D5~combout\);

-- Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\D3~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_D3,
	combout => \D3~combout\);

-- Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\D2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_D2,
	combout => \D2~combout\);

-- Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\D1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_D1,
	combout => \D1~combout\);

-- Location: LCFF_X56_Y7_N1
\inst6|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \D1~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6|inst~regout\);

-- Location: LCCOMB_X56_Y7_N22
\inst6|inst9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst6|inst9~0_combout\ = (\w~combout\ & ((\inst6|inst~regout\))) # (!\w~combout\ & (\D2~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D2~combout\,
	datac => \w~combout\,
	datad => \inst6|inst~regout\,
	combout => \inst6|inst9~0_combout\);

-- Location: LCFF_X56_Y7_N23
\inst6|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst6|inst9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6|inst1~regout\);

-- Location: LCCOMB_X56_Y7_N12
\inst6|inst12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst6|inst12~0_combout\ = (\w~combout\ & ((\inst6|inst1~regout\))) # (!\w~combout\ & (\D3~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D3~combout\,
	datac => \w~combout\,
	datad => \inst6|inst1~regout\,
	combout => \inst6|inst12~0_combout\);

-- Location: LCFF_X56_Y7_N13
\inst6|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst6|inst12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6|inst2~regout\);

-- Location: LCCOMB_X56_Y7_N2
\inst6|inst15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst6|inst15~0_combout\ = (\w~combout\ & ((\inst6|inst2~regout\))) # (!\w~combout\ & (\D4~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D4~combout\,
	datac => \w~combout\,
	datad => \inst6|inst2~regout\,
	combout => \inst6|inst15~0_combout\);

-- Location: LCFF_X56_Y7_N3
\inst6|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst6|inst15~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6|inst3~regout\);

-- Location: LCCOMB_X56_Y7_N28
\inst6|inst18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst6|inst18~0_combout\ = (\w~combout\ & ((\inst6|inst3~regout\))) # (!\w~combout\ & (\D5~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D5~combout\,
	datac => \w~combout\,
	datad => \inst6|inst3~regout\,
	combout => \inst6|inst18~0_combout\);

-- Location: LCFF_X56_Y7_N29
\inst6|inst4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst6|inst18~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6|inst4~regout\);

-- Location: LCCOMB_X56_Y7_N26
\inst6|inst21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst6|inst21~0_combout\ = (\w~combout\ & ((\inst6|inst4~regout\))) # (!\w~combout\ & (\D6~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D6~combout\,
	datac => \w~combout\,
	datad => \inst6|inst4~regout\,
	combout => \inst6|inst21~0_combout\);

-- Location: LCFF_X56_Y7_N27
\inst6|inst5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst6|inst21~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6|inst5~regout\);

-- Location: LCCOMB_X56_Y7_N8
\inst6|inst24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst6|inst24~0_combout\ = (\w~combout\ & ((\inst6|inst5~regout\))) # (!\w~combout\ & (\D7~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D7~combout\,
	datac => \w~combout\,
	datad => \inst6|inst5~regout\,
	combout => \inst6|inst24~0_combout\);

-- Location: LCFF_X56_Y7_N9
\inst6|inst28\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst6|inst24~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6|inst28~regout\);

-- Location: LCCOMB_X53_Y7_N6
\inst6|inst27~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst6|inst27~0_combout\ = (\w~combout\ & ((\inst6|inst28~regout\))) # (!\w~combout\ & (\D8~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \D8~combout\,
	datad => \inst6|inst28~regout\,
	combout => \inst6|inst27~0_combout\);

-- Location: LCFF_X53_Y7_N7
\inst6|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst6|inst27~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6|inst6~regout\);

-- Location: LCCOMB_X53_Y7_N26
\inst|inst|X1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|inst|X1~0_combout\ = \inst|inst4~regout\ $ (\inst6|inst6~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst4~regout\,
	datad => \inst6|inst6~regout\,
	combout => \inst|inst|X1~0_combout\);

-- Location: LCCOMB_X53_Y7_N8
\inst|inst|X1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|inst|X1~1_combout\ = (\inst|inst|X1~0_combout\ & (((!\inst|inst3~regout\ & !\inst|inst2~regout\)) # (!\inst|inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst3~regout\,
	datab => \inst|inst2~regout\,
	datac => \inst|inst1~regout\,
	datad => \inst|inst|X1~0_combout\,
	combout => \inst|inst|X1~1_combout\);

-- Location: LCFF_X53_Y7_N9
\inst|inst4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst|inst|X1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|inst4~regout\);

-- Location: LCCOMB_X53_Y7_N12
\inst|inst|X3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|inst|X3~4_combout\ = (\inst|inst1~regout\ & (!\inst|inst3~regout\ & (!\inst|inst2~regout\))) # (!\inst|inst1~regout\ & (\inst|inst3~regout\ $ (\inst|inst2~regout\ $ (\inst6|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010100010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst3~regout\,
	datab => \inst|inst1~regout\,
	datac => \inst|inst2~regout\,
	datad => \inst6|inst6~regout\,
	combout => \inst|inst|X3~4_combout\);

-- Location: LCCOMB_X53_Y7_N4
\inst|inst|X3~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|inst|X3~5_combout\ = (\inst|inst|X3~4_combout\ & (\inst|inst2~regout\ $ (((\inst|inst1~regout\) # (!\inst|inst4~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1~regout\,
	datab => \inst|inst4~regout\,
	datac => \inst|inst2~regout\,
	datad => \inst|inst|X3~4_combout\,
	combout => \inst|inst|X3~5_combout\);

-- Location: LCFF_X53_Y7_N5
\inst|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst|inst|X3~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|inst2~regout\);

-- Location: LCCOMB_X53_Y7_N2
\inst|inst|X2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|inst|X2~4_combout\ = (\inst|inst1~regout\ & (!\inst|inst3~regout\ & (!\inst|inst2~regout\))) # (!\inst|inst1~regout\ & (\inst|inst3~regout\ $ (\inst|inst2~regout\ $ (\inst6|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100100010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst3~regout\,
	datab => \inst|inst2~regout\,
	datac => \inst|inst1~regout\,
	datad => \inst6|inst6~regout\,
	combout => \inst|inst|X2~4_combout\);

-- Location: LCCOMB_X53_Y7_N24
\inst|inst|X2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|inst|X2~5_combout\ = (\inst|inst4~regout\ & (!\inst|inst3~regout\ & (\inst|inst1~regout\ $ (!\inst|inst|X2~4_combout\)))) # (!\inst|inst4~regout\ & (!\inst|inst1~regout\ & ((\inst|inst|X2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1~regout\,
	datab => \inst|inst4~regout\,
	datac => \inst|inst3~regout\,
	datad => \inst|inst|X2~4_combout\,
	combout => \inst|inst|X2~5_combout\);

-- Location: LCFF_X53_Y7_N25
\inst|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst|inst|X2~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|inst3~regout\);

-- Location: LCCOMB_X53_Y7_N22
\inst|inst|X4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|inst|X4~2_combout\ = (\inst|inst4~regout\ & (!\inst|inst2~regout\ & (\inst|inst3~regout\ $ (\inst6|inst6~regout\)))) # (!\inst|inst4~regout\ & (\inst|inst3~regout\ & (\inst|inst2~regout\ $ (\inst6|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst4~regout\,
	datab => \inst|inst2~regout\,
	datac => \inst|inst3~regout\,
	datad => \inst6|inst6~regout\,
	combout => \inst|inst|X4~2_combout\);

-- Location: LCCOMB_X53_Y7_N14
\inst|inst|X4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|inst|X4~3_combout\ = (!\inst|inst1~regout\ & \inst|inst|X4~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst1~regout\,
	datad => \inst|inst|X4~2_combout\,
	combout => \inst|inst|X4~3_combout\);

-- Location: LCFF_X53_Y7_N15
\inst|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst|inst|X4~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|inst1~regout\);

-- Location: LCCOMB_X53_Y7_N18
\inst1|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|WideOr0~0_combout\ = (\inst|inst1~regout\ & (\inst|inst4~regout\ & (\inst|inst3~regout\ $ (\inst|inst2~regout\)))) # (!\inst|inst1~regout\ & (!\inst|inst3~regout\ & (\inst|inst4~regout\ $ (\inst|inst2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1~regout\,
	datab => \inst|inst3~regout\,
	datac => \inst|inst4~regout\,
	datad => \inst|inst2~regout\,
	combout => \inst1|WideOr0~0_combout\);

-- Location: LCCOMB_X53_Y7_N20
\inst1|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|WideOr1~0_combout\ = (\inst|inst1~regout\ & ((\inst|inst4~regout\ & (\inst|inst3~regout\)) # (!\inst|inst4~regout\ & ((\inst|inst2~regout\))))) # (!\inst|inst1~regout\ & (\inst|inst2~regout\ & (\inst|inst3~regout\ $ (\inst|inst4~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1~regout\,
	datab => \inst|inst3~regout\,
	datac => \inst|inst4~regout\,
	datad => \inst|inst2~regout\,
	combout => \inst1|WideOr1~0_combout\);

-- Location: LCCOMB_X53_Y7_N30
\inst1|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|WideOr2~0_combout\ = (\inst|inst1~regout\ & (\inst|inst2~regout\ & ((\inst|inst3~regout\) # (!\inst|inst4~regout\)))) # (!\inst|inst1~regout\ & (\inst|inst3~regout\ & (!\inst|inst4~regout\ & !\inst|inst2~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1~regout\,
	datab => \inst|inst3~regout\,
	datac => \inst|inst4~regout\,
	datad => \inst|inst2~regout\,
	combout => \inst1|WideOr2~0_combout\);

-- Location: LCCOMB_X53_Y7_N16
\inst1|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|WideOr3~0_combout\ = (\inst|inst3~regout\ & ((\inst|inst4~regout\ & ((\inst|inst2~regout\))) # (!\inst|inst4~regout\ & (\inst|inst1~regout\ & !\inst|inst2~regout\)))) # (!\inst|inst3~regout\ & (!\inst|inst1~regout\ & (\inst|inst4~regout\ $ 
-- (\inst|inst2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1~regout\,
	datab => \inst|inst3~regout\,
	datac => \inst|inst4~regout\,
	datad => \inst|inst2~regout\,
	combout => \inst1|WideOr3~0_combout\);

-- Location: LCCOMB_X53_Y7_N28
\inst1|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|WideOr4~0_combout\ = (\inst|inst3~regout\ & (!\inst|inst1~regout\ & (\inst|inst4~regout\))) # (!\inst|inst3~regout\ & ((\inst|inst2~regout\ & (!\inst|inst1~regout\)) # (!\inst|inst2~regout\ & ((\inst|inst4~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1~regout\,
	datab => \inst|inst3~regout\,
	datac => \inst|inst4~regout\,
	datad => \inst|inst2~regout\,
	combout => \inst1|WideOr4~0_combout\);

-- Location: LCCOMB_X53_Y7_N0
\inst1|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|WideOr5~0_combout\ = (\inst|inst3~regout\ & (!\inst|inst1~regout\ & ((\inst|inst4~regout\) # (!\inst|inst2~regout\)))) # (!\inst|inst3~regout\ & (\inst|inst4~regout\ & (\inst|inst1~regout\ $ (!\inst|inst2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1~regout\,
	datab => \inst|inst3~regout\,
	datac => \inst|inst4~regout\,
	datad => \inst|inst2~regout\,
	combout => \inst1|WideOr5~0_combout\);

-- Location: LCCOMB_X53_Y7_N10
\inst1|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|WideOr6~0_combout\ = (\inst|inst4~regout\ & ((\inst|inst1~regout\) # (\inst|inst3~regout\ $ (\inst|inst2~regout\)))) # (!\inst|inst4~regout\ & ((\inst|inst3~regout\) # (\inst|inst1~regout\ $ (\inst|inst2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst1~regout\,
	datab => \inst|inst3~regout\,
	datac => \inst|inst4~regout\,
	datad => \inst|inst2~regout\,
	combout => \inst1|WideOr6~0_combout\);

-- Location: LCCOMB_X54_Y7_N20
\inst2|inst4|inst~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst4|inst~feeder_combout\ = \inst|inst4~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst4~regout\,
	combout => \inst2|inst4|inst~feeder_combout\);

-- Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\decode2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_decode2,
	combout => \decode2~combout\);

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\decode1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_decode1,
	combout => \decode1~combout\);

-- Location: LCCOMB_X53_Y11_N16
\inst2|inst5|inst\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst5|inst~combout\ = (!\decode2~combout\ & !\decode1~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \decode2~combout\,
	datad => \decode1~combout\,
	combout => \inst2|inst5|inst~combout\);

-- Location: LCFF_X54_Y7_N21
\inst2|inst4|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst2|inst4|inst~feeder_combout\,
	ena => \inst2|inst5|inst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst4|inst~regout\);

-- Location: LCFF_X54_Y7_N5
\inst2|inst4|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \inst|inst2~regout\,
	sload => VCC,
	ena => \inst2|inst5|inst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst4|inst2~regout\);

-- Location: LCFF_X54_Y7_N15
\inst2|inst4|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \inst|inst1~regout\,
	sload => VCC,
	ena => \inst2|inst5|inst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst4|inst3~regout\);

-- Location: LCCOMB_X54_Y7_N26
\inst2|inst4|inst1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst4|inst1~feeder_combout\ = \inst|inst3~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst3~regout\,
	combout => \inst2|inst4|inst1~feeder_combout\);

-- Location: LCFF_X54_Y7_N27
\inst2|inst4|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst2|inst4|inst1~feeder_combout\,
	ena => \inst2|inst5|inst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst4|inst1~regout\);

-- Location: LCCOMB_X54_Y7_N16
\inst7|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst7|WideOr0~0_combout\ = (\inst2|inst4|inst2~regout\ & (!\inst2|inst4|inst1~regout\ & (\inst2|inst4|inst~regout\ $ (!\inst2|inst4|inst3~regout\)))) # (!\inst2|inst4|inst2~regout\ & (\inst2|inst4|inst~regout\ & (\inst2|inst4|inst3~regout\ $ 
-- (!\inst2|inst4|inst1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst4|inst~regout\,
	datab => \inst2|inst4|inst2~regout\,
	datac => \inst2|inst4|inst3~regout\,
	datad => \inst2|inst4|inst1~regout\,
	combout => \inst7|WideOr0~0_combout\);

-- Location: LCCOMB_X54_Y7_N10
\inst7|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst7|WideOr1~0_combout\ = (\inst2|inst4|inst3~regout\ & ((\inst2|inst4|inst~regout\ & ((\inst2|inst4|inst1~regout\))) # (!\inst2|inst4|inst~regout\ & (\inst2|inst4|inst2~regout\)))) # (!\inst2|inst4|inst3~regout\ & (\inst2|inst4|inst2~regout\ & 
-- (\inst2|inst4|inst~regout\ $ (\inst2|inst4|inst1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst4|inst~regout\,
	datab => \inst2|inst4|inst2~regout\,
	datac => \inst2|inst4|inst3~regout\,
	datad => \inst2|inst4|inst1~regout\,
	combout => \inst7|WideOr1~0_combout\);

-- Location: LCCOMB_X54_Y7_N4
\inst7|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst7|WideOr2~0_combout\ = (\inst2|inst4|inst3~regout\ & (\inst2|inst4|inst2~regout\ & ((\inst2|inst4|inst1~regout\) # (!\inst2|inst4|inst~regout\)))) # (!\inst2|inst4|inst3~regout\ & (!\inst2|inst4|inst~regout\ & (!\inst2|inst4|inst2~regout\ & 
-- \inst2|inst4|inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst4|inst~regout\,
	datab => \inst2|inst4|inst3~regout\,
	datac => \inst2|inst4|inst2~regout\,
	datad => \inst2|inst4|inst1~regout\,
	combout => \inst7|WideOr2~0_combout\);

-- Location: LCCOMB_X54_Y7_N14
\inst7|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst7|WideOr3~0_combout\ = (\inst2|inst4|inst1~regout\ & ((\inst2|inst4|inst~regout\ & (\inst2|inst4|inst2~regout\)) # (!\inst2|inst4|inst~regout\ & (!\inst2|inst4|inst2~regout\ & \inst2|inst4|inst3~regout\)))) # (!\inst2|inst4|inst1~regout\ & 
-- (!\inst2|inst4|inst3~regout\ & (\inst2|inst4|inst~regout\ $ (\inst2|inst4|inst2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst4|inst~regout\,
	datab => \inst2|inst4|inst2~regout\,
	datac => \inst2|inst4|inst3~regout\,
	datad => \inst2|inst4|inst1~regout\,
	combout => \inst7|WideOr3~0_combout\);

-- Location: LCCOMB_X54_Y7_N8
\inst7|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst7|WideOr4~0_combout\ = (\inst2|inst4|inst1~regout\ & (\inst2|inst4|inst~regout\ & ((!\inst2|inst4|inst3~regout\)))) # (!\inst2|inst4|inst1~regout\ & ((\inst2|inst4|inst2~regout\ & ((!\inst2|inst4|inst3~regout\))) # (!\inst2|inst4|inst2~regout\ & 
-- (\inst2|inst4|inst~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst4|inst~regout\,
	datab => \inst2|inst4|inst2~regout\,
	datac => \inst2|inst4|inst3~regout\,
	datad => \inst2|inst4|inst1~regout\,
	combout => \inst7|WideOr4~0_combout\);

-- Location: LCCOMB_X54_Y7_N18
\inst7|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst7|WideOr5~0_combout\ = (\inst2|inst4|inst~regout\ & (\inst2|inst4|inst3~regout\ $ (((\inst2|inst4|inst1~regout\) # (!\inst2|inst4|inst2~regout\))))) # (!\inst2|inst4|inst~regout\ & (!\inst2|inst4|inst2~regout\ & (!\inst2|inst4|inst3~regout\ & 
-- \inst2|inst4|inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst4|inst~regout\,
	datab => \inst2|inst4|inst2~regout\,
	datac => \inst2|inst4|inst3~regout\,
	datad => \inst2|inst4|inst1~regout\,
	combout => \inst7|WideOr5~0_combout\);

-- Location: LCCOMB_X53_Y11_N10
\inst2|inst5|inst2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst5|inst2~0_combout\ = (!\decode2~combout\ & \decode1~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \decode2~combout\,
	datad => \decode1~combout\,
	combout => \inst2|inst5|inst2~0_combout\);

-- Location: LCFF_X54_Y7_N31
\inst2|inst3|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \inst|inst1~regout\,
	sload => VCC,
	ena => \inst2|inst5|inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst3|inst3~regout\);

-- Location: LCFF_X54_Y7_N1
\inst2|inst3|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \inst|inst2~regout\,
	sload => VCC,
	ena => \inst2|inst5|inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst3|inst2~regout\);

-- Location: LCFF_X54_Y7_N25
\inst2|inst3|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \inst|inst4~regout\,
	sload => VCC,
	ena => \inst2|inst5|inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst3|inst~regout\);

-- Location: LCFF_X54_Y7_N23
\inst2|inst3|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \inst|inst3~regout\,
	sload => VCC,
	ena => \inst2|inst5|inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst3|inst1~regout\);

-- Location: LCCOMB_X54_Y7_N24
\inst8|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst8|WideOr0~0_combout\ = (\inst2|inst3|inst3~regout\ & (\inst2|inst3|inst~regout\ & (\inst2|inst3|inst2~regout\ $ (\inst2|inst3|inst1~regout\)))) # (!\inst2|inst3|inst3~regout\ & (!\inst2|inst3|inst1~regout\ & (\inst2|inst3|inst2~regout\ $ 
-- (\inst2|inst3|inst~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst3|inst3~regout\,
	datab => \inst2|inst3|inst2~regout\,
	datac => \inst2|inst3|inst~regout\,
	datad => \inst2|inst3|inst1~regout\,
	combout => \inst8|WideOr0~0_combout\);

-- Location: LCCOMB_X54_Y7_N22
\inst8|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst8|WideOr1~0_combout\ = (\inst2|inst3|inst3~regout\ & ((\inst2|inst3|inst~regout\ & (\inst2|inst3|inst1~regout\)) # (!\inst2|inst3|inst~regout\ & ((\inst2|inst3|inst2~regout\))))) # (!\inst2|inst3|inst3~regout\ & (\inst2|inst3|inst2~regout\ & 
-- (\inst2|inst3|inst~regout\ $ (\inst2|inst3|inst1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst3|inst~regout\,
	datab => \inst2|inst3|inst3~regout\,
	datac => \inst2|inst3|inst1~regout\,
	datad => \inst2|inst3|inst2~regout\,
	combout => \inst8|WideOr1~0_combout\);

-- Location: LCCOMB_X54_Y7_N0
\inst8|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst8|WideOr2~0_combout\ = (\inst2|inst3|inst3~regout\ & (\inst2|inst3|inst2~regout\ & ((\inst2|inst3|inst1~regout\) # (!\inst2|inst3|inst~regout\)))) # (!\inst2|inst3|inst3~regout\ & (!\inst2|inst3|inst~regout\ & (!\inst2|inst3|inst2~regout\ & 
-- \inst2|inst3|inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst3|inst~regout\,
	datab => \inst2|inst3|inst3~regout\,
	datac => \inst2|inst3|inst2~regout\,
	datad => \inst2|inst3|inst1~regout\,
	combout => \inst8|WideOr2~0_combout\);

-- Location: LCCOMB_X54_Y7_N30
\inst8|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst8|WideOr3~0_combout\ = (\inst2|inst3|inst1~regout\ & ((\inst2|inst3|inst~regout\ & (\inst2|inst3|inst2~regout\)) # (!\inst2|inst3|inst~regout\ & (!\inst2|inst3|inst2~regout\ & \inst2|inst3|inst3~regout\)))) # (!\inst2|inst3|inst1~regout\ & 
-- (!\inst2|inst3|inst3~regout\ & (\inst2|inst3|inst~regout\ $ (\inst2|inst3|inst2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst3|inst~regout\,
	datab => \inst2|inst3|inst2~regout\,
	datac => \inst2|inst3|inst3~regout\,
	datad => \inst2|inst3|inst1~regout\,
	combout => \inst8|WideOr3~0_combout\);

-- Location: LCCOMB_X54_Y7_N28
\inst8|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst8|WideOr4~0_combout\ = (\inst2|inst3|inst1~regout\ & (!\inst2|inst3|inst3~regout\ & ((\inst2|inst3|inst~regout\)))) # (!\inst2|inst3|inst1~regout\ & ((\inst2|inst3|inst2~regout\ & (!\inst2|inst3|inst3~regout\)) # (!\inst2|inst3|inst2~regout\ & 
-- ((\inst2|inst3|inst~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst3|inst3~regout\,
	datab => \inst2|inst3|inst2~regout\,
	datac => \inst2|inst3|inst~regout\,
	datad => \inst2|inst3|inst1~regout\,
	combout => \inst8|WideOr4~0_combout\);

-- Location: LCCOMB_X54_Y7_N6
\inst8|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst8|WideOr5~0_combout\ = (\inst2|inst3|inst2~regout\ & (\inst2|inst3|inst~regout\ & (\inst2|inst3|inst3~regout\ $ (\inst2|inst3|inst1~regout\)))) # (!\inst2|inst3|inst2~regout\ & (!\inst2|inst3|inst3~regout\ & ((\inst2|inst3|inst~regout\) # 
-- (\inst2|inst3|inst1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst3|inst3~regout\,
	datab => \inst2|inst3|inst2~regout\,
	datac => \inst2|inst3|inst~regout\,
	datad => \inst2|inst3|inst1~regout\,
	combout => \inst8|WideOr5~0_combout\);

-- Location: LCCOMB_X54_Y7_N12
\inst8|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst8|WideOr6~0_combout\ = (\inst2|inst3|inst~regout\ & ((\inst2|inst3|inst3~regout\) # (\inst2|inst3|inst2~regout\ $ (\inst2|inst3|inst1~regout\)))) # (!\inst2|inst3|inst~regout\ & ((\inst2|inst3|inst1~regout\) # (\inst2|inst3|inst3~regout\ $ 
-- (\inst2|inst3|inst2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst3|inst3~regout\,
	datab => \inst2|inst3|inst2~regout\,
	datac => \inst2|inst3|inst~regout\,
	datad => \inst2|inst3|inst1~regout\,
	combout => \inst8|WideOr6~0_combout\);

-- Location: LCCOMB_X56_Y7_N14
\inst2|inst1|inst1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst1|inst1~feeder_combout\ = \inst|inst3~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst3~regout\,
	combout => \inst2|inst1|inst1~feeder_combout\);

-- Location: LCCOMB_X53_Y11_N24
\inst2|inst5|inst2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst5|inst2~1_combout\ = (\decode2~combout\ & !\decode1~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \decode2~combout\,
	datad => \decode1~combout\,
	combout => \inst2|inst5|inst2~1_combout\);

-- Location: LCFF_X56_Y7_N15
\inst2|inst1|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst2|inst1|inst1~feeder_combout\,
	ena => \inst2|inst5|inst2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst1|inst1~regout\);

-- Location: LCCOMB_X56_Y7_N24
\inst2|inst1|inst2~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst1|inst2~feeder_combout\ = \inst|inst2~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst2~regout\,
	combout => \inst2|inst1|inst2~feeder_combout\);

-- Location: LCFF_X56_Y7_N25
\inst2|inst1|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst2|inst1|inst2~feeder_combout\,
	ena => \inst2|inst5|inst2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst1|inst2~regout\);

-- Location: LCCOMB_X56_Y7_N30
\inst2|inst1|inst3~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst1|inst3~feeder_combout\ = \inst|inst1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst1~regout\,
	combout => \inst2|inst1|inst3~feeder_combout\);

-- Location: LCFF_X56_Y7_N31
\inst2|inst1|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst2|inst1|inst3~feeder_combout\,
	ena => \inst2|inst5|inst2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst1|inst3~regout\);

-- Location: LCCOMB_X56_Y7_N16
\inst2|inst1|inst~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst1|inst~feeder_combout\ = \inst|inst4~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst4~regout\,
	combout => \inst2|inst1|inst~feeder_combout\);

-- Location: LCFF_X56_Y7_N17
\inst2|inst1|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	datain => \inst2|inst1|inst~feeder_combout\,
	ena => \inst2|inst5|inst2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst1|inst~regout\);

-- Location: LCCOMB_X57_Y7_N4
\inst9|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst9|WideOr0~0_combout\ = (\inst2|inst1|inst2~regout\ & (!\inst2|inst1|inst1~regout\ & (\inst2|inst1|inst3~regout\ $ (!\inst2|inst1|inst~regout\)))) # (!\inst2|inst1|inst2~regout\ & (\inst2|inst1|inst~regout\ & (\inst2|inst1|inst1~regout\ $ 
-- (!\inst2|inst1|inst3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst1|inst1~regout\,
	datab => \inst2|inst1|inst2~regout\,
	datac => \inst2|inst1|inst3~regout\,
	datad => \inst2|inst1|inst~regout\,
	combout => \inst9|WideOr0~0_combout\);

-- Location: LCCOMB_X57_Y7_N18
\inst9|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst9|WideOr1~0_combout\ = (\inst2|inst1|inst1~regout\ & ((\inst2|inst1|inst~regout\ & ((\inst2|inst1|inst3~regout\))) # (!\inst2|inst1|inst~regout\ & (\inst2|inst1|inst2~regout\)))) # (!\inst2|inst1|inst1~regout\ & (\inst2|inst1|inst2~regout\ & 
-- (\inst2|inst1|inst3~regout\ $ (\inst2|inst1|inst~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst1|inst1~regout\,
	datab => \inst2|inst1|inst2~regout\,
	datac => \inst2|inst1|inst3~regout\,
	datad => \inst2|inst1|inst~regout\,
	combout => \inst9|WideOr1~0_combout\);

-- Location: LCCOMB_X57_Y7_N16
\inst9|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst9|WideOr2~0_combout\ = (\inst2|inst1|inst2~regout\ & (\inst2|inst1|inst3~regout\ & ((\inst2|inst1|inst1~regout\) # (!\inst2|inst1|inst~regout\)))) # (!\inst2|inst1|inst2~regout\ & (\inst2|inst1|inst1~regout\ & (!\inst2|inst1|inst3~regout\ & 
-- !\inst2|inst1|inst~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst1|inst1~regout\,
	datab => \inst2|inst1|inst2~regout\,
	datac => \inst2|inst1|inst3~regout\,
	datad => \inst2|inst1|inst~regout\,
	combout => \inst9|WideOr2~0_combout\);

-- Location: LCCOMB_X57_Y7_N26
\inst9|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst9|WideOr3~0_combout\ = (\inst2|inst1|inst1~regout\ & ((\inst2|inst1|inst2~regout\ & ((\inst2|inst1|inst~regout\))) # (!\inst2|inst1|inst2~regout\ & (\inst2|inst1|inst3~regout\ & !\inst2|inst1|inst~regout\)))) # (!\inst2|inst1|inst1~regout\ & 
-- (!\inst2|inst1|inst3~regout\ & (\inst2|inst1|inst2~regout\ $ (\inst2|inst1|inst~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst1|inst1~regout\,
	datab => \inst2|inst1|inst2~regout\,
	datac => \inst2|inst1|inst3~regout\,
	datad => \inst2|inst1|inst~regout\,
	combout => \inst9|WideOr3~0_combout\);

-- Location: LCCOMB_X57_Y7_N20
\inst9|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst9|WideOr4~0_combout\ = (\inst2|inst1|inst1~regout\ & (((!\inst2|inst1|inst3~regout\ & \inst2|inst1|inst~regout\)))) # (!\inst2|inst1|inst1~regout\ & ((\inst2|inst1|inst2~regout\ & (!\inst2|inst1|inst3~regout\)) # (!\inst2|inst1|inst2~regout\ & 
-- ((\inst2|inst1|inst~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst1|inst1~regout\,
	datab => \inst2|inst1|inst2~regout\,
	datac => \inst2|inst1|inst3~regout\,
	datad => \inst2|inst1|inst~regout\,
	combout => \inst9|WideOr4~0_combout\);

-- Location: LCCOMB_X57_Y7_N10
\inst9|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst9|WideOr5~0_combout\ = (\inst2|inst1|inst1~regout\ & (!\inst2|inst1|inst3~regout\ & ((\inst2|inst1|inst~regout\) # (!\inst2|inst1|inst2~regout\)))) # (!\inst2|inst1|inst1~regout\ & (\inst2|inst1|inst~regout\ & (\inst2|inst1|inst2~regout\ $ 
-- (!\inst2|inst1|inst3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst1|inst1~regout\,
	datab => \inst2|inst1|inst2~regout\,
	datac => \inst2|inst1|inst3~regout\,
	datad => \inst2|inst1|inst~regout\,
	combout => \inst9|WideOr5~0_combout\);

-- Location: LCCOMB_X57_Y7_N12
\inst9|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst9|WideOr6~0_combout\ = (\inst2|inst1|inst~regout\ & ((\inst2|inst1|inst3~regout\) # (\inst2|inst1|inst1~regout\ $ (\inst2|inst1|inst2~regout\)))) # (!\inst2|inst1|inst~regout\ & ((\inst2|inst1|inst1~regout\) # (\inst2|inst1|inst2~regout\ $ 
-- (\inst2|inst1|inst3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst1|inst1~regout\,
	datab => \inst2|inst1|inst2~regout\,
	datac => \inst2|inst1|inst3~regout\,
	datad => \inst2|inst1|inst~regout\,
	combout => \inst9|WideOr6~0_combout\);

-- Location: LCCOMB_X54_Y7_N2
\inst7|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst7|WideOr6~0_combout\ = (\inst2|inst4|inst~regout\ & ((\inst2|inst4|inst3~regout\) # (\inst2|inst4|inst2~regout\ $ (\inst2|inst4|inst1~regout\)))) # (!\inst2|inst4|inst~regout\ & ((\inst2|inst4|inst1~regout\) # (\inst2|inst4|inst2~regout\ $ 
-- (\inst2|inst4|inst3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst4|inst~regout\,
	datab => \inst2|inst4|inst2~regout\,
	datac => \inst2|inst4|inst3~regout\,
	datad => \inst2|inst4|inst1~regout\,
	combout => \inst7|WideOr6~0_combout\);

-- Location: LCCOMB_X53_Y11_N2
\inst2|inst5|inst2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst5|inst2~2_combout\ = (\decode2~combout\ & \decode1~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \decode2~combout\,
	datad => \decode1~combout\,
	combout => \inst2|inst5|inst2~2_combout\);

-- Location: LCFF_X53_Y7_N23
\inst2|inst|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \inst|inst3~regout\,
	sload => VCC,
	ena => \inst2|inst5|inst2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst|inst1~regout\);

-- Location: LCFF_X53_Y7_N13
\inst2|inst|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \inst|inst2~regout\,
	sload => VCC,
	ena => \inst2|inst5|inst2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst|inst2~regout\);

-- Location: LCFF_X53_Y7_N27
\inst2|inst|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \inst|inst4~regout\,
	sload => VCC,
	ena => \inst2|inst5|inst2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst|inst~regout\);

-- Location: LCFF_X53_Y7_N3
\inst2|inst|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst4|inst7~clkctrl_outclk\,
	sdata => \inst|inst1~regout\,
	sload => VCC,
	ena => \inst2|inst5|inst2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst|inst3~regout\);

-- Location: LCCOMB_X57_Y7_N22
\inst3|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr0~0_combout\ = (\inst2|inst|inst2~regout\ & (!\inst2|inst|inst1~regout\ & (\inst2|inst|inst~regout\ $ (!\inst2|inst|inst3~regout\)))) # (!\inst2|inst|inst2~regout\ & (\inst2|inst|inst~regout\ & (\inst2|inst|inst1~regout\ $ 
-- (!\inst2|inst|inst3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst1~regout\,
	datab => \inst2|inst|inst2~regout\,
	datac => \inst2|inst|inst~regout\,
	datad => \inst2|inst|inst3~regout\,
	combout => \inst3|WideOr0~0_combout\);

-- Location: LCCOMB_X57_Y7_N24
\inst3|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr1~0_combout\ = (\inst2|inst|inst1~regout\ & ((\inst2|inst|inst~regout\ & ((\inst2|inst|inst3~regout\))) # (!\inst2|inst|inst~regout\ & (\inst2|inst|inst2~regout\)))) # (!\inst2|inst|inst1~regout\ & (\inst2|inst|inst2~regout\ & 
-- (\inst2|inst|inst~regout\ $ (\inst2|inst|inst3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst1~regout\,
	datab => \inst2|inst|inst2~regout\,
	datac => \inst2|inst|inst~regout\,
	datad => \inst2|inst|inst3~regout\,
	combout => \inst3|WideOr1~0_combout\);

-- Location: LCCOMB_X57_Y7_N6
\inst3|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr2~0_combout\ = (\inst2|inst|inst2~regout\ & (\inst2|inst|inst3~regout\ & ((\inst2|inst|inst1~regout\) # (!\inst2|inst|inst~regout\)))) # (!\inst2|inst|inst2~regout\ & (\inst2|inst|inst1~regout\ & (!\inst2|inst|inst~regout\ & 
-- !\inst2|inst|inst3~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst1~regout\,
	datab => \inst2|inst|inst2~regout\,
	datac => \inst2|inst|inst~regout\,
	datad => \inst2|inst|inst3~regout\,
	combout => \inst3|WideOr2~0_combout\);

-- Location: LCCOMB_X57_Y7_N0
\inst3|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr3~0_combout\ = (\inst2|inst|inst1~regout\ & ((\inst2|inst|inst2~regout\ & (\inst2|inst|inst~regout\)) # (!\inst2|inst|inst2~regout\ & (!\inst2|inst|inst~regout\ & \inst2|inst|inst3~regout\)))) # (!\inst2|inst|inst1~regout\ & 
-- (!\inst2|inst|inst3~regout\ & (\inst2|inst|inst2~regout\ $ (\inst2|inst|inst~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst1~regout\,
	datab => \inst2|inst|inst2~regout\,
	datac => \inst2|inst|inst~regout\,
	datad => \inst2|inst|inst3~regout\,
	combout => \inst3|WideOr3~0_combout\);

-- Location: LCCOMB_X57_Y7_N14
\inst3|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr4~0_combout\ = (\inst2|inst|inst1~regout\ & (((\inst2|inst|inst~regout\ & !\inst2|inst|inst3~regout\)))) # (!\inst2|inst|inst1~regout\ & ((\inst2|inst|inst2~regout\ & ((!\inst2|inst|inst3~regout\))) # (!\inst2|inst|inst2~regout\ & 
-- (\inst2|inst|inst~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst1~regout\,
	datab => \inst2|inst|inst2~regout\,
	datac => \inst2|inst|inst~regout\,
	datad => \inst2|inst|inst3~regout\,
	combout => \inst3|WideOr4~0_combout\);

-- Location: LCCOMB_X57_Y7_N28
\inst3|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr5~0_combout\ = (\inst2|inst|inst1~regout\ & (!\inst2|inst|inst3~regout\ & ((\inst2|inst|inst~regout\) # (!\inst2|inst|inst2~regout\)))) # (!\inst2|inst|inst1~regout\ & (\inst2|inst|inst~regout\ & (\inst2|inst|inst2~regout\ $ 
-- (!\inst2|inst|inst3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst1~regout\,
	datab => \inst2|inst|inst2~regout\,
	datac => \inst2|inst|inst~regout\,
	datad => \inst2|inst|inst3~regout\,
	combout => \inst3|WideOr5~0_combout\);

-- Location: LCCOMB_X57_Y7_N30
\inst3|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr6~0_combout\ = (\inst2|inst|inst~regout\ & ((\inst2|inst|inst3~regout\) # (\inst2|inst|inst1~regout\ $ (\inst2|inst|inst2~regout\)))) # (!\inst2|inst|inst~regout\ & ((\inst2|inst|inst1~regout\) # (\inst2|inst|inst2~regout\ $ 
-- (\inst2|inst|inst3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst1~regout\,
	datab => \inst2|inst|inst2~regout\,
	datac => \inst2|inst|inst~regout\,
	datad => \inst2|inst|inst3~regout\,
	combout => \inst3|WideOr6~0_combout\);

-- Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\A~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst1|WideOr0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_A);

-- Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\B~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst1|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_B);

-- Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst1|WideOr2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C);

-- Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\D~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst1|WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_D);

-- Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\E~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst1|WideOr4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_E);

-- Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\F~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst1|WideOr5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_F);

-- Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\G~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst1|ALT_INV_WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_G);

-- Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\test~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst6|inst6~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_test);

-- Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst7|WideOr0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a0);

-- Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst7|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a1);

-- Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst7|WideOr2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a2);

-- Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a3~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst7|WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a3);

-- Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a4~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst7|WideOr4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a4);

-- Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a5~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst7|WideOr5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a5);

-- Location: PIN_V20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\b0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst8|WideOr0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_b0);

-- Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\b1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst8|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_b1);

-- Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\b2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst8|WideOr2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_b2);

-- Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\b3~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst8|WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_b3);

-- Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\b4~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst8|WideOr4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_b4);

-- Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\b5~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst8|WideOr5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_b5);

-- Location: PIN_AB24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\b6~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst8|ALT_INV_WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_b6);

-- Location: PIN_AB23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\c0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst9|WideOr0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_c0);

-- Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\c1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst9|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_c1);

-- Location: PIN_AC25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\c2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst9|WideOr2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_c2);

-- Location: PIN_AC26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\c3~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst9|WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_c3);

-- Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\c4~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst9|WideOr4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_c4);

-- Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\c5~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst9|WideOr5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_c5);

-- Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\c6~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst9|ALT_INV_WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_c6);

-- Location: PIN_V13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\a6~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst7|ALT_INV_WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_a6);

-- Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\e0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|WideOr0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_e0);

-- Location: PIN_AA25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\e1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_e1);

-- Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\e2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|WideOr2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_e2);

-- Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\e3~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_e3);

-- Location: PIN_Y25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\e4~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|WideOr4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_e4);

-- Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\e5~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|WideOr5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_e5);

-- Location: PIN_W24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\e6~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|ALT_INV_WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_e6);
END structure;


