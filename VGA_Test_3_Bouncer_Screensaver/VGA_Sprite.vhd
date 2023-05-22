----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:09:10 01/28/2021 
-- Design Name: 
-- Module Name:    VGA_Strips - Behavioral 
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

entity VGA_Sprite is
	port (
		SW: in std_logic_vector(7 downto 0);
		Row: in std_logic_vector(9 downto 0);
		Col: in std_logic_vector(9 downto 0);
		vc: in std_logic_vector(9 downto 0);
		hc: in std_logic_vector(9 downto 0);
		Disp: in std_logic;
		RGB: out std_logic_vector(7 downto 0)
	);
end VGA_Sprite;

architecture Behavioral of VGA_Sprite is
	constant w: integer := 50;
	constant h: integer := 50;
	signal red: std_logic_vector(2 downto 0);
	signal green: std_logic_vector(2 downto 0);
	signal blue: std_logic_vector(1 downto 0);
	signal Col1: std_logic_vector(9 downto 0);
	signal Row1: std_logic_vector(9 downto 0);
	signal spriteEn: std_logic;
begin


-- Row1 <= "0010000111"; -- 135
-- Col1 <= "0011110100"; -- 244
 Row1 <= Row; 
 Col1 <= Col;

spriteEn <= '1' when (((hc > Col1) and (hc <= Col1 + w)) and ((vc >= Row1) and (vc < Row1 + h))) else '0';

	
	process(spriteEn, Disp, SW)
	begin
	
		red <= "000";
		green <= "000";
		blue <= "00";
		
		if Disp = '1' and spriteEn = '1' then
			red <= SW(7 downto 5);
			green <= SW(4 downto 2);
			blue <= SW(1 downto 0);
		end if;
	end process;
		
		RGB <= blue & green & red;

end Behavioral;

