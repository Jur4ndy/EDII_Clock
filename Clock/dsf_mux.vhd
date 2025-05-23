entity mux is
  port (
    -- Dados de entrada: vetores de 16 bits e o bit do botão p. (teste git)
    data_1  : in  bit_vector(15 downto 0);
    data_0  : in  bit_vector(15 downto 0);
    p      : in  bit;

    -- Dados de saída: vetor de 16 bits.
    resultm : out bit_vector(3 downto 0)
	 resultmd : out bit_vector(3 downto 0)
	 resulth : out bit_vector(3 downto 0)
	 resulthd : out bit_vector(3 downto 0)
  );
end mux;

architecture behavioral of mux is
begin

  process(data_0, data_1, p)
  begin
    if p = '1' then
      resultm <= data_0(3 downto 0);
		resultmd <= data_0(7 downto 4);
		resulth <= data_0(11 downto 8);
		resulthd <= data_0(15 downto 12);
    else
      resultm <= data_1(3 downto 0);
		resultmd <= data_1(7 downto 4);
		resulth <= data_1(11 downto 8);
		resulthd <= data_1(15 downto 12);
    end if;
  end process;

end behavioral;
