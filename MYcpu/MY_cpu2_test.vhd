--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:41:22 07/25/2016
-- Design Name:   
-- Module Name:   D:/ISE/MYcpu/MY_cpu2_test.vhd
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
 
ENTITY MY_cpu2_test IS
END MY_cpu2_test;
 
ARCHITECTURE behavior OF MY_cpu2_test IS 
 
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
         nPWR : OUT  std_logic;
         ABUS_out : OUT  std_logic_vector(15 downto 0);
         DBUS_out : OUT  std_logic_vector(15 downto 0);
         nMREQ_out : OUT  std_logic;
         nRD_out : OUT  std_logic;
         nWR_out : OUT  std_logic;
         nBHE_out : OUT  std_logic;
         nBLE_out : OUT  std_logic;
         IR_in_out : OUT  std_logic_vector(15 downto 0);
         k0 : IN  std_logic_vector(7 downto 0);
         IODB_out : OUT  std_logic_vector(7 downto 0);
         IOAD_out : OUT  std_logic_vector(1 downto 0);
         nPREQ_out : OUT  std_logic;
         nPRD_out : OUT  std_logic;
         nPWR_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal k0 : std_logic_vector(7 downto 0) := (others => '0');

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
   signal ABUS_out : std_logic_vector(15 downto 0);
   signal DBUS_out : std_logic_vector(15 downto 0);
   signal nMREQ_out : std_logic;
   signal nRD_out : std_logic;
   signal nWR_out : std_logic;
   signal nBHE_out : std_logic;
   signal nBLE_out : std_logic;
   signal IR_in_out : std_logic_vector(15 downto 0);
   signal IODB_out : std_logic_vector(7 downto 0);
   signal IOAD_out : std_logic_vector(1 downto 0);
   signal nPREQ_out : std_logic;
   signal nPRD_out : std_logic;
   signal nPWR_out : std_logic;

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
          nPWR => nPWR,
          ABUS_out => ABUS_out,
          DBUS_out => DBUS_out,
          nMREQ_out => nMREQ_out,
          nRD_out => nRD_out,
          nWR_out => nWR_out,
          nBHE_out => nBHE_out,
          nBLE_out => nBLE_out,
          IR_in_out => IR_in_out,
          k0 => k0,
          IODB_out => IODB_out,
          IOAD_out => IOAD_out,
          nPREQ_out => nPREQ_out,
          nPRD_out => nPRD_out,
          nPWR_out => nPWR_out
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
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
