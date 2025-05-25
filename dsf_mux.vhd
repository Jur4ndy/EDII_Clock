entity mux is
  port (
    -- Dados de entrada: vetores de 16 bits e o bit do botão p.
    data_1  : in  bit_vector(15 downto 0);
    data_0  : in  bit_vector(15 downto 0);
    p      : in  bit;

    -- Dados de saída: vetor de 16 bits.
    result : out bit_vector(15 downto 0)
  );
end mux;

architecture behavioral of mux is
begin

  process(data_0, data_1, p)
  begin
    if p = '1' then
      result <= data_0;
    else
      result <= data_1;
    end if;
  end process;

end behavioral;