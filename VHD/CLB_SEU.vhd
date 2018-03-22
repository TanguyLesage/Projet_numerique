library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_VHDL;
use lib_VHDL.all;

entity CLB_SEU is
  port(E_SEU_1      : in  std_logic_vector(3 downto 0);
       E_SEU_2      : in  std_logic_vector(3 downto 0);
       clk_SEU      : in  std_logic;
       config_SEU_1 : in  std_logic_vector (15 downto 0);
       config_SEU_2 : in  std_logic_vector (15 downto 0);
       commande_SEU : in  std_logic_vector (1 downto 0);
       Rst_SEU      : in  std_logic;
       S_SEU        : out std_logic_vector (1 downto 0);
       CLB_ERROR    : out std_logic);
end  CLB_SEU;

architecture archi_clb_seu of CLB_SEU is

  component CLB
  port(E_CLB        : in  std_logic_vector(3 downto 0);
       clk_clb      : in  std_logic;
       config_LUT   : in  std_logic_vector (15 downto 0);
       commande_mux : in  std_logic;
       Rst_CLB      : in  std_logic;
       S_CLB        : out std_logic);
end component;

  signal S_CLB_1       : std_logic;
  signal S_CLB_2       : std_logic;

begin

CLB_1 : CLB port map (
   E_CLB        => E_SEU_1,
   clk_clb      => clk_SEU,
   config_LUT   => config_SEU_1,
   commande_mux => commande_SEU(0),
   Rst_CLB      => Rst_SEU,
   S_CLB        => S_CLB_1);

CLB_2 : CLB port map (
   E_CLB        => E_SEU_2,
   clk_clb      => clk_SEU,
   config_LUT   => config_SEU_2,
   commande_mux => commande_SEU(1),
   Rst_CLB      => Rst_SEU,
   S_CLB        => S_CLB_2);
S_SEU(0)<=S_CLB_1;
S_SEU(1)<=S_CLB_2;
CLB_ERROR <= S_CLB_1 XOR S_CLB_2;

end archi_clb_seu;
