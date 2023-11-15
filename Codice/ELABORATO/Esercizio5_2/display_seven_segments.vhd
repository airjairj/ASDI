library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_seven_segments is
	Generic( 
				CLKIN_freq : integer := 100000000; 
				CLKOUT_freq : integer := 500
				);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           VALUE : in  integer;
           ENABLE : in  STD_LOGIC_VECTOR (7 downto 0); -- decide quali cifre abilitare
           DOTS : in  STD_LOGIC_VECTOR (7 downto 0); -- decide quali punti visualizzare
           ANODES : out  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
           CATHODES : out  STD_LOGIC_VECTOR (7 downto 0));
end display_seven_segments;

architecture Structural of display_seven_segments is

signal counter : std_logic_vector(2 downto 0);
signal clock_filter_out : std_logic := '0';

COMPONENT cathodes_manager
	PORT(
		counter : IN std_logic_vector(2 downto 0);
		value : IN integer;
		dots : IN std_logic_vector(7 downto 0);          
		cathodes : OUT std_logic_vector(7 downto 0)
		);
END COMPONENT;

COMPONENT clock_filter
	GENERIC(
				CLKIN_freq : integer := 100000000;
				CLKOUT_freq : integer := 500
				);
	PORT(
		clock_in : IN std_logic; 
        reset : in  STD_LOGIC;		
		clock_out : OUT std_logic
		);
END COMPONENT;
begin
--il clock filter genera un segnale di abilitazione per il contatore mod8 che viene usato
--come segnale di conteggio e quindi di fatto fornisce la frequenza con cui viene modificata
--la cifra da mostrare

clk_filter: clock_filter GENERIC MAP(
	CLKIN_freq => CLKIN_freq,
	CLKOUT_freq => CLKOUT_freq
	)
	PORT MAP(
		clock_in => CLK,
		reset => RST,
		clock_out => clock_filter_out
	);

cathodes_instance: cathodes_manager port map(
	counter => counter,
	value => value,
	dots => dots,
	cathodes => cathodes
);

end Structural;

