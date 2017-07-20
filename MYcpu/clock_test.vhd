--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:23:08 07/22/2016
-- Design Name:   
-- Module Name:   D:/ISE/my_cpu/clock_test.vhd
-- Project Name:  my_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clock_control
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
 
ENTITY clock_test IS
END clock_test;
 
ARCHITECTURE behavior OF clock_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clock_control
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         t0 : OUT  std_logic;
         t1 : OUT  std_logic;
         t2 : OUT  std_logic;
         t3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal t0 : std_logic;
   signal t1 : std_logic;
   signal t2 : std_logic;
   signal t3 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clock_control PORT MAP (
          clk => clk,
          rst => rst,
          t0 => t0,
          t1 => t1,
          t2 => t2,
          t3 => t3
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     rst<='1';
		wait for clk_period;
      rst<='0';
      wait for clk_period*10;
      rst<='1';
		wait for clk_period*2;
		rst<='0';
      wait for clk_period*10;
      wait;

      -- insert stimulus here 

      wait;
   end process;

END;
