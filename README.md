# TDateTimeHelper

A TDateTime helper record for Delphi XE3 and above.

One of the new language features for XE3 and above are record helpers for simple types.

To learn a little bit more, I decided to make a record helper for the TDateTime type. It's a very simple record helper which pretty much calls the existing date time functions that are in the DateUtils unit. One benefit is that it allows you to assign and manipulate datetime values very easily.

Getting Started
---------------
1. Download the DateTimeHelper unit.
2. Add DateTimeHelper unit to your project.
3. Add DateTimeHelper to the `uses` clause in the `implementation` section of your unit.

And that's it! You now should be able to see the additional methods on TDateTime types via CodeInsight in your Delphi IDE.

**_Note:_** The limitation of helper records is that only one helper is active/available per class type. If you have more than one helper for a class type then it is the last one defined in the uses clause that will be active. 


**Example**
```delphi
uses DateTimeHelper;

var
  T1, T2: TDateTime;

begin
  // Set date to 14th September 2012
  T1 := TDateTime.Create(2012, 9, 14);

  // Set date to today's date
  T1 := TDateTime.Today;

  // Set T2 to 1 year, 3 months and 10 days ahead of T1.
  T2 := T1.AddYears(1).AddMonths(3).AddDays(10);

  if T2.IsInLeapYear then
    WriteLn(Format('%d is a leap year', [T2.Year]));
    
  T1 := TDateTime.Create(1995, 2, 14); // Delphi's birthday

  WriteLn(Format('Delphi is %d years old today.', [T1.YearsBetween(Now)]));
  WriteLn('Delphi''s birthday was ' + T1.ToString('dd/mm/yyyy'));
end;
```
An important rule that I have applied in creating this record helper is that TDateTime is a value type and therefore is **immutable**. This means all helper methods will create and **return a new value** and **not change the current value** of the calling TDateTime variable (unless explicitly assigned).

**Example**
```delphi
T1 := TDateTime.Create(2016, 09, 14);

WriteLn(T1.AddYears(2).ToString); // will return 14/09/2018
WriteLn(T1.ToString);             // T1 is unchanged and will still be 14/09/2016.
```

To Do
-----
Need to add unit tests! 


Contribute
----------
I'm open to any new ideas to make this helper record be more consistent in every day use. Please clone the repo and send your pull requests if you would like to add some unit tests, new methods, and any other ideas that would make TDateTimeHelper indispensible.
