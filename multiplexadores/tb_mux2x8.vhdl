entity tb_mux2x8 is end entity;

architecture comuta of tb_mux2x8 is
  component mux2x8 is
    port(
      c0  : in bit_vector(7 downto 0);
      c1  : in bit_vector(7 downto 0);
      sel : in bit;
      z   : out bit_vector(7 downto 0)
    );
  end component;

  signal sc0 : bit_vector(7 downto 0);
  signal sc1 : bit_vector(7 downto 0);
  signal sselect : bit;
  signal sz : bit_vector(7 downto 0);

begin

  u_mux2x8 : mux2x8 port map(
    sc0,  --sinal canal 0
    sc1,  --sinal canal 1
    sselect, --Sinal seletor
    sz    --sinal saída
  );

  u_tb : process
  begin
    
  end process;

end architecture;
