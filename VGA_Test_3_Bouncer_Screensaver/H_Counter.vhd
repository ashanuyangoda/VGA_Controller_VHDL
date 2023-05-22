library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity H_Counter is 
   port( 
	 Clock_enable_B: in std_logic;
 	 CLK: in std_logic;
 	 RST: in std_logic;
 	 Hcnt: out std_logic_vector(9 downto 0);
	 TC: out std_logic
	 );
end H_Counter;
 
architecture Behavioral of H_Counter is
   signal temp: std_logic_vector(9 downto 0);
begin   
process(CLK,RST)
   begin
      if RST='1' then
         temp <= "0000000000";
			TC <= '0';
      elsif(rising_edge(CLK)) then
         if Clock_enable_B='0' then
            if temp="1100011111" then
               temp<="0000000000";
					TC <= '0';
            else
               temp <= temp + 1;
					TC <= '1';
            end if;
         end if;
      end if;
   end process;
   Hcnt <= temp;
end Behavioral;