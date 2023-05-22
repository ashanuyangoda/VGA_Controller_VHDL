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

entity clkdiv is
    port(
                  mclk: in  std_logic;
                   rst: in  std_logic;
						aout: out std_logic;
						aout1: out std_logic
    );
end clkdiv;

architecture Behavioral of clkdiv is
    signal cntdiv: std_logic_vector(19 downto 0);
begin
    process(mclk, rst)
    begin
        if (rst = '1') then
            cntdiv <= "00000000000000000000";
        elsif (mclk' event and mclk = '1') then
            cntdiv <= cntdiv + 1;
        end if;
    end process;
    
    aout <= cntdiv(1);
	 aout1 <= cntdiv(19);
            
end Behavioral;