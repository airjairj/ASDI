library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM is
    port(
    CLK : in std_logic;
    s_write : in std_logic;
    address : in std_logic_vector (3 downto 0);
    out_val : out std_logic_vector(3 downto 0);
    inp_val : in std_logic_vector(3 downto 0)
    );
end entity MEM;

architecture MemArch of MEM is
    signal ind : integer := 0;
    type MEMORY_N_4 is array (0 to 15) of std_logic_vector(3 downto 0);
    signal MEMO : MEMORY_N_4;

    begin
        process (CLK,s_write)
            begin
                if (rising_edge(CLK) and s_write = '1') then
                    MEMO(ind) <= inp_val;
                end if;
           
            out_val <= MEMO(ind);


            end process;

end MemArch;
