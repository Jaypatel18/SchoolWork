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

-- DATE "12/04/2015 04:07:32"

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

ENTITY 	Final IS
    PORT (
	\00\ : OUT std_logic;
	WR : IN std_logic;
	Clk : IN std_logic;
	Load : IN std_logic;
	W0 : IN std_logic;
	W1 : IN std_logic;
	W2 : IN std_logic;
	W3 : IN std_logic;
	W4 : IN std_logic;
	W5 : IN std_logic;
	W6 : IN std_logic;
	W7 : IN std_logic;
	\01\ : OUT std_logic;
	\02\ : OUT std_logic;
	\03\ : OUT std_logic;
	\04\ : OUT std_logic;
	\05\ : OUT std_logic;
	\06\ : OUT std_logic;
	\10\ : OUT std_logic;
	\11\ : OUT std_logic;
	\12\ : OUT std_logic;
	\13\ : OUT std_logic;
	\14\ : OUT std_logic;
	\15\ : OUT std_logic;
	\16\ : OUT std_logic;
	\20\ : OUT std_logic;
	\21\ : OUT std_logic;
	\22\ : OUT std_logic;
	\23\ : OUT std_logic;
	\24\ : OUT std_logic;
	\25\ : OUT std_logic;
	\26\ : OUT std_logic;
	\30\ : OUT std_logic;
	\31\ : OUT std_logic;
	\32\ : OUT std_logic;
	\33\ : OUT std_logic;
	\34\ : OUT std_logic;
	\35\ : OUT std_logic;
	\36\ : OUT std_logic
	);
END Final;

-- Design Ports Information
-- 00	=>  Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 01	=>  Location: PIN_AA25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 02	=>  Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 03	=>  Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 04	=>  Location: PIN_Y25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 05	=>  Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 06	=>  Location: PIN_W24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 10	=>  Location: PIN_AB23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 11	=>  Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 12	=>  Location: PIN_AC25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 13	=>  Location: PIN_AC26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 14	=>  Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 15	=>  Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 16	=>  Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 20	=>  Location: PIN_V20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 21	=>  Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 22	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 23	=>  Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 24	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 25	=>  Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 26	=>  Location: PIN_AB24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 30	=>  Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 31	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 32	=>  Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 33	=>  Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 34	=>  Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 35	=>  Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- 36	=>  Location: PIN_V13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Clk	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- WR	=>  Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Load	=>  Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- W0	=>  Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- W1	=>  Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- W2	=>  Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- W3	=>  Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- W4	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- W5	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- W6	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- W7	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Final IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \ww_00\ : std_logic;
SIGNAL ww_WR : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_Load : std_logic;
SIGNAL ww_W0 : std_logic;
SIGNAL ww_W1 : std_logic;
SIGNAL ww_W2 : std_logic;
SIGNAL ww_W3 : std_logic;
SIGNAL ww_W4 : std_logic;
SIGNAL ww_W5 : std_logic;
SIGNAL ww_W6 : std_logic;
SIGNAL ww_W7 : std_logic;
SIGNAL \ww_01\ : std_logic;
SIGNAL \ww_02\ : std_logic;
SIGNAL \ww_03\ : std_logic;
SIGNAL \ww_04\ : std_logic;
SIGNAL \ww_05\ : std_logic;
SIGNAL \ww_06\ : std_logic;
SIGNAL \ww_10\ : std_logic;
SIGNAL \ww_11\ : std_logic;
SIGNAL \ww_12\ : std_logic;
SIGNAL \ww_13\ : std_logic;
SIGNAL \ww_14\ : std_logic;
SIGNAL \ww_15\ : std_logic;
SIGNAL \ww_16\ : std_logic;
SIGNAL \ww_20\ : std_logic;
SIGNAL \ww_21\ : std_logic;
SIGNAL \ww_22\ : std_logic;
SIGNAL \ww_23\ : std_logic;
SIGNAL \ww_24\ : std_logic;
SIGNAL \ww_25\ : std_logic;
SIGNAL \ww_26\ : std_logic;
SIGNAL \ww_30\ : std_logic;
SIGNAL \ww_31\ : std_logic;
SIGNAL \ww_32\ : std_logic;
SIGNAL \ww_33\ : std_logic;
SIGNAL \ww_34\ : std_logic;
SIGNAL \ww_35\ : std_logic;
SIGNAL \ww_36\ : std_logic;
SIGNAL \inst1|inst~regout\ : std_logic;
SIGNAL \inst1|inst7~regout\ : std_logic;
SIGNAL \inst1|inst8~combout\ : std_logic;
SIGNAL \inst1|inst6~regout\ : std_logic;
SIGNAL \inst1|inst71~combout\ : std_logic;
SIGNAL \inst1|inst5~regout\ : std_logic;
SIGNAL \inst1|inst61~combout\ : std_logic;
SIGNAL \inst1|inst4~regout\ : std_logic;
SIGNAL \inst1|inst51~combout\ : std_logic;
SIGNAL \inst1|12~combout\ : std_logic;
SIGNAL \Clk~combout\ : std_logic;
SIGNAL \W1~combout\ : std_logic;
SIGNAL \W3~combout\ : std_logic;
SIGNAL \W4~combout\ : std_logic;
SIGNAL \W5~combout\ : std_logic;
SIGNAL \W6~combout\ : std_logic;
SIGNAL \W7~combout\ : std_logic;
SIGNAL \W0~combout\ : std_logic;
SIGNAL \Load~combout\ : std_logic;
SIGNAL \W2~combout\ : std_logic;
SIGNAL \inst1|inst9~combout\ : std_logic;
SIGNAL \inst1|inst1~regout\ : std_logic;
SIGNAL \inst1|inst10~combout\ : std_logic;
SIGNAL \inst1|inst2~regout\ : std_logic;
SIGNAL \inst1|inst11~combout\ : std_logic;
SIGNAL \inst1|inst3~regout\ : std_logic;
SIGNAL \inst2|inst11|_Y0~0_combout\ : std_logic;
SIGNAL \inst2|inst4~regout\ : std_logic;
SIGNAL \inst2|inst3~regout\ : std_logic;
SIGNAL \inst2|inst9|_Y3~0_combout\ : std_logic;
SIGNAL \inst2|inst9|_Y3~1_combout\ : std_logic;
SIGNAL \inst2|inst1~regout\ : std_logic;
SIGNAL \inst2|inst|_Y2~0_combout\ : std_logic;
SIGNAL \inst2|inst|_Y2~1_combout\ : std_logic;
SIGNAL \inst2|inst2~regout\ : std_logic;
SIGNAL \inst2|inst10|_Y1~1_combout\ : std_logic;
SIGNAL \inst2|inst10|_Y1~0_combout\ : std_logic;
SIGNAL \inst2|inst10|_Y1~2_combout\ : std_logic;
SIGNAL \decoder|inst9|inst8~feeder_combout\ : std_logic;
SIGNAL \WR~combout\ : std_logic;
SIGNAL \inst6|inst~0_combout\ : std_logic;
SIGNAL \inst6|inst~regout\ : std_logic;
SIGNAL \decoder|inst4|inst~combout\ : std_logic;
SIGNAL \decoder|inst9|inst8~regout\ : std_logic;
SIGNAL \decoder|inst9|inst~regout\ : std_logic;
SIGNAL \decoder|inst9|inst10~regout\ : std_logic;
SIGNAL \decoder|inst9|inst6~feeder_combout\ : std_logic;
SIGNAL \decoder|inst9|inst6~regout\ : std_logic;
SIGNAL \inst|WideOr0~0_combout\ : std_logic;
SIGNAL \inst|WideOr1~0_combout\ : std_logic;
SIGNAL \inst|WideOr2~0_combout\ : std_logic;
SIGNAL \inst|WideOr3~0_combout\ : std_logic;
SIGNAL \inst|WideOr4~0_combout\ : std_logic;
SIGNAL \inst|WideOr5~0_combout\ : std_logic;
SIGNAL \inst|WideOr6~0_combout\ : std_logic;
SIGNAL \inst6|inst1~0_combout\ : std_logic;
SIGNAL \inst6|inst1~regout\ : std_logic;
SIGNAL \decoder|inst4|inst7~combout\ : std_logic;
SIGNAL \decoder|inst10|inst8~regout\ : std_logic;
SIGNAL \decoder|inst10|inst~regout\ : std_logic;
SIGNAL \decoder|inst10|inst10~feeder_combout\ : std_logic;
SIGNAL \decoder|inst10|inst10~regout\ : std_logic;
SIGNAL \decoder|inst10|inst6~regout\ : std_logic;
SIGNAL \inst3|WideOr0~0_combout\ : std_logic;
SIGNAL \inst3|WideOr1~0_combout\ : std_logic;
SIGNAL \inst3|WideOr2~0_combout\ : std_logic;
SIGNAL \inst3|WideOr3~0_combout\ : std_logic;
SIGNAL \inst3|WideOr4~0_combout\ : std_logic;
SIGNAL \inst3|WideOr5~0_combout\ : std_logic;
SIGNAL \inst3|WideOr6~0_combout\ : std_logic;
SIGNAL \decoder|inst11|inst~feeder_combout\ : std_logic;
SIGNAL \decoder|inst4|inst8~combout\ : std_logic;
SIGNAL \decoder|inst11|inst~regout\ : std_logic;
SIGNAL \decoder|inst11|inst8~feeder_combout\ : std_logic;
SIGNAL \decoder|inst11|inst8~regout\ : std_logic;
SIGNAL \decoder|inst11|inst6~regout\ : std_logic;
SIGNAL \decoder|inst11|inst10~regout\ : std_logic;
SIGNAL \inst4|WideOr0~0_combout\ : std_logic;
SIGNAL \inst4|WideOr1~0_combout\ : std_logic;
SIGNAL \inst4|WideOr2~0_combout\ : std_logic;
SIGNAL \inst4|WideOr3~0_combout\ : std_logic;
SIGNAL \inst4|WideOr4~0_combout\ : std_logic;
SIGNAL \inst4|WideOr5~0_combout\ : std_logic;
SIGNAL \inst4|WideOr6~0_combout\ : std_logic;
SIGNAL \decoder|inst4|inst9~combout\ : std_logic;
SIGNAL \decoder|inst12|inst10~regout\ : std_logic;
SIGNAL \decoder|inst12|inst~regout\ : std_logic;
SIGNAL \decoder|inst12|inst8~feeder_combout\ : std_logic;
SIGNAL \decoder|inst12|inst8~regout\ : std_logic;
SIGNAL \decoder|inst12|inst6~feeder_combout\ : std_logic;
SIGNAL \decoder|inst12|inst6~regout\ : std_logic;
SIGNAL \inst5|WideOr0~0_combout\ : std_logic;
SIGNAL \inst5|WideOr1~0_combout\ : std_logic;
SIGNAL \inst5|WideOr2~0_combout\ : std_logic;
SIGNAL \inst5|WideOr3~0_combout\ : std_logic;
SIGNAL \inst5|WideOr4~0_combout\ : std_logic;
SIGNAL \inst5|WideOr5~0_combout\ : std_logic;
SIGNAL \inst5|WideOr6~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_WideOr6~0_combout\ : std_logic;
SIGNAL \inst4|ALT_INV_WideOr6~0_combout\ : std_logic;
SIGNAL \inst3|ALT_INV_WideOr6~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_WideOr6~0_combout\ : std_logic;

