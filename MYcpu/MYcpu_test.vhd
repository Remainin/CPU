--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:18:23 07/24/2016
-- Design Name:   
-- Module Name:   D:/ISE/MYcpu/MYcpu_test.vhd
-- Project Name:  MYcpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MYcpu
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
 
ENTITY MYcpu_test IS
END MYcpu_test;
 
ARCHITECTURE behavior OF MYcpu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MYcpu
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         ABUS : OUT  std_logic_vector(15 downto 0);
         DBUS : INOUT  std_logic_vector(15 downto 0);
         nMREQ : OUT  std_logic;
         nRD : OUT  std_logic;
         nWR : OUT  std_logic;
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic;
         IOAD : OUT  std_logic_vector(1 downto 0);
         IODB : INOUT  std_logic_vector(7 downto 0);
         nPREQ : OUT  std_logic;
         nPRD : OUT  std_logic;
         nPWR : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal DBUS : std_logic_vector(15 downto 0);
   signal IODB : std_logic_vector(7 downto 0);

 	--Outputs
   signal ABUS : std_logic_vector(15 downto 0);
   signal nMREQ : std_logic;
   signal nRD : std_logic;
   signal nWR : std_logic;
   signal nBHE : std_logic;
   signal nBLE : std_logic;
   signal IOAD : std_logic_vector(1 downto 0);
   signal nPREQ : std_logic;
   signal nPRD : std_logic;
   signal nPWR : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MYcpu PORT MAP (
          rst => rst,
          clk => clk,
          ABUS => ABUS,
          DBUS => DBUS,
          nMREQ => nMREQ,
          nRD => nRD,
          nWR => nWR,
          nBHE => nBHE,
          nBLE => nBLE,
          IOAD => IOAD,
          IODB => IODB,
          nPREQ => nPREQ,
          nPRD => nPRD,
          nPWR => nPWR
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
      rst <= '1';
		wait for 10 ns;
		rst <= '0';
		wait for 5 ns;
		DBUS <= "0001110100000110";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 30 ns;
		
		DBUS <= "0001000000000001";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 30 ns;
		
		DBUS <= "0010001010000000";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 30 ns;
		
		DBUS <= "0010001010000000";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 30 ns;
		
		DBUS <= "0010101100000010";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 30 ns;
		
		DBUS <= "0011000011111111";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 30 ns;
		
		DBUS <= "0011101111111111";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= "0000000000000001";
		wait for 10 ns;
		wait for 10 ns;
		
		DBUS <= "0100010000000001";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 30 ns;
		
		DBUS <= "0100111000000001";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 10 ns;
		IODB <= "00110011";
		wait for 10 ns;
		wait for 10 ns;
		
		DBUS <= "0000110110100000";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 30 ns;
		
		DBUS <= "0000100000000000";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 30 ns;
		
		DBUS <= "0000000011000000";
		IODB <= (others => 'Z');
		wait for 10 ns;
		DBUS <= (others => 'Z');
		IODB <= (others => 'Z');
		wait for 30 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
