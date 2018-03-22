library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_VHDL;
use lib_VHDL.all;



entity bench_SEU is

end bench_SEU;

architecture arch_bench_SEU of bench_SEU is

  component CLB_SEU
  port(E_SEU_1      : in  std_logic_vector(3 downto 0);
       E_SEU_2      : in  std_logic_vector(3 downto 0);
       clk_SEU      : in  std_logic;
       config_SEU_1 : in  std_logic_vector (15 downto 0);
       config_SEU_2 : in  std_logic_vector (15 downto 0);
       commande_SEU : in  std_logic_vector (1 downto 0);
       Rst_SEU      : in  std_logic;
       S_SEU        : out std_logic_vector (1 downto 0);
       CLB_ERROR    : out std_logic);
  end component;

  signal clk          : std_logic:= '0';
  signal E_1          : std_logic_vector(3 downto 0);
  signal E_2          : std_logic_vector(3 downto 0);
  signal comm_mux     : std_logic_vector(1 downto 0);
  signal config_1     : std_logic_vector (15 downto 0);
  signal config_2     : std_logic_vector (15 downto 0);
  signal Rst          : std_logic:= '0';
  signal S            : std_logic_vector(1 downto 0);
  signal CLB_SEU_ERROR: std_logic := '0';

begin

bench_CLB_SEU : CLB_SEU
    port map (
      E_SEU_1      => E_1,
      E_SEU_2      => E_2,
      clk_SEU      => clk,
      config_SEU_1 => config_1,
      config_SEU_2 => config_2,
      commande_SEU => comm_mux,
      Rst_SEU      => Rst,
      CLB_ERROR    => CLB_SEU_ERROR,
      S_SEU        => S);

config_1 (15 downto 0) <= "1110101010111011";
config_2 (15 downto 0) <= "1110101010111010";
comm_mux<="11";
Rst <= '0';
clk<= not(clk) after 20 ns;

process
begin
E_1 <="0000";
E_2 <="0000";
wait for 20 ns;
E_1 <="0001";
E_2 <="0001";
wait for 20 ns;
E_1 <="0010";
E_2 <="0010";
wait for 20 ns;
E_1 <="0011";
E_2 <="0010";
wait for 20 ns;
E_1 <="0100";
E_2 <="0100";
wait for 20 ns;
E_1 <="0101";
E_2 <="0101";
wait for 20 ns;
E_1 <="0110";
E_2 <="0110";
wait for 20 ns;
E_1 <="0111";
E_2 <="0111";
wait for 20 ns;
E_1 <="1000";
E_2 <="1000";
wait for 20 ns;
E_1 <="1001";
E_2 <="1001";
wait for 20 ns;
E_1 <="1010";
E_2 <="1010";
wait for 20 ns;
E_1 <="1011";
E_2 <="1011";
wait for 20 ns;
E_1 <="1100";
E_2 <="1100";
wait for 20 ns;
E_1 <="1101";
E_2 <="1101";
wait for 20 ns;
E_1 <="1110";
E_2 <="1110";
wait for 20 ns;
E_1 <="1111";
E_2 <="1111";
wait for 20 ns;
end process;

end architecture;
