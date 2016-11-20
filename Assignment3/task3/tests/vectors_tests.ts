context with Vectors; use Vectors;
        with Ada.Text_IO; use Ada.Text_IO;

code Ada.Text_IO.Put_Line("Begin testing: ");

***** Test Addition
define  Vector_1 : constant Vector := (1.0, 2.0, 3.0);
        Vector_2 : constant Vector := (4.0, 5.0, 6.0);
        Vector_Result : Vector;
test    Vector_Result := Vector_1 + Vector_2;
pass    Vector_Result = (5.0, 7.0, 9.0)

***** Test Addition with negative
define  Vector_1 : constant Vector := (-5.0, -2.0, -6.0);
        Vector_2 : constant Vector := (-3.0, -8.0, -10.0);
        Vector_Result : Vector;
test    Vector_Result := Vector_1 + Vector_2;
pass    Vector_Result = (-8.0, -10.0, -16.0)

***** Test Subtraction
define  Vector_Left : constant Vector := (1.0, 2.0, 3.0);
        Vector_Right : constant Vector := (4.0, 5.0, 6.0);
        Vector_Result : Vector;
test    Vector_Result := Vector_Left - Vector_Right;
pass    Vector_Result = (-3.0, -3.0, -3.0)

***** Test Subtraction with positive
define  Vector_Left : constant Vector := (5.0, 2.0, 2.0);
        Vector_Right : Vector := (5.0, 2.0, 2.0);
test    Vector_Right := Vector_Left - Vector_Right;
pass    Vector_Right = (0.0, 0.0, 0.0)

***** Test Multipl Vec Float
define  Vector_A : constant Vector := (5.0, 2.0, 2.0);
        Vector_Result : Vector;
        Multiplicator : constant Float := 2.0;
test    Vector_Result := Vector_A * Multiplicator;
pass    Vector_Result = (10.0, 4.0, 4.0)

***** Test Multipl Vec Vec
define  Vector_A : constant Vector := (5.0, 2.0, 2.0);
        Vector_B : constant Vector := (2.0, 2.0, 2.0);
        Result : Float;
test    Result := Vector_A * Vector_B;
pass    Result = 18.0

***** Test Compare
define  Vector_A : constant Vector := (5.0, 2.0, 2.0);
        Vector_B : constant Vector := (5.0, 2.0, 2.0);
        Result : Boolean := False;
test    Result := Vector_A = Vector_B;
pass    Result

***** Test Orthogonal
define  Vector_A : constant Vector := (1.0, 0.0, 0.0);
        Vector_B : constant Vector := (0.0, 1.0, 0.0);
        Result : Boolean := False;
test    Result := Are_Orthogonal(Vector_A, Vector_B);
pass    Result

***** Test not Orthogonal
define  Vector_A : constant Vector := (1.0, 0.0, 0.0);
        Vector_B : constant Vector := (1.0, 1.0, 0.0);
        Result : Boolean := False;
test    Result := Are_Orthogonal(Vector_A, Vector_B);
pass    not Result

***** Test Cross Product
define  Vector_A : constant Vector := (1.0, 2.0, 3.0);
        Vector_B : constant Vector := (4.0, 5.0, 6.0);
        Vector_C : Vector;
test    Vector_C := Cross_Product(Vector_A, Vector_B);
pass    Vector_C = (-3.0, 6.0, -3.0)

***** Test Distance
define  Vector_A : constant Vector := (3.0, 2.0, 2.0);
        Vector_B : constant Vector := (2.0, 2.0, 2.0);
        Result : Float;
test    Result := Distance(Vector_A, Vector_B);
pass    Result = 1.0

***** Test Distance To Origin
define  Vector_A : constant Vector := (1.0, 0.0, 0.0);
        Result : Float;
test    Result := Distance_To_Origin(Vector_A);
pass    Result = 1.0

***** Test Distance To Origin 2
define  Vector_A : constant Vector := (1.0, 8.0, 3.0);
        Result : Float;
test    Result := Distance_To_Origin(Vector_A);
pass    8.60232 - Result < 0.00001

code Ada.Text_IO.Put_Line("End testing");
