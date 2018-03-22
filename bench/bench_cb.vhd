library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library modelsim_lib;
use modelsim_lib.util.all;

library lib_VHDL;

entity bench_cb is
end entity;

architecture arch of bench_cb is

  component connect_basic
    port(cb_in              : in std_logic_vector(7 downto 0);
         cb_out             : out std_logic_vector(3 downto 0);
         cb_config          : in std_logic_vector(31 downto 0));
  end component;

  signal   cb_in_sig                             : std_logic_vector(7 downto 0) := "10101010";
  signal   cb_out_sig                            : std_logic_vector(3 downto 0) ;
  signal   cb_configA                            : std_logic_vector(7 downto 0) := "00000001";
  signal   cb_configB                            : std_logic_vector(7 downto 0) := "00000010";
  signal   cb_configC                            : std_logic_vector(7 downto 0) := "00000100";
  signal   cb_configD                            : std_logic_vector(7 downto 0) := "00001000";
  signal   cb_config_sig                         : std_logic_vector(31 downto 0) := cb_configA & cb_configB & cb_configC & cb_configD;

begin

  cb1 : connect_basic
    port map (
        cb_in => cb_in_sig,
        cb_out => cb_out_sig,
        cb_config => cb_config_sig
      ) ;

end architecture;  -- arch
