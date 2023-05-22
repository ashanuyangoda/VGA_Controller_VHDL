----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:06:20 12/16/2020 
-- Design Name: 
-- Module Name:    Disp_Comp - Behavioral 
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

entity Disp_Comp is
   port (
         Hcnt: in std_logic_vector(9 downto 0);
			Vcnt: in std_logic_vector(9 downto 0);
         Disp: out std_logic
   );
end Disp_Comp;

architecture Behavioral of Disp_Comp is

	signal TempA, TempB, TempC, TempD: std_logic;

begin

--TempA <= '1' when (Hcnt > 144)
--else '0';

--TempB <= '1' when (Hcnt < 784)
--else '0';

--TempC <= '1' when (Vcnt > 35)
--else '0';

--TempD <= '1' when (Vcnt < 515)
--else '0';	

--Disp <= TempA and TempB and TempC and TempD;

Disp <= '1' when (((Hcnt < 784) and (Hcnt >= 144)) and ((Vcnt < 515) and (Vcnt >= 35))) else '0';

end Behavioral;

