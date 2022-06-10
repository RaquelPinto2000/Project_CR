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
  Port (dataIn : in std_logic_vector(31 downto 0);
        dataOut : out std_logic);
end PalindromoCheck;

architecture Behavioral of PalindromoCheck is
    signal s_dataIn_reverse: std_logic_vector(31 downto 0);
begin
    process(dataIn)
    begin
        for i in 0 to dataIn'length-1 loop
            s_dataIn_reverse(i) <= dataIn(31-i);
        end loop;
    end process; 
    dataOut <= '1' when s_dataIn_reverse = dataIn else '0'; 
end Behavioral;