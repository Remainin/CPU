--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:52:50 07/23/2016
-- Design Name:   
-- Module Name:   D:/ISE/my_cpu/ALu_test.vhd
-- Project Name:  my_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALu_test IS
END ALu_test;
 
ARCHITECTURE behavior OF ALu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         rst : IN  std_logic;
         t1 : IN  std_logic;
         IR_in : IN  std_logic_vector(15 downto 0);
         R_update_in : IN  std_logic;
         R_data : IN  std_logic_vector(7 downto 0);
         addr : OUT  std_logic_vector(15 downto 0);
         PC_new : OUT  std_logic_vector(15 downto 0);
         ALUOUT : OUT  std_logic_vector(7 downto 0);
         IO_c : OUT  std_logic;
         IO_s : OUT  std_logic;
         wr : OUT  std_logic;
         rd : OUT  std_logic;
         PC_update : OUT  std_logic;
         R_update : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal t1 : std_logic := '0';
   signal IR_in : std_logic_vector(15 downto 0) := (others => '0');
   signal R_update_in : std_logic := '0';
   signal R_data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal addr : std_logic_vector(15 downto 0);
   signal PC_new : std_logic_vector(15 downto 0);
   signal ALUOUT : std_logic_vector(7 downto 0);
   signal IO_c : std_logic;
   signal IO_s : std_logic;
   signal wr : std_logic;
   signal rd : std_logic;
   signal PC_update : std_logic;
   signal R_update : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          rst => rst,
          t1 => t1,
          IR_in => IR_in,
          R_update_in => R_update_in,
          R_data => R_data,
          addr => addr,
          PC_new => PC_new,
          ALUOUT => ALUOUT,
          IO_c => IO_c,
          IO_s => IO_s,
          wr => wr,
          rd => rd,
          PC_update => PC_update,
          R_update => R_update
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rst<='1';
      wait for 10 ns;
      rst <= '0';
		R_update_in<='0';
		R_data<="00000000";
		IR_in<="0001110100000110";
		t1<='1';
		wait for 10 ns;
		
		R_update_in<='1';
		R_data<="00000000";
		IR_in<="0001110100000110";
		t1<='0';
		wait for 10 ns;
		
		R_update_in<='0';
		R_data<="00000000";
		IR_in<="0001000000000001";
		t1<='1';
		wait for 10 ns;
		
		R_update_in<='1';
		R_data<="00000001";
		IR_in<="0001000000000001";
		t1<='0';
		wait for 10 ns;
		
		R_update_in<='0';
		R_data<="00000000";
		IR_in<="0010001010000000";
		t1<='1';
		wait for 10 ns;
		
		R_update_in<='1';
		R_data<="10000000";
		IR_in<="0010001010000000";
		t1<='0';
		wait for 10 ns;
		
		R_update_in<='0';
		R_data<="00000000";
		IR_in<="0010101100000010";
		t1<='1';
		wait for 10 ns;
		
		R_update_in<='1';
		R_data<="10000000";
		IR_in<="0010101100000010";
		t1<='0';
		wait for 10 ns;
		
		R_update_in<='0';
		R_data<="00000000";
		IR_in<="0011000011111111";
		t1<='1';
		wait for 10 ns;
		
		R_update_in<='0';
		R_data<="00000000";
		IR_in<="0011101111111111";
		t1<='1';
		wait for 10 ns;
		
		R_update_in<='1';
		R_data<="00000001";
		IR_in<="0011101111111111";
		t1<='0';
		wait for 10 ns;
		
		R_update_in<='0';
		R_data<="00000000";
		IR_in<="0100010000000001";
		t1<='1';
		wait for 10 ns;
		
		R_update_in<='0';
		R_data<="00000000";
		IR_in<="0100111000000001";
		t1<='1';
		wait for 10 ns;
		
		R_update_in<='1';
		R_data<="01010101";
		IR_in<="0100111000000001";
    	t1<='0';
		wait for 10 ns;
		
		R_update_in<='0';
		R_data<="00000000";
		IR_in<="0000110110100000";
		t1<='1';
		wait for 10 ns;
		
		R_update_in<='0';
		R_data<="00000000";
		IR_in<="0000000011000000";
		t1<='1';
		wait for 10 ns;
		
		R_update_in<='1';
		R_data<="11111100";
		IR_in<="0000000011000000";
		t1<='0';
		wait for 10 ns;
		rst <= '1';
      wait;
   end process;

END;
