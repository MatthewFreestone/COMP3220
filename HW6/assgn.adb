with Ada.Numerics.Discrete_Random, Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
package body Assgn is 
    procedure Init_Array(Arr : in out BINARY_ARRAY) is 
        subtype Random_Range is Integer range 0 .. 1;
        package R is new
            Ada.Numerics.Discrete_Random (Random_Range);
        use R;
        G : Generator;
        X : Random_Range;
    begin
        Reset (G);
        for i in 1 .. Arr'Length loop
            X := Random(G);
            Arr(i) := X;
        end loop;
    end Init_Array;

    procedure Reverse_Bin_Arr(Arr : in out BINARY_ARRAY) is
        A : Integer;
    begin
        -- Reverse the order of the elements in an array
        -- for i in 1 .. Arr'Length / 2 loop
        --     Arr(i) := Arr(i) xor Arr(Arr'Length - i + 1);
        --     Arr(Arr'Length - i + 1) := Arr(i) xor Arr(Arr'Length - i + 1);
        --     Arr(i) := Arr(i) xor Arr(Arr'Length - i + 1);
        -- end loop;
        A := 0;
    end Reverse_Bin_Arr;

    procedure Print_Bin_Arr(Arr : in BINARY_ARRAY) is
    begin
        for i in 1 .. Arr'Length loop
            Put(Integer'Image(Arr(i)));
        end loop;
        New_Line;
    end Print_Bin_Arr;

    function Int_To_Bin(Num : in Integer) return BINARY_ARRAY is
        B : BINARY_ARRAY := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    begin
        return B;
        -- Convert an integer to a binary array
    end Int_To_Bin;
    function Bin_To_Int(Arr : in BINARY_ARRAY) return Integer is
    begin
        return 0;
    end Bin_To_Int;
    function "+" (Left, Right : in BINARY_ARRAY) return BINARY_ARRAY is
        B : BINARY_ARRAY := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    begin
        return B;
    end "+";
    function "+" (Left : in INTEGER; Right : in BINARY_ARRAY) return BINARY_ARRAY is
        B : BINARY_ARRAY := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    begin
        return B;
        --code 
    end "+";
    function "-" (Left, Right : in BINARY_ARRAY) return BINARY_ARRAY is
        B : BINARY_ARRAY := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    begin
        return B;
        --code 
    end "-";
    function "-" (Left : in INTEGER; Right : in BINARY_ARRAY) return BINARY_ARRAY is
        B : BINARY_ARRAY := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    begin
        return B;
        --code 
    end "-";


end Assgn;