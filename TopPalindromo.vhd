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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopPalindromo is
  Port (clk: in std_logic;
        btnR : in std_logic; 
        led: out std_logic_vector(5 downto 0));
        --counter: out std_logic_vector(4 downto 0));
end TopPalindromo;

architecture Behavioral of TopPalindromo is
    signal s_btnR: std_logic; 
    signal s_led : std_logic;
    signal s_enCounter:std_logic;
    signal s_counter:std_logic_vector(4 downto 0);
begin

DebounceUnit_R: entity work.DebounceUnit(Behavioral)
    generic map(kHzClkFreq => 100_000,
                mSecMinInWidth=>100,
                inPolarity=>'1',
                outPolarity=>'1') 
    port map(refclk=>clk,
             dirtyIn=> btnR,
             pulsedOut=>s_btnR);

PulseGenerator_Counter: entity work.PulseGenerator_counter(Behavioral)  -- 1hz
    port map (clk => clk,
              reset => s_btnR,
              pulse=> s_enCounter);

palindromo_check: entity work.PalindromoCheck(Behavioral)
     port map (--dataIn=>"00101001110011011011001110010100", -- e
               --dataIn=>"11010101111010011001011110101011", -- e
               --dataIn=>"00101001110011010011001110010100", -- nao e
               --dataIn=>"00101001110011011011001110010101", -- nao e
               --dataIn=>"00101011110011011011001110010100", -- nao e
               dataIn=>"00101001110011011011000110010100", -- nao e
               dataOut=>s_led);
               
led(0) <= s_led;

end Behavioral;
