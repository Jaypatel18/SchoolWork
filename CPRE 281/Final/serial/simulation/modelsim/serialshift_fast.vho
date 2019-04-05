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

-- DATE "12/06/2014 17:24:28"

-- 
-- Device: Altera EP2C50F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	serialshift IS
    PORT (
	s : OUT std_logic;
	Clock : IN std_logic;
	D1 : IN std_logic;
	w : IN std_logic;
	D2 : IN std_logic;
	D3 : IN std_logic;
	D4 : IN std_logic;
	D5 : IN std_logic;
	D6 : IN std_logic;
	D7 : IN std_logic;
	D8 : IN std_logic
	);
END serialshift;

-- Design Ports Information
-- s	=>  Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D8	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- w	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D7	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D6	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D5	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Clock	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D4	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D3	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D2	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- D1	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF serialshift IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_s : std_logic;
SIGNAL ww_Clock : std_logic;
SIGNAL ww_D1 : std_logic;
SIGNAL ww_w : std_logic;
SIGNAL ww_D2 : std_logic;
SIGNAL ww_D3 : std_logic;
SIGNAL ww_D4 : std_logic;
SIGNAL ww_D5 : std_logic;
SIGNAL ww_D6 : std_logic;
SIGNAL ww_D7 : std_logic;
SIGNAL ww_D8 : std_logic;
SIGNAL \Clock~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst30|inst7~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst30|inst101|inst10~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst30|inst102|inst10~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst30|inst6~regout\ : std_logic;
SIGNAL \inst30|inst102|inst10~regout\ : std_logic;
SIGNAL \inst30|inst6~0_combout\ : std_logic;
SIGNAL \inst30|inst102|inst8~regout\ : std_logic;
SIGNAL \inst30|inst102|inst1~regout\ : std_logic;
SIGNAL \inst30|inst102|inst2~regout\ : std_logic;
SIGNAL \inst30|inst102|inst3~regout\ : std_logic;
SIGNAL \inst30|inst102|inst4~regout\ : std_logic;
SIGNAL \inst30|inst102|inst14~combout\ : std_logic;
SIGNAL \inst30|inst102|inst9~regout\ : std_logic;
SIGNAL \inst30|inst102|inst5~regout\ : std_logic;
SIGNAL \inst30|inst102|inst6~regout\ : std_logic;
SIGNAL \inst30|inst102|inst7~regout\ : std_logic;
SIGNAL \inst30|inst102|inst10~0_combout\ : std_logic;
SIGNAL \inst30|inst102|inst10~1_combout\ : std_logic;
SIGNAL \inst30|inst101|inst10~regout\ : std_logic;
SIGNAL \inst30|inst102|inst8~0_combout\ : std_logic;
SIGNAL \inst30|inst102|inst8~1_combout\ : std_logic;
SIGNAL \inst30|inst102|inst2~0_combout\ : std_logic;
SIGNAL \inst30|inst102|inst3~0_combout\ : std_logic;
SIGNAL \inst30|inst102|inst4~0_combout\ : std_logic;
SIGNAL \inst30|inst102|inst9~0_combout\ : std_logic;
SIGNAL \inst30|inst102|inst9~1_combout\ : std_logic;
SIGNAL \inst30|inst102|inst5~0_combout\ : std_logic;
SIGNAL \inst30|inst102|inst6~0_combout\ : std_logic;
SIGNAL \inst30|inst102|inst7~0_combout\ : std_logic;
SIGNAL \inst30|inst101|inst8~regout\ : std_logic;
SIGNAL \inst30|inst101|inst1~regout\ : std_logic;
SIGNAL \inst30|inst101|inst2~regout\ : std_logic;
SIGNAL \inst30|inst101|inst3~regout\ : std_logic;
SIGNAL \inst30|inst101|inst4~regout\ : std_logic;
SIGNAL \inst30|inst101|inst14~combout\ : std_logic;
SIGNAL \inst30|inst101|inst9~regout\ : std_logic;
SIGNAL \inst30|inst101|inst5~regout\ : std_logic;
SIGNAL \inst30|inst101|inst6~regout\ : std_logic;
SIGNAL \inst30|inst101|inst7~regout\ : std_logic;
SIGNAL \inst30|inst101|inst10~0_combout\ : std_logic;
SIGNAL \inst30|inst101|inst10~1_combout\ : std_logic;
SIGNAL \inst30|inst101|inst8~0_combout\ : std_logic;
SIGNAL \inst30|inst101|inst8~1_combout\ : std_logic;
SIGNAL \inst30|inst101|inst2~0_combout\ : std_logic;
SIGNAL \inst30|inst101|inst3~0_combout\ : std_logic;
SIGNAL \inst30|inst101|inst4~0_combout\ : std_logic;
SIGNAL \inst30|inst101|inst9~0_combout\ : std_logic;
SIGNAL \inst30|inst101|inst9~1_combout\ : std_logic;
SIGNAL \inst30|inst101|inst5~0_combout\ : std_logic;
SIGNAL \inst30|inst101|inst6~0_combout\ : std_logic;
SIGNAL \inst30|inst101|inst7~0_combout\ : std_logic;
SIGNAL \inst30|inst102|inst1~0_combout\ : std_logic;
SIGNAL \inst30|inst101|inst1~0_combout\ : std_logic;
SIGNAL \Clock~combout\ : std_logic;
SIGNAL \Clock~clkctrl_outclk\ : std_logic;
SIGNAL \inst30|inst101|inst10~clkctrl_outclk\ : std_logic;
SIGNAL \inst30|inst102|inst10~clkctrl_outclk\ : std_logic;
SIGNAL \inst30|inst1~0_combout\ : std_logic;
SIGNAL \inst30|inst1~regout\ : std_logic;
SIGNAL \inst30|inst2~0_combout\ : std_logic;
SIGNAL \inst30|inst2~regout\ : std_logic;
SIGNAL \inst30|inst3~0_combout\ : std_logic;
SIGNAL \inst30|inst3~regout\ : std_logic;
SIGNAL \inst30|inst4~0_combout\ : std_logic;
SIGNAL \inst30|inst4~regout\ : std_logic;
SIGNAL \inst30|inst14~combout\ : std_logic;
SIGNAL \inst30|inst5~0_combout\ : std_logic;
SIGNAL \inst30|inst5~regout\ : std_logic;
SIGNAL \inst30|inst7~0_combout\ : std_logic;
SIGNAL \inst30|inst7~regout\ : std_logic;
SIGNAL \inst30|inst7~clkctrl_outclk\ : std_logic;
SIGNAL \w~combout\ : std_logic;
SIGNAL \D8~combout\ : std_logic;
SIGNAL \D7~combout\ : std_logic;
SIGNAL \D6~combout\ : std_logic;
SIGNAL \D5~combout\ : std_logic;
SIGNAL \D4~combout\ : std_logic;
SIGNAL \D3~combout\ : std_logic;
SIGNAL \D2~combout\ : std_logic;
SIGNAL \D1~combout\ : std_logic;
SIGNAL \inst~feeder_combout\ : std_logic;
SIGNAL \inst~regout\ : std_logic;
SIGNAL \inst9~0_combout\ : std_logic;
SIGNAL \inst1~regout\ : std_logic;
SIGNAL \inst12~0_combout\ : std_logic;
SIGNAL \inst2~regout\ : std_logic;
SIGNAL \inst15~0_combout\ : std_logic;
SIGNAL \inst3~regout\ : std_logic;
SIGNAL \inst18~0_combout\ : std_logic;
SIGNAL \inst4~regout\ : std_logic;
SIGNAL \inst21~0_combout\ : std_logic;
SIGNAL \inst5~regout\ : std_logic;
SIGNAL \inst24~0_combout\ : std_logic;
SIGNAL \inst28~regout\ : std_logic;
SIGNAL \inst27~0_combout\ : std_logic;
SIGNAL \inst6~regout\ : std_logic;

