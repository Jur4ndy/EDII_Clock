library ieee;
use ieee.numeric_bit.all;
use work.dsf_std.all;

entity dsf_vectors2vector is

  port (

    -- Dados de entrada: vetores de 4 bits.
    data3  :  in      bit_vector(4-1 downto 0);
	data2  :  in      bit_vector(4-1 downto 0);
	data1  :  in      bit_vector(4-1 downto 0);
	data0  :  in      bit_vector(4-1 downto 0);

    -- Dados de saída: vetor de 16 bits.
    result :  buffer  bit_vector(16-1 downto 0)

  );

end dsf_vectors2vector;


architecture vectors2vector_a of dsf_vectors2vector is
begin

  -- OP. Resultado da concatenação dos vetores de dados.
  result <= data3 & data2 & data1 & data0;

end vectors2vector_a;
