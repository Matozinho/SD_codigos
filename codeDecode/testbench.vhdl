-- Codificador e Decodificador de Excesso-k para Complemento de 2
-- 5 bits
-- TESTBENCH
-- errCODE = 1 em c = -16 
-- errDECODE = 1 não deve acontecer

library ieee;
use ieee.numeric_bit.all;

entity code_decode is
end entity;

architecture testbench of code_decode is

    component encoder is
        port(
            c    : in bit_vector(4 downto 0);
            erro : out bit;
            s    : out bit_vector(4 downto 0)
        );
    end component;

    component decoder is
        port(
            k    : in bit_vector(4 downto 0);
            erro : out bit;
            s    : out bit_vector(4 downto 0)
        );
    end component;

    signal sin_c, sout_c_in_k, sout_k : bit_vector(4 downto 0);
    signal errCode, errDecode : bit;

begin

    u_code   : encoder  port map(sin_c      , errCode  , sout_c_in_k);
    u_decode : decoder  port map(sout_c_in_k, errDecode, sout_k     );

    u_tb : process
    variable i : integer := 0;
    begin
        sin_c <= bit_vector( to_unsigned(i,5) );
        wait for 10 ns;

        i := i + 1;

        if (i = 32) then
            wait;
        end if;

    end process;    

end architecture;
