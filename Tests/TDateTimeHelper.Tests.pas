unit TDateTimeHelper.Tests;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TDateTimeHelperTestObject = class(TObject) 
  public
    [Test]
    procedure Test1;
  end;

implementation

uses
  System.SysUtils;
  DateTimeHelper;

{ TDateTimeHelperTestObject }

procedure TDateTimeHelperTestObject.Test1;
var
  Expected: TDateTime;
  Actual: TDateTime;
begin
  Expected := EncodeDate(1995, 2, 14);

  Actual := TDateTime.Create(1995, 2, 14);

  Assert.AreEqual(Expected, Actual);
end;

initialization
  TDUnitX.RegisterTestFixture(TDateTimeHelperTestObject);
end.
