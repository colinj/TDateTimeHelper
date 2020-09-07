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
    procedure DateTime_Create_Unixtime;
    [Test]
    procedure DateTime_Create_TotalSecounds;
    [Test]
    procedure DateTime_Create_AsString;
    [Test]
    procedure DateTime_Create_AsLocalString;
    [Test]
    procedure DateTime_Create_AsLocalString2;
    [Test]
    procedure DateTime_TotalSecounds;
    [Test]
    procedure DateTime_UnixTime;
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

procedure TDateTimeHelperTestObject.DateTime_Create_Unixtime;
var
  FExpected, FActual:TDateTime;
  Utime:Int64;
begin
  FExpected := EncodeDateTime(YEAR_VAL, MONTH_VAL, DAY_VAL, HOUR_VAL, MIN_VAL,
    SEC_VAL, 0);
  Utime:= DateTimeToUnix(FExpected);
  FActual := TDateTime.CreateUnixTime(Utime);
  Assert.AreEqual(FExpected, FActual);
end;

procedure TDateTimeHelperTestObject.DateTime_Create_AsString;
var
  FExpected, FActual:TDateTime;
begin
  FExpected := EncodeDateTime(YEAR_VAL, MONTH_VAL, DAY_VAL, HOUR_VAL, MIN_VAL,
    SEC_VAL, 0);

  FActual := TDateTime.Create('02/14/1995 10:25:15','MM/dd/yyyy hh:mm:ss');
  Assert.AreEqual(FExpected, FActual);
end;

procedure TDateTimeHelperTestObject.DateTime_Create_TotalSecounds;
var
  FExpected, FActual:TDateTime;
  TotalSecounds:Int64;
begin
  FExpected := EncodeDateTime(YEAR_VAL, MONTH_VAL, DAY_VAL, HOUR_VAL, MIN_VAL,
    SEC_VAL, 0);
  TotalSecounds := SecondsBetween(FExpected, 0);

  FActual := TDateTime.CreateTotalSeconds(TotalSecounds);
  Assert.AreEqual(FExpected, FActual);
end;

procedure TDateTimeHelperTestObject.DateTime_Create_AsLocalString;
var
  FExpected, FActual:TDateTime;
begin
  FExpected := EncodeDateTime(YEAR_VAL, MONTH_VAL, DAY_VAL, HOUR_VAL, MIN_VAL,
    SEC_VAL, 0);

  FActual := TDateTime.CreateLocal('02/14/1995 10:25:15','en-US');
  Assert.AreEqual(FExpected, FActual);
end;

procedure TDateTimeHelperTestObject.DateTime_Create_AsLocalString2;
var
  FExpected, FActual:TDateTime;
begin
  FExpected := EncodeDateTime(YEAR_VAL, MONTH_VAL, DAY_VAL, HOUR_VAL, MIN_VAL,
    SEC_VAL, 0);

  FActual := TDateTime.CreateLocal('14/02/1995 10:25:15','en-GB');
  Assert.AreEqual(FExpected, FActual);
end;

procedure TDateTimeHelperTestObject.DateTime_TotalSecounds;
var
  Expected, Actual:Int64;
begin
  Expected:= SecondsBetween(FExpected, 0);
  Actual := FActual.TotalSeconds;
  Assert.AreEqual(Expected, Actual);
end;

procedure TDateTimeHelperTestObject.DateTime_UnixTime;
var
  Expected, Actual:Int64;
begin
  Expected:= DateTimeToUnix(FExpected);
  Actual := FActual.UnixTime;
  Assert.AreEqual(Expected, Actual);
end;

initialization
  TDUnitX.RegisterTestFixture(TDateTimeHelperTestObject);

end.

