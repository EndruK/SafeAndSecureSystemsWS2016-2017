pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__run_tests.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__run_tests.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E162 : Short_Integer; pragma Import (Ada, E162, "system__os_lib_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__soft_links_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exception_table_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "ada__io_exceptions_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "ada__numerics_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings__maps_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__strings__maps__constants_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "ada__tags_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "ada__streams_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "interfaces__c_E");
   E028 : Short_Integer; pragma Import (Ada, E028, "system__exceptions_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "system__file_control_block_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "system__file_io_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "system__finalization_root_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "ada__finalization_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__storage_pools_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__finalization_masters_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "ada__calendar_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "system__object_reader_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "system__dwarf_lines_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__pool_global_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__secondary_stack_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__traceback__symbolic_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "ada__text_io_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "ada_containers__aunit_lists_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "aunit_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "aunit__memory_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "aunit__memory__utils_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "aunit__tests_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "aunit__test_filters_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "aunit__time_measure_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "aunit__test_results_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "aunit__assertions_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "aunit__reporter_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "aunit__reporter__text_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "aunit__simple_test_cases_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "aunit__test_cases_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "aunit__test_suites_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "aunit__run_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "test_suite_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "vectors_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "vectors_tests_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E152 := E152 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "vectors_tests__finalize_spec");
      begin
         F1;
      end;
      E148 := E148 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "aunit__test_suites__finalize_spec");
      begin
         F2;
      end;
      E190 := E190 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "aunit__test_cases__finalize_spec");
      begin
         F3;
      end;
      E100 := E100 - 1;
      E102 := E102 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "aunit__simple_test_cases__finalize_spec");
      begin
         F4;
      end;
      E138 := E138 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "aunit__reporter__text__finalize_spec");
      begin
         F5;
      end;
      E104 := E104 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "aunit__assertions__finalize_spec");
      begin
         F6;
      end;
      E111 := E111 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "aunit__test_results__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "aunit__test_filters__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "aunit__tests__finalize_spec");
      begin
         E118 := E118 - 1;
         F9;
      end;
      E158 := E158 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "ada__text_io__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__file_io__finalize_body");
      begin
         E160 := E160 - 1;
         F11;
      end;
      E120 := E120 - 1;
      E129 := E129 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__pool_global__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__finalization_masters__finalize_spec");
      begin
         F13;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E026 := E026 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E091 := E091 + 1;
      Ada.Numerics'Elab_Spec;
      E183 := E183 + 1;
      Ada.Strings'Elab_Spec;
      E054 := E054 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E060 := E060 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E090 := E090 + 1;
      Interfaces.C'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E028 := E028 + 1;
      System.File_Control_Block'Elab_Spec;
      E165 := E165 + 1;
      System.Finalization_Root'Elab_Spec;
      E125 := E125 + 1;
      Ada.Finalization'Elab_Spec;
      E123 := E123 + 1;
      System.Storage_Pools'Elab_Spec;
      E127 := E127 + 1;
      System.Finalization_Masters'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E115 := E115 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      System.Pool_Global'Elab_Spec;
      E129 := E129 + 1;
      System.Finalization_Masters'Elab_Body;
      E120 := E120 + 1;
      System.File_Io'Elab_Body;
      E160 := E160 + 1;
      E044 := E044 + 1;
      Ada.Tags'Elab_Body;
      E093 := E093 + 1;
      E056 := E056 + 1;
      System.Soft_Links'Elab_Body;
      E018 := E018 + 1;
      System.Os_Lib'Elab_Body;
      E162 := E162 + 1;
      System.Secondary_Stack'Elab_Body;
      E022 := E022 + 1;
      E049 := E049 + 1;
      E068 := E068 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E039 := E039 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E158 := E158 + 1;
      E008 := E008 + 1;
      E005 := E005 + 1;
      E109 := E109 + 1;
      E107 := E107 + 1;
      Aunit.Tests'Elab_Spec;
      E118 := E118 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Time_Measure'Elab_Spec;
      E113 := E113 + 1;
      Aunit.Test_Results'Elab_Spec;
      E111 := E111 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E104 := E104 + 1;
      Aunit.Reporter'Elab_Spec;
      E012 := E012 + 1;
      Aunit.Reporter.Text'Elab_Spec;
      E138 := E138 + 1;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E102 := E102 + 1;
      E100 := E100 + 1;
      Aunit.Test_Cases'Elab_Spec;
      E190 := E190 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E148 := E148 + 1;
      E146 := E146 + 1;
      E154 := E154 + 1;
      Vectors_Tests'Elab_Spec;
      E152 := E152 + 1;
      Test_Suite'Elab_Body;
      E150 := E150 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_run_tests");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/andre/Programming/ada/Assignment3/task3/bin/run_tests.o
   --   /home/andre/Programming/ada/Assignment3/task3/bin/vectors.o
   --   /home/andre/Programming/ada/Assignment3/task3/bin/vectors_tests.o
   --   /home/andre/Programming/ada/Assignment3/task3/bin/test_suite.o
   --   -L/home/andre/Programming/ada/Assignment3/task3/bin/
   --   -L/home/andre/Programming/ada/Assignment3/task3/bin/
   --   -L/opt/gnat/lib/aunit/
   --   -L/opt/gnat/lib/gcc/x86_64-pc-linux-gnu/4.9.4/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
