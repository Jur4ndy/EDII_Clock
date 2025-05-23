library ieee;
use ieee.numeric_bit.all;

entity comparador is
  port (
    enable  : in     bit;
    dataa   : in     integer range 0 to 15;
    datab   : in     integer range 0 to 15;
    gtout   : buffer bit;
    ltout   : buffer bit;
    eqout   : buffer bit
  );
end comparador;

architecture compare_a of comparador is

  -- Internal signal
  signal gleout : bit_vector(2 downto 0);  -- [2]=gt, [1]=lt, [0]=eq

  -- Internal function
  function compare(a, b : integer) return bit_vector is
    variable result : bit_vector(2 downto 0); -- [2]=gt, [1]=lt, [0]=eq
  begin
    if a > b then
      result := "100";  -- gt = 1
    elsif a < b then
      result := "010";  -- lt = 1
    else
      result := "001";  -- eq = 1
    end if;
    return result;
  end function;

begin

  -- Apply function only if enabled
  gleout <= compare(dataa, datab) when enable = '1' else
            (others => '0');

  -- Output assignments
  gtout <= gleout(2);
  ltout <= gleout(1);
  eqout <= gleout(0);

end compare_a;