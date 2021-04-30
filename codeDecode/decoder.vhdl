entity decoder is
  port(
    k    : in bit_vector(4 downto 0);
    erro : out bit;
    s    : out bit_vector(4 downto 0)
  );
end entity;

architecture decode of decoder is
begin

  s(4) <= not k(4) and ( not k(0) or not k(1) or not k(2) or not k(3) );
  s(3) <= (k(3) and ( not k(0) or not k(1) or not k(2) )) or (k(0) and k(1) and k(2) and not k(3));
  s(2) <= (k(2) and (not k(1) or not k(0))) or (not k(2) and k(1) and k(0));
  s(1) <= k(1) xor K(0);
  s(0) <= not k(0);
  
  erro <= '1' when k = "11111" else '0';
  
end architecture;
