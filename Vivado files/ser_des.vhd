----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.01.2024 08:54:09
-- Design Name: 
-- Module Name: SerDes - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ser_des is
    Port ( pin_in : in  STD_LOGIC;
           pin_out : out  STD_LOGIC;
           clk_0 : in  STD_LOGIC;
           clk_90 : in  STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end ser_des;


architecture RTL of ser_des is

signal clk_0B, clk_90B: STD_LOGIC;

begin

clk_0B<=not clk_0; 
clk_90B<=not clk_90;

ISERDES_1 : ISERDESE2
   generic map (
      DATA_RATE => "DDR",           -- DDR, SDR
      DATA_WIDTH => 4,              -- Parallel data width (2-8,10,14)
      DYN_CLKDIV_INV_EN => "FALSE", -- Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
      DYN_CLK_INV_EN => "FALSE",    -- Enable DYNCLKINVSEL inversion (FALSE, TRUE)
      -- INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      INIT_Q3 => '0',
      INIT_Q4 => '0',
      INTERFACE_TYPE => "OVERSAMPLE",   -- MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
      IOBDELAY => "BOTH",           -- NONE, BOTH, IBUF, IFD -- ит
      NUM_CE => 1,                  -- Number of clock enables (1,2)
      OFB_USED => "FALSE",          -- Select OFB path (FALSE, TRUE)
      SERDES_MODE => "MASTER",      -- MASTER, SLAVE
      -- SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
      SRVAL_Q1 => '0',
      SRVAL_Q2 => '0',
      SRVAL_Q3 => '0',
      SRVAL_Q4 => '0'  )
   port map ( 
        O => pin_out, 
        Q1 => Q(0), 
        Q2 => Q(2), 
        Q3 => Q(1),
        Q4 => Q(3),
        Q5 => open, 
        Q6 => open, 
        Q7 => open, 
        Q8 => open, 
        SHIFTOUT1 => open, 
        SHIFTOUT2 => open, 
        BITSLIP => '0',
        CE1 => '1', 
        CE2 => '1', 
        CLKDIVP => '0',
	CLK => clk_0, 
	CLKB => clk_0B,
        CLKDIV => '0',
        OCLK => clk_90, 
        OCLKB => clk_90B, 
        DYNCLKDIVSEL => '0',  
        DYNCLKSEL => '0',
        D => '0',
        DDLY =>  pin_in,  
        OFB => '0',             
        RST => '0', 
        SHIFTIN1 => '0',  
        SHIFTIN2 => '0');

end RTL;


