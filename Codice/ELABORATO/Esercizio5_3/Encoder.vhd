library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- questo componente prende in ingresso una stringa di 10 bit espressa in 
-- rappresentazione decodificata (un solo bit alto alla volta) che rappresenta una cifra decimale e restituisce
-- la rappresentazione della cifra decimale mediante codifica Binary-Coded Decimal (BCD).  
entity Encoder is
    Port(
        X : in STD_LOGIC_VECTOR(7 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
       );
end Encoder;

architecture Dataflow of Encoder is

begin
    with X select
        Y <= "0000" when "0000000001",
             "0001" when "0000000010",
             "0010" when "0000000100",
             "0011" when "0000001000",
             "0100" when "0000010000",
             "0101" when "0000100000",
             "0110" when "0001000000",
             "0111" when "0010000000",
             "1111" when others; 
end Dataflow;
