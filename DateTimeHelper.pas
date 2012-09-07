{***************************************************************************}
{                                                                           }
{           DateTimeHelper                                                  }
{                                                                           }
{           Copyright (C) Colin Johnsun                                     }
{                                                                           }
{           https://github.com/colinj                                       }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}

unit DateTimeHelper;

interface

uses
  System.SysUtils, System.Types;

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
    function GetSecond: Word;
    function GetTime: TDateTime;
    function GetYear: Integer;
    class function GetNow: TDateTime; static;
    class function GetToday: TDateTime; static;
    class function GetTomorrow: TDateTime; static;
    class function GetYesterDay: TDateTime; static;
  public
    class function Create(const aYear, aMonth, aDay: Word): TDateTime; overload; static;
    class function Create(const aYear, aMonth, aDay, aHour, aMinute, aSecond,
      aMillisecond: Word): TDateTime; overload; static;

    class property Now: TDateTime read GetNow;
    class property Today: TDateTime read GetToday;
    class property Yesterday: TDateTime read GetYesterDay;
    class property Tomorrow: TDateTime read GetTomorrow;

    property Date: TDateTime read GetDate;
    property Time: TDateTime read GetTime;

    property DayOfWeek: Word read GetDayOfWeek;
    property DayOfYear: Word read GetDayOfYear;

    property Year: Integer read GetYear;
    property Month: Word read GetMonth;
    property Day: Word read GetDay;
    property Hour: Word read GetHour;
    property Minute: Word read GetMinute;
    property Second: Word read GetSecond;
    property Millisecond: Word read GetMillisecond;

    function StartOfYear: TDateTime;
    function EndOfYear: TDateTime;
    function StartOfMonth: TDateTime;
    function EndOfMonth: TDateTime;
    function StartOfWeek: TDateTime;
    function EndOfWeek: TDateTime;
    function StartOfDay: TDateTime;
    function EndOfDay: TDateTime;

    function AddYears(const aNumberOfYears: Integer = 1): TDateTime;
    function AddMonths(const aNumberOfMonths: Integer = 1): TDateTime;
    function AddDays(const aNumberOfDays: Integer = 1): TDateTime;
    function AddHours(const aNumberOfHours: Int64 = 1): TDateTime;
    function AddMinutes(const aNumberOfMinutes: Int64 = 1): TDateTime;
    function AddSeconds(const aNumberOfSeconds: Int64 = 1): TDateTime;
    function AddMilliseconds(const aNumberOfMilliseconds: Int64 = 1): TDateTime;

    function CompareTo(const aDateTime: TDateTime): TValueRelationship;
    function InRange(const aStartDateTime, aEndDateTime: TDateTime; const aInclusive: Boolean = True): Boolean;
    function IsInLeapYear: Boolean;
    function IsToday: Boolean;
    function IsSameDay(const aDateTime: TDateTime): Boolean;
    function IsAM: Boolean;
    function IsPM: Boolean;

    function YearsBetween(const aDateTime: TDateTime): Integer;
    function MonthsBetween(const aDateTime: TDateTime): Integer;
    function WeeksBetween(const aDateTime: TDateTime): Integer;
    function DaysBetween(const aDateTime: TDateTime): Integer;
    function HoursBetween(const aDateTime: TDateTime): Int64;
    function MinutesBetween(const aDateTime: TDateTime): Int64;
    function SecondsBetween(const aDateTime: TDateTime): Int64;
    function MilliSecondsBetween(const aDateTime: TDateTime): Int64;
  end;

implementation

uses
  System.DateUtils;

{ TDateTimeHelper }

function TDateTimeHelper.AddDays(const aNumberOfDays: Integer): TDateTime;
begin
  Result := IncDay(Self, aNumberOfDays);
end;

function TDateTimeHelper.AddHours(const aNumberOfHours: Int64): TDateTime;
begin
  Result := IncHour(Self, aNumberOfHours);
end;

function TDateTimeHelper.AddMilliseconds(const aNumberOfMilliseconds: Int64): TDateTime;
begin
  Result := IncMilliSecond(Self, aNumberOfMilliseconds);
end;

function TDateTimeHelper.AddMinutes(const aNumberOfMinutes: Int64): TDateTime;
begin
  Result := IncMinute(Self, aNumberOfMinutes);
end;

function TDateTimeHelper.AddMonths(const aNumberOfMonths: Integer): TDateTime;
begin
  Result := IncMonth(Self, aNumberOfMonths);
end;

function TDateTimeHelper.AddSeconds(const aNumberOfSeconds: Int64): TDateTime;
begin
  Result := IncSecond(Self, aNumberOfSeconds);
end;

function TDateTimeHelper.AddYears(const aNumberOfYears: Integer): TDateTime;
begin
  Result := IncYear(Self, aNumberOfYears);
end;

function TDateTimeHelper.CompareTo(const aDateTime: TDateTime): TValueRelationship;
begin
  Result := CompareDateTime(Self, aDateTime);
end;

class function TDateTimeHelper.Create(const aYear, aMonth,
  aDay: Word): TDateTime;
begin
  Result := EncodeDate(aYear, aMonth, aDay);
end;

class function TDateTimeHelper.Create(const aYear, aMonth, aDay, aHour, aMinute,
  aSecond, aMillisecond: Word): TDateTime;
begin
  Result := EncodeDateTime(aYear, aMonth, aDay, aHour, aMinute, aSecond, aMillisecond);
end;

function TDateTimeHelper.DaysBetween(const aDateTime: TDateTime): Integer;
begin
  Result := System.DateUtils.DaysBetween(Self, aDateTime);
end;

function TDateTimeHelper.EndOfDay: TDateTime;
begin
  Result := EndOfTheDay(Self);
end;

function TDateTimeHelper.EndOfMonth: TDateTime;
begin
  Result := EndOfTheMonth(Self);
end;

function TDateTimeHelper.EndOfWeek: TDateTime;
begin
  Result := EndOfTheWeek(Self);
end;

function TDateTimeHelper.EndOfYear: TDateTime;
begin
  Result := EndOfTheYear(Self);
end;

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
  Result := System.SysUtils.Now;
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
  Result := System.SysUtils.Date;
end;

class function TDateTimeHelper.GetTomorrow: TDateTime;
begin
  Result := System.SysUtils.Date + 1;
end;

function TDateTimeHelper.GetYear: Integer;
begin
  Result := YearOf(Self);
end;

class function TDateTimeHelper.GetYesterDay: TDateTime;
begin
  Result := System.SysUtils.Date - 1;
end;

function TDateTimeHelper.HoursBetween(const aDateTime: TDateTime): Int64;
begin
  Result := System.DateUtils.HoursBetween(Self, aDateTime);
end;

function TDateTimeHelper.InRange(const aStartDateTime, aEndDateTime: TDateTime; const aInclusive: Boolean): Boolean;
begin
  Result := DateTimeInRange(Self, aStartDateTime, aEndDateTime, aInclusive);
end;

function TDateTimeHelper.IsAM: Boolean;
begin
  Result := System.DateUtils.IsAM(Self);
end;

function TDateTimeHelper.IsInLeapYear: Boolean;
begin
  Result := IsInLeapYear(Self);
end;

function TDateTimeHelper.IsPM: Boolean;
begin
  Result := System.DateUtils.IsPM(Self);
end;

function TDateTimeHelper.IsSameDay(const aDateTime: TDateTime): Boolean;
begin
  Result := System.DateUtils.IsSameDay(Self);
end;

function TDateTimeHelper.IsToday: Boolean;
begin
  Result := System.DateUtils.IsToday(Self);
end;

function TDateTimeHelper.MilliSecondsBetween(const aDateTime: TDateTime): Int64;
begin
  Result := System.DateUtils.MilliSecondsBetween(Self, aDateTime);
end;

function TDateTimeHelper.MinutesBetween(const aDateTime: TDateTime): Int64;
begin
  Result := System.DateUtils.MinutesBetween(Self, aDateTime);
end;

function TDateTimeHelper.MonthsBetween(const aDateTime: TDateTime): Integer;
begin
  Result := System.DateUtils.MonthsBetween(Self, aDateTime);
end;

function TDateTimeHelper.SecondsBetween(const aDateTime: TDateTime): Int64;
begin
  Result := System.DateUtils.SecondsBetween(Self, aDateTime);
end;

function TDateTimeHelper.StartOfDay: TDateTime;
begin
  Result := StartOfTheDay(Self);
end;

function TDateTimeHelper.StartOfMonth: TDateTime;
begin
  Result := StartOfTheMonth(Self);
end;

function TDateTimeHelper.StartOfWeek: TDateTime;
begin
  Result := StartOfTheWeek(Self);
end;

function TDateTimeHelper.StartOfYear: TDateTime;
begin
  Result := StartOfTheYear(Self);
end;

function TDateTimeHelper.WeeksBetween(const aDateTime: TDateTime): Integer;
begin
  Result := System.DateUtils.WeeksBetween(Self, aDateTime);
end;

function TDateTimeHelper.YearsBetween(const aDateTime: TDateTime): Integer;
begin
  Result := System.DateUtils.YearsBetween(Self, aDateTime);
end;

end.