BEGIN

s <= ww_s;
ww_Clock <= Clock;
ww_D1 <= D1;
ww_w <= w;
ww_D2 <= D2;
ww_D3 <= D3;
ww_D4 <= D4;
ww_D5 <= D5;
ww_D6 <= D6;
ww_D7 <= D7;
ww_D8 <= D8;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clock~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Clock~combout\);

\inst30|inst7~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst30|inst7~regout\);

\inst30|inst101|inst10~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst30|inst101|inst10~regout\);

\inst30|inst102|inst10~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \inst30|inst102|inst10~regout\);

-- Location: LCFF_X39_Y43_N17
\inst30|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst102|inst10~clkctrl_outclk\,
	datain => \inst30|inst6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst6~regout\);

-- Location: LCFF_X42_Y1_N29
\inst30|inst102|inst10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst101|inst10~clkctrl_outclk\,
	datain => \inst30|inst102|inst10~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst102|inst10~regout\);

-- Location: LCCOMB_X39_Y43_N16
\inst30|inst6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst6~0_combout\ = \inst30|inst6~regout\ $ (((\inst30|inst5~regout\ & \inst30|inst14~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst30|inst5~regout\,
	datac => \inst30|inst6~regout\,
	datad => \inst30|inst14~combout\,
	combout => \inst30|inst6~0_combout\);

-- Location: LCFF_X42_Y1_N23
\inst30|inst102|inst8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst101|inst10~clkctrl_outclk\,
	datain => \inst30|inst102|inst8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst102|inst8~regout\);

-- Location: LCFF_X42_Y1_N9
\inst30|inst102|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst101|inst10~clkctrl_outclk\,
	datain => \inst30|inst102|inst1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst102|inst1~regout\);

