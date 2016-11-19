with AUnit.Assertions;
with Vectors;

use AUnit.Assertions;
use Vectors;

package body Vectors_Tests is

    procedure Register_Tests(T : in out Test) is
        use AUnit.Test_Cases.Registration;
    begin -- Register_Tests
        Register_Routine(T, Test_Addition'Access, "Test_Addition");
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

        hehe : constant Vector := (1.0,2.0,3.0);
        huhu : constant Vector := (4.0,5.0,6.0);
        result : Vector;
        Dummy : Natural := 3;
    begin -- Test_Addition
        result := hehe + huhu;
        Assert(result = (5.0,7.0,9.0), "Test_Addition failed.");
    end Test_Addition;

end Vectors_Tests;
