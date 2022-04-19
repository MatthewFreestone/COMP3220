package body Assgn is 
    procedure Init_Array(Arr : in out BINARY_ARRAY) is 
    begin
        for i in 1 .. Arr'Length loop
            Arr(i) := 0;
        end loop;
    end Init_Array;
    procedure Reverse_Bin_Array(Arr : in out BINARY_ARRAY) is
    begin
        -- Reverse the order of the elements in an array
        for i in 1 .. Arr'Length / 2 loop
            Arr(i) := Arr(i) xor Arr(Arr'Length - i + 1);
            Arr(Arr'Length - i + 1) := Arr(i) xor Arr(Arr'Length - i + 1);
            Arr(i) := Arr(i) xor Arr(Arr'Length - i + 1);
        end loop;
    end Reverse_Bin_Array;
    procedure Print_Bin_Array(Arr : in BINARY_ARRAY) is
    begin
        -- Print the elements of an array
        for i in 1 .. Arr'Length loop
            stdout.put(Arr(i));
        end loop;
    end Print_Bin_Array;
    function Int_To_Bin(Int : in Integer) return BINARY_ARRAY is
    begin
        -- Convert an integer to a binary array
        A := 0;
    end Int_To_Bin;
    function Bin_To_Int(Arr : in BINARY_ARRAY) return Integer is
    begin
        --code 
        A := 0;
    end Bin_To_Int;
    function "+" (Left, Right : in BINARY_ARRAY) return BINARY_ARRAY is
    begin
        A := 0;
        --code 
    end "+";
    function "+" (Left : in INTEGER; Right : in BINARY_ARRAY) return BINARY_ARRAY is
    begin
        A := 0;
        --code 
    end "+";
    function "-" (Left, Right : in BINARY_ARRAY) return BINARY_ARRAY is
    begin
        A := 0;
        --code 
    end "-";
    function "-" (Left : in INTEGER; Right : in BINARY_ARRAY) return BINARY_ARRAY is
    begin
        A := 0;
        --code 
    end "-";


end Assgn;