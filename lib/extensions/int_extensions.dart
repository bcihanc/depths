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
// Created Date: August 17, 2020

part of depths;

/// Provides extensions for [int].
extension IntScrewdriver<T> on int {
  /// Returns [Duration] equal to [this] no. of minutes
  Duration get minutes => Duration(minutes: this);

  /// Returns [Duration] equal to [this] no. of seconds
  Duration get seconds => Duration(seconds: this);

  /// Returns [Duration] equal to [this] no. of milliseconds
  Duration get milliseconds => Duration(milliseconds: this);

  Duration get days => Duration(days: this);

  /// Returns no. of digits
  /// e.g.  3.length   // returns 1
  ///      21.length   // returns 2
  ///     541.length  // returns 3
  int get length => toString().length;

  /// Returns list of digits of [this]
  /// e.g   12345.digits    // returns [1, 2, 3, 4, 5]
  /// e.g   8564.digits    // returns [8, 5, 6, 4]
  List<int> get digits => toString().split('').map(int.parse).toList();

  /// Returns true for non-zero values just like C language.
  /// e.g
  ///       1.asBool      // returns true
  ///       0.asBool      // returns false
  ///     452.asBool      // returns true
  bool get asBool => this != 0;

  /// Returns [int] as string which has a zero appended as prefix if [this]
  /// is a single digit value.
  String twoDigits() => this < 10 ? '0$this' : toString();

  Future<void> get secondsWait async => await Future.delayed(Duration(milliseconds: this));
}

/// Generates a non-negative random integer uniformly distributed in the range
/// rom 0, inclusive, to [max], exclusive.
/// default [max] is 1_000_000
int randomInt({int? max}) => Random().nextInt(max ?? 1000000);
