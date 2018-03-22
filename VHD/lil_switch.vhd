library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_VHDL;
use lib_VHDL.all;

entity lil_switch is
  port(E_ls           : in  std_logic_vector (2 downto 0);
       com_mux_ls_1   : in  std_logic_vector (1 downto 0);
       com_mux_ls_2   : in  std_logic_vector (1 downto 0);
       Error_ls      : out std_logic;
       S_ls           : out std_logic);
end  lil_switch;

architecture archi_ls of lil_switch is

component Buff
  port (E_buff                    : in  std_logic;
        config_buff               : in  std_logic;
        S_buff                    : out std_logic);
  end component;

signal S_mux          : std_logic;
signal Error_ls1      : std_logic;
signal config_buff_ls : std_logic;

begin

tri_state : Buff port map (
    E_buff        => S_mux,
    config_buff   => config_buff_ls,
    S_buff        => S_ls);

process (com_mux_ls_1)
begin

Error_ls1 <= (com_mux_ls_1(0) XOR com_mux_ls_2(0)) OR (com_mux_ls_1(1) XOR com_mux_ls_2(1));
Error_ls <= Error_ls1;
config_buff_ls <= (com_mux_ls_1(0) AND com_mux_ls_1(1)) OR Error_ls1;

if (com_mux_ls_1="00") then
  S_mux <= E_ls(0);
elsif (com_mux_ls_1="01") then
  S_mux <= E_ls(1);
elsif (com_mux_ls_1="01") then
  S_mux <= E_ls(2);
else
  S_mux <= 'X';
end if;

end process;
end archi_ls;
