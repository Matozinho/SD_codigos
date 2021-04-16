entity tb_mux4x1 is end entity;

architecture comuta of tb_mux4x1 is
  component mux4x1 is
    port(
      c0   : in bit;
      c1   : in bit;
      c2   : in bit;
      c3   : in bit;
      sel  : in bit_vector(1 downto 0);
      z    : out bit 
    );
  end component;

  signal sc0 : bit;
  signal sc1 : bit;
  signal sc2 : bit;
  signal sc3 : bit;
  signal sselect : bit_vector(1 downto 0);
  signal sz : bit;

begin

  u_mux4x1 : mux4x1 port map(
    sc0,
    sc1,
    sc2,
    sc3,
    sselect,
    sz
  );

  u_tb : process
  begin
    sc0 <= '0';
    sc1 <= '1';
    sc2 <= '0';
    sc3 <= '1';
    sselect <= "00";
    wait for 10 ns;

    sselect <= "01";
    wait for 10 ns;

    sselect <= "10";
    wait for 10 ns;

    sselect <= "11";
    wait for 10 ns;

    sc0 <= '1';
    sc1 <= '0';
    sc2 <= '1';
    sc3 <= '0';
    sselect <= "00";
    wait for 10 ns;

    sselect <= "01";
    wait for 10 ns;

    sselect <= "10";
    wait for 10 ns;

    sselect <= "11";
    wait for 10 ns;
    
    wait;
  end process;

end architecture;