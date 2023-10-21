/*
 *  Copyright (c) 2020, Birju Vachhani
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  1. Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *
 *  2. Redistributions in binary form must reproduce the above copyright notice,
 *     this list of conditions and the following disclaimer in the documentation
 *     and/or other materials provided with the distribution.
 *
 *  3. Neither the name of the copyright holder nor the names of its
 *     contributors may be used to endorse or promote products derived from
 *     this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 */

// Author: Birju Vachhani
// Created Date: August 16, 2020

part of depths;

/// Provides extensions for [DateTime] class.
extension DateTimeScrewdriver on DateTime {
  /// Returns an instance of [DateTime] without time related values.
  /// This is intended to remove hour, minute, second and millisecond
  /// information from [DateTime] instance which leaves only date information.
  /// Example:
  ///     final date = DateTime().now();   // 26-07-2020 16:54:23
  ///     date.dateOnly                    // 26-07-2020
  /// This is helpful in cases where comparison of only dates is required.
  DateTime get dateOnly => DateTime(year, month, day);

  /// Returns Duration difference between [this] and current time
  Duration fromNow() => difference(now());

  /// Returns true if the date of [this] occurs before the date of [other].
  ///
  /// The comparison is independent of whether the time is in UTC or
  /// in the local time zone.
  bool isBeforeDate(DateTime other) => dateOnly.isBefore(other.dateOnly);

  /// Returns true if the date of [this] occurs after the date of [other].
  ///
  /// The comparison is independent of whether the time is in UTC or
  /// in the local time zone.
  bool isAfterDate(DateTime other) => dateOnly.isAfter(other.dateOnly);

  /// Returns true if the date of [this] occurs on the same day as
  /// the date of [other].
  ///
  /// The comparison is independent of whether the time is in UTC or
  /// in the local time zone.
  bool isSameDateAs(DateTime other) => dateOnly.isAtSameMomentAs(other.dateOnly);

  /// Returns true if [this] is same as the date of today.
  /// This doesn't account for time.
  bool get isToday {
    final now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }

  bool get isYesterday => dateOnly == DateTime.now().subtract(1.days).dateOnly;

  /// Returns true if [this] occurs in past
  /// This doesn't account for time.
  bool get isPast => isBefore(DateTime.now());

  /// Returns true if [this] occurs in future
  /// This doesn't account for time.
  bool get isFuture => isAfter(DateTime.now());

  /// Returns true if [this] occurs before [other].
  ///
  /// The comparison is independent of whether the time is in UTC or
  /// in the local time zone.
  bool operator <(DateTime other) => isBefore(other);

  /// Returns true if [this] occurs after [other].
  ///
  /// The comparison is independent of whether the time is in UTC or
  /// in the local time zone.
  bool operator >(DateTime other) => isAfter(other);

  /// Returns true if [this] occurs before or at the same moment as [other].
  ///
  /// The comparison is independent of whether the time is in UTC or
  /// in the local time zone.
  bool operator <=(DateTime other) => isBefore(other) || isAtSameMomentAs(other);

  /// Returns true if [this] occurs after or at the same moment as [other].
  ///
  /// The comparison is independent of whether the time is in UTC or
  /// in the local time zone.
  bool operator >=(DateTime other) => isAfter(other) || isAtSameMomentAs(other);

  /// + operator that Adds [duration] to [this]
  /// e.g.
  ///       DateTime twoDaysAfter = DateTime.now() + 2.days;
  DateTime operator +(Duration duration) => add(duration);

  /// - operator that subtracts [duration] from [this].
  /// e.g.
  ///       DateTime fiveDaysAgo = DateTime.now() - 5.days;
  DateTime operator -(Duration duration) => subtract(duration);

  /// Formats date using [DateFormat] from intl package.
  String format(String pattern) => DateFormat(pattern).format(this);
}

/// shot for [DateTime.now]
DateTime now() => DateTime.now();

/// Returns current date without time information.
DateTime get today => DateTime.now().dateOnly;