BEGIN

\00\ <= \ww_00\;
ww_WR <= WR;
ww_Clk <= Clk;
ww_Load <= Load;
ww_W0 <= W0;
ww_W1 <= W1;
ww_W2 <= W2;
ww_W3 <= W3;
ww_W4 <= W4;
ww_W5 <= W5;
ww_W6 <= W6;
ww_W7 <= W7;
\01\ <= \ww_01\;
\02\ <= \ww_02\;
\03\ <= \ww_03\;
\04\ <= \ww_04\;
\05\ <= \ww_05\;
\06\ <= \ww_06\;
\10\ <= \ww_10\;
\11\ <= \ww_11\;
\12\ <= \ww_12\;
\13\ <= \ww_13\;
\14\ <= \ww_14\;
\15\ <= \ww_15\;
\16\ <= \ww_16\;
\20\ <= \ww_20\;
\21\ <= \ww_21\;
\22\ <= \ww_22\;
\23\ <= \ww_23\;
\24\ <= \ww_24\;
\25\ <= \ww_25\;
\26\ <= \ww_26\;
\30\ <= \ww_30\;
\31\ <= \ww_31\;
\32\ <= \ww_32\;
\33\ <= \ww_33\;
\34\ <= \ww_34\;
\35\ <= \ww_35\;
\36\ <= \ww_36\;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst5|ALT_INV_WideOr6~0_combout\ <= NOT \inst5|WideOr6~0_combout\;
\inst4|ALT_INV_WideOr6~0_combout\ <= NOT \inst4|WideOr6~0_combout\;
\inst3|ALT_INV_WideOr6~0_combout\ <= NOT \inst3|WideOr6~0_combout\;
\inst|ALT_INV_WideOr6~0_combout\ <= NOT \inst|WideOr6~0_combout\;

-- Location: LCFF_X62_Y14_N13
\inst1|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst1|inst8~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst1|inst~regout\);

-- Location: LCFF_X62_Y14_N3
\inst1|inst7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst1|inst71~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst1|inst7~regout\);

