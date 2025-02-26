library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is

--Declare the component under test (UUT): sevenseg_decoder

  component top_basys3 is
    port(
      i_Hex   : in  std_logic_vector(3 downto 0);
      o_seg_n : out std_logic_vector(6 downto 0)
    );
  end component;

  -- declare any additional components required

  signal w_Hex   : std_logic_vector(3 downto 0) := (others => '0');
  signal w_seg_n : std_logic_vector(6 downto 0);

begin
  my_decoder_inst : sevenseg_decoder port map(
      i_Hex   => w_Hex,
      o_seg_n => w_seg_n
    );



  --Test Process: Check 4 different hex values and assert expected outputs
  -----------------------------------------------------------------------------
    
test_process : process
begin
    -- 0
    w_Hex <= x"0";  wait for 10 ns;
    assert (w_seg_n = "1000000") report "Error on 0" severity failure;

    -- 1
    w_Hex <= x"1";  wait for 10 ns;
    assert (w_seg_n = "1111001") report "Error on 1" severity failure;

    -- 2
    w_Hex <= x"2";  wait for 10 ns;
    assert (w_seg_n = "0100100") report "Error on 2" severity failure;

    -- 3
    w_Hex <= x"3";  wait for 10 ns;
    assert (w_seg_n = "0110000") report "Error on 3" severity failure;

    -- 4
    w_Hex <= x"4";  wait for 10 ns;
    assert (w_seg_n = "0011001") report "Error on 4" severity failure;

    -- 5
    w_Hex <= x"5";  wait for 10 ns;
    assert (w_seg_n = "0010010") report "Error on 5" severity failure;

    -- 6
    w_Hex <= x"6";  wait for 10 ns;
    assert (w_seg_n = "0000010") report "Error on 6" severity failure;

    -- 7
    w_Hex <= x"7";  wait for 10 ns;
    assert (w_seg_n = "1111000") report "Error on 7" severity failure;

    -- 8
    w_Hex <= x"8";  wait for 10 ns;
    assert (w_seg_n = "0000000") report "Error on 8" severity failure;

    -- 9
    w_Hex <= x"9";  wait for 10 ns;
    assert (w_seg_n = "0011000") report "Error on 9" severity failure;

    -- A
    w_Hex <= x"A";  wait for 10 ns;
    assert (w_seg_n = "0001000") report "Error on A" severity failure;

    -- B
    w_Hex <= x"B";  wait for 10 ns;
    assert (w_seg_n = "0000011") report "Error on B" severity failure;

    -- C
    w_Hex <= x"C";  wait for 10 ns;
    assert (w_seg_n = "0100111") report "Error on C" severity failure;

    -- D
    w_Hex <= x"D";  wait for 10 ns;
    assert (w_seg_n = "0100001") report "Error on D" severity failure;

    -- E
    w_Hex <= x"E";  wait for 10 ns;
    assert (w_seg_n = "0000110") report "Error on E" severity failure;

    -- F
    w_Hex <= x"F";  wait for 10 ns;
    assert (w_seg_n = "0001110") report "Error on F" severity failure;


    wait;
  end process;

end test_bench;


