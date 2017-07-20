--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:36:37 07/24/2016
-- Design Name:   
-- Module Name:   D:/ISE/my_cpu/storge_test.vhd
-- Project Name:  my_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: storge
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
 
ENTITY storge_test IS
END storge_test;
 
ARCHITECTURE behavior OF storge_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT storge
    PORT(
         rst : IN  std_logic;
         t2 : IN  std_logic;
         ALUOUT : IN  std_logic_vector(7 downto 0);
         wr_in : IN  std_logic;
         rd_in : IN  std_logic;
         addr : IN  std_logic_vector(15 downto 0);
         R_temp : OUT  std_logic_vector(7 downto 0);
         wr_out : OUT  std_logic;
         rd_out : OUT  std_logic;
         addr_out : OUT  std_logic_vector(15 downto 0);
         data : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal t2 : std_logic := '0';
   signal ALUOUT : std_logic_vector(7 downto 0) := (others => '0');
   signal wr_in : std_logic := '0';
   signal rd_in : std_logic := '0';
   signal addr : std_logic_vector(15 downto 0) := (others => '0');

	--BiDirs
   signal data : std_logic_vector(7 downto 0);

 	--Outputs
   signal R_temp : std_logic_vector(7 downto 0);
   signal wr_out : std_logic;
   signal rd_out : std_logic;
   signal addr_out : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: storge PORT MAP (
          rst => rst,
          t2 => t2,
          ALUOUT => ALUOUT,
          wr_in => wr_in,
          rd_in => rd_in,
          addr => addr,
          R_temp => R_temp,
          wr_out => wr_out,
          rd_out => rd_out,
          addr_out => addr_out,
          data => data
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rst <= '1';
		wait for 10 ns;
		rst <= '0';
		t2 <= '1';
		ALUOUT <= "01010101";
		addr <= "0000000010001000";
		wr_in <= '1';
		rd_in <= '0';
		wait for 10 ns;
		ALUOUT <= "00000000";
		addr <= "0000000010001000";
		wr_in <= '0';
		rd_in <= '1';
		data <= "11100111";
		wait for 10 ns;
		ALUOUT <= "11111111";
		addr <= "0000111111000000";
		wr_in <= '0';
		rd_in <= '0';
		wait ;
      -- insert stimulus here 

      wait;
   end process;

END;
