library ieee;
use ieee.numeric_bit.all;

entity comparador16 is
  port (
    enable  : in     bit;
    dataa   : in     bit_vector(15 downto 0);
    datab   : in     bit_vector(15 downto 0);
    gtout   : buffer bit;
    ltout   : buffer bit;
    eqout   : buffer bit
  );
end comparador16;

architecture compare_a of comparador16 is

  -- Internal signal
  signal gleout : bit_vector(2 downto 0);  -- [2]=gt, [1]=lt, [0]=eq

  -- Internal function to compare bit_vectors
  function compare(a, b : bit_vector(15 downto 0)) return bit_vector is
    variable result : bit_vector(2 downto 0); -- [2]=gt, [1]=lt, [0]=eq
  begin
    if unsigned(a) > unsigned(b) then
      result := "100";  -- gt = 1
    elsif unsigned(a) < unsigned(b) then
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
