unit uDateTimeHelper;

interface

uses
  SysUtils, Classes;

type
  TDateTimeHelper = record helper for TDateTime
  private
    function GetDay: Word;
    function GetDate: TDateTime;
    function GetDayOfWeek: Word;
    function GetDayOfYear: Word;
    function GetHour: Word;
    function GetMillisecond: Word;
    function GetMinute: Word;
    function GetMonth: Word;
    class function GetNow: TDateTime; static;
    function GetSecond: Word;
    function GetTime: TDateTime;
    class function GetToday: TDateTime; static;
    function GetYear: Integer;
  public
    class property Now: TDateTime read GetNow;
    class property Today: TDateTime read GetToday;

    property Date: TDateTime read GetDate;
    property Time: TDateTime read GetTime;

    property DayOfWeek: Word read GetDayOfWeek;
    property DayOfYear: Word read GetDayOfYear;

    // Pick-a-field
    property Year: Integer read GetYear;
    property Month: Word read GetMonth;
    property Day: Word read GetDay;
    property Hour: Word read GetHour;
    property Minute: Word read GetMinute;
    property Second: Word read GetSecond;
    property Millisecond: Word read GetMillisecond;

    // Start/End functions
    function StartOfYear: TDateTime;
    function EndOfYear: TDateTime;
    function StartOfMonth: TDateTime;
    function EndOfMonth: TDateTime;
    function StartOfTheWeek: TDateTime;
    function EndOfTheWeek: TDateTime;
    function StartOfDay: TDateTime;
    function EndOfDay: TDateTime;

    // Increment/decrement datetimes
    function AddYears(const aNumberOfYears: Integer): TDateTime;
    function AddMonths(const aNumberOfMonths: Integer): TDateTime;
    function AddDays(const aNumberOfDays: Integer): TDateTime;
    function AddHours(const aNumberOfHours: Int64): TDateTime;
    function AddMinutes(const aNumberOfMinutes: Int64): TDateTime;
    function AddSeconds(const aNumberOfSeconds: Int64): TDateTime;
    function AddMilliseconds(const aNumberOfMilliseconds: Int64): TDateTime;

    // Datetime comparisons
    function CompareTo(const aDateTime: TDateTime): Integer;
    
  end;

implementation

uses
  DateUtils;

{ TDateTimeHelper }

function TDateTimeHelper.GetDate: TDateTime;
begin
  Result := DateOf(Self);
end;

function TDateTimeHelper.GetDay: Word;
begin
  Result := DayOf(Self);
end;

function TDateTimeHelper.GetDayOfWeek: Word;
begin
  Result := DayOfTheWeek(Self);
end;

function TDateTimeHelper.GetDayOfYear: Word;
begin
  Result := DayOfTheYear(Self);
end;

function TDateTimeHelper.GetHour: Word;
begin
  Result := HourOf(Self);
end;

function TDateTimeHelper.GetMillisecond: Word;
begin
  Result := MilliSecondOf(Self);
end;

function TDateTimeHelper.GetMinute: Word;
begin
  Result := MinuteOf(Self);
end;

function TDateTimeHelper.GetMonth: Word;
begin
  Result := MonthOf(Self);
end;

class function TDateTimeHelper.GetNow: TDateTime;
begin
  Result := SysUtils.Now;
end;

function TDateTimeHelper.GetSecond: Word;
begin
  Result := SecondOf(Self);
end;

function TDateTimeHelper.GetTime: TDateTime;
begin
  Result := TimeOf(Self);
end;

class function TDateTimeHelper.GetToday: TDateTime;
begin
  Result := SysUtils.Date;
end;

function TDateTimeHelper.GetYear: Integer;
begin
  Result := YearOf(Self);
end;

end.
