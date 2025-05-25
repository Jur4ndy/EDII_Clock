

library ieee;
use ieee.numeric_bit.all;
use work.dsf_std.all;


entity dsf_datareg is

  port (

    -- Controles assíncrono.
    enable   :  in      bit;
    areset   :  in      bit;

    -- Controles síncrono.
    load_en  :  in      bit;
    clk      :  in      bit;

    -- Entrada e saída de dados do registrador: 4 bits
    data     :  in      integer range (2**4 - 1) downto 0;
    q        :  buffer  integer range (2**4 - 1) downto 0 := 0

  );

end dsf_datareg;


architecture datareg_a of dsf_datareg is

  -- --------------------------------------------------------------------------
  --                   CONSTANTES GLOBAIS DA ARQUITETURA                     --
  -- --------------------------------------------------------------------------

  -- Limite do índice do vetor de bits.
  constant  MAX_DATA  :  integer  :=  data'high;


  -- --------------------------------------------------------------------------
  --                   FUNÇÕES GLOBAIS DA ARQUITETURA                     --
  -- --------------------------------------------------------------------------

  function reset_q (enable : bit; q : integer) return integer is

    variable  reg  :  integer range MAX_DATA downto 0 := 0;

  begin

    if (enable = '1') then

      -- Modo limpa.
      reg := 0;
	  
	else
	
      -- Modo memória.
	  reg := q;
	
	end if;

	return reg;

  end reset_q;


  function load_q (enable : bit; load_en : bit; data: integer; q : integer) return integer is

    variable  reg  :  integer range MAX_DATA downto 0 := 0;

  begin

    if (enable = '1') and (load_en = '1') then
	
      -- Modo carga.
      reg := data;

    else
	
	  -- Modo memória.
      reg := q;

    end if;

    return reg;

  end load_q;


begin

  -- OP1. Resultado de carga.
  q <= reset_q(enable, q) when (areset  = '1') else 
       load_q(enable, load_en, data, q) when low2high(clk);
			     
end datareg_a;
