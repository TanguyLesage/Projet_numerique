------------------------------connect_basic.vhd----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity connect_basic is
  port(cb_in              : in std_logic_vector(7 downto 0);
       cb_out             : out std_logic_vector(3 downto 0);
       cb_config          : in std_logic_vector(31 downto 0));
end connect_basic;

architecture A of connect_basic is

begin
  GEN_INT:
  for i in 0 to 3 generate
    process(cb_config, cb_in)
    variable cb_out_var: std_logic;
    begin
      cb_out_var:='0';
      for j in 0 to 7 loop
       	if cb_config(i*j) = '1' then
      	  cb_out_var := cb_in(j);
        end if;
      end loop;
    cb_out(i)<=cb_out_var;
    end process;
  end generate;

end A;
