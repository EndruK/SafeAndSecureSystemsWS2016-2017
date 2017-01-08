context with Parallel_Algorithms;
        with Ada.Assertions; use Ada.Assertions;
        with Ada.Text_IO; use Ada.Text_IO;
define  Epsilon : constant Float := 0.00001;

code Ada.Text_IO.Put_Line("Begin testing: ");

***** Init Result with 0
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                      "+" => "+");
        Result : constant Integer := 0;
test    null;
pass    Result = 0

***** Init Tasks with 0
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                      "+" => "+");
        My_Array_Access : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type'(1,2,3,4,5,6);
        Tasks  : constant Integer := 0;
test    null;
pass    Tasks = 0

***** Init Tasks with 2
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                      "+" => "+");
        My_Array_Access : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type'(1,2,3,4,5,6);
        Tasks  : constant Integer := 2;
test    null;
pass    Tasks = 2

***** Init Array with 2 Elements Int
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                      "+" => "+");
        My_Array_Access : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type'(1,2);
test    null;
pass    My_Array_Access'Length = 2
            and My_Array_Access(0) = 1
            and My_Array_Access(1) = 2

***** Init Array with 2 Elements Float
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Float,
                                                      "+" => "+");
        My_Array_Access : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type'(1.2, 2.1);
test    null;
pass    My_Array_Access'Length = 2
            and My_Array_Access(0) - 1.2 < Epsilon
            and My_Array_Access(1) - 2.1 < Epsilon

***** Calc Sum 6 Elements Int
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                      "+" => "+");
        My_Array : My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type(1..6);
        Result : Integer;
        Tasks  : constant Integer := 2;
prepare for I in 1..6 loop
            My_Array(I) := I;
        end loop;
test    My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
pass    Result = 21

***** Calc Sum 6 Elements Float
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Float,
                                                      "+" => "+");
        My_Array : My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type(1..6);
        Result : Float;
        Tasks  : constant Integer := 2;
prepare for I in 1..6 loop
            My_Array(I) := Float(I) + 0.3;
        end loop;
test    My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
pass    Result - 22.8 < Epsilon

***** Calc Sum 100 Elements Int
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                      "+" => "+");
        My_Array : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type(1..100);
        Result : Integer;
        Tasks : constant Integer := 2;
prepare for I in 1..100 loop
            My_Array(I) := 1;
        end loop;
test    My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
pass    Result = 100

***** Calc Sum 100 Elements Float
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Float,
                                                      "+" => "+");
        My_Array : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type(1..100);
        Result : Float;
        Tasks : constant Integer := 2;
prepare for I in 1..100 loop
            My_Array(I) := 1.1;
        end loop;
test    My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
pass    Result - 110.0 < Epsilon

***** Calc Sum 100 Elements Int 100 Tasks
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                      "+" => "+");
        My_Array : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type(1..100);
        Result : Integer;
        Tasks : constant Integer := 100;
prepare for I in 1..100 loop
            My_Array(I) := 1;
        end loop;
test    My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
pass    Result = 100

***** Calc Sum 100 Elements Float
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Float,
                                                      "+" => "+");
        My_Array : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type(1..100);
        Result : Float;
        Tasks : constant Integer := 100;
prepare for I in 1..100 loop
            My_Array(I) := 1.1;
        end loop;
test    My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
pass    Result - 110.0 < Epsilon

***** Calc Sum 10000 Elements Int 100 Tasks
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                      "+" => "+");
        My_Array : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type(1..10000);
        Result : Integer;
        Tasks : constant Integer := 100;
prepare for I in 1..10000 loop
            My_Array(I) := 50;
        end loop;
test    My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
pass    Result = 500000

***** Calc Sum Int'Last/2 Elements Int 100 Tasks (long process)
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                      "+" => "+");
        My_Array : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type(1..Integer'Last/2);
        Result : Integer;
        Tasks : constant Integer := 100;
prepare for I in 1..Integer'Last/2 loop
            My_Array(I) := 1;
        end loop;
test    My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
pass    Result = Integer'Last/2

***** Calc Sum negative int 100 tasks
define  package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                      "+" => "+");
        My_Array : constant My_Par_Alg.Array_Access_Type :=
            new My_Par_Alg.Array_Type(1..500);
        Result : Integer;
        Tasks : constant Integer := 100;
prepare for I in 1..500 loop
            My_Array(I) := -30;
        end loop;
test    My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
pass    Result = -15000
