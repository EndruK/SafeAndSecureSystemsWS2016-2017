package body bank_accounts is
  -- Returns the current Balance from Account.
  -- Pre Check Account
  -- Excistence, valid account_type
  function Get_Balance(Account: Account_Type) return Cents_Type is
  begin
    return Account.Balance;
  end Get_Balance;

  -- Deposits Amount at the given Account.
  procedure Deposit(Account: in out Account_Type; Amount: Cents_Type) is
  begin
    Put("lol"); -- DEBUG
  end Deposit;

  -- Withdraws Amount from the given Account.
  procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) is
  begin
    Put("lol"); -- DEBUG
  end Withdraw;
  procedure Transfer(From: in out Account_Type;
                     To: in out Account_Type;
                     Amount: in Cents_Type) is
  begin
    Put("lol"); -- DEBUG
  end Transfer;
end bank_accounts;
