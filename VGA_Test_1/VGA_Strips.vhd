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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA_Strips is
	port (
		vc: in std_logic_vector(9 downto 0);
		hc: in std_logic_vector(9 downto 0);
		RGB: out std_logic_vector(7 downto 0)
	);
end VGA_Strips;

architecture Behavioral of VGA_Strips is
	signal red: std_logic_vector(2 downto 0);
	signal green: std_logic_vector(2 downto 0);
	signal blue: std_logic_vector(1 downto 0);
begin

	red <= vc(6) & vc(6) & vc(7);
	green <= not (hc(6) & hc(6) & hc(7));
	blue <= hc(7) & hc(7);
	
	RGB <= blue & green & red;
	

end Behavioral;

