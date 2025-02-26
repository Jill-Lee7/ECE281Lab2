--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2025 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : sevenseg_decoder_tb.vhd
--| AUTHOR(S)     : Jillian Essig
--| CREATED       : 02/25/2025  Last Modified 02/25/2025
--| DESCRIPTION   : This file tests to ensure that the sevenseg_decoder
--|                works properly for all 16 hex values (0-F).
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std
--|    Files     : sevenseg_decoder.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENTIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------

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









