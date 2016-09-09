----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Javier Macotela && Sergio 
-- 
-- Create Date: 07.09.2016 13:23:59
-- Design Name: 
-- Module Name: mealy - behavior
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

entity moore is
    port (
        clk   : in  std_logic;
        rst : in  std_logic;
        s_in  : in  std_logic;
        d_out2 : out std_logic );
end moore;

architecture behavior of moore is

    type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12);
    
    signal current_state, next_state : state_type;
    
begin -- Mealy_arch

    -- purpose: Implements the registers forthe sequence decoder
    -- type   : sequential
    -- inputs : clk, rst, next_state
    -- outputs: current_state
    reg: process (clk, rst)  -- The register process
    begin  -- process register
        if rst = '0' then
            current_state <= s0;
        elsif clk'event and clk = '1' then
            current_state <= next_state;
        end if;
     end process reg;
     
   comb: process (s_in, current_state)
   begin
    next_state <= current_state;
    case current_state is
        when s0 =>
            if s_in = '0' then
                next_state <= s1;
            else
                next_state <= s0;
            end if;
        when s1 =>
            if s_in = '0' then
                next_state <= s1;
            else
                next_state <= s2;
            end if;
        when s2 =>
            if s_in = '0' then
                next_state <= s3;
            else
                next_state <= s0;
            end if;
         when s3 =>
            if s_in = '0' then
                next_state <= s1;
            else
                next_state <= s4;
            end if;
          when s4 =>
            if s_in = '0' then
                next_state <= s3;
            else
                next_state <= s5;
            end if;
          when s5 =>
            if s_in = '0' then
                next_state <= s6;
            else
                next_state <= s0;
            end if;
          when s6 =>
            if s_in = '0' then
                next_state <= s7;
            else
                next_state <= s0;
            end if;
          when s7 =>
            if s_in = '0' then
                next_state <= s8;
            else
                next_state <= s2;
            end if;
          when s8 =>
            if s_in = '0' then
                next_state <= s9;
            else
                next_state <= s2;
            end if;
          when s9 =>
            if s_in = '0' then
                next_state <= s1;
            else
                next_state <= s10;
            end if;
           when s10 =>
            if s_in = '0' then
                next_state <= s3;
            else
                next_state <= s11;
            end if;
           when s11 =>
            if s_in = '0' then
                next_state <= s12;
            else
                next_state <= s0;
            end if;
            when s12 =>
            if s_in = '0' then
                next_state <= s1;
            else
                next_state <= s2;
           end if;
           when others => null;
   end case;
   end process comb;
   
    moore: process (current_state)
    begin
        d_out2 <= '0';
        if current_state = s12 then
            d_out2 <= '1';
        else
            d_out2 <= '0';
        end if;
    end process moore;
end behavior;
