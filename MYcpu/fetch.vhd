-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:24:28 07/23/2016 
-- Design Name: 
-- Module Name:    fetch - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fetch is
    Port ( rst : in  STD_LOGIC;
           t0 : in  STD_LOGIC;
           t1 : in  STD_LOGIC;
           IR_in : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_new : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_update : in  STD_LOGIC;
           IR_out : out  STD_LOGIC_VECTOR (15 downto 0);
           IR_read : out  STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (15 downto 0));
end fetch;

architecture f of fetch is
signal PC : std_logic_vector(15 downto 0);
signal IR : std_logic_vector(15 downto 0);

begin
	process(t0,rst,t1,PC_update, IR_in) 		--取指、PC的更新
	
	begin
		if rst = '1' then
			PC <= (others => '0');
			IR<= (others => '0');
			IR_read <= '0';
		elsif (t0 = '1' and t1 = '0' and PC_update = '0') then		--取指，读指令控制信号有效，读入指令
				IR <= IR_in;
				IR_read <= '1';
				
			elsif (t0 = '0' and t1 = '1' and PC_update = '0')  then		--在t1到来时，完成PC+1的操作
				IR_read <= '0';
				PC <= PC + 1;
			elsif (t0 = '0' and t1 = '0' and PC_update = '1')  then		--若PC更新控制信号有效，则PC的更新值赋给PC
				PC <= PC_new;
				IR_read <= '0';	
			else																			--其他情况，读指令控制信号无效
				IR_read <= '0';	
			
	end if;
	end process;
	IR_out <= IR;
	PC_out <= PC;
end f;

