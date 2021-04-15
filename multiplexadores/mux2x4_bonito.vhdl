entity mux2x4_bonito is
    port(
        c0  : in  bit_vector(3 downto 0);
        c1  : in  bit_vector(3 downto 0);
        sel : in  bit;
        zp  : out bit_vector(3 downto 0);
        zc  : out bit_vector(3 downto 0)
    );
end entity;

architecture comuta of mux2x4_bonito is
begin
    -- usando portas lógicas
    -- fio-por-fio, infelizmente!
    zp(0) <= (c0(0) and not(sel)) or (c1(0) and sel); -- Canal i, bit 0
    zp(1) <= (c0(1) and not(sel)) or (c1(1) and sel); -- Canal i, bit 1
    zp(2) <= (c0(2) and not(sel)) or (c1(2) and sel); -- Canal i, bit 2
    zp(3) <= (c0(3) and not(sel)) or (c1(3) and sel); -- Canal i, bit 3

    -- comando vhdl de seleção de sinais
    zc <= c0 when sel = '0' else c1;

end architecture;
