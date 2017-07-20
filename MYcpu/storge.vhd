----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:19:05 07/24/2016 
-- Design Name: 
-- Module Name:    storge - Behavioral 
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

entity storge is
    Port ( rst : in  STD_LOGIC;
           t2 : in  STD_LOGIC;
           ALUOUT : in  STD_LOGIC_VECTOR (7 downto 0);
           wr_in : in  STD_LOGIC;
           rd_in : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (15 downto 0);
           R_temp : out  STD_LOGIC_VECTOR (7 downto 0);
           wr_out : out  STD_LOGIC;
           rd_out : out  STD_LOGIC;
           addr_out : out  STD_LOGIC_VECTOR (15 downto 0);
           data : inout  STD_LOGIC_VECTOR (7 downto 0));
end storge;

architecture s of storge is
begin
	process(rst,t2,wr_in,rd_in,data)
	variable Rtemp : std_logic_vector(7 downto 0);   --R_temp相当于一个虚拟的寄存器，用于保存从主存取来或要存的数据，以及要传递给回写模块的数据
	begin
		if (rst = '1')then
			Rtemp  := (others=>'0');
			R_temp <= (others=>'0');
			wr_out <= '0';
			rd_out <= '0';
			addr_out <= (others=>'0');
			data <= (others=>'0');
		elsif (t2 = '1')then							--在t2节拍有效
			addr_out <= addr;
			wr_out <= wr_in;
			rd_out <= rd_in;
			Rtemp := ALUOUT;
			if(wr_in = '1' and rd_in = '0')then
				data <= Rtemp;
				R_temp <= Rtemp;
			elsif(wr_in = '0' and rd_in = '1')then
				data <= (others=>'Z');
				Rtemp := data;
				R_temp <= data;
			else
				data <= (others=>'Z');
				R_temp <= Rtemp;
			end if;
		else
			wr_out <= '0';
			rd_out <= '0';
		end if;
	end process;
end s;

