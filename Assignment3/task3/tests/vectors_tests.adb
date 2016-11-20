with AUnit.Assertions;
with Vectors;

use AUnit.Assertions;
use Vectors;

package body Vectors_Tests is

    procedure Register_Tests(T : in out Test) is
        use AUnit.Test_Cases.Registration;
    begin -- Register_Tests
        Register_Routine(T, Test_Addition'Access, "Test_Addition");
        Register_Routine(T, Test_Addition_With_Negative'Access, "Test_Addition_With_Negative");
        Register_Routine(T, Test_Subtraction'Access, "Test_Subtraction");
        Register_Routine(T, Test_Subtraction_With_Positive'Access, "Test_Subtraction_With_Positive");
        Register_Routine(T, Test_Multiplikation_Vec_Float'Access, "Test_Multiplikation_Vec_Float");
        Register_Routine(T, Test_Multiplikation_Vec_Vec'Access, "Test_Multiplikation_Vec_Vec");
        Register_Routine(T, Test_Compare'Access, "Test_Compare");
        Register_Routine(T, Test_Are_Orthogonal'Access, "Test_Are_Orthogonal");
        Register_Routine(T, Test_Are_Not_Orthogonal'Access, "Test_Are_Not_Orthogonal");
        Register_Routine(T, Test_Cross_Product'Access, "Test_Cross_Product");
        Register_Routine(T, Test_Distance'Access, "Test_Distance");
        Register_Routine(T, Test_Distance_To_Origin'Access, "Test_Distance_To_Origin");
        Register_Routine(T, Test_Distance_To_Origin_Two'Access, "Test_Distance_To_Origin_Two");

    end Register_Tests;

--------------------------------------------------------------------------------

    function Name(T : Test) return Test_String is
        pragma Unreferenced(T);
    begin -- Name
        return Format("Vectors_Tests");
    end Name;

--------------------------------------------------------------------------------

    procedure Test_Addition(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_Left : constant Vector := (1.0, 2.0, 3.0);
        Vector_Right : constant Vector := (4.0, 5.0, 6.0);
        Result : Vector;
    begin
        Result := Vector_Left + Vector_Right;
        Assert(Result = (5.0,7.0,9.0), "Test_Addition failed.");
    end Test_Addition;

--------------------------------------------------------------------------------

    procedure Test_Addition_With_Negative(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_Left : constant Vector := (-5.0, -2.0, -2.0);
        Vector_Right : Vector := (-5.0, -1.0, -2.0);
    begin
        Vector_Right := Vector_Left + Vector_Right;
        Assert(Vector_Right = (-10.0, -3.0, -4.0), "Test_Addition_With_Negative failed.");
    end Test_Addition_With_Negative;

--------------------------------------------------------------------------------

    procedure Test_Subtraction(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_Left : constant Vector := (1.0, 2.0, 3.0);
        Vector_Right : constant Vector := (4.0, 5.0, 6.0);
        Result : Vector;
    begin
        Result := Vector_Left - Vector_Right;
        Assert(Result = (-3.0,-3.0,-3.0), "Test_Subtraction failed.");
    end Test_Subtraction;

--------------------------------------------------------------------------------

    procedure Test_Subtraction_With_Positive(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_Left : constant Vector := (5.0, 2.0, 2.0);
        Vector_Right : Vector := (5.0, 2.0, 2.0);
    begin
        Vector_Right := Vector_Left - Vector_Right;
        Assert(Vector_Right = (0.0, 0.0, 0.0), "Test_Subtraction_With_Positive failed.");
    end Test_Subtraction_With_Positive;

--------------------------------------------------------------------------------

    procedure Test_Multiplikation_Vec_Float(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_A : constant Vector := (5.0, 2.0, 2.0);
        Vector_Result : Vector;
        Multiplicator : constant Float := 2.0;
    begin
        Vector_Result := Vector_A * Multiplicator;
        Assert(Vector_Result = (10.0, 4.0, 4.0), "Test_Multiplikation_Vec_Float failed.");
    end Test_Multiplikation_Vec_Float;

--------------------------------------------------------------------------------

    procedure Test_Multiplikation_Vec_Vec(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_A : constant Vector := (5.0, 2.0, 2.0);
        Vector_B : constant Vector := (2.0, 2.0, 2.0);
        Result : Float;
    begin
        Result := Vector_A * Vector_B;
        Assert(Result = 18.0, "Test_Multiplikation_Vec_Vec failed.");
    end Test_Multiplikation_Vec_Vec;

--------------------------------------------------------------------------------

    procedure Test_Compare(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_A : constant Vector := (5.0, 2.0, 2.0);
        Vector_B : constant Vector := (5.0, 2.0, 2.0);
        Result : Boolean := False;
    begin
        Result := Vector_A = Vector_B;
        Assert(Result, "Test_Compare failed.");
    end Test_Compare;

--------------------------------------------------------------------------------

    procedure Test_Are_Orthogonal(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_A : constant Vector := (1.0, 0.0, 0.0);
        Vector_B : constant Vector := (0.0, 1.0, 0.0);
    begin
        Assert(Are_Orthogonal(Vector_A, Vector_B), "Test_Are_Orthogonal failed.");
    end Test_Are_Orthogonal;

--------------------------------------------------------------------------------

    procedure Test_Are_Not_Orthogonal(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_A : constant Vector := (1.0, 0.0, 0.0);
        Vector_B : constant Vector := (1.0, 1.0, 0.0);
    begin
        Assert(not Are_Orthogonal(Vector_A, Vector_B), "Test_Are_Not_Orthogonal failed.");
    end Test_Are_Not_Orthogonal;

--------------------------------------------------------------------------------

    procedure Test_Cross_Product(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_A : constant Vector := (1.0, 2.0, 3.0);
        Vector_B : constant Vector := (4.0, 5.0, 6.0);
        Vector_C : Vector;
    begin
        Vector_C := Cross_Product(Vector_A, Vector_B);
        Assert(Vector_C = (-3.0, 6.0, -3.0), "Test_Cross_Product failed.");
    end Test_Cross_Product;

--------------------------------------------------------------------------------

    procedure Test_Distance(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_A : constant Vector := (3.0, 2.0, 2.0);
        Vector_B : constant Vector := (2.0, 2.0, 2.0);
        Result : Float;
    begin
        Result := Distance(Vector_A, Vector_B);
        Assert(Result = 1.0, "Test_Distance failed.");
    end Test_Distance;

--------------------------------------------------------------------------------

    procedure Test_Distance_To_Origin(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_A : constant Vector := (1.0, 0.0, 0.0);
    begin
        Assert(Distance_To_Origin(Vector_A) = 1.0, "Test_Distance_To_Origin failed.");
    end Test_Distance_To_Origin;

--------------------------------------------------------------------------------

    procedure Test_Distance_To_Origin_Two(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        Vector_A : constant Vector := (1.0, 8.0, 3.0);
        Result : Float;
    begin -- Test_Distance_To_Origin_Two
        Result := Distance_To_Origin(Vector_A);
        Assert(8.60232 - Result < 0.00001, "Test_Distance_To_Origin_Two failed.");
    end Test_Distance_To_Origin_Two;

end Vectors_Tests;
