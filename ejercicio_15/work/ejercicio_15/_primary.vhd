library verilog;
use verilog.vl_types.all;
entity ejercicio_15 is
    generic(
        Espera_20ms     : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        Enviar_SetFunction: vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        Envia_EntryModeSet: vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        Enviar_DisplayControl: vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        Envia_DisplayClear: vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        Envia_Direccion : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        Caracter1       : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        Caracter2       : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        Caracter3       : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        Caracter4       : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        Termina_Aqui    : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0)
    );
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        E               : out    vl_logic;
        RS              : out    vl_logic;
        RW              : out    vl_logic;
        INIlisto        : out    vl_logic;
        DATOS           : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Espera_20ms : constant is 1;
    attribute mti_svvh_generic_type of Enviar_SetFunction : constant is 1;
    attribute mti_svvh_generic_type of Envia_EntryModeSet : constant is 1;
    attribute mti_svvh_generic_type of Enviar_DisplayControl : constant is 1;
    attribute mti_svvh_generic_type of Envia_DisplayClear : constant is 1;
    attribute mti_svvh_generic_type of Envia_Direccion : constant is 1;
    attribute mti_svvh_generic_type of Caracter1 : constant is 1;
    attribute mti_svvh_generic_type of Caracter2 : constant is 1;
    attribute mti_svvh_generic_type of Caracter3 : constant is 1;
    attribute mti_svvh_generic_type of Caracter4 : constant is 1;
    attribute mti_svvh_generic_type of Termina_Aqui : constant is 1;
end ejercicio_15;
