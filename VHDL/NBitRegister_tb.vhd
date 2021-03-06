library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NBitRegister_tb is
--  Port ( );
end NBitRegister_tb;

architecture Behavioral of NBitRegister_tb is

component NBitRegister is
    generic (n : Integer := 63);
    Port ( CLK : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR(n downto 0);
           EN : in STD_LOGIC;
           RST : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(n downto 0));
end component;

signal clk, en, rst : std_logic;
signal d, q : std_logic_vector(63 downto 0);

begin

NBitRegisterTest : NBitRegister 
generic map( n => 63)
port map(
    CLK => clk,
    D => d,
    EN => en,
    RST => rst,
    Q => q
);

process
begin

rst <= '1';
clk <= '0';
d <= x"1000000000000001";
en <= '1';
wait for 10ns;
rst <= '0';
clk <= '1';
wait for 10ns;
assert q = x"1000000000000001" report "Register store failed";
d <= x"5550005550005550";
en <= '0';
clk <= '0';
wait for 10ns;
clk <= '1';
wait for 10ns;
assert q = x"1000000000000001" report "Stored without enable";
clk <= '0';
en <= '1';
wait for 10ns;
clk <= '1';
wait for 10ns;
assert q = x"5550005550005550" report "Did not update";

end process;

end Behavioral;