-- Location: LCCOMB_X62_Y14_N12
\inst1|inst8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|inst8~combout\ = (\inst1|inst7~regout\) # ((\Load~combout\ & \W3~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~combout\,
	datab => \inst1|inst7~regout\,
	datac => \W3~combout\,
	combout => \inst1|inst8~combout\);

-- Location: LCFF_X62_Y14_N29
\inst1|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst1|inst61~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst1|inst6~regout\);

-- Location: LCCOMB_X62_Y14_N2
\inst1|inst71\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|inst71~combout\ = (\inst1|inst6~regout\) # ((\Load~combout\ & \W4~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~combout\,
	datab => \inst1|inst6~regout\,
	datac => \W4~combout\,
	combout => \inst1|inst71~combout\);

-- Location: LCFF_X62_Y14_N19
\inst1|inst5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst1|inst51~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst1|inst5~regout\);

-- Location: LCCOMB_X62_Y14_N28
\inst1|inst61\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|inst61~combout\ = (\inst1|inst5~regout\) # ((\Load~combout\ & \W5~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~combout\,
	datab => \inst1|inst5~regout\,
	datac => \W5~combout\,
	combout => \inst1|inst61~combout\);

-- Location: LCFF_X62_Y14_N1
\inst1|inst4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst1|12~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst1|inst4~regout\);

-- Location: LCCOMB_X62_Y14_N18
\inst1|inst51\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|inst51~combout\ = (\inst1|inst4~regout\) # ((\Load~combout\ & \W6~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~combout\,
	datab => \inst1|inst4~regout\,
	datac => \W6~combout\,
	combout => \inst1|inst51~combout\);

-- Location: LCCOMB_X62_Y14_N0
\inst1|12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|12~combout\ = (\W7~combout\ & \Load~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \W7~combout\,
	datac => \Load~combout\,
	combout => \inst1|12~combout\);

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Clk~I\ : cycloneii_io
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
	padio => ww_Clk,
	combout => \Clk~combout\);

-- Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\W1~I\ : cycloneii_io
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
	padio => ww_W1,
	combout => \W1~combout\);

-- Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\W3~I\ : cycloneii_io
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
	padio => ww_W3,
	combout => \W3~combout\);

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\W4~I\ : cycloneii_io
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
	padio => ww_W4,
	combout => \W4~combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\W5~I\ : cycloneii_io
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
	padio => ww_W5,
	combout => \W5~combout\);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\W6~I\ : cycloneii_io
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
	padio => ww_W6,
	combout => \W6~combout\);

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\W7~I\ : cycloneii_io
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
	padio => ww_W7,
	combout => \W7~combout\);

-- Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\W0~I\ : cycloneii_io
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
	padio => ww_W0,
	combout => \W0~combout\);

-- Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Load~I\ : cycloneii_io
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
	padio => ww_Load,
	combout => \Load~combout\);

-- Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\W2~I\ : cycloneii_io
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
	padio => ww_W2,
	combout => \W2~combout\);

-- Location: LCCOMB_X62_Y14_N6
\inst1|inst9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|inst9~combout\ = (\inst1|inst~regout\) # ((\Load~combout\ & \W2~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst~regout\,
	datac => \Load~combout\,
	datad => \W2~combout\,
	combout => \inst1|inst9~combout\);

-- Location: LCFF_X62_Y14_N7
\inst1|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst1|inst9~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst1|inst1~regout\);

-- Location: LCCOMB_X62_Y14_N16
\inst1|inst10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|inst10~combout\ = (\inst1|inst1~regout\) # ((\W1~combout\ & \Load~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \W1~combout\,
	datac => \Load~combout\,
	datad => \inst1|inst1~regout\,
	combout => \inst1|inst10~combout\);

-- Location: LCFF_X62_Y14_N17
\inst1|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst1|inst10~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst1|inst2~regout\);

-- Location: LCCOMB_X63_Y7_N2
\inst1|inst11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1|inst11~combout\ = (\inst1|inst2~regout\) # ((\Load~combout\ & \W0~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~combout\,
	datac => \W0~combout\,
	datad => \inst1|inst2~regout\,
	combout => \inst1|inst11~combout\);

-- Location: LCFF_X63_Y7_N3
\inst1|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst1|inst11~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst1|inst3~regout\);

-- Location: LCCOMB_X64_Y7_N10
\inst2|inst11|_Y0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst11|_Y0~0_combout\ = \inst2|inst4~regout\ $ (\inst1|inst3~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|inst4~regout\,
	datad => \inst1|inst3~regout\,
	combout => \inst2|inst11|_Y0~0_combout\);

-- Location: LCFF_X63_Y7_N21
\inst2|inst4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst11|_Y0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst4~regout\);

-- Location: LCFF_X63_Y7_N25
\inst2|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst10|_Y1~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst3~regout\);

-- Location: LCCOMB_X63_Y7_N22
\inst2|inst9|_Y3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst9|_Y3~0_combout\ = (\inst2|inst2~regout\) # ((\inst2|inst1~regout\ & !\inst2|inst3~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst1~regout\,
	datac => \inst2|inst2~regout\,
	datad => \inst2|inst3~regout\,
	combout => \inst2|inst9|_Y3~0_combout\);

-- Location: LCCOMB_X63_Y7_N14
\inst2|inst9|_Y3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst9|_Y3~1_combout\ = (\inst2|inst4~regout\ & (!\inst2|inst9|_Y3~0_combout\ & (\inst2|inst3~regout\ $ (\inst1|inst3~regout\)))) # (!\inst2|inst4~regout\ & (\inst2|inst3~regout\ & (\inst1|inst3~regout\ $ (\inst2|inst9|_Y3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst3~regout\,
	datab => \inst2|inst4~regout\,
	datac => \inst1|inst3~regout\,
	datad => \inst2|inst9|_Y3~0_combout\,
	combout => \inst2|inst9|_Y3~1_combout\);

-- Location: LCFF_X63_Y7_N13
\inst2|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst9|_Y3~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst1~regout\);

-- Location: LCCOMB_X63_Y7_N8
\inst2|inst|_Y2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst|_Y2~0_combout\ = \inst2|inst3~regout\ $ (\inst1|inst3~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst3~regout\,
	datad => \inst1|inst3~regout\,
	combout => \inst2|inst|_Y2~0_combout\);

-- Location: LCCOMB_X64_Y7_N8
\inst2|inst|_Y2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst|_Y2~1_combout\ = (\inst2|inst1~regout\) # ((\inst2|inst4~regout\ & (\inst2|inst2~regout\ & !\inst2|inst|_Y2~0_combout\)) # (!\inst2|inst4~regout\ & (!\inst2|inst2~regout\ & \inst2|inst|_Y2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst4~regout\,
	datab => \inst2|inst1~regout\,
	datac => \inst2|inst2~regout\,
	datad => \inst2|inst|_Y2~0_combout\,
	combout => \inst2|inst|_Y2~1_combout\);

