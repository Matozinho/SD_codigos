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
    -- Canal0 = 0 | Canal1 = 1
    sc0 <= "00000000";
    sc1 <= "11111111";
    sselect <= '0';
    wait for 10 ns;
    
    sselect <= '1';
    wait for 10 ns;
    
    -- Canal0 = 1 | Canal1 = 0
    sc0 <= "11111111";
    sc1 <= "00000000";
    sselect <= '0';
    wait for 10 ns;
    
    sselect <= '1';
    wait for 10 ns;

    -- Canal0 = 0F | Canal1 = F0
    sc0 <= "00001111";
    sc1 <= "11110000";
    sselect <= '0';
    wait for 10 ns;

    sselect <= '1';
    wait for 10 ns;

    -- Canal0 = F0 | Canal1 = 0F
    sc0 <= "11110000";
    sc1 <= "00001111";
    sselect <= '0';
    wait for 10 ns;

    sselect <= '1';
    wait for 10 ns;

    wait;
  end process;

end architecture;
