library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dsf_dezHora is
  port (
    enable    : in  std_logic;
    areset    : in  std_logic;
    count_en  : in  std_logic;
    clk       : in  std_logic;
    q         : buffer unsigned(3 downto 0) := (others => '0'); -- 4 bits para poder concatenar
    carry     : out std_logic := '0'
  );
end dsf_dezHora;

architecture upcounter_a of dsf_dezHora is
  constant LEN_MODULE : unsigned(3 downto 0) := "0011";  -- 3 decimal
  constant MAX_MODULE : unsigned(3 downto 0) := LEN_MODULE - 1; -- 2 decimal
begin

  process(clk, areset)
  begin
    if areset = '1' then
      q     <= (others => '0');
      carry <= '0';
    elsif rising_edge(clk) then
      if enable = '1' and count_en = '1' then
        if q = MAX_MODULE then
          q <= (others => '0');
          carry <= '1';
        else
          q <= q + 1;
          carry <= '0';
        end if;
      else
        carry <= '0';
      end if;
    end if;
  end process;

end upcounter_a;

