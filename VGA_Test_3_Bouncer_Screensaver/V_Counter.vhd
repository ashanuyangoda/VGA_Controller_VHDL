library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity V_Counter is 
   port( 
	 Clock_enable_B: in std_logic;
 	 CLK: in std_logic;
 	 RST: in std_logic;
 	 Vcnt: out std_logic_vector(9 downto 0)
	 );
end V_Counter;
 
architecture Behavioral of V_Counter is
   signal temp: std_logic_vector(9 downto 0);
begin   process(CLK,RST)
   begin
      if RST='1' then
         temp <= "0000000000";
      elsif(rising_edge(CLK)) then
         if Clock_enable_B='0' then
            if temp="1000001100" then
               temp<="0000000000";
            else
               temp <= temp + 1;
            end if;
         end if;
      end if;
   end process;
   Vcnt <= temp;
end Behavioral;