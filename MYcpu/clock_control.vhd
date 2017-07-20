----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:08:20 07/21/2016 
-- Design Name: 
-- Module Name:    clock_control - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_control is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           t0 : out  STD_LOGIC;
           t1 : out  STD_LOGIC;
           t2 : out  STD_LOGIC;
           t3 : out  STD_LOGIC);
end clock_control;

architecture clock of clock_control is

signal tem: std_logic_vector(3 downto 0);    --用于控制4个时钟节拍
begin
	process(clk,rst,tem)
	variable temp: integer := 0;
	begin
		if (rst='1')then
			tem <= "0000";
			temp := 0;
		elsif(clk = '1' and clk'event)then
			temp := temp + 1;
		
		case temp mod 4 is
			when 1 => tem <= "0001";
			when 2 => tem <= "0010";
			when 3 => tem <= "0100";
			when others => tem <= "1000";
		end case;
		end if;
	end process;				--四个时钟节拍分别有效
	t0 <= tem(0);
	t1 <= tem(1);
	t2 <= tem(2);
	t3 <= tem(3);

end clock;

