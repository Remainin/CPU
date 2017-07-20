----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:26:41 07/25/2016 
-- Design Name: 
-- Module Name:    MY_cpu2 - Behavioral 
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

entity MYcpu is
 port(	  rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           nMREQ : out  STD_LOGIC;
           nRD : out  STD_LOGIC;
           nWR : out  STD_LOGIC;
           nBHE : out  STD_LOGIC;
           nBLE : out  STD_LOGIC;
			  IOAD : out  std_logic_vector(1 downto 0);
           IODB : inout  std_logic_vector(7 downto 0);
			  nPREQ : out  STD_LOGIC;
			  nPRD : out  STD_LOGIC;
			  nPWR : out  STD_LOGIC);
			  
			  
end MYcpu;
architecture Behavioral of MYcpu is 
	
	component clock_control is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           t0 : out  STD_LOGIC;
           t1 : out  STD_LOGIC;
           t2 : out  STD_LOGIC;
           t3 : out  STD_LOGIC);
   end component;
	
	component fetch is
    Port ( rst : in  STD_LOGIC;
           t0 : in  STD_LOGIC;
           t1 : in  STD_LOGIC;
           IR_in : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_new : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_update : in  STD_LOGIC;
           IR_out : out  STD_LOGIC_VECTOR (15 downto 0);
           IR_read : out  STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (15 downto 0));
   end component;
	
	component alu is
    Port ( rst : in  STD_LOGIC;
           t1 : in  STD_LOGIC;
           IR_in : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           R_update_in : in  STD_LOGIC;
           R_data : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           addr : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           PC_new : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           ALUOUT : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
           IO_c : out  STD_LOGIC;
           IO_s : out  STD_LOGIC;					--IO��дѡ�񣬵͵�ƽΪд��Ĵ������ߵ�ƽΪ�������϶�
           wr : out  STD_LOGIC;
           rd : out  STD_LOGIC;
           PC_update : out  STD_LOGIC;
           R_update : out  STD_LOGIC);
   end component;
	
	component storge is
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
   end component;
	
	component write_back is
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
   end component;
	
	component visit_control is
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
   end component;
	
	signal t0 : std_logic;
	signal t1 : std_logic;
	signal t2 : std_logic;
	signal t3 : std_logic;
	signal PC_new : std_logic_vector(15 downto 0);
	signal PC_update : std_logic;
	signal IR_in : std_logic_vector(15 downto 0);
	signal IR_out : std_logic_vector(15 downto 0);
	signal PC_out : std_logic_vector(15 downto 0);
	signal IR_read : std_logic;
	signal R_new : std_logic_vector(7 downto 0);
	signal R_update : std_logic;
	signal IO_s : std_logic;
	signal IO_c : std_logic;
	signal wr : std_logic;
	signal rd : std_logic; 
	signal wr_in : std_logic;
	signal rd_in: std_logic;
	signal addr : std_logic_vector(15 downto 0);
	signal addr_in : std_logic_vector(15 downto 0);
	signal ALUOUT : std_logic_vector(7 downto 0);
	signal PC_u_in : std_logic;
	signal R_u_in : std_logic;
	signal PC_in : std_logic_vector(15 downto 0);
	signal R_temp : std_logic_vector(7 downto 0);
	signal data_storge : std_logic_vector(7 downto 0);
	
begin

	
	U1:clock_control port map(clk,rst,t0,t1,t2,t3);
	U2:fetch port map(rst,t0,t1,IR_in,PC_new,PC_update,IR_out,IR_read,PC_out);
   U3:alu port map(rst,t1,IR_out,R_update,R_new,addr,PC_in,ALUOUT,IO_c,IO_s,wr,rd,PC_u_in,R_u_in);
   U4:storge port map(rst,t2,ALUOUT,wr,rd,addr,R_temp,wr_in,rd_in,addr_in,data_storge);
   U5:write_back port map(rst,t3,PC_u_in,R_u_in,R_temp,PC_in,PC_update,PC_new,R_update,R_new); 
	U6:visit_control port map(IR_read,PC_out,addr_in,wr_in,rd_in,IO_c,IO_s,ABUS,IR_in,nMREQ,nRD,nWR,nBHE,nBLE,IOAD,nPREQ,nPRD,nPWR,data_storge,DBUS,IODB);


	
	
end Behavioral;




