library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is

--Declare the component under test (UUT): sevenseg_decoder

  component sevenseg_decoder is
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

    -- E
    w_Hex <= x"E";  wait for 10 ns;
    assert (w_seg_n = "0000110") report "Error on E" severity failure;

    -- F
    w_Hex <= x"F";  wait for 10 ns;
    assert (w_seg_n = "0001110") report "Error on F" severity failure;

    wait;
  end process;

end test_bench;

