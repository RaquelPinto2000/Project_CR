----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2022 11:22:43
-- Design Name: 
-- Module Name: counter_4bits - Behavioral
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

entity counter5bits is
  Port (clk: in std_logic; 
        reset: in std_logic;
        enable: in std_logic;
        counter : out std_logic_vector(4 downto 0));
       
end counter5bits;

architecture Behavioral of counter5bits is
      signal s_counter : natural :=0;
begin

    process(clk)
    begin
        if(rising_edge(clk)) then
           if(reset ='1' or s_counter < 0 or s_counter>=31) then
                s_counter <= 0;
           elsif(enable ='1') then
                s_counter <= (s_counter+1);
           end if;
          
           counter<= std_logic_vector(to_unsigned(s_counter,counter'length));
        end if;
    end process;
    
end Behavioral;
