library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port (
        AN      : out STD_LOGIC_VECTOR (3 downto 0);
        Cathodes: out STD_LOGIC_VECTOR (7 downto 0);
        LED     : out STD_LOGIC_VECTOR (7 downto 0);
        SW      : in  STD_LOGIC_VECTOR (4 downto 0);
        BUTTON  : in  STD_LOGIC_VECTOR (4 downto 0)
    );
end main;

architecture Behavioral of main is

begin
		-- Anode control
    AN(0) <= not SW(0);
    AN(1) <= not SW(1);
    AN(2) <= not SW(2);
    AN(3) <= not SW(3);
	 
		-- Cathode logic (7-seg display)
    Cathodes(0) <= SW(0) or SW(3);
    Cathodes(1) <= '0';
    Cathodes(2) <= SW(1);
    Cathodes(3) <= SW(0) or SW(3);
    Cathodes(4) <= SW(0) or SW(2) or SW(3);
    Cathodes(5) <= SW(0) or SW(1) or SW(2);
    Cathodes(6) <= SW(0);
    Cathodes(7) <= '1';
	 
		-- LED logic
    LED(0) <= BUTTON(0) and not BUTTON(4);
    LED(1) <= BUTTON(1) and not BUTTON(4);
    LED(2) <= BUTTON(2) and not BUTTON(4);
    LED(3) <= BUTTON(3) and not BUTTON(4);
    LED(4) <= BUTTON(0) and BUTTON(4);
    LED(5) <= BUTTON(1) and BUTTON(4);
    LED(6) <= BUTTON(2) and BUTTON(4);
    LED(7) <= BUTTON(3) and BUTTON(4);
	 
	 
end Behavioral;



