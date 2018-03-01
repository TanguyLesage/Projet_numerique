library ieee;
use IEEE.std_logic_1164.all;

ENTITY LUT IS
PORT (Entry                : IN STD_LOGIC_VECTOR (3 dowto 0);
      config_LUT           : IN STD_LOGIC_VECTOR (15 downto 0);
      S                    : OUT STD_LOGIC);
END LUT ;

ARCHITECTURE LUT_arch OF LUT IS
BEGIN
PROCESS (Entry)
BEGIN
case Entry is

  when "0000" => LUT_out <= config_LUT[0];
  when "0001" => LUT_out <= config_LUT[1];
  when "0010" => LUT_out <= config_LUT[2];
  when "0011" => LUT_out <= config_LUT[3];
  when "0100" => LUT_out <= config_LUT[4];
  when "0101" => LUT_out <= config_LUT[5];
  when "0110" => LUT_out <= config_LUT[6];
  when "0111" => LUT_out <= config_LUT[7];
  when "1000" => LUT_out <= config_LUT[8];
  when "1001" => LUT_out <= config_LUT[9];
  when "1010" => LUT_out <= config_LUT[10];
  when "1011" => LUT_out <= config_LUT[11];
  when "1100" => LUT_out <= config_LUT[12];
  when "1101" => LUT_out <= config_LUT[13];
  when "1110" => LUT_out <= config_LUT[14];
  when "1111" => LUT_out <= config_LUT[15];
  when others =>  LUT_out <= 'X'; -- for simulation to catch al non {0,1} field values

end case;
END PROCESS;
END LUT_arch;
