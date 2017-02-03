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

-- DATE "12/04/2015 03:51:06"

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

ENTITY 	state_machine IS
    PORT (
	Z3 : OUT std_logic;
	S : IN std_logic;
	Clk : IN std_logic;
	Z2 : OUT std_logic;
	Z1 : OUT std_logic;
	Z0 : OUT std_logic
	);
END state_machine;

-- Design Ports Information
-- Z3	=>  Location: PIN_E5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z2	=>  Location: PIN_B2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z1	=>  Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z0	=>  Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- S	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Clk	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF state_machine IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Z3 : std_logic;
SIGNAL ww_S : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_Z2 : std_logic;
SIGNAL ww_Z1 : std_logic;
SIGNAL ww_Z0 : std_logic;
SIGNAL \Clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clk~combout\ : std_logic;
SIGNAL \Clk~clkctrl_outclk\ : std_logic;
SIGNAL \inst1~feeder_combout\ : std_logic;
SIGNAL \inst1~regout\ : std_logic;
SIGNAL \S~combout\ : std_logic;
SIGNAL \inst|_Y2~0_combout\ : std_logic;
SIGNAL \inst|_Y2~1_combout\ : std_logic;
SIGNAL \inst2~feeder_combout\ : std_logic;
SIGNAL \inst2~regout\ : std_logic;
SIGNAL \inst10|_Y1~0_combout\ : std_logic;
SIGNAL \inst10|_Y1~1_combout\ : std_logic;
SIGNAL \inst10|_Y1~2_combout\ : std_logic;
SIGNAL \inst3~regout\ : std_logic;
SIGNAL \inst11|_Y0~0_combout\ : std_logic;
SIGNAL \inst4~regout\ : std_logic;
SIGNAL \inst9|_Y3~0_combout\ : std_logic;
SIGNAL \inst9|_Y3~1_combout\ : std_logic;

BEGIN

Z3 <= ww_Z3;
ww_S <= S;
ww_Clk <= Clk;
Z2 <= ww_Z2;
Z1 <= ww_Z1;
Z0 <= ww_Z0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Clk~combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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

-- Location: CLKCTRL_G3
\Clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clk~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y34_N22
\inst1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst1~feeder_combout\ = \inst9|_Y3~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst9|_Y3~1_combout\,
	combout => \inst1~feeder_combout\);

-- Location: LCFF_X1_Y34_N23
inst1 : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~clkctrl_outclk\,
	datain => \inst1~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst1~regout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\S~I\ : cycloneii_io
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
	padio => ww_S,
	combout => \S~combout\);

-- Location: LCCOMB_X1_Y34_N12
\inst|_Y2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|_Y2~0_combout\ = \S~combout\ $ (\inst3~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \S~combout\,
	datad => \inst3~regout\,
	combout => \inst|_Y2~0_combout\);

-- Location: LCCOMB_X1_Y34_N26
\inst|_Y2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|_Y2~1_combout\ = (\inst1~regout\) # ((\inst4~regout\ & (\inst2~regout\ & !\inst|_Y2~0_combout\)) # (!\inst4~regout\ & (!\inst2~regout\ & \inst|_Y2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4~regout\,
	datab => \inst1~regout\,
	datac => \inst2~regout\,
	datad => \inst|_Y2~0_combout\,
	combout => \inst|_Y2~1_combout\);

-- Location: LCCOMB_X1_Y34_N18
\inst2~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst2~feeder_combout\ = \inst|_Y2~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|_Y2~1_combout\,
	combout => \inst2~feeder_combout\);

-- Location: LCFF_X1_Y34_N19
inst2 : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~clkctrl_outclk\,
	datain => \inst2~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2~regout\);

-- Location: LCCOMB_X1_Y34_N20
\inst10|_Y1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|_Y1~0_combout\ = \S~combout\ $ (\inst2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \S~combout\,
	datad => \inst2~regout\,
	combout => \inst10|_Y1~0_combout\);

-- Location: LCCOMB_X1_Y34_N10
\inst10|_Y1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|_Y1~1_combout\ = (!\inst1~regout\) # (!\S~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \S~combout\,
	datad => \inst1~regout\,
	combout => \inst10|_Y1~1_combout\);

-- Location: LCCOMB_X1_Y34_N4
\inst10|_Y1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|_Y1~2_combout\ = (\inst3~regout\ & ((\inst4~regout\ & ((!\inst10|_Y1~1_combout\))) # (!\inst4~regout\ & (!\inst10|_Y1~0_combout\)))) # (!\inst3~regout\ & (\inst4~regout\ $ (((\inst10|_Y1~0_combout\ & \inst10|_Y1~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4~regout\,
	datab => \inst3~regout\,
	datac => \inst10|_Y1~0_combout\,
	datad => \inst10|_Y1~1_combout\,
	combout => \inst10|_Y1~2_combout\);

-- Location: LCFF_X1_Y34_N1
inst3 : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~clkctrl_outclk\,
	sdata => \inst10|_Y1~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3~regout\);

-- Location: LCCOMB_X1_Y34_N24
\inst11|_Y0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst11|_Y0~0_combout\ = \S~combout\ $ (\inst4~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S~combout\,
	datac => \inst4~regout\,
	combout => \inst11|_Y0~0_combout\);

-- Location: LCFF_X1_Y34_N25
inst4 : cycloneii_lcell_ff
PORT MAP (
	clk => \Clk~clkctrl_outclk\,
	datain => \inst11|_Y0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst4~regout\);

-- Location: LCCOMB_X1_Y34_N28
\inst9|_Y3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst9|_Y3~0_combout\ = (\S~combout\ & (!\inst2~regout\ & (\inst4~regout\ $ (\inst3~regout\)))) # (!\S~combout\ & (\inst3~regout\ & (\inst2~regout\ $ (\inst4~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S~combout\,
	datab => \inst2~regout\,
	datac => \inst4~regout\,
	datad => \inst3~regout\,
	combout => \inst9|_Y3~0_combout\);

-- Location: LCCOMB_X1_Y34_N6
\inst9|_Y3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst9|_Y3~1_combout\ = (\inst9|_Y3~0_combout\ & ((\inst3~regout\) # (!\inst1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1~regout\,
	datac => \inst3~regout\,
	datad => \inst9|_Y3~0_combout\,
	combout => \inst9|_Y3~1_combout\);

-- Location: PIN_E5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z3~I\ : cycloneii_io
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
	datain => \inst9|_Y3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z3);

-- Location: PIN_B2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z2~I\ : cycloneii_io
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
	datain => \inst|_Y2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z2);

-- Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z1~I\ : cycloneii_io
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
	datain => \inst10|_Y1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z1);

-- Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z0~I\ : cycloneii_io
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
	datain => \inst11|_Y0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z0);
END structure;


