--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:09:02 07/24/2016
-- Design Name:   
-- Module Name:   D:/ISE/my_cpu/writeback_test.vhd
-- Project Name:  my_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: write_back
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
 
ENTITY writeback_test IS
END writeback_test;
 
ARCHITECTURE behavior OF writeback_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT write_back
    PORT(
         rst : IN  std_logic;
         t3 : IN  std_logic;
         PC_u_in : IN  std_logic;
         R_u_in : IN  std_logic;
         R_temp : IN  std_logic_vector(7 downto 0);
         PC_in : IN  std_logic_vector(15 downto 0);
         PC_update : OUT  std_logic;
         PC_new : OUT  std_logic_vector(15 downto 0);
         R_update : OUT  std_logic;
         R_new : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal t3 : std_logic := '0';
   signal PC_u_in : std_logic := '0';
   signal R_u_in : std_logic := '0';
   signal R_temp : std_logic_vector(7 downto 0) := (others => '0');
   signal PC_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal PC_update : std_logic;
   signal PC_new : std_logic_vector(15 downto 0);
   signal R_update : std_logic;
   signal R_new : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: write_back PORT MAP (
          rst => rst,
          t3 => t3,
          PC_u_in => PC_u_in,
          R_u_in => R_u_in,
          R_temp => R_temp,
          PC_in => PC_in,
          PC_update => PC_update,
          PC_new => PC_new,
          R_update => R_update,
          R_new => R_new
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '1';
      wait for 10 ns;	
		rst <= '0';
		t3 <= '1';
		PC_u_in <=  '1';
      R_u_in <=  '0';
      R_temp <=  "00011000";
      PC_in <=  "1111000011110000";
		wait for 10 ns;
		t3 <= '0';
		PC_u_in <=  '1';
      R_u_in <=  '0';
		wait for 10 ns;
		t3 <= '1';
		PC_u_in <=  '0';
      R_u_in <=  '1';
      R_temp <=  "01110110";
      PC_in <=  "1000000000111000";
		wait for 10 ns;
		t3 <= '0';
		PC_u_in <=  '1';
      R_u_in <=  '0';
		wait for 10 ns;
		t3 <= '1';
		PC_u_in<=  '1';
      R_u_in <=  '1';
      R_temp <=  "00000000";
      PC_in <=  "0000000000000000";
		
      -- insert stimulus here 

      wait;
   end process;

END;
