library ieee;
use ieee.numeric_bit.all;

entity countUnHora is
  port (
    -- Controles assíncronos
    enable    : in  bit;
    areset    : in  bit;

    -- Controles síncronos
    count_en  : in  bit;
    clk       : in  bit;

    -- Resultado da contagem: 4 bits
    q         : buffer integer range 0 to 15 := 0;

    -- Sinal de carry: ativo por 1 ciclo ao atingir LEN_MODULE-1
    carry     : out bit := '0'
  );
end countUnHora;

architecture upcounter_a of countUnHora is

  -- Constantes de configuração
  constant LEN_MODULE : integer := 10;                   -- módulo de contagem
  constant MAX_MODULE : integer := LEN_MODULE - 1;       -- último valor válido (9)

begin

  -- Processo principal de contagem e geração do sinal carry
  process (clk, areset)
  begin
    if areset = '1' then
      q     <= 0;
      carry <= '0';

    elsif rising_edge(clk) then
      if enable = '1' then
        if count_en = '1' then
          if q = MAX_MODULE then
            q     <= 0;
            carry <= '1';
          else
            q     <= q + 1;
            carry <= '0';
          end if;
        else
          -- Modo memória
          carry <= '0';
        end if;
      else
        -- Se desabilitado, mantém valor e carry = 0
        carry <= '0';
      end if;
    end if;
  end process;

end upcounter_a;
