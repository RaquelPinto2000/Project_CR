----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.06.2022 10:47:30
-- Design Name: 
-- Module Name: CountPalindrome - Behavioral
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

entity CountPalindrome is
  Port (clk : in std_logic;
        dataIn : in std_logic;
        counter: out std_logic_vector(3 downto 0));
end CountPalindrome;

architecture Behavioral of CountPalindrome is
    signal s_counter : natural range 0 to 15;
begin
    process(clk,dataIn)
    begin
        if (rising_edge(clk)) then
            if (s_counter <0 or s_counter > 16) then
                s_counter <=0;
            end if;
            if (dataIn ='1') then
                s_counter <= s_counter +1;
            end if;
        end if;
    end process;
    
 counter <= std_logic_vector(to_unsigned(s_counter, counter'length));
 
end Behavioral;