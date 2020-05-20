unit TDateTimeHelper.Tests;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TDateTimeHelperTestObject = class(TObject)
  private
    FActual: TDateTime;
    FExpected: TDateTime;
  public
    [Setup]
    procedure Setup;
    [Test]
    procedure DateTime_Create;
    [Test]
    procedure DateTime_Date;
    [Test]
    procedure DateTime_DayOfWeek;
    [Test]
    procedure DateTime_DayOfYear;
    [Test]
    procedure DateTime_Year;
    [Test]
    procedure DateTime_Hour;
    [Test]
    procedure DateTime_Minute;
    [Test]
    procedure DateTime_Second;
    [Test]
    procedure DateTime_Millisecond;
    [Test]
    procedure DateTime_StartOfYear;
    [Test]
    procedure DateTime_EndOfYear;
    [Test]
    procedure DateTime_StartOfMonth;
    [Test]
    procedure DateTime_EndOfMonth;
    [Test]
    procedure DateTime_StartOfWeek;
    [Test]
    procedure DateTime_EndOfWeek;
    [Test]
    procedure DateTime_StartOfDay;
    [Test]
    procedure DateTime_EndOfDay;
    [Test]
    procedure UnixTime_Get;
    [Test]
    procedure UnixTime_Set;
    [Test]
    procedure TotalSecouns_Get;
    [Test]
    procedure TotalSecouns_Set;
  end;

implementation

uses
  System.SysUtils, System.DateUtils, DateTimeHelper;

const
  YEAR_VAL = 1995;
  MONTH_VAL = 2;
  DAY_VAL = 14;
  HOUR_VAL = 10;
  MIN_VAL = 25;
  SEC_VAL = 15;
  MSEC_VAL = 120;

{ TDateTimeHelperTestObject }

procedure TDateTimeHelperTestObject.Setup;
begin
  FActual := TDateTime.Create(YEAR_VAL, MONTH_VAL, DAY_VAL, HOUR_VAL, MIN_VAL,
    SEC_VAL, MSEC_VAL);
  FExpected := EncodeDateTime(YEAR_VAL, MONTH_VAL, DAY_VAL, HOUR_VAL, MIN_VAL,
    SEC_VAL, MSEC_VAL);
end;

procedure TDateTimeHelperTestObject.TotalSecouns_Get;
begin
  Assert.AreEqual(SecondsBetween(FExpected, 0), FActual.TotalSecounds);
end;

procedure TDateTimeHelperTestObject.TotalSecouns_Set;
var
  Available, Expected: TDateTime;
begin
// FExpected has millis acuracy and can not compare to Available (secounds acuracy)
  Expected := StrToDate('01/01/2020');

  Available.TotalSecounds := SecondsBetween(Expected, 0);
  Assert.AreEqual(Expected, Available);
end;

procedure TDateTimeHelperTestObject.UnixTime_Get;
begin
  Assert.AreEqual(DateTimeToUnix(FExpected), FActual.UnixTime);
end;

procedure TDateTimeHelperTestObject.UnixTime_Set;
var
  UnixValue: Int64;
  Available: TDateTime;
begin
  UnixValue := DateTimeToUnix(FExpected);
  Available.UnixTime := UnixValue;
  Assert.AreEqual(UnixToDateTime(UnixValue), Available);
end;

procedure TDateTimeHelperTestObject.DateTime_Create;
begin
  Assert.AreEqual(FExpected, FActual);
end;

procedure TDateTimeHelperTestObject.DateTime_Date;
begin
  Assert.AreEqual(DateOf(FExpected), FActual.Date);
end;

procedure TDateTimeHelperTestObject.DateTime_DayOfWeek;
begin
  Assert.AreEqual(DayOfTheWeek(FExpected), FActual.DayOfWeek);
end;

procedure TDateTimeHelperTestObject.DateTime_DayOfYear;
begin
  Assert.AreEqual(DayOfTheYear(FExpected), FActual.DayOfYear);
end;

procedure TDateTimeHelperTestObject.DateTime_Year;
begin
  Assert.AreEqual(YearOf(FExpected), FActual.Year);
end;

procedure TDateTimeHelperTestObject.DateTime_Hour;
begin
  Assert.AreEqual(HourOf(FExpected), FActual.Hour);
end;

procedure TDateTimeHelperTestObject.DateTime_Minute;
begin
  Assert.AreEqual(MinuteOf(FExpected), FActual.Minute);
end;

procedure TDateTimeHelperTestObject.DateTime_Second;
begin
  Assert.AreEqual(SecondOf(FExpected), FActual.Second);
end;

procedure TDateTimeHelperTestObject.DateTime_Millisecond;
begin
  Assert.AreEqual(MilliSecondOf(FExpected), FActual.Millisecond);
end;

procedure TDateTimeHelperTestObject.DateTime_StartOfYear;
begin
  Assert.AreEqual(StartOfTheYear(FExpected), FActual.StartOfYear);
end;

procedure TDateTimeHelperTestObject.DateTime_EndOfYear;
begin
  Assert.AreEqual(EndOfTheYear(FExpected), FActual.EndOfYear);
end;

procedure TDateTimeHelperTestObject.DateTime_StartOfMonth;
begin
  Assert.AreEqual(StartOfTheMonth(FExpected), FActual.StartOfMonth);
end;

procedure TDateTimeHelperTestObject.DateTime_EndOfMonth;
begin
  Assert.AreEqual(EndOfTheMonth(FExpected), FActual.EndOfMonth);
end;

procedure TDateTimeHelperTestObject.DateTime_StartOfWeek;
begin
  Assert.AreEqual(StartOfTheWeek(FExpected), FActual.StartOfWeek);
end;

procedure TDateTimeHelperTestObject.DateTime_EndOfWeek;
begin
  Assert.AreEqual(EndOfTheWeek(FExpected), FActual.EndOfWeek);
end;

procedure TDateTimeHelperTestObject.DateTime_StartOfDay;
begin
  Assert.AreEqual(StartOfTheDay(FExpected), FActual.StartOfDay);
end;

procedure TDateTimeHelperTestObject.DateTime_EndOfDay;
begin
  Assert.AreEqual(EndOfTheDay(FExpected), FActual.EndOfDay);
end;

initialization
  TDUnitX.RegisterTestFixture(TDateTimeHelperTestObject);

end.

