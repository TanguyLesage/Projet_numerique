library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_VHDL;
use lib_VHDL.all;

entity CLB is
  port(E_CLB        : in  std_logic_vector(3 downto 0);
       clk_clb      : in  std_logic;
       config_LUT   : in  std_logic_vector (15 downto 0);
       commande_mux : in  std_logic;
       Rst_CLB      : in std_logic;
       S_CLB        : out std_logic);
end  CLB;

architecture archi_clb of CLB is

component LUT
  port (E_LUT                    : in  std_logic_vector (3 downto 0);
        config_LUT               : in  std_logic_vector (15 downto 0);
        S_LUT                    : out std_logic);
  end component;

  component registre
  port(clk_reg  : in std_logic;
       E_reg    : in std_logic;
       Rst_reg  : in std_logic;
       S_reg    : out std_logic);
end component;

signal mux1      : std_logic;
signal mux2      : std_logic;

begin

CLB_LUT : LUT port map (
   E_LUT      => E_CLB,
   S_LUT      => mux1,
   config_LUT => config_LUT);

CLB_reg : registre port map (
    E_reg   => mux1,
    S_reg   => mux2,
    Rst_reg => Rst_CLB,
    clk_reg => clk_clb);

process (commande_mux,mux1, mux2)
begin
if (commande_mux='1') then
  S_CLB <= mux1;
else
  S_CLB <= mux2;

end if;
end process;
end archi_clb;
