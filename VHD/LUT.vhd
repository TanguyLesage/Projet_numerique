library ieee;
use IEEE.std_logic_1164.all;

entity LUT is
port (E_LUT                : in  std_logic_vector (3 downto 0);
      config_LUT           : in  std_logic_vector (15 downto 0);
      S_LUT                : out std_logic);
end LUT ;

architecture LUT_arch of LUT is
begin
process (E_LUT)
begin
case E_LUT is
  when "0000" => S_LUT <= config_LUT(0);
  when "0001" => S_LUT <= config_LUT(1);
  when "0010" => S_LUT <= config_LUT(2);
  when "0011" => S_LUT <= config_LUT(3);
  when "0100" => S_LUT <= config_LUT(4);
  when "0101" => S_LUT <= config_LUT(5);
  when "0110" => S_LUT <= config_LUT(6);
  when "0111" => S_LUT <= config_LUT(7);
  when "1000" => S_LUT <= config_LUT(8);
  when "1001" => S_LUT <= config_LUT(9);
  when "1010" => S_LUT <= config_LUT(10);
  when "1011" => S_LUT <= config_LUT(11);
  when "1100" => S_LUT <= config_LUT(12);
  when "1101" => S_LUT <= config_LUT(13);
  when "1110" => S_LUT <= config_LUT(14);
  when "1111" => S_LUT <= config_LUT(15);
  when others =>  S_LUT <= 'X';

end case;
end process;
end LUT_arch;