-- Location: LCFF_X42_Y1_N21
\inst30|inst102|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst101|inst10~clkctrl_outclk\,
	datain => \inst30|inst102|inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst102|inst2~regout\);

-- Location: LCFF_X42_Y1_N27
\inst30|inst102|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst101|inst10~clkctrl_outclk\,
	datain => \inst30|inst102|inst3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst102|inst3~regout\);

-- Location: LCFF_X42_Y1_N17
\inst30|inst102|inst4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst101|inst10~clkctrl_outclk\,
	datain => \inst30|inst102|inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst102|inst4~regout\);

-- Location: LCCOMB_X42_Y1_N10
\inst30|inst102|inst14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst14~combout\ = (\inst30|inst102|inst4~regout\ & (\inst30|inst102|inst1~regout\ & (\inst30|inst102|inst2~regout\ & \inst30|inst102|inst3~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst102|inst4~regout\,
	datab => \inst30|inst102|inst1~regout\,
	datac => \inst30|inst102|inst2~regout\,
	datad => \inst30|inst102|inst3~regout\,
	combout => \inst30|inst102|inst14~combout\);

-- Location: LCFF_X42_Y1_N5
\inst30|inst102|inst9\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst101|inst10~clkctrl_outclk\,
	datain => \inst30|inst102|inst9~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst102|inst9~regout\);

-- Location: LCFF_X42_Y1_N15
\inst30|inst102|inst5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst101|inst10~clkctrl_outclk\,
	datain => \inst30|inst102|inst5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst102|inst5~regout\);

-- Location: LCFF_X42_Y1_N13
\inst30|inst102|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst101|inst10~clkctrl_outclk\,
	datain => \inst30|inst102|inst6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst102|inst6~regout\);

-- Location: LCFF_X42_Y1_N25
\inst30|inst102|inst7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst101|inst10~clkctrl_outclk\,
	datain => \inst30|inst102|inst7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst102|inst7~regout\);

