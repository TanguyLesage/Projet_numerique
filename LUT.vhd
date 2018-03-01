library ieee;
use IEEE.std_logic_1164.all;

ENTITY LUT IS
PORT (  A, B, C ,D: IN STD_LOGIC;
        config_LUT : IN STD_LOGIC_VECTOR (15 downto 0);
        S : OUT STD_LOGIC);
END LUT ;

ARCHITECTURE LUT_arch OF LUT IS
BEGIN
PROCESS (A,B,C,D)
BEGIN
    S <= config_LUT[8*D+4*C+2*B+A];
END PROCESS;
END LUT_arch;

component bascule port (d, ck, clear: in std_logic; q : out std_logic);
end component;

signal q0, q1, q0plus1, q1plus1 : std_logic;

BEGIN
S<= q0 and q1 and e;

q0plus1 <= q0 xor e;
q1plus1 <= (not e and q1) or (e and (q1 xor q0));

bas0 : bascule port map (q0plus1, ck, clear, q0);
bas1 : bascule port map (q1plus1, ck, clear, q1);

END A;
