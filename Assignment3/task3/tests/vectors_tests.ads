with AUnit;
with AUnit.Test_Cases;

use AUnit;
use AUnit.Test_Cases;

package Vectors_Tests is

    type Test is new Test_Case with null record;

    procedure Register_Tests(T : in out Test);
    function Name(T : Test) return Test_String;

    procedure Test_Addition(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Addition_Overflow_One(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Addition_Overflow_Two(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Addition_With_Negative(T : in out Test_Cases.Test_Case'Class);

    procedure Test_Subtraction(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Subtraction_Overflow_One(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Subtraction_Overflow_Two(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Subtraction_With_Positive(T : in out Test_Cases.Test_Case'Class);

    procedure Test_Multiplikation_Vec_Float(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Multiplikation_Vec_Float_Overflow(T : in out Test_Cases.Test_Case'Class);

    procedure Test_Multiplikation_Vec_Vec(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Multiplikation_Vec_Vec_Overflow(T : in out Test_Cases.Test_Case'Class);

    procedure Test_Assign(T : in out Test_Cases.Test_Case'Class);

    procedure Test_Are_Orthogonal(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Are_Not_Orthogonal(T : in out Test_Cases.Test_Case'Class);

    procedure Test_Cross_Product(T : in out Test_Cases.Test_Case'Class);

    procedure Test_Distance(T : in out Test_Cases.Test_Case'Class);

    procedure Test_Distance_To_Origin(T : in out Test_Cases.Test_Case'Class);

end Vectors_Tests;
