------------------------------connect_full.vhd----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity connect_full is
  port(cf_in                   : in  std_logic_vector(7 downto 0);
       cf_out                  : out  std_logic_vector(7 downto 0);
       cf_error                : out  std_logic;
       cf_config               : in std_logic_vector(63 downto 0));
end connect_full;

architecture A of connect_full is

  component connect_basic
    port(cb_in              : in std_logic_vector(7 downto 0);
         cb_out             : out std_logic_vector(3 downto 0);
         cb_config          : in std_logic_vector(31 downto 0));
  end component;

  signal cb_out_sig : std_logic_vector(7 downto 0) := "00000000";

begin

  cb1 : connect_basic port map ( cf_in, cb_out_sig(7 downto 4), cf_config(63 downto 32));
  cb2 : connect_basic port map ( cf_in, cb_out_sig(3 downto 0), cf_config(31 downto 0));

process (cf_out)
variable cf_error_var: std_logic;
begin
  cf_error_var:='0';
  for i in 0 to 3 loop
    cf_error_var := cf_error_var OR (cb_out_sig(i) XOR cb_out_sig(i+4));
  end loop;
  cf_error <= cf_error_var;
end process;
end A;
