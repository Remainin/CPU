--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:26:24 07/24/2016
-- Design Name:   
-- Module Name:   D:/ISE/my_cpu/visit_test.vhd
-- Project Name:  my_cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: visit_control
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
 
ENTITY visit_test IS
END visit_test;
 
ARCHITECTURE behavior OF visit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT visit_control
    PORT(
         IR_read : IN  std_logic;
         PC_in : IN  std_logic_vector(15 downto 0);
         addr_in : IN  std_logic_vector(15 downto 0);
         wr_in : IN  std_logic;
         rd_in : IN  std_logic;
         IO_c : IN  std_logic;
         IO_s : IN  std_logic;
         ABUS : OUT  std_logic_vector(15 downto 0);
         IR_out : OUT  std_logic_vector(15 downto 0);
         nMREQ : OUT  std_logic;
         nRD : OUT  std_logic;
         nWR : OUT  std_logic;
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic;
         IOAD : OUT  std_logic_vector(1 downto 0);
         nPREQ : OUT  std_logic;
         nPRD : OUT  std_logic;
         nPWR : OUT  std_logic;
         data_storge : INOUT  std_logic_vector(7 downto 0);
         DBUS : INOUT  std_logic_vector(15 downto 0);
         IODB : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IR_read : std_logic := '0';
   signal PC_in : std_logic_vector(15 downto 0) := (others => '0');
   signal addr_in : std_logic_vector(15 downto 0) := (others => '0');
   signal wr_in : std_logic := '0';
   signal rd_in : std_logic := '0';
   signal IO_c : std_logic := '0';
   signal IO_s : std_logic := '0';

	--BiDirs
   signal data_storge : std_logic_vector(7 downto 0);
   signal DBUS : std_logic_vector(15 downto 0);
   signal IODB : std_logic_vector(7 downto 0);

 	--Outputs
   signal ABUS : std_logic_vector(15 downto 0);
   signal IR_out : std_logic_vector(15 downto 0);
   signal nMREQ : std_logic;
   signal nRD : std_logic;
   signal nWR : std_logic;
   signal nBHE : std_logic;
   signal nBLE : std_logic;
   signal IOAD : std_logic_vector(1 downto 0);
   signal nPREQ : std_logic;
   signal nPRD : std_logic;
   signal nPWR : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: visit_control PORT MAP (
          IR_read => IR_read,
          PC_in => PC_in,
          addr_in => addr_in,
          wr_in => wr_in,
          rd_in => rd_in,
          IO_c => IO_c,
          IO_s => IO_s,
          ABUS => ABUS,
          IR_out => IR_out,
          nMREQ => nMREQ,
          nRD => nRD,
          nWR => nWR,
          nBHE => nBHE,
          nBLE => nBLE,
          IOAD => IOAD,
          nPREQ => nPREQ,
          nPRD => nPRD,
          nPWR => nPWR,
          data_storge => data_storge,
          DBUS => DBUS,
          IODB => IODB
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      IR_read <= '1';
		PC_in <= "0000000000000001";
		DBUS <= "0000100000000111"; 
		wait for 10 ns;
		DBUS <= (OTHERS =>'Z');
		IR_read <= '0';
		PC_in <= "0000000000000001";
		wr_in <= '1';
		rd_in <= '0';
		IO_s <= '0';
		IO_c <= '0';
		data_storge <= "01010101";
		addr_in <= "1111000011110000";
		wait for 10 ns;
		data_storge <= (OTHERS =>'Z');
		IR_read <= '0';
		PC_in <= "0000000000000001";
		wr_in <= '0';
		rd_in <= '1';
		IO_s <= '0';
		IO_c <= '0';
		DBUS <= "1010101011110101";
		addr_in <= "1111000011110000";
		wait for 10 ns;
		DBUS <= (OTHERS =>'Z');
		IR_read <= '0';
		PC_in <= "0000000000000001";
		wr_in <= '1';
		rd_in <= '0';
		IO_s <= '1';
		IO_c <= '1';
		data_storge <= "11100111";
		addr_in <= "1111000011110000";
		IODB <= (OTHERS =>'Z');
		wait for 10 ns;
		DBUS <= (OTHERS =>'Z');
		data_storge <= (OTHERS =>'Z');
		IR_read <= '0';
		PC_in <= "0000000000000001";
		wr_in <= '0';
		rd_in <= '1';
		IO_s <= '0';
		IO_c <= '1';
		addr_in <= "0000111100000001";
		IODB <= "00001000";
		wait for 10 ns;
		IR_read <= '0';
		PC_in <= "0000000000000001";
		wr_in <= '0';
		rd_in <= '0';
		IO_s <= '0';
		IO_c <= '0';
		data_storge <= (OTHERS =>'Z');
		IODB <= (OTHERS =>'Z');
		DBUS <= (OTHERS =>'Z');
		addr_in <= "1111000011110000";
      -- insert stimulus here 

      wait;
   end process;

END;
