library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registre is
port(clk_reg   : in std_logic;
     E_reg     : in std_logic;
     Rst_reg   : in std_logic;
     S_reg     : out std_logic);
end registre;

architecture registre_arch of registre is

begin
process (clk_reg)
begin
if (clk_reg'event and clk_reg = '1') then
    if (Rst_reg = '1') then
	S_reg <= '0';
    else
	S_reg <= E_reg;
    end if;
end if;
end process;
end registre_arch;
