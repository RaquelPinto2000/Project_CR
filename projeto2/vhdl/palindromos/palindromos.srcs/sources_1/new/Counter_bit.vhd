----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.06.2022 10:12:53
-- Design Name: 
-- Module Name: Counter_bit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter_bit is
    Port (clk: in std_logic;
          reset: in std_logic;
          dataIn: in std_logic;
          controler: out std_logic);
         -- counter: out std_logic_vector(4 downto 0)); -- pode ser 32 palindromos no maximo
end Counter_bit;

architecture Behavioral of Counter_bit is

    type TState is (START, PAUSE);
    signal pState, nState: TState; -- estado presente e proximo estado
  
begin


sync_process : process(clk)
    begin
        if (rising_edge (clk)) then
            if (reset = '1') then
                pState <= PAUSE;   
               -- s_counter <=0;     
            else
                pState <= nState;
            end if;
         end if;
     end process; 
     
comb_process : process(clk, pState, reset, dataIn)
    begin
        case pState is
            when PAUSE =>
                controler <= '0';
                if (dataIn = '1') then
                    nState <= START;
                    controler <= '1';
                else
                    nState <= PAUSE;
                end if;
             when START =>
                controler <='0';
                if (dataIn = '0') then
                    nState <= PAUSE;
                else
                    nState <= START;
                    controler <='1';
                end if;    
             when others =>
                nState <= PAUSE;   
                controler <= '0';     
        end case;
    end process;
   
end Behavioral;
