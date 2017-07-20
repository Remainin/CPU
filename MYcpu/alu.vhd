----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:02:39 07/23/2016 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( rst : in  STD_LOGIC;
           t1 : in  STD_LOGIC;
           IR_in : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           R_update_in : in  STD_LOGIC;
           R_data : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           addr : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           PC_new : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           ALUOUT : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
           IO_c : out  STD_LOGIC;
           IO_s : out  STD_LOGIC;					--IO读写选择，低电平为写入寄存器，高电平为在外设上读
           wr : out  STD_LOGIC;
           rd : out  STD_LOGIC;
           PC_update : out  STD_LOGIC;
           R_update : out  STD_LOGIC);
end alu;

architecture count of alu is
type reg_temp is array(7 downto 0) of std_logic_vector(7 downto 0);
signal cf : std_logic;
signal reg : reg_temp;

begin
	process(t1,R_update_in,rst,IR_in)
	variable reg_a : std_logic_vector(7 downto 0);
	variable reg_b : std_logic_vector(7 downto 0);
	variable temp_a : std_logic_vector(8 downto 0);
	variable temp_b : std_logic_vector(8 downto 0);
	variable temp_c : std_logic_vector(8 downto 0);
	variable temp_sum : std_logic_vector(8 downto 0);
--	variable cf : std_logic;
	begin
	reg_a := reg(conv_integer(IR_in(10 downto 8)));
	reg_b := reg(conv_integer(IR_in(2 downto 0)));
		if(rst='1') then				--初始化各个寄存器的值
			reg(0)<="00010001";
			reg(1)<="00001111";
			reg(2)<="01101110";
			reg(3)<="00101010";
			reg(4)<="01010101";
			reg(5)<="00000001";
			reg(6)<="11111111";
			reg(7)<="00000000";
			PC_update <='0';
			R_update <= '0';
			wr <= '0';
			rd <= '0';
			IO_c <= '0';
			IO_s <= '0';
			addr <= (others =>'0');
			PC_new <= (others =>'0');
			ALUOUT <= (others =>'0');
			cf <= '0';
			reg_a :=(others=>'0');
			reg_b :=(others=>'0');
		elsif(R_update_in='1') then						--寄存器更新控制信号有效时，更新相关寄存器的值
			reg(conv_integer(IR_in(10 downto 8)))<=R_data;
		elsif(t1='1') then								--我的设计思想：仅在运算模块进行IR的译码，然后向其他模块发出控制信号，控制接下来相应的操作
			case IR_in(15 downto 11) is				--按照不同的指令进行译码，给出每一条指令所要用到的所有的控制信号
				when "00000" =>		--JMP X
					PC_update <= '1';
					R_update <= '0';
					wr <= '0';
					rd <= '0';
					IO_c <= '0';
					IO_s <= '0';
					PC_new <= (reg(7) & IR_in(7 downto 0));
				when "00001" =>		--JZ Ri,X
					if (reg_a ="00000000")then
						PC_update <= '1';
						R_update <= '0';
						wr <= '0';
						rd <= '0';
						IO_c <= '0';
						IO_s <= '0';
						PC_new <= (reg(7) & IR_in(7 downto 0));	
					else
						PC_update <= '0';
						R_update <= '0';
						wr <= '0';
						rd <= '0';
						IO_c <= '0';
						IO_s <= '0';
					end if;
				when "00010" =>		--SUB Ri,Rj
					PC_update <= '0';
					R_update <= '1';
					wr <= '0';
					rd <= '0';
					IO_c <= '0';
					IO_s <= '0';
					temp_a := '0' & reg_a(7 downto 0);
					temp_b := '0' & reg_b(7 downto 0);
					temp_c := "00000000" & cf;
					temp_sum := temp_a-temp_b-temp_c;
					ALUOUT <= temp_sum(7 downto 0);
					cf <= temp_sum(8);
				when "00011" =>		--ADD Ri,Rj
					PC_update <= '0';
					R_update <= '1';
					wr <= '0';
					rd <= '0';
					IO_c <= '0';
					IO_s <= '0';
					temp_a := '0' & reg_a(7 downto 0);
					temp_b := '0' & reg_b(7 downto 0);
					temp_c := "00000000" & cf;
					temp_sum := temp_a+temp_b+temp_c;
					ALUOUT <= temp_sum(7 downto 0);
					cf <= temp_sum(8);	
				when "00100" =>		--MVI Ri, X
					PC_update <= '0';
					R_update <= '1';
					wr <= '0';
					rd <= '0';
					IO_c <= '0';
					IO_s <= '0';
					ALUOUT <= IR_in(7 downto 0);
				when "00101" =>		--MOV Ri, Rj
					PC_update <= '0';
					R_update <= '1';
					wr <= '0';
					rd <= '0';
					IO_c <= '0';
					IO_s <= '0';
					ALUOUT <= reg_b;	
				when "00110" =>		--STA Ri,X
					PC_update <= '0';
					R_update <= '0';
					wr <= '1';
					rd <= '0';
					IO_c <= '0';
					IO_s <= '0';
					addr <= (reg(7) & IR_in(7 downto 0));
					ALUOUT <= reg_a;	
				when "00111" =>		--LDA Ri,X
					PC_update <= '0';
					R_update <= '1';
					wr <= '0';
					rd <= '1';
					IO_c <= '0';
					IO_s <= '0';
					addr <= (reg(7) & IR_in(7 downto 0));
					ALUOUT <= reg_a;	
				when "01000" =>		--IN Ri,port
					PC_update <= '0';
					R_update <= '0';
					wr <= '1';
					rd <= '0';
					IO_c <= '1';
					IO_s <= '1';				--IO读写选择，低电平为写入寄存器，高电平为在外设上读
					addr <= (reg(7) & IR_in(7 downto 0));
					ALUOUT <= reg_a;	
				when "01001" =>		--OUT Ri,port
					PC_update <= '0';
					R_update <= '1';
					wr <= '0';
					rd <= '1';
					IO_c <= '1';
					IO_s <= '0';				--IO读写选择，低电平为写，高电平为读
					addr <= (reg(7) & IR_in(7 downto 0));
				when others => NULL;
			end case;
		end if;
	end process;
end count;

