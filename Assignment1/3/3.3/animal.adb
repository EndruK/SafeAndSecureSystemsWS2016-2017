-- André Karge 110033
-- Kai Gerrit Rüdsdorf 100141
with Ada.Text_IO;
use  Ada.Text_IO;
procedure Animal is
  User_Input : Character;
begin
  loop
    Put("Pick an animal out of ");
    Put("(cat, dog, bird, elephant, giraffe, snake)");
    Put(" and confirm with a "".""");
    New_Line;
    Get(User_Input);
    if User_Input /= '.' then
      Put("Wrong input! Please confirm that you've chosen your animal with a "".""");
    else
      exit;
    end if;
  end loop;
  Put("Is your animal a household animal?(y/n)");
  New_Line;
  Household_Loop:
    loop
    Get(User_Input);
    if User_Input = 'Y' or User_Input = 'y' then
      Put("Does your animal purr?(y/n)");
      New_Line;
      Purr_Loop:
      loop
        Get(User_Input);
        if User_Input = 'Y' or User_Input = 'y' then
          Put("Your animal might be a cat.");
          exit Purr_Loop;
        elsif User_Input = 'N' or User_Input = 'n' then
          Put("Does your animal bark?");
          New_Line;
          Bark_Loop:
          loop
            Get(User_Input);
            if User_Input = 'Y' or User_Input = 'y' then
              Put("Your animal might be a dog.");
              exit Bark_Loop;
            elsif User_Input = 'N' or User_Input = 'n' then
              Put("Your animal might be a bird.");
              exit Bark_Loop;
            end if;
            Put("Wrong input, please type either y or n");
            New_Line;
          end loop Bark_Loop;
          exit Purr_Loop;
        end if;
        Put("Wrong input, please type either y or n");
        New_Line;
      end loop Purr_Loop;
      exit Household_Loop;
    elsif User_Input = 'N' or User_Input = 'n' then
      Put("Does your animal have a long neck?(y/n)");
      New_Line;
      Neck_Loop:
      loop
        Get(User_Input);
        if User_Input = 'Y' or User_Input = 'y' then
          Put("Your animal might be a giraffe.");
          exit Neck_Loop;
        elsif User_Input = 'N' or User_Input = 'n' then
          Put("Does your animal hiss?");
          New_Line;
          Hiss_Loop:
          loop
            Get(User_Input);
            if User_Input = 'Y' or User_Input = 'y' then
              Put("Your animal might be a snake.");
              exit Hiss_Loop;
            elsif User_Input = 'N' or User_Input = 'n' then
              Put("Your animal might be an elephant.");
              exit Hiss_Loop;
            end if;
            Put("Wrong input, please type either y or n");
            New_Line;
          end loop Hiss_Loop;
          exit Neck_Loop;
        end if;
        Put("Wrong input, please type either y or n");
        New_Line;
      end loop Neck_Loop;
      exit Household_Loop;
    end if;
    Put("Wrong input, please type either y or n");
    New_Line;
  end loop Household_Loop;
end Animal;
