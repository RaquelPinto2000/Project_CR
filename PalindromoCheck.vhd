----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.06.2022 15:31:01
-- Design Name: 
-- Module Name: TopPalindromo - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PalindromoCheck is
  Port (clk: in std_logic;
        reset: in std_logic;
        enable : in std_logic; -- pulso de 2hz
        dataIn : in std_logic_vector(31 downto 0);
        dataOut : out std_logic);
end PalindromoCheck;

architecture Behavioral of PalindromoCheck is
    signal s_counter : natural := 0;    --para percorrer o vetor
    signal verify : std_logic;
    signal flag :std_logic:='0';
begin
 -- flag<='1';
  process(clk)
    begin
        if(rising_edge(clk)) then
           if(reset = '1' or s_counter =15) then
                s_counter <= 0;
           --     verify <='1';
                flag<='0';
           else
                if( enable ='1') then
                   if(dataIn(s_counter) = dataIn (31-s_counter) and flag/='1')then
                       -- verify <='1';
                        s_counter <= (s_counter +1);
                       -- flag<='0';
                        --flag<='1';
                   else
                       -- verify <='0';
                        flag<='1'; -- ja nao pode ser palindromo
                   end if;
                end if;
           end if; 
        end if;
    end process;
     dataOut<= '0' when flag='1' else
                    '1';
end Behavioral;
