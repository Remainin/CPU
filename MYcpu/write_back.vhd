----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:03:37 07/24/2016 
-- Design Name: 
-- Module Name:    write_back - Behavioral 
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

entity write_back is
    Port ( rst : in  STD_LOGIC;
           t3 : in  STD_LOGIC;
           PC_u_in : in  STD_LOGIC;
           R_u_in : in  STD_LOGIC;
           R_temp : in  STD_LOGIC_VECTOR (7 downto 0);
           PC_in : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_update : out  STD_LOGIC;
           PC_new : out  STD_LOGIC_VECTOR (15 downto 0);
           R_update : out  STD_LOGIC;
           R_new : out  STD_LOGIC_VECTOR (7 downto 0));
end write_back;

architecture w of write_back is

begin
	process(rst,t3,PC_u_in,R_u_in,R_temp,PC_in)
	begin
		if (rst = '1') then
			PC_update <= '0';
			PC_new <= (others=>'0');
			R_update <= '0';
			R_new <= (others=>'0');
		elsif (t3='1') then			--时钟节拍到来时，将相关的回写信号传出
			PC_update <= PC_u_in;
			PC_new <= PC_in;
			R_update <= R_u_in;
			R_new <= R_temp;
		elsif (t3='0') then
			PC_update <= '0';
			R_update <= '0';
		end if;
	end process;
end w;