-- Location: LCCOMB_X42_Y1_N30
\inst30|inst102|inst10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst10~0_combout\ = (((!\inst30|inst102|inst6~regout\) # (!\inst30|inst102|inst5~regout\)) # (!\inst30|inst102|inst9~regout\)) # (!\inst30|inst102|inst7~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst102|inst7~regout\,
	datab => \inst30|inst102|inst9~regout\,
	datac => \inst30|inst102|inst5~regout\,
	datad => \inst30|inst102|inst6~regout\,
	combout => \inst30|inst102|inst10~0_combout\);

-- Location: LCCOMB_X42_Y1_N28
\inst30|inst102|inst10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst10~1_combout\ = \inst30|inst102|inst10~regout\ $ (((\inst30|inst102|inst8~regout\ & (!\inst30|inst102|inst10~0_combout\ & \inst30|inst102|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst102|inst8~regout\,
	datab => \inst30|inst102|inst10~0_combout\,
	datac => \inst30|inst102|inst10~regout\,
	datad => \inst30|inst102|inst14~combout\,
	combout => \inst30|inst102|inst10~1_combout\);

-- Location: LCFF_X38_Y43_N27
\inst30|inst101|inst10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \inst30|inst101|inst10~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst101|inst10~regout\);

-- Location: LCCOMB_X42_Y1_N6
\inst30|inst102|inst8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst8~0_combout\ = (!\inst30|inst102|inst6~regout\) # (!\inst30|inst102|inst7~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst102|inst7~regout\,
	datad => \inst30|inst102|inst6~regout\,
	combout => \inst30|inst102|inst8~0_combout\);

-- Location: LCCOMB_X42_Y1_N22
\inst30|inst102|inst8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst8~1_combout\ = \inst30|inst102|inst8~regout\ $ (((!\inst30|inst102|inst8~0_combout\ & (\inst30|inst102|inst5~regout\ & \inst30|inst102|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst102|inst8~0_combout\,
	datab => \inst30|inst102|inst5~regout\,
	datac => \inst30|inst102|inst8~regout\,
	datad => \inst30|inst102|inst14~combout\,
	combout => \inst30|inst102|inst8~1_combout\);

-- Location: LCCOMB_X42_Y1_N20
\inst30|inst102|inst2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst2~0_combout\ = \inst30|inst102|inst2~regout\ $ (\inst30|inst102|inst1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst102|inst2~regout\,
	datad => \inst30|inst102|inst1~regout\,
	combout => \inst30|inst102|inst2~0_combout\);

-- Location: LCCOMB_X42_Y1_N26
\inst30|inst102|inst3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst3~0_combout\ = \inst30|inst102|inst3~regout\ $ (((\inst30|inst102|inst2~regout\ & \inst30|inst102|inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst30|inst102|inst2~regout\,
	datac => \inst30|inst102|inst3~regout\,
	datad => \inst30|inst102|inst1~regout\,
	combout => \inst30|inst102|inst3~0_combout\);

-- Location: LCCOMB_X42_Y1_N16
\inst30|inst102|inst4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst4~0_combout\ = \inst30|inst102|inst4~regout\ $ (((\inst30|inst102|inst3~regout\ & (\inst30|inst102|inst2~regout\ & \inst30|inst102|inst1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst102|inst3~regout\,
	datab => \inst30|inst102|inst2~regout\,
	datac => \inst30|inst102|inst4~regout\,
	datad => \inst30|inst102|inst1~regout\,
	combout => \inst30|inst102|inst4~0_combout\);

-- Location: LCCOMB_X42_Y1_N2
\inst30|inst102|inst9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst9~0_combout\ = ((!\inst30|inst102|inst6~regout\) # (!\inst30|inst102|inst7~regout\)) # (!\inst30|inst102|inst5~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst30|inst102|inst5~regout\,
	datac => \inst30|inst102|inst7~regout\,
	datad => \inst30|inst102|inst6~regout\,
	combout => \inst30|inst102|inst9~0_combout\);

-- Location: LCCOMB_X42_Y1_N4
\inst30|inst102|inst9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst9~1_combout\ = \inst30|inst102|inst9~regout\ $ (((\inst30|inst102|inst8~regout\ & (!\inst30|inst102|inst9~0_combout\ & \inst30|inst102|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst102|inst8~regout\,
	datab => \inst30|inst102|inst9~0_combout\,
	datac => \inst30|inst102|inst9~regout\,
	datad => \inst30|inst102|inst14~combout\,
	combout => \inst30|inst102|inst9~1_combout\);

-- Location: LCCOMB_X42_Y1_N14
\inst30|inst102|inst5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst5~0_combout\ = \inst30|inst102|inst5~regout\ $ (\inst30|inst102|inst14~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst102|inst5~regout\,
	datad => \inst30|inst102|inst14~combout\,
	combout => \inst30|inst102|inst5~0_combout\);

-- Location: LCCOMB_X42_Y1_N12
\inst30|inst102|inst6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst6~0_combout\ = \inst30|inst102|inst6~regout\ $ (((\inst30|inst102|inst5~regout\ & \inst30|inst102|inst14~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst102|inst5~regout\,
	datac => \inst30|inst102|inst6~regout\,
	datad => \inst30|inst102|inst14~combout\,
	combout => \inst30|inst102|inst6~0_combout\);

-- Location: LCCOMB_X42_Y1_N24
\inst30|inst102|inst7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst7~0_combout\ = \inst30|inst102|inst7~regout\ $ (((\inst30|inst102|inst5~regout\ & (\inst30|inst102|inst6~regout\ & \inst30|inst102|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst102|inst5~regout\,
	datab => \inst30|inst102|inst6~regout\,
	datac => \inst30|inst102|inst7~regout\,
	datad => \inst30|inst102|inst14~combout\,
	combout => \inst30|inst102|inst7~0_combout\);

-- Location: LCFF_X38_Y43_N23
\inst30|inst101|inst8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \inst30|inst101|inst8~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst101|inst8~regout\);

-- Location: LCFF_X38_Y43_N17
\inst30|inst101|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \inst30|inst101|inst1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst101|inst1~regout\);

-- Location: LCFF_X38_Y43_N5
\inst30|inst101|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \inst30|inst101|inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst101|inst2~regout\);

-- Location: LCFF_X38_Y43_N3
\inst30|inst101|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \inst30|inst101|inst3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst101|inst3~regout\);

-- Location: LCFF_X38_Y43_N29
\inst30|inst101|inst4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \inst30|inst101|inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst101|inst4~regout\);

-- Location: LCCOMB_X38_Y43_N0
\inst30|inst101|inst14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst14~combout\ = (\inst30|inst101|inst1~regout\ & (\inst30|inst101|inst4~regout\ & (\inst30|inst101|inst2~regout\ & \inst30|inst101|inst3~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst101|inst1~regout\,
	datab => \inst30|inst101|inst4~regout\,
	datac => \inst30|inst101|inst2~regout\,
	datad => \inst30|inst101|inst3~regout\,
	combout => \inst30|inst101|inst14~combout\);

-- Location: LCFF_X38_Y43_N9
\inst30|inst101|inst9\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \inst30|inst101|inst9~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst101|inst9~regout\);

-- Location: LCFF_X38_Y43_N25
\inst30|inst101|inst5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \inst30|inst101|inst5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst101|inst5~regout\);

-- Location: LCFF_X38_Y43_N21
\inst30|inst101|inst6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \inst30|inst101|inst6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst101|inst6~regout\);

-- Location: LCFF_X38_Y43_N31
\inst30|inst101|inst7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Clock~clkctrl_outclk\,
	datain => \inst30|inst101|inst7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst101|inst7~regout\);

-- Location: LCCOMB_X38_Y43_N18
\inst30|inst101|inst10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst10~0_combout\ = (((!\inst30|inst101|inst7~regout\) # (!\inst30|inst101|inst6~regout\)) # (!\inst30|inst101|inst9~regout\)) # (!\inst30|inst101|inst5~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst101|inst5~regout\,
	datab => \inst30|inst101|inst9~regout\,
	datac => \inst30|inst101|inst6~regout\,
	datad => \inst30|inst101|inst7~regout\,
	combout => \inst30|inst101|inst10~0_combout\);

-- Location: LCCOMB_X38_Y43_N26
\inst30|inst101|inst10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst10~1_combout\ = \inst30|inst101|inst10~regout\ $ (((\inst30|inst101|inst8~regout\ & (!\inst30|inst101|inst10~0_combout\ & \inst30|inst101|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst101|inst8~regout\,
	datab => \inst30|inst101|inst10~0_combout\,
	datac => \inst30|inst101|inst10~regout\,
	datad => \inst30|inst101|inst14~combout\,
	combout => \inst30|inst101|inst10~1_combout\);

-- Location: LCCOMB_X38_Y43_N12
\inst30|inst101|inst8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst8~0_combout\ = (!\inst30|inst101|inst7~regout\) # (!\inst30|inst101|inst6~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst101|inst6~regout\,
	datad => \inst30|inst101|inst7~regout\,
	combout => \inst30|inst101|inst8~0_combout\);

-- Location: LCCOMB_X38_Y43_N22
\inst30|inst101|inst8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst8~1_combout\ = \inst30|inst101|inst8~regout\ $ (((!\inst30|inst101|inst8~0_combout\ & (\inst30|inst101|inst5~regout\ & \inst30|inst101|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst101|inst8~0_combout\,
	datab => \inst30|inst101|inst5~regout\,
	datac => \inst30|inst101|inst8~regout\,
	datad => \inst30|inst101|inst14~combout\,
	combout => \inst30|inst101|inst8~1_combout\);

-- Location: LCCOMB_X38_Y43_N4
\inst30|inst101|inst2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst2~0_combout\ = \inst30|inst101|inst2~regout\ $ (\inst30|inst101|inst1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst101|inst2~regout\,
	datad => \inst30|inst101|inst1~regout\,
	combout => \inst30|inst101|inst2~0_combout\);

-- Location: LCCOMB_X38_Y43_N2
\inst30|inst101|inst3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst3~0_combout\ = \inst30|inst101|inst3~regout\ $ (((\inst30|inst101|inst2~regout\ & \inst30|inst101|inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst30|inst101|inst2~regout\,
	datac => \inst30|inst101|inst3~regout\,
	datad => \inst30|inst101|inst1~regout\,
	combout => \inst30|inst101|inst3~0_combout\);

-- Location: LCCOMB_X38_Y43_N28
\inst30|inst101|inst4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst4~0_combout\ = \inst30|inst101|inst4~regout\ $ (((\inst30|inst101|inst3~regout\ & (\inst30|inst101|inst2~regout\ & \inst30|inst101|inst1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst101|inst3~regout\,
	datab => \inst30|inst101|inst2~regout\,
	datac => \inst30|inst101|inst4~regout\,
	datad => \inst30|inst101|inst1~regout\,
	combout => \inst30|inst101|inst4~0_combout\);

-- Location: LCCOMB_X38_Y43_N10
\inst30|inst101|inst9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst9~0_combout\ = ((!\inst30|inst101|inst5~regout\) # (!\inst30|inst101|inst7~regout\)) # (!\inst30|inst101|inst6~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst101|inst6~regout\,
	datab => \inst30|inst101|inst7~regout\,
	datac => \inst30|inst101|inst5~regout\,
	combout => \inst30|inst101|inst9~0_combout\);

-- Location: LCCOMB_X38_Y43_N8
\inst30|inst101|inst9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst9~1_combout\ = \inst30|inst101|inst9~regout\ $ (((\inst30|inst101|inst8~regout\ & (\inst30|inst101|inst14~combout\ & !\inst30|inst101|inst9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst101|inst8~regout\,
	datab => \inst30|inst101|inst14~combout\,
	datac => \inst30|inst101|inst9~regout\,
	datad => \inst30|inst101|inst9~0_combout\,
	combout => \inst30|inst101|inst9~1_combout\);

-- Location: LCCOMB_X38_Y43_N24
\inst30|inst101|inst5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst5~0_combout\ = \inst30|inst101|inst5~regout\ $ (\inst30|inst101|inst14~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst101|inst5~regout\,
	datad => \inst30|inst101|inst14~combout\,
	combout => \inst30|inst101|inst5~0_combout\);

-- Location: LCCOMB_X38_Y43_N20
\inst30|inst101|inst6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst6~0_combout\ = \inst30|inst101|inst6~regout\ $ (((\inst30|inst101|inst5~regout\ & \inst30|inst101|inst14~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst30|inst101|inst5~regout\,
	datac => \inst30|inst101|inst6~regout\,
	datad => \inst30|inst101|inst14~combout\,
	combout => \inst30|inst101|inst6~0_combout\);

-- Location: LCCOMB_X38_Y43_N30
\inst30|inst101|inst7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst7~0_combout\ = \inst30|inst101|inst7~regout\ $ (((\inst30|inst101|inst6~regout\ & (\inst30|inst101|inst5~regout\ & \inst30|inst101|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst101|inst6~regout\,
	datab => \inst30|inst101|inst5~regout\,
	datac => \inst30|inst101|inst7~regout\,
	datad => \inst30|inst101|inst14~combout\,
	combout => \inst30|inst101|inst7~0_combout\);

-- Location: LCCOMB_X42_Y1_N8
\inst30|inst102|inst1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst102|inst1~0_combout\ = !\inst30|inst102|inst1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst102|inst1~regout\,
	combout => \inst30|inst102|inst1~0_combout\);

-- Location: LCCOMB_X38_Y43_N16
\inst30|inst101|inst1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst101|inst1~0_combout\ = !\inst30|inst101|inst1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst101|inst1~regout\,
	combout => \inst30|inst101|inst1~0_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Clock~I\ : cycloneii_io
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
	padio => ww_Clock,
	combout => \Clock~combout\);

-- Location: CLKCTRL_G3
\Clock~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clock~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clock~clkctrl_outclk\);

-- Location: CLKCTRL_G9
\inst30|inst101|inst10~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst30|inst101|inst10~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst30|inst101|inst10~clkctrl_outclk\);

-- Location: CLKCTRL_G15
\inst30|inst102|inst10~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst30|inst102|inst10~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst30|inst102|inst10~clkctrl_outclk\);

-- Location: LCCOMB_X39_Y43_N24
\inst30|inst1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst1~0_combout\ = !\inst30|inst1~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst1~regout\,
	combout => \inst30|inst1~0_combout\);

-- Location: LCFF_X39_Y43_N25
\inst30|inst1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst102|inst10~clkctrl_outclk\,
	datain => \inst30|inst1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst1~regout\);

-- Location: LCCOMB_X39_Y43_N8
\inst30|inst2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst2~0_combout\ = \inst30|inst2~regout\ $ (\inst30|inst1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst2~regout\,
	datad => \inst30|inst1~regout\,
	combout => \inst30|inst2~0_combout\);

-- Location: LCFF_X39_Y43_N9
\inst30|inst2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst102|inst10~clkctrl_outclk\,
	datain => \inst30|inst2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst2~regout\);

-- Location: LCCOMB_X39_Y43_N14
\inst30|inst3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst3~0_combout\ = \inst30|inst3~regout\ $ (((\inst30|inst2~regout\ & \inst30|inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst30|inst2~regout\,
	datac => \inst30|inst3~regout\,
	datad => \inst30|inst1~regout\,
	combout => \inst30|inst3~0_combout\);

-- Location: LCFF_X39_Y43_N15
\inst30|inst3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst102|inst10~clkctrl_outclk\,
	datain => \inst30|inst3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst3~regout\);

-- Location: LCCOMB_X39_Y43_N12
\inst30|inst4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst4~0_combout\ = \inst30|inst4~regout\ $ (((\inst30|inst3~regout\ & (\inst30|inst2~regout\ & \inst30|inst1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst3~regout\,
	datab => \inst30|inst2~regout\,
	datac => \inst30|inst4~regout\,
	datad => \inst30|inst1~regout\,
	combout => \inst30|inst4~0_combout\);

-- Location: LCFF_X39_Y43_N13
\inst30|inst4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst102|inst10~clkctrl_outclk\,
	datain => \inst30|inst4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst4~regout\);

-- Location: LCCOMB_X39_Y43_N0
\inst30|inst14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst14~combout\ = (\inst30|inst1~regout\ & (\inst30|inst2~regout\ & (\inst30|inst3~regout\ & \inst30|inst4~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst1~regout\,
	datab => \inst30|inst2~regout\,
	datac => \inst30|inst3~regout\,
	datad => \inst30|inst4~regout\,
	combout => \inst30|inst14~combout\);

-- Location: LCCOMB_X39_Y43_N4
\inst30|inst5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst5~0_combout\ = \inst30|inst5~regout\ $ (\inst30|inst14~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst30|inst5~regout\,
	datad => \inst30|inst14~combout\,
	combout => \inst30|inst5~0_combout\);

-- Location: LCFF_X39_Y43_N5
\inst30|inst5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst102|inst10~clkctrl_outclk\,
	datain => \inst30|inst5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst5~regout\);

-- Location: LCCOMB_X39_Y43_N20
\inst30|inst7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst30|inst7~0_combout\ = \inst30|inst7~regout\ $ (((\inst30|inst6~regout\ & (\inst30|inst5~regout\ & \inst30|inst14~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst30|inst6~regout\,
	datab => \inst30|inst5~regout\,
	datac => \inst30|inst7~regout\,
	datad => \inst30|inst14~combout\,
	combout => \inst30|inst7~0_combout\);

-- Location: LCFF_X39_Y43_N21
\inst30|inst7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst102|inst10~clkctrl_outclk\,
	datain => \inst30|inst7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst30|inst7~regout\);

-- Location: CLKCTRL_G10
\inst30|inst7~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst30|inst7~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst30|inst7~clkctrl_outclk\);

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: LCCOMB_X36_Y43_N2
\inst~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst~feeder_combout\ = \D1~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \D1~combout\,
	combout => \inst~feeder_combout\);

-- Location: LCFF_X36_Y43_N3
inst : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst7~clkctrl_outclk\,
	datain => \inst~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst~regout\);

-- Location: LCCOMB_X36_Y43_N0
\inst9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst9~0_combout\ = (\w~combout\ & ((\inst~regout\))) # (!\w~combout\ & (\D2~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \D2~combout\,
	datad => \inst~regout\,
	combout => \inst9~0_combout\);

-- Location: LCFF_X36_Y43_N1
inst1 : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst7~clkctrl_outclk\,
	datain => \inst9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst1~regout\);

-- Location: LCCOMB_X36_Y43_N10
\inst12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst12~0_combout\ = (\w~combout\ & ((\inst1~regout\))) # (!\w~combout\ & (\D3~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \D3~combout\,
	datad => \inst1~regout\,
	combout => \inst12~0_combout\);

-- Location: LCFF_X36_Y43_N11
inst2 : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst7~clkctrl_outclk\,
	datain => \inst12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2~regout\);

-- Location: LCCOMB_X36_Y43_N12
\inst15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst15~0_combout\ = (\w~combout\ & ((\inst2~regout\))) # (!\w~combout\ & (\D4~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \D4~combout\,
	datad => \inst2~regout\,
	combout => \inst15~0_combout\);

-- Location: LCFF_X36_Y43_N13
inst3 : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst7~clkctrl_outclk\,
	datain => \inst15~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3~regout\);

-- Location: LCCOMB_X36_Y43_N18
\inst18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst18~0_combout\ = (\w~combout\ & ((\inst3~regout\))) # (!\w~combout\ & (\D5~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \D5~combout\,
	datad => \inst3~regout\,
	combout => \inst18~0_combout\);

-- Location: LCFF_X36_Y43_N19
inst4 : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst7~clkctrl_outclk\,
	datain => \inst18~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4~regout\);

-- Location: LCCOMB_X36_Y43_N28
\inst21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst21~0_combout\ = (\w~combout\ & ((\inst4~regout\))) # (!\w~combout\ & (\D6~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \D6~combout\,
	datad => \inst4~regout\,
	combout => \inst21~0_combout\);

-- Location: LCFF_X36_Y43_N29
inst5 : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst7~clkctrl_outclk\,
	datain => \inst21~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst5~regout\);

-- Location: LCCOMB_X36_Y43_N6
\inst24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst24~0_combout\ = (\w~combout\ & ((\inst5~regout\))) # (!\w~combout\ & (\D7~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \D7~combout\,
	datad => \inst5~regout\,
	combout => \inst24~0_combout\);

-- Location: LCFF_X36_Y43_N7
inst28 : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst7~clkctrl_outclk\,
	datain => \inst24~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst28~regout\);

-- Location: LCCOMB_X36_Y43_N4
\inst27~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst27~0_combout\ = (\w~combout\ & ((\inst28~regout\))) # (!\w~combout\ & (\D8~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w~combout\,
	datac => \D8~combout\,
	datad => \inst28~regout\,
	combout => \inst27~0_combout\);

-- Location: LCFF_X36_Y43_N5
inst6 : cycloneii_lcell_ff
PORT MAP (
	clk => \inst30|inst7~clkctrl_outclk\,
	datain => \inst27~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst6~regout\);

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\s~I\ : cycloneii_io
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
	datain => \inst6~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_s);
END structure;


