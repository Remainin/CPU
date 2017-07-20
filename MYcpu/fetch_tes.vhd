--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:49:19 07/23/2016
-- Design Name:   
-- Module Name:   D:/ISE/my_cpu/fetch_tes.vhd
-- Project Name:  my_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fetch
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
 
ENTITY fetch_tes IS
END fetch_tes;
 
ARCHITECTURE behavior OF fetch_tes IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fetch
    PORT(
         rst : IN  std_logic;
         t0 : IN  std_logic;
         t1 : IN  std_logic;
         IR_in : IN  std_logic_vector(15 downto 0);
         PC_new : IN  std_logic_vector(15 downto 0);
         PC_update : IN  std_logic;
         IR_out : OUT  std_logic_vector(15 downto 0);
         IR_read : OUT  std_logic;
         PC_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal t0 : std_logic := '0';
   signal t1 : std_logic := '0';
   signal IR_in : std_logic_vector(15 downto 0) := (others => '0');
   signal PC_new : std_logic_vector(15 downto 0) := (others => '0');
   signal PC_update : std_logic := '0';

 	--Outputs
   signal IR_out : std_logic_vector(15 downto 0);
   signal IR_read : std_logic;
   signal PC_out : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fetch PORT MAP (
          rst => rst,
          t0 => t0,
          t1 => t1,
          IR_in => IR_in,
          PC_new => PC_new,
          PC_update => PC_update,
          IR_out => IR_out,
          IR_read => IR_read,
          PC_out => PC_out
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rst<='1';
      wait for 10 ns;
      rst<='0';
		t0<='1';
		IR_in<="1001001001011111";
      PC_new<="0101101011110110";
		wait for 10 ns;
		IR_in<="0000000000000000";
		t0<='0';
		t1<='1';
		wait for 10 ns;
		t1<='0';
		PC_update<='1';
		wait;
      

      -- insert stimulus here 

      wait;
   end process;

END;
