----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:39:07 12/16/2020 
-- Design Name: 
-- Module Name:    VGA_Disp_Con - Struct 
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

entity VGA_Disp_Con is
	port(
			mclk: in std_logic;
			RST: in std_logic;
			RGB_out: out std_logic_vector(7 downto 0);
			HS: out std_logic;
			VS: out std_logic
	);
end VGA_Disp_Con;

architecture Struct of VGA_Disp_Con is

	component clkdiv
     port(
                  mclk: in  std_logic;
                   rst: in  std_logic;
						aout: out std_logic
     );
	end component;
	
	component H_Counter 
		port( 
			 Clock_enable_B: in std_logic;
			 CLK: in std_logic;
			 RST: in std_logic;
			 Hcnt: out std_logic_vector(9 downto 0);
			 TC: out std_logic
		 );
	end component;
	
	component V_Counter
		port( 
			 Clock_enable_B: in std_logic;
			 CLK: in std_logic;
			 RST: in std_logic;
			 Vcnt: out std_logic_vector(9 downto 0)
		 );
	end component;
	
	component HS_Comp
		port (
					 Hcnt: in std_logic_vector(9 downto 0);
						HS: out std_logic
			);
	end component;
	
	component VS_Comp
		port (
					 Vcnt: in std_logic_vector(9 downto 0);
						VS: out std_logic
			);
	end component;
	
	component Disp_Comp
		port (
				Hcnt: in std_logic_vector(9 downto 0);
				Vcnt: in std_logic_vector(9 downto 0);
				Disp: out std_logic
		);
	end component;
	
	component Color_Mux
		port(
				  RGB: in std_logic_vector(7 downto 0);
			No_Color: in std_logic_vector(7 downto 0);
				  sel: in std_logic;
		  Color_out: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component VGA_Strips is
		port (
			vc: in std_logic_vector(9 downto 0);
			hc: in std_logic_vector(9 downto 0);
			RGB: out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal clk: std_logic;
	signal En: std_logic;
	signal Sig_TC: std_logic;
	signal Hcount: std_logic_vector(9 downto 0);
	signal Vcount: std_logic_vector(9 downto 0);
	signal Temp_Disp: std_logic;
	
	signal N_Col_in: std_logic_vector(7 downto 0);
	signal RGB_in: std_logic_vector(7 downto 0);
	
	
begin

	En <= '0';
	N_Col_in <= "11111111";
	
	VGA2: VGA_Strips port map(
		vc => Vcount,
		hc => Hcount,
		RGB => RGB_in
	);

	CLK1: clkdiv port map(
						mclk => mclk,
                   rst => RST,
						aout => clk
	);
	
	C1: H_Counter port map(
			 Clock_enable_B => En,
			 CLK => clk,
			 RST => RST,
			 Hcnt => Hcount,
			 TC => Sig_TC
	);
	
	C2: V_Counter port map(
			 Clock_enable_B => Sig_TC,
			 CLK => clk,
			 RST => RST,
			 Vcnt => Vcount
	);
	
	COM1: HS_Comp port map(

			 Hcnt => Hcount,
			 HS => HS
	);

	COM2: VS_Comp port map(

			 Vcnt => Vcount,
			 VS => VS
	);
	
	COM3: Disp_Comp port map(

			 Hcnt => Hcount,
			 Vcnt => Vcount,
			 Disp => Temp_Disp
	);
	
	MUX1: Color_Mux port map(
			RGB => RGB_in,
			No_Color => N_Col_in,
			sel => Temp_Disp,
		   Color_out => RGB_Out
	);

end Struct;

