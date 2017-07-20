----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:30:57 07/24/2016 
-- Design Name: 
-- Module Name:    visit_control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity visit_control is
    Port ( IR_read : in  STD_LOGIC;
           PC_in : in  STD_LOGIC_VECTOR (15 downto 0);
           addr_in : in  STD_LOGIC_VECTOR (15 downto 0);
           wr_in : in  STD_LOGIC;
           rd_in : in  STD_LOGIC;
           IO_c : in  STD_LOGIC;
           IO_s : in  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
			  IR_out : out  STD_LOGIC_VECTOR (15 downto 0);
           nMREQ : out  STD_LOGIC;
           nRD : out  STD_LOGIC;
           nWR : out  STD_LOGIC;
           nBHE : out  STD_LOGIC;
           nBLE : out  STD_LOGIC;
           IOAD : out  STD_LOGIC_VECTOR (1 downto 0);
           nPREQ : out  STD_LOGIC;
           nPRD : out  STD_LOGIC;
           nPWR : out  STD_LOGIC;
           data_storge : inout  STD_LOGIC_VECTOR (7 downto 0);
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
			  IODB : inout  STD_LOGIC_VECTOR (7 downto 0));
end visit_control;

architecture v of visit_control is
signal IR_temp : std_logic_vector(15 downto 0);					--在此，设置一个IR寄存器
begin
	process(IR_read,wr_in,rd_in,IO_c,IO_s,DBUS,data_storge,IODB,PC_in)  --访存控制，根据不同的控制信号，给出不同的操作
	begin
		if (IR_read = '1') then						--读指令
			nMREQ <= '0';
			nBLE <= '0';
			nBHE <= '0';
			nRD <= '0';
			nWR <= '1';
			ABUS <= PC_in;
			IR_temp <= DBUS;
			DBUS <= (others => 'Z');
		elsif (IO_c = '0' and IO_s = '0' and wr_in = '1' and rd_in = '0') then      --向存储器写入数据
			nMREQ <= '0';
			nBLE <= '0';
			nBHE <= '1';
			nRD <= '1';
			nWR <= '0';
			ABUS <= addr_in;
			DBUS(7 downto 0) <= data_storge;
			data_storge <= (others => 'Z');
		elsif (IO_c = '0' and IO_s = '0' and wr_in = '0' and rd_in = '1') then			--从存储器读出数据
			nMREQ <= '0';
			nBLE <= '0';
			nBHE <= '1';
			nRD <= '0';
			nWR <= '1';
			ABUS <= addr_in;
			data_storge <= DBUS(7 downto 0);
			DBUS <= (others => 'Z');
		elsif (IO_c = '1' and IO_s = '1' and wr_in = '1' and rd_in = '0') then		--IO读写选择，低电平为写入寄存器，高电平为写入外设
			nPREQ <= '0';
			nPRD <= '1';
			nPWR <= '0';
			IOAD <= addr_in(1 downto 0);
			IODB <= data_storge;
			data_storge <= (others => 'Z');
		elsif (IO_c = '1' and IO_s = '0' and wr_in = '0' and rd_in = '1') then		--IO读写选择，低电平为写入寄存器，高电平为写入外设
			nPREQ <= '0';
			nPRD <= '0';
			nPWR <= '1';
			IOAD <= addr_in(1 downto 0);
			data_storge <= IODB;
			IODB <= (others => 'Z');
		else																				--其他情况下，各个控制信号均无效
			nMREQ <= '1';
			nBLE <= '1';
			nBHE <= '1';
			nRD <= '1';
			nWR <= '1';
			nPREQ <= '1';
			nPRD <= '1';
			nPWR <= '1';
		end if;
	end process;
	IR_out <= IR_temp;
			
end v;

