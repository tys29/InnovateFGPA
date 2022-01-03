library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NBitRegister is
    generic (n : Integer := 63);
    Port ( CLK : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR(n downto 0);
           EN : in STD_LOGIC;
           RST : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(n downto 0));
end NBitRegister;

architecture Behavioral of NBitRegister is

begin

process(CLK, RST)
begin
    if (RST = '1') then
        for i in n downto 0 loop
            Q(i) <= '0';
        end loop;
    elsif (CLK'event and CLK = '1' and EN = '1') then
        Q <= D;
    end if;
end process;

end Behavioral;
