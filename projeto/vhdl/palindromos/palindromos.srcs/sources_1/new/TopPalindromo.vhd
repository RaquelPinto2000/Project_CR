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
      --  s_dataout: in std_logic;
        led: out std_logic_vector(5 downto 0));
        --counter: out std_logic_vector(4 downto 0));
end TopPalindromo;

architecture Behavioral of TopPalindromo is
    signal s_btnR: std_logic; 
    signal s_led : std_logic;
    signal s_enCounter:std_logic;
    signal s_dataout: std_logic_vector(31 downto 0);
    signal s_controler: std_logic;
    signal s_counter:std_logic_vector(3 downto 0);
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
               dataIn=>"00101001110011011011001110010101", -- nao e
               --dataIn=>"00101011110011011011001110010100", -- nao e
               --dataIn=>"01100101100110011001100110100110", -- e
               dataOut=>s_dataout);
               
               
--   Unitcounter: entity work.Counter_bit(Behavioral)
--        port map (clk => clk,
--                  reset => s_btnR,
--                  dataIn =>s_dataout, 
--                  controler => s_controler);
   
--   counter: entity work.counter5bits(Behavioral)
--         port map(clk => clk,
--                  reset => s_btnR,
--                  enable =>s_controler,
--                  counter => s_counter );

--vounter: entity work.CountPalindrome(Behavioral)
--        port map (clk => clk,
--                  dataIn => '1',
--                  counter => s_counter);
                  
              
        
led(0) <= s_dataout(0);
led(1) <= s_dataout(1);
led(2) <= s_dataout(2);
led(3) <= s_dataout(3);
led(4) <= s_dataout(4);
led(5) <= s_dataout(5);

end Behavioral;