-- Location: LCFF_X63_Y7_N19
\inst2|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst|_Y2~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|inst2~regout\);

-- Location: LCCOMB_X63_Y7_N18
\inst2|inst10|_Y1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst10|_Y1~1_combout\ = (!\inst2|inst2~regout\ & !\inst2|inst3~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|inst2~regout\,
	datad => \inst2|inst3~regout\,
	combout => \inst2|inst10|_Y1~1_combout\);

-- Location: LCCOMB_X63_Y7_N12
\inst2|inst10|_Y1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst10|_Y1~0_combout\ = (\inst2|inst3~regout\ & ((\inst2|inst4~regout\ & ((\inst2|inst1~regout\))) # (!\inst2|inst4~regout\ & (\inst2|inst2~regout\)))) # (!\inst2|inst3~regout\ & (\inst2|inst4~regout\ $ (((!\inst2|inst2~regout\ & 
-- !\inst2|inst1~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst3~regout\,
	datab => \inst2|inst2~regout\,
	datac => \inst2|inst1~regout\,
	datad => \inst2|inst4~regout\,
	combout => \inst2|inst10|_Y1~0_combout\);

-- Location: LCCOMB_X63_Y7_N20
\inst2|inst10|_Y1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2|inst10|_Y1~2_combout\ = (\inst1|inst3~regout\ & (((\inst2|inst10|_Y1~0_combout\)))) # (!\inst1|inst3~regout\ & ((\inst2|inst10|_Y1~1_combout\ & (\inst2|inst4~regout\)) # (!\inst2|inst10|_Y1~1_combout\ & (!\inst2|inst4~regout\ & 
-- !\inst2|inst10|_Y1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst3~regout\,
	datab => \inst2|inst10|_Y1~1_combout\,
	datac => \inst2|inst4~regout\,
	datad => \inst2|inst10|_Y1~0_combout\,
	combout => \inst2|inst10|_Y1~2_combout\);

-- Location: LCCOMB_X62_Y7_N14
\decoder|inst9|inst8~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst9|inst8~feeder_combout\ = \inst2|inst10|_Y1~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst2|inst10|_Y1~2_combout\,
	combout => \decoder|inst9|inst8~feeder_combout\);

-- Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\WR~I\ : cycloneii_io
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
	padio => ww_WR,
	combout => \WR~combout\);

-- Location: LCCOMB_X63_Y7_N6
\inst6|inst~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst6|inst~0_combout\ = \inst6|inst~regout\ $ (!\Load~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst6|inst~regout\,
	datad => \Load~combout\,
	combout => \inst6|inst~0_combout\);

-- Location: LCFF_X63_Y7_N7
\inst6|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst6|inst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6|inst~regout\);

-- Location: LCCOMB_X62_Y7_N4
\decoder|inst4|inst\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst4|inst~combout\ = (!\inst6|inst1~regout\ & (\WR~combout\ & !\inst6|inst~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|inst1~regout\,
	datab => \WR~combout\,
	datad => \inst6|inst~regout\,
	combout => \decoder|inst4|inst~combout\);

-- Location: LCFF_X62_Y7_N15
\decoder|inst9|inst8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \decoder|inst9|inst8~feeder_combout\,
	ena => \decoder|inst4|inst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst9|inst8~regout\);

-- Location: LCFF_X62_Y7_N23
\decoder|inst9|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst9|_Y3~1_combout\,
	sload => VCC,
	ena => \decoder|inst4|inst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst9|inst~regout\);

-- Location: LCFF_X62_Y7_N5
\decoder|inst9|inst10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst11|_Y0~0_combout\,
	sload => VCC,
	ena => \decoder|inst4|inst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst9|inst10~regout\);

-- Location: LCCOMB_X62_Y7_N28
\decoder|inst9|inst6~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst9|inst6~feeder_combout\ = \inst2|inst|_Y2~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst2|inst|_Y2~1_combout\,
	combout => \decoder|inst9|inst6~feeder_combout\);

-- Location: LCFF_X62_Y7_N29
\decoder|inst9|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \decoder|inst9|inst6~feeder_combout\,
	ena => \decoder|inst4|inst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst9|inst6~regout\);

-- Location: LCCOMB_X63_Y7_N4
\inst|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr0~0_combout\ = (\decoder|inst9|inst~regout\ & (\decoder|inst9|inst10~regout\ & (\decoder|inst9|inst8~regout\ $ (\decoder|inst9|inst6~regout\)))) # (!\decoder|inst9|inst~regout\ & (!\decoder|inst9|inst8~regout\ & (\decoder|inst9|inst10~regout\ 
-- $ (\decoder|inst9|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst9|inst8~regout\,
	datab => \decoder|inst9|inst~regout\,
	datac => \decoder|inst9|inst10~regout\,
	datad => \decoder|inst9|inst6~regout\,
	combout => \inst|WideOr0~0_combout\);

