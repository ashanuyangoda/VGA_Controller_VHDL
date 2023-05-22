----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:22 02/06/2021 
-- Design Name: 
-- Module Name:    bouncer - Behavioral 
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

entity bouncer is
	port(
		clk: in std_logic;
		clr: in std_logic;
		Col: out std_logic_vector(9 downto 0);
		Row: out std_logic_vector(9 downto 0)
	);
end bouncer;

architecture Behavioral of bouncer is
	
begin

process(clk, clr)
	variable clv, rlv: std_logic_vector(9 downto 0);
	variable dcv, drv: std_logic_vector(9 downto 0);
	constant clmax: integer := 734;
	constant rlmax: integer := 465;
	constant clmin: integer := 144;
	constant rlmin: integer := 35;
begin
	
	if clr = '1' then
		dcv := "0000000001";
		drv := "1111111111";
		rlv := "0010000111"; -- 135
		clv := "0011110100"; -- 244
	
	elsif clk'event and clk = '1' then
	
		clv := clv + dcv;
		rlv := rlv + drv;
		if (clv < 0 or clv >= clmax or clv <= clmin) then
			dcv := 0 - dcv;
		end if;
		if (rlv < 0 or rlv >= rlmax or rlv <= rlmin) then
			drv := 0 - drv;
		end if;
		
	end if;
	
Col <= clv;
Row <= rlv;

end process;

end Behavioral;

