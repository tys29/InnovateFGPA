library ieee;
use ieee.std_logic_1164.all;

entity InnovateFPGA is
	port (SW : in std_logic;
			LED : out std_logic);
end InnovateFPGA;

architecture behavioral of InnovateFPGA is
begin
	LED <= SW;
end behavioral;