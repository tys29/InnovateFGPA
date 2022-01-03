-- This UART interface is to be used for connection to the sensor board.
-- UART Control Flow is outlined on page 39 of the ADuCM3027/ADuCM3029 User Guide.
-- https://www.analog.com/media/en/technical-documentation/user-guides/ADuCM3027-ADuCM3029-User-Guide-UG-1091.pdf


library ieee;
use ieee.std_logic_1164.all;

entity UART is
	port (Rx : in std_logic;
			RTS : in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			Tx : out std_logic;
			CTS : out std_logic);
end UART;


architecture behavioral of UART is

signal Tx_sig : std_logic;
type state is (idle, transmit);
signal pr_state, nx_state : state;

begin
	Tx <= Tx_sig when RTS = '1' else '1';
	
	-- FSM Register
	process (reset, clk)
	begin
		if (reset = '1') then
			pr_state <= idle;
		elsif (clk'event and clk = '1') then
			pr_state <= nx_state;
		end if;
	end process;
	
	-- Next state function
	process (Rx, pr_state)
	begin
		case pr_state is
			when idle =>
				if (Rx = '0') then
					nx_state <= transmit;
				end if;
			when transmit =>
				nx_state <= idle;
		end case;
	end process;
	
	-- Output function
	process (pr_state, Rx)
	begin
		case pr_state is
			when idle =>
				Tx <= '1';
				CTS <= '1';
			when transmit =>
				Tx <= '1';
				CTS <= '1';
		end case;
	end process;
	
end behavioral;