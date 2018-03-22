library ieee;
use IEEE.std_logic_1164.all;

entity Buff is
port (E_buff               : in  std_logic;
      config_buff          : in  std_logic;
      S_buff               : out std_logic);
end Buff ;

architecture Buff_arch of Buff is
begin
process (config_buff)

begin

if (config_buff='1') then
  S_Buff <= 'Z';
else
  S_Buff <= E_Buff;
end if;

end process;
end Buff_arch;
