----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:57 12/16/2020 
-- Design Name: 
-- Module Name:    Color_Mux - Behavioral 
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

entity Color_Mux is
	port(
		     RGB: in std_logic_vector(7 downto 0);
		No_Color: in std_logic_vector(7 downto 0);
			  sel: in std_logic;
	  Color_out: out std_logic_vector(7 downto 0)
	);
end Color_Mux;

architecture Behavioral of Color_Mux is

begin

	process (RGB,No_Color,sel)
	begin
		case sel is
			when '0' => Color_out <= No_Color;
			when '1' => Color_out <= RGB;
			when others => Color_out <= "00000000";
		end case;
	end process;

end Behavioral;