-- Location: LCCOMB_X63_Y7_N26
\inst|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr1~0_combout\ = (\decoder|inst9|inst8~regout\ & ((\decoder|inst9|inst10~regout\ & (\decoder|inst9|inst~regout\)) # (!\decoder|inst9|inst10~regout\ & ((\decoder|inst9|inst6~regout\))))) # (!\decoder|inst9|inst8~regout\ & 
-- (\decoder|inst9|inst6~regout\ & (\decoder|inst9|inst~regout\ $ (\decoder|inst9|inst10~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst9|inst8~regout\,
	datab => \decoder|inst9|inst~regout\,
	datac => \decoder|inst9|inst10~regout\,
	datad => \decoder|inst9|inst6~regout\,
	combout => \inst|WideOr1~0_combout\);

-- Location: LCCOMB_X63_Y7_N0
\inst|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr2~0_combout\ = (\decoder|inst9|inst~regout\ & (\decoder|inst9|inst6~regout\ & ((\decoder|inst9|inst8~regout\) # (!\decoder|inst9|inst10~regout\)))) # (!\decoder|inst9|inst~regout\ & (\decoder|inst9|inst8~regout\ & 
-- (!\decoder|inst9|inst10~regout\ & !\decoder|inst9|inst6~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst9|inst8~regout\,
	datab => \decoder|inst9|inst~regout\,
	datac => \decoder|inst9|inst10~regout\,
	datad => \decoder|inst9|inst6~regout\,
	combout => \inst|WideOr2~0_combout\);

-- Location: LCCOMB_X63_Y7_N10
\inst|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr3~0_combout\ = (\decoder|inst9|inst8~regout\ & ((\decoder|inst9|inst10~regout\ & ((\decoder|inst9|inst6~regout\))) # (!\decoder|inst9|inst10~regout\ & (\decoder|inst9|inst~regout\ & !\decoder|inst9|inst6~regout\)))) # 
-- (!\decoder|inst9|inst8~regout\ & (!\decoder|inst9|inst~regout\ & (\decoder|inst9|inst10~regout\ $ (\decoder|inst9|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst9|inst8~regout\,
	datab => \decoder|inst9|inst~regout\,
	datac => \decoder|inst9|inst10~regout\,
	datad => \decoder|inst9|inst6~regout\,
	combout => \inst|WideOr3~0_combout\);

-- Location: LCCOMB_X62_Y7_N0
\inst|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr4~0_combout\ = (\decoder|inst9|inst8~regout\ & (!\decoder|inst9|inst~regout\ & (\decoder|inst9|inst10~regout\))) # (!\decoder|inst9|inst8~regout\ & ((\decoder|inst9|inst6~regout\ & (!\decoder|inst9|inst~regout\)) # 
-- (!\decoder|inst9|inst6~regout\ & ((\decoder|inst9|inst10~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst9|inst8~regout\,
	datab => \decoder|inst9|inst~regout\,
	datac => \decoder|inst9|inst10~regout\,
	datad => \decoder|inst9|inst6~regout\,
	combout => \inst|WideOr4~0_combout\);

-- Location: LCCOMB_X63_Y7_N28
\inst|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr5~0_combout\ = (\decoder|inst9|inst8~regout\ & (!\decoder|inst9|inst~regout\ & ((\decoder|inst9|inst10~regout\) # (!\decoder|inst9|inst6~regout\)))) # (!\decoder|inst9|inst8~regout\ & (\decoder|inst9|inst10~regout\ & 
-- (\decoder|inst9|inst~regout\ $ (!\decoder|inst9|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst9|inst8~regout\,
	datab => \decoder|inst9|inst~regout\,
	datac => \decoder|inst9|inst10~regout\,
	datad => \decoder|inst9|inst6~regout\,
	combout => \inst|WideOr5~0_combout\);

-- Location: LCCOMB_X63_Y7_N30
\inst|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|WideOr6~0_combout\ = (\decoder|inst9|inst10~regout\ & ((\decoder|inst9|inst~regout\) # (\decoder|inst9|inst8~regout\ $ (\decoder|inst9|inst6~regout\)))) # (!\decoder|inst9|inst10~regout\ & ((\decoder|inst9|inst8~regout\) # 
-- (\decoder|inst9|inst~regout\ $ (\decoder|inst9|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst9|inst8~regout\,
	datab => \decoder|inst9|inst~regout\,
	datac => \decoder|inst9|inst10~regout\,
	datad => \decoder|inst9|inst6~regout\,
	combout => \inst|WideOr6~0_combout\);

-- Location: LCCOMB_X63_Y7_N16
\inst6|inst1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst6|inst1~0_combout\ = \inst6|inst1~regout\ $ (((\inst6|inst~regout\ & !\Load~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|inst~regout\,
	datac => \inst6|inst1~regout\,
	datad => \Load~combout\,
	combout => \inst6|inst1~0_combout\);

-- Location: LCFF_X63_Y7_N17
\inst6|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst6|inst1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6|inst1~regout\);

-- Location: LCCOMB_X64_Y7_N22
\decoder|inst4|inst7\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst4|inst7~combout\ = (\WR~combout\ & (\inst6|inst~regout\ & !\inst6|inst1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~combout\,
	datab => \inst6|inst~regout\,
	datad => \inst6|inst1~regout\,
	combout => \decoder|inst4|inst7~combout\);

-- Location: LCFF_X63_Y7_N9
\decoder|inst10|inst8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst10|_Y1~2_combout\,
	sload => VCC,
	ena => \decoder|inst4|inst7~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst10|inst8~regout\);

-- Location: LCFF_X63_Y7_N15
\decoder|inst10|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst2|inst9|_Y3~1_combout\,
	ena => \decoder|inst4|inst7~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst10|inst~regout\);

-- Location: LCCOMB_X64_Y7_N16
\decoder|inst10|inst10~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst10|inst10~feeder_combout\ = \inst2|inst11|_Y0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst2|inst11|_Y0~0_combout\,
	combout => \decoder|inst10|inst10~feeder_combout\);

-- Location: LCFF_X64_Y7_N17
\decoder|inst10|inst10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \decoder|inst10|inst10~feeder_combout\,
	ena => \decoder|inst4|inst7~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst10|inst10~regout\);

-- Location: LCFF_X64_Y7_N23
\decoder|inst10|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst|_Y2~1_combout\,
	sload => VCC,
	ena => \decoder|inst4|inst7~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst10|inst6~regout\);

-- Location: LCCOMB_X64_Y6_N16
\inst3|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr0~0_combout\ = (\decoder|inst10|inst~regout\ & (\decoder|inst10|inst10~regout\ & (\decoder|inst10|inst8~regout\ $ (\decoder|inst10|inst6~regout\)))) # (!\decoder|inst10|inst~regout\ & (!\decoder|inst10|inst8~regout\ & 
-- (\decoder|inst10|inst10~regout\ $ (\decoder|inst10|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst10|inst8~regout\,
	datab => \decoder|inst10|inst~regout\,
	datac => \decoder|inst10|inst10~regout\,
	datad => \decoder|inst10|inst6~regout\,
	combout => \inst3|WideOr0~0_combout\);

-- Location: LCCOMB_X64_Y6_N30
\inst3|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr1~0_combout\ = (\decoder|inst10|inst8~regout\ & ((\decoder|inst10|inst10~regout\ & (\decoder|inst10|inst~regout\)) # (!\decoder|inst10|inst10~regout\ & ((\decoder|inst10|inst6~regout\))))) # (!\decoder|inst10|inst8~regout\ & 
-- (\decoder|inst10|inst6~regout\ & (\decoder|inst10|inst~regout\ $ (\decoder|inst10|inst10~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst10|inst8~regout\,
	datab => \decoder|inst10|inst~regout\,
	datac => \decoder|inst10|inst10~regout\,
	datad => \decoder|inst10|inst6~regout\,
	combout => \inst3|WideOr1~0_combout\);

-- Location: LCCOMB_X64_Y6_N0
\inst3|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr2~0_combout\ = (\decoder|inst10|inst~regout\ & (\decoder|inst10|inst6~regout\ & ((\decoder|inst10|inst8~regout\) # (!\decoder|inst10|inst10~regout\)))) # (!\decoder|inst10|inst~regout\ & (\decoder|inst10|inst8~regout\ & 
-- (!\decoder|inst10|inst10~regout\ & !\decoder|inst10|inst6~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst10|inst8~regout\,
	datab => \decoder|inst10|inst~regout\,
	datac => \decoder|inst10|inst10~regout\,
	datad => \decoder|inst10|inst6~regout\,
	combout => \inst3|WideOr2~0_combout\);

-- Location: LCCOMB_X64_Y6_N14
\inst3|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr3~0_combout\ = (\decoder|inst10|inst8~regout\ & ((\decoder|inst10|inst10~regout\ & ((\decoder|inst10|inst6~regout\))) # (!\decoder|inst10|inst10~regout\ & (\decoder|inst10|inst~regout\ & !\decoder|inst10|inst6~regout\)))) # 
-- (!\decoder|inst10|inst8~regout\ & (!\decoder|inst10|inst~regout\ & (\decoder|inst10|inst10~regout\ $ (\decoder|inst10|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst10|inst8~regout\,
	datab => \decoder|inst10|inst~regout\,
	datac => \decoder|inst10|inst10~regout\,
	datad => \decoder|inst10|inst6~regout\,
	combout => \inst3|WideOr3~0_combout\);

-- Location: LCCOMB_X64_Y7_N24
\inst3|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr4~0_combout\ = (\decoder|inst10|inst8~regout\ & (!\decoder|inst10|inst~regout\ & (\decoder|inst10|inst10~regout\))) # (!\decoder|inst10|inst8~regout\ & ((\decoder|inst10|inst6~regout\ & (!\decoder|inst10|inst~regout\)) # 
-- (!\decoder|inst10|inst6~regout\ & ((\decoder|inst10|inst10~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst10|inst~regout\,
	datab => \decoder|inst10|inst8~regout\,
	datac => \decoder|inst10|inst10~regout\,
	datad => \decoder|inst10|inst6~regout\,
	combout => \inst3|WideOr4~0_combout\);

-- Location: LCCOMB_X64_Y6_N12
\inst3|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr5~0_combout\ = (\decoder|inst10|inst8~regout\ & (!\decoder|inst10|inst~regout\ & ((\decoder|inst10|inst10~regout\) # (!\decoder|inst10|inst6~regout\)))) # (!\decoder|inst10|inst8~regout\ & (\decoder|inst10|inst10~regout\ & 
-- (\decoder|inst10|inst~regout\ $ (!\decoder|inst10|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst10|inst8~regout\,
	datab => \decoder|inst10|inst~regout\,
	datac => \decoder|inst10|inst10~regout\,
	datad => \decoder|inst10|inst6~regout\,
	combout => \inst3|WideOr5~0_combout\);

-- Location: LCCOMB_X64_Y7_N14
\inst3|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|WideOr6~0_combout\ = (\decoder|inst10|inst10~regout\ & ((\decoder|inst10|inst~regout\) # (\decoder|inst10|inst8~regout\ $ (\decoder|inst10|inst6~regout\)))) # (!\decoder|inst10|inst10~regout\ & ((\decoder|inst10|inst8~regout\) # 
-- (\decoder|inst10|inst~regout\ $ (\decoder|inst10|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst10|inst~regout\,
	datab => \decoder|inst10|inst8~regout\,
	datac => \decoder|inst10|inst10~regout\,
	datad => \decoder|inst10|inst6~regout\,
	combout => \inst3|WideOr6~0_combout\);

-- Location: LCCOMB_X64_Y7_N6
\decoder|inst11|inst~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst11|inst~feeder_combout\ = \inst2|inst9|_Y3~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst2|inst9|_Y3~1_combout\,
	combout => \decoder|inst11|inst~feeder_combout\);

-- Location: LCCOMB_X64_Y7_N0
\decoder|inst4|inst8\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst4|inst8~combout\ = (\WR~combout\ & (!\inst6|inst~regout\ & \inst6|inst1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WR~combout\,
	datab => \inst6|inst~regout\,
	datad => \inst6|inst1~regout\,
	combout => \decoder|inst4|inst8~combout\);

-- Location: LCFF_X64_Y7_N7
\decoder|inst11|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \decoder|inst11|inst~feeder_combout\,
	ena => \decoder|inst4|inst8~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst11|inst~regout\);

-- Location: LCCOMB_X64_Y7_N2
\decoder|inst11|inst8~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst11|inst8~feeder_combout\ = \inst2|inst10|_Y1~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst2|inst10|_Y1~2_combout\,
	combout => \decoder|inst11|inst8~feeder_combout\);

-- Location: LCFF_X64_Y7_N3
\decoder|inst11|inst8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \decoder|inst11|inst8~feeder_combout\,
	ena => \decoder|inst4|inst8~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst11|inst8~regout\);

-- Location: LCFF_X64_Y7_N9
\decoder|inst11|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \inst2|inst|_Y2~1_combout\,
	ena => \decoder|inst4|inst8~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst11|inst6~regout\);

-- Location: LCFF_X64_Y7_N1
\decoder|inst11|inst10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst11|_Y0~0_combout\,
	sload => VCC,
	ena => \decoder|inst4|inst8~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst11|inst10~regout\);

-- Location: LCCOMB_X64_Y7_N28
\inst4|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|WideOr0~0_combout\ = (\decoder|inst11|inst~regout\ & (\decoder|inst11|inst10~regout\ & (\decoder|inst11|inst8~regout\ $ (\decoder|inst11|inst6~regout\)))) # (!\decoder|inst11|inst~regout\ & (!\decoder|inst11|inst8~regout\ & 
-- (\decoder|inst11|inst6~regout\ $ (\decoder|inst11|inst10~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst11|inst~regout\,
	datab => \decoder|inst11|inst8~regout\,
	datac => \decoder|inst11|inst6~regout\,
	datad => \decoder|inst11|inst10~regout\,
	combout => \inst4|WideOr0~0_combout\);

-- Location: LCCOMB_X64_Y7_N30
\inst4|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|WideOr1~0_combout\ = (\decoder|inst11|inst~regout\ & ((\decoder|inst11|inst10~regout\ & (\decoder|inst11|inst8~regout\)) # (!\decoder|inst11|inst10~regout\ & ((\decoder|inst11|inst6~regout\))))) # (!\decoder|inst11|inst~regout\ & 
-- (\decoder|inst11|inst6~regout\ & (\decoder|inst11|inst8~regout\ $ (\decoder|inst11|inst10~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst11|inst~regout\,
	datab => \decoder|inst11|inst8~regout\,
	datac => \decoder|inst11|inst6~regout\,
	datad => \decoder|inst11|inst10~regout\,
	combout => \inst4|WideOr1~0_combout\);

-- Location: LCCOMB_X64_Y7_N20
\inst4|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|WideOr2~0_combout\ = (\decoder|inst11|inst~regout\ & (\decoder|inst11|inst6~regout\ & ((\decoder|inst11|inst8~regout\) # (!\decoder|inst11|inst10~regout\)))) # (!\decoder|inst11|inst~regout\ & (\decoder|inst11|inst8~regout\ & 
-- (!\decoder|inst11|inst6~regout\ & !\decoder|inst11|inst10~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst11|inst~regout\,
	datab => \decoder|inst11|inst8~regout\,
	datac => \decoder|inst11|inst6~regout\,
	datad => \decoder|inst11|inst10~regout\,
	combout => \inst4|WideOr2~0_combout\);

-- Location: LCCOMB_X64_Y7_N26
\inst4|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|WideOr3~0_combout\ = (\decoder|inst11|inst8~regout\ & ((\decoder|inst11|inst6~regout\ & ((\decoder|inst11|inst10~regout\))) # (!\decoder|inst11|inst6~regout\ & (\decoder|inst11|inst~regout\ & !\decoder|inst11|inst10~regout\)))) # 
-- (!\decoder|inst11|inst8~regout\ & (!\decoder|inst11|inst~regout\ & (\decoder|inst11|inst6~regout\ $ (\decoder|inst11|inst10~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst11|inst~regout\,
	datab => \decoder|inst11|inst8~regout\,
	datac => \decoder|inst11|inst6~regout\,
	datad => \decoder|inst11|inst10~regout\,
	combout => \inst4|WideOr3~0_combout\);

-- Location: LCCOMB_X64_Y7_N12
\inst4|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|WideOr4~0_combout\ = (\decoder|inst11|inst8~regout\ & (!\decoder|inst11|inst~regout\ & ((\decoder|inst11|inst10~regout\)))) # (!\decoder|inst11|inst8~regout\ & ((\decoder|inst11|inst6~regout\ & (!\decoder|inst11|inst~regout\)) # 
-- (!\decoder|inst11|inst6~regout\ & ((\decoder|inst11|inst10~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst11|inst~regout\,
	datab => \decoder|inst11|inst8~regout\,
	datac => \decoder|inst11|inst6~regout\,
	datad => \decoder|inst11|inst10~regout\,
	combout => \inst4|WideOr4~0_combout\);

-- Location: LCCOMB_X64_Y7_N18
\inst4|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|WideOr5~0_combout\ = (\decoder|inst11|inst8~regout\ & (!\decoder|inst11|inst~regout\ & ((\decoder|inst11|inst10~regout\) # (!\decoder|inst11|inst6~regout\)))) # (!\decoder|inst11|inst8~regout\ & (\decoder|inst11|inst10~regout\ & 
-- (\decoder|inst11|inst~regout\ $ (!\decoder|inst11|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst11|inst~regout\,
	datab => \decoder|inst11|inst8~regout\,
	datac => \decoder|inst11|inst6~regout\,
	datad => \decoder|inst11|inst10~regout\,
	combout => \inst4|WideOr5~0_combout\);

-- Location: LCCOMB_X64_Y7_N4
\inst4|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst4|WideOr6~0_combout\ = (\decoder|inst11|inst10~regout\ & ((\decoder|inst11|inst~regout\) # (\decoder|inst11|inst8~regout\ $ (\decoder|inst11|inst6~regout\)))) # (!\decoder|inst11|inst10~regout\ & ((\decoder|inst11|inst8~regout\) # 
-- (\decoder|inst11|inst~regout\ $ (\decoder|inst11|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst11|inst~regout\,
	datab => \decoder|inst11|inst8~regout\,
	datac => \decoder|inst11|inst6~regout\,
	datad => \decoder|inst11|inst10~regout\,
	combout => \inst4|WideOr6~0_combout\);

-- Location: LCCOMB_X62_Y7_N30
\decoder|inst4|inst9\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst4|inst9~combout\ = (\inst6|inst1~regout\ & (\WR~combout\ & \inst6|inst~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|inst1~regout\,
	datab => \WR~combout\,
	datad => \inst6|inst~regout\,
	combout => \decoder|inst4|inst9~combout\);

-- Location: LCFF_X62_Y7_N31
\decoder|inst12|inst10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst11|_Y0~0_combout\,
	sload => VCC,
	ena => \decoder|inst4|inst9~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst12|inst10~regout\);

-- Location: LCFF_X62_Y7_N17
\decoder|inst12|inst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	sdata => \inst2|inst9|_Y3~1_combout\,
	sload => VCC,
	ena => \decoder|inst4|inst9~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst12|inst~regout\);

-- Location: LCCOMB_X62_Y7_N20
\decoder|inst12|inst8~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst12|inst8~feeder_combout\ = \inst2|inst10|_Y1~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst2|inst10|_Y1~2_combout\,
	combout => \decoder|inst12|inst8~feeder_combout\);

-- Location: LCFF_X62_Y7_N21
\decoder|inst12|inst8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \decoder|inst12|inst8~feeder_combout\,
	ena => \decoder|inst4|inst9~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst12|inst8~regout\);

-- Location: LCCOMB_X62_Y7_N10
\decoder|inst12|inst6~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \decoder|inst12|inst6~feeder_combout\ = \inst2|inst|_Y2~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst2|inst|_Y2~1_combout\,
	combout => \decoder|inst12|inst6~feeder_combout\);

-- Location: LCFF_X62_Y7_N11
\decoder|inst12|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~combout\,
	datain => \decoder|inst12|inst6~feeder_combout\,
	ena => \decoder|inst4|inst9~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \decoder|inst12|inst6~regout\);

-- Location: LCCOMB_X62_Y7_N2
\inst5|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst5|WideOr0~0_combout\ = (\decoder|inst12|inst~regout\ & (\decoder|inst12|inst10~regout\ & (\decoder|inst12|inst8~regout\ $ (\decoder|inst12|inst6~regout\)))) # (!\decoder|inst12|inst~regout\ & (!\decoder|inst12|inst8~regout\ & 
-- (\decoder|inst12|inst10~regout\ $ (\decoder|inst12|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst12|inst10~regout\,
	datab => \decoder|inst12|inst~regout\,
	datac => \decoder|inst12|inst8~regout\,
	datad => \decoder|inst12|inst6~regout\,
	combout => \inst5|WideOr0~0_combout\);

-- Location: LCCOMB_X62_Y7_N8
\inst5|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst5|WideOr1~0_combout\ = (\decoder|inst12|inst~regout\ & ((\decoder|inst12|inst10~regout\ & (\decoder|inst12|inst8~regout\)) # (!\decoder|inst12|inst10~regout\ & ((\decoder|inst12|inst6~regout\))))) # (!\decoder|inst12|inst~regout\ & 
-- (\decoder|inst12|inst6~regout\ & (\decoder|inst12|inst10~regout\ $ (\decoder|inst12|inst8~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst12|inst10~regout\,
	datab => \decoder|inst12|inst~regout\,
	datac => \decoder|inst12|inst8~regout\,
	datad => \decoder|inst12|inst6~regout\,
	combout => \inst5|WideOr1~0_combout\);

-- Location: LCCOMB_X62_Y7_N18
\inst5|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst5|WideOr2~0_combout\ = (\decoder|inst12|inst~regout\ & (\decoder|inst12|inst6~regout\ & ((\decoder|inst12|inst8~regout\) # (!\decoder|inst12|inst10~regout\)))) # (!\decoder|inst12|inst~regout\ & (!\decoder|inst12|inst10~regout\ & 
-- (\decoder|inst12|inst8~regout\ & !\decoder|inst12|inst6~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst12|inst10~regout\,
	datab => \decoder|inst12|inst~regout\,
	datac => \decoder|inst12|inst8~regout\,
	datad => \decoder|inst12|inst6~regout\,
	combout => \inst5|WideOr2~0_combout\);

-- Location: LCCOMB_X62_Y7_N12
\inst5|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst5|WideOr3~0_combout\ = (\decoder|inst12|inst8~regout\ & ((\decoder|inst12|inst10~regout\ & ((\decoder|inst12|inst6~regout\))) # (!\decoder|inst12|inst10~regout\ & (\decoder|inst12|inst~regout\ & !\decoder|inst12|inst6~regout\)))) # 
-- (!\decoder|inst12|inst8~regout\ & (!\decoder|inst12|inst~regout\ & (\decoder|inst12|inst10~regout\ $ (\decoder|inst12|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst12|inst10~regout\,
	datab => \decoder|inst12|inst~regout\,
	datac => \decoder|inst12|inst8~regout\,
	datad => \decoder|inst12|inst6~regout\,
	combout => \inst5|WideOr3~0_combout\);

-- Location: LCCOMB_X62_Y7_N6
\inst5|WideOr4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst5|WideOr4~0_combout\ = (\decoder|inst12|inst8~regout\ & (\decoder|inst12|inst10~regout\ & (!\decoder|inst12|inst~regout\))) # (!\decoder|inst12|inst8~regout\ & ((\decoder|inst12|inst6~regout\ & ((!\decoder|inst12|inst~regout\))) # 
-- (!\decoder|inst12|inst6~regout\ & (\decoder|inst12|inst10~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst12|inst10~regout\,
	datab => \decoder|inst12|inst~regout\,
	datac => \decoder|inst12|inst8~regout\,
	datad => \decoder|inst12|inst6~regout\,
	combout => \inst5|WideOr4~0_combout\);

-- Location: LCCOMB_X62_Y7_N24
\inst5|WideOr5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst5|WideOr5~0_combout\ = (\decoder|inst12|inst10~regout\ & (\decoder|inst12|inst~regout\ $ (((\decoder|inst12|inst8~regout\) # (!\decoder|inst12|inst6~regout\))))) # (!\decoder|inst12|inst10~regout\ & (!\decoder|inst12|inst~regout\ & 
-- (\decoder|inst12|inst8~regout\ & !\decoder|inst12|inst6~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst12|inst10~regout\,
	datab => \decoder|inst12|inst~regout\,
	datac => \decoder|inst12|inst8~regout\,
	datad => \decoder|inst12|inst6~regout\,
	combout => \inst5|WideOr5~0_combout\);

-- Location: LCCOMB_X62_Y7_N26
\inst5|WideOr6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst5|WideOr6~0_combout\ = (\decoder|inst12|inst10~regout\ & ((\decoder|inst12|inst~regout\) # (\decoder|inst12|inst8~regout\ $ (\decoder|inst12|inst6~regout\)))) # (!\decoder|inst12|inst10~regout\ & ((\decoder|inst12|inst8~regout\) # 
-- (\decoder|inst12|inst~regout\ $ (\decoder|inst12|inst6~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \decoder|inst12|inst10~regout\,
	datab => \decoder|inst12|inst~regout\,
	datac => \decoder|inst12|inst8~regout\,
	datad => \decoder|inst12|inst6~regout\,
	combout => \inst5|WideOr6~0_combout\);

-- Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\00~I\ : cycloneii_io
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
	datain => \inst|WideOr0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_00\);

-- Location: PIN_AA25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\01~I\ : cycloneii_io
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
	datain => \inst|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_01\);

-- Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\02~I\ : cycloneii_io
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
	datain => \inst|WideOr2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_02\);

-- Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\03~I\ : cycloneii_io
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
	datain => \inst|WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_03\);

-- Location: PIN_Y25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\04~I\ : cycloneii_io
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
	datain => \inst|WideOr4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_04\);

-- Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\05~I\ : cycloneii_io
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
	datain => \inst|WideOr5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_05\);

-- Location: PIN_W24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\06~I\ : cycloneii_io
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
	datain => \inst|ALT_INV_WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_06\);

-- Location: PIN_AB23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\10~I\ : cycloneii_io
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
	padio => \ww_10\);

-- Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\11~I\ : cycloneii_io
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
	padio => \ww_11\);

-- Location: PIN_AC25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\12~I\ : cycloneii_io
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
	padio => \ww_12\);

-- Location: PIN_AC26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\13~I\ : cycloneii_io
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
	padio => \ww_13\);

-- Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\14~I\ : cycloneii_io
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
	padio => \ww_14\);

-- Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\15~I\ : cycloneii_io
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
	padio => \ww_15\);

-- Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\16~I\ : cycloneii_io
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
	padio => \ww_16\);

-- Location: PIN_V20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\20~I\ : cycloneii_io
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
	datain => \inst4|WideOr0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_20\);

-- Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\21~I\ : cycloneii_io
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
	datain => \inst4|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_21\);

-- Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\22~I\ : cycloneii_io
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
	datain => \inst4|WideOr2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_22\);

-- Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\23~I\ : cycloneii_io
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
	datain => \inst4|WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_23\);

-- Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\24~I\ : cycloneii_io
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
	datain => \inst4|WideOr4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_24\);

-- Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\25~I\ : cycloneii_io
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
	datain => \inst4|WideOr5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_25\);

-- Location: PIN_AB24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\26~I\ : cycloneii_io
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
	datain => \inst4|ALT_INV_WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_26\);

-- Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\30~I\ : cycloneii_io
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
	datain => \inst5|WideOr0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_30\);

-- Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\31~I\ : cycloneii_io
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
	datain => \inst5|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_31\);

-- Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\32~I\ : cycloneii_io
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
	datain => \inst5|WideOr2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_32\);

-- Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\33~I\ : cycloneii_io
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
	datain => \inst5|WideOr3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_33\);

-- Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\34~I\ : cycloneii_io
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
	datain => \inst5|WideOr4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_34\);

-- Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\35~I\ : cycloneii_io
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
	datain => \inst5|WideOr5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_35\);

-- Location: PIN_V13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\36~I\ : cycloneii_io
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
	datain => \inst5|ALT_INV_WideOr6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => \ww_36\);
END structure;


