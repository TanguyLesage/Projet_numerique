library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library modelsim_lib;
use modelsim_lib.util.all;

-- Indiquer ici quelle bibliothèque du filtre à utiliser 
-- (VHDL, après synthèse, après placement et routage)
--library lib_VHDL;
--library lib_SYNTH;

entity bench_connect_basic is
end entity;

architecture B of bench_connect_basic is

  component connect_basic
     port(cb_in              : in std_logic_vector(7 downto 0);
          cb_out             : out std_logic_vector(3 downto 0);
          cb_config          : in std_logic_vector(31 downto 0));
  end component;

end architecture;
