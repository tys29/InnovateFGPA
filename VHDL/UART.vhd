-- This UART interface is to be used for connection to the sensor board.
-- UART Control Flow is outlined on page 39 of the ADuCM3027/ADuCM3029 User Guide.
-- https://www.analog.com/media/en/technical-documentation/user-guides/ADuCM3027-ADuCM3029-User-Guide-UG-1091.pdf


library ieee;
use ieee.std_logic_1164.all;

entity UART is
	port (Rx : in std_logic;
			RTS : in std_logic;
			Tx : out std_logic;
			CTS : out std_logic);
end UART;


architecture behavioral of UART is

signal Tx_sig : std_logic;

begin
	Tx <= Tx_sig when RTS = '1' else '0';
	
end behavioral;