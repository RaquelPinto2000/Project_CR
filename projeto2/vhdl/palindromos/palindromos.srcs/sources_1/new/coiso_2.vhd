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

entity coiso_2 is
    Port (clk: in std_logic;
          reset: in std_logic;
          dataIn: in std_logic;
          counter: out std_logic_vector(4 downto 0)); -- pode ser 32 palindromos no maximo
end coiso_2;

architecture Behavioral of coiso_2 is

    type TState is (START, PAUSE);
    signal pState, nState: TState; -- estado presente e proximo estado
    signal s_counter : natural := 0; -- contador para os palindromos
    signal controler: std_logic;
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
--            when INIT =>
--                s_counter <= 0;
--                 if (dataIn = '1') then
--                     nState <= START;
--                 elsif (dataIn = '0') then
--                    nState <= PAUSE;
--                 else 
--                    nState <= INIT;
--                 end if;

            when PAUSE =>
                controler <= '0';
                --s_counter <= 0;
             --   counter <= std_logic_vector(to_unsigned(s_counter,counter'length));
                if (dataIn = '1') then
                    nState <= START;
                    controler <= '1';
                   -- s_counter <= s_counter +1;
              --      counter <= std_logic_vector(to_unsigned(s_counter,counter'length));
                else
                    nState <= PAUSE;
                end if;
             when START =>
              --  s_counter <= 0;
                controler <='0';
                if (dataIn = '0') then
                    nState <= PAUSE;
                else
                    nState <= START;
                    controler <='1';
                    --s_counter <= s_counter +1;
               --     counter <= std_logic_vector(to_unsigned(s_counter,counter'length));
                end if;    
             when others =>
                nState <= PAUSE;   
               -- s_counter <= 0;
                controler <= '0';
               -- counter <= std_logic_vector(to_unsigned(s_counter,counter'length));                   
        end case;
        if(controler ='1') then
            s_counter <= s_counter +1;
        end if;
        counter <= std_logic_vector(to_unsigned(s_counter,counter'length));
    end process;
   
end Behavioral;
