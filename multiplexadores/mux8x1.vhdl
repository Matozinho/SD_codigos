entity mux8x1 is
  port(
    c0   : in bit;
    c1   : in bit;
    c2   : in bit;
    c3   : in bit;
    c4   : in bit;
    c5   : in bit;
    c6   : in bit;
    c7   : in bit;
    sel  : in bit_vector(2 downto 0);
    z    : out bit 
  );
end entity;

architecture comuta of mux8x1 is
begin
  -- Comando vhdl para selção de canais
  z <= c0 when (sel = "000") 
  else c1 when (sel = "001") 
  else c2 when (sel = "010") 
  else c3 when (sel = "011") 
  else c4 when (sel = "100") 
  else c5 when (sel = "101") 
  else c6 when (sel = "110") 
  else c7 when (sel = "111");

end architecture;