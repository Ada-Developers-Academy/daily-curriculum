# Bank Accounts


## Breakfast

Create an `Account` class with a minimum of 6 specs. The class should have the following methods:
- `self.new(id, initial_balance)`: creates a new instance with the instance variable `id` and 'initial_balance' assigned
  - Account cannot be created with initialize negative balance
- `#withdraw(amount)`: The input amount gets taken out of the account as result of an ATM transaction.
  - Does not allow the account to go negative
- `#deposit(amount)`: Adds the input amount to the account balance as a result of an ATM transaction.
- `#balance`: Returns the current account balance

Create a `SavingsAccount` class with a minimum of 6 specs. The class should inherit behavior from the `Account` class. It should include updated logic within the following methods:
- `self.new(id, initial_balance)`: creates a new instance with the instance variable `id` and 'initial_balance' assigned
  - The initial balance cannot be less than $10.
- `#withdraw(amount)`: The input amount gets taken out of the account as result of an ATM transaction.
  - Does not allow the account to go below the $10 minimum balance
  - Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance

It should include the following new methods:
- `#add_interest(rate)`: Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance).
  - Input rate is assumed to be a percentage (i.e. 0.25).
  - The formula for calculating interest is `balance * rate/100`
    - Example: If the interest rate is 0.25% and the balance is $10,000, then the interest is $25 and the new balance becomes $10,025.

## Lunch

Create a `CheckingAccount` class with a minimum of 6 specs. The class should inherit behavior from the `Account` class.

- `#withdraw(amount)`: The input amount gets taken out of the account as result of an ATM transaction.
  - Does not allow the account to go negative
  - Each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance
- `#withdraw_using_check(amount)`: The input amount gets taken out of the account as a result of a check withdrawal
  - Allows the account to go into overdraft up to -$10 but not any lower
  - The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
- `#reset_checks`: Resets the number of checks used to zero

## Dinner

Create a `MoneyMarketAccount` class with a minimum of 6 specs. The class should inherit behavior from the `Account` class.
- A maximum of 6 transactions (deposits or withdrawals) are allowed per month on this account type
- `self.new(id, initial_balance)`: creates a new instance with the instance variable `id` and 'initial_balance' assigned
  - The initial balance cannot be less than $10,000.
- `#withdraw(amount)`: The input amount gets taken out of the account as result of an ATM transaction.
  - If a withdrawal causes the balance to go below $10,000, a fee of $100 is imposed and no more transactions are allowed until the balance is increased using a deposit transaction.
  - Each transaction will be counted against the maximum number of transactions
- `#deposit(amount)`
  - Each transaction will be counted against the maximum number of transactions
  - Exception to the above: A deposit performed to reach or exceed the minimum balance of $10,000 is not counted as part of the 6 transactions.
- `#add_interest(rate)`: Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance). Note** This is the same as the `SavingsAccount` interest.
- `#reset_transactions`: Resets the number of transactions to zero
