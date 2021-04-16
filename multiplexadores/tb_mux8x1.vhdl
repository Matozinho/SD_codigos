entity tb_mux8x1 is end entity;

architecture comuta of tb_mux8x1 is
  component mux8x1 is
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
  end component;

  signal sc0, sc1, sc2, sc3, sc4, sc5, sc6, sc7, sz : bit;
  signal sselect : bit_vector(2 downto 0);

begin

  u_mux8x1 : mux8x1 port map(
    sc0,
    sc1,
    sc2,
    sc3,
    sc4,
    sc5,
    sc6,
    sc7,
    sselect,
    sz
  );

  u_tb : process
  begin
    sc0 <= '0';
    sc1 <= '1';
    sc2 <= '0';
    sc3 <= '1';
    sc4 <= '0';
    sc5 <= '1';
    sc6 <= '0';
    sc7 <= '1';
    sselect <= "000";
    wait for 10 ns;

    sselect <= "001";
    wait for 10 ns;

    sselect <= "010";
    wait for 10 ns;

    sselect <= "011";
    wait for 10 ns;

    sselect <= "100";
    wait for 10 ns;

    sselect <= "101";
    wait for 10 ns;

    sselect <= "110";
    wait for 10 ns;

    sselect <= "111";
    wait for 10 ns;

    sc0 <= '1';
    sc1 <= '0';
    sc2 <= '1';
    sc3 <= '0';
    sc4 <= '1';
    sc5 <= '0';
    sc6 <= '1';
    sc7 <= '0';
    sselect <= "000";
    wait for 10 ns;

    sselect <= "001";
    wait for 10 ns;

    sselect <= "010";
    wait for 10 ns;

    sselect <= "011";
    wait for 10 ns;

    sselect <= "100";
    wait for 10 ns;

    sselect <= "101";
    wait for 10 ns;

    sselect <= "110";
    wait for 10 ns;

    sselect <= "111";
    wait for 10 ns;

    wait;
  end process;
  end architecture;


