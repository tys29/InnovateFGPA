library ieee;
use ieee.std_logic_1164.all;

entity InnovateFPGA is
	port (clk : in std_logic;
			reset : in std_logic;
			Rx_sensor : in std_logic;
			RTS_sensor : in std_logic;
			Tx_sensor : out std_logic;
			CTS_sensor : out std_logic);
end InnovateFPGA;

architecture behavioral of InnovateFPGA is

component UART is
	port (Rx : in std_logic;
			RTS : in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			Tx : out std_logic;
			CTS : out std_logic);
end component;

begin
	U1 : UART port map ( Rx => Rx_sensor,
								RTS => RTS_sensor,
								clk => clk,
								reset => reset,
								Tx => Tx_sensor,
								CTS => CTS_sensor);
end behavioral;