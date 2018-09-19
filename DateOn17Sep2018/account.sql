CREATE TABLE AccountAudit 
(AccountID INT IDENTITY(1,1) PRIMARY KEY,
LastTransactionDate DATETIME
)


CREATE TABLE AccountBalance
(
Balance MONEY,
AsOnBalance MONEY,
AccountId INT FOREIGN KEY REFERENCES AccountAudit(AccountId)
)


CREATE TABLE TransactionDetail
(
TransactionType VARCHAR(50),
TransactionAmount MONEY,
Withdraw DATE,
Deposit DATE,
AccountId INT FOREIGN KEY REFERENCES AccountAudit(AccountId)
) 


CREATE PROCEDURE Proc_Account
(
@AccountID INT,
@TransactionType VARCHAR(50),
@TransactionAmount MONEY
)
AS
DECLARE @ClosingBalance int =0;
DECLARE @OpeningBalance int =0;
DECLARE @LastTransaction date;
BEGIN
BEGIN TRANSACTION;
select @LastTransaction=max( LastTransaction) from AccountAudit where AccountID=@AccountID;
select @OpeningBalance =balance from AccountBalance where AccountID=@AccountID and AsOnBalance=@LastTransaction;
if (upper(@TransactionType)='DEBIT')
set @ClosingBalance = @OpeningBalance-@TransactionAmount
else 
set @ClosingBalance = @OpeningBalance-@TransactionAmount

  insert into TransactionDetail values (@AccountID,@TransactionType,@TransactionAmount,@OpeningBalance,@ClosingBalance)
  insert into AccountBalance values (@AccountID,@ClosingBalance,GETDATE())
  update AccountAudit set LastTransaction=GETDATE() where AccountID=@AccountID;

  commit transaction;
  end;

 exec  2,'credit',1000

