library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_VHDL;
use lib_VHDL.all;



entity bench_class is

end bench_class;

architecture arch_bench_class of bench_class is

  component CLB
  port(E_CLB        : in  std_logic_vector(3 downto 0);
       clk_clb      : in  std_logic;
       config_LUT   : in  std_logic_vector (15 downto 0);
       commande_mux : in  std_logic;
       Rst_CLB      : in  std_logic;
       S_CLB        : out std_logic);
  end component;

  signal clk          : std_logic:= '0';
  signal E            : std_logic_vector(3 downto 0);
  signal comm_mux     : std_logic;
  signal config       : std_logic_vector (15 downto 0);
  signal Rst          : std_logic:= '0';
  signal S            : std_logic;

begin

bench_CLB : CLB
    port map (
      E_CLB        => E,
      clk_CLB      => clk,
      config_LUT   => config,
      commande_mux => comm_mux,
      Rst_CLB      => Rst,
      S_CLB        => S);

config<= "1110101010111010";
comm_mux<='1';
clk<= not(clk) after 20 ns;

process
begin
E<="0000";
wait for 20 ns;
E<="0001";
wait for 20 ns;
E<="0010";
wait for 20 ns;
E<="0011";
wait for 20 ns;
E<="0100";
wait for 20 ns;
E<="0101";
wait for 20 ns;
E<="0110";
wait for 20 ns;
E<="0111";
wait for 20 ns;
E<="1000";
wait for 20 ns;
E<="1001";
wait for 20 ns;
E<="1010";
wait for 20 ns;
E<="1011";
wait for 20 ns;
E<="1100";
wait for 20 ns;
E<="1101";
wait for 20 ns;
E<="1110";
wait for 20 ns;
E<="1111";
wait for 20 ns;
end process;

end architecture;
