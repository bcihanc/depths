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
// Created Date: August 20, 2020

part of depths;

/// provides extensions for Iterable
extension IterableScrewDriver<E> on Iterable<E> {
  /// Returns the index of the last element in the collection.
  int get lastIndex => length > 0 ? length - 1 : 0;

  /// Returns true if the collection only has 1 element.
  bool get hasOnlyOneElement => length == 1;

  /// Returns a random element from [this]. Returns null if no elements
  /// are present.
  E? randomOrNull([Random? random]) {
    if (isEmpty) return null;
    if (length == 1) return first;
    return elementAt((random ?? Random()).nextInt(length));
  }

  /// Returns a random element from [this].
  /// Throws [StateError] if there are no elements in the collection.
  E random([Random? random]) {
    if (isEmpty) throw StateError('no elements');
    if (length == 1) return first;
    return elementAt((random ?? Random()).nextInt(length));
  }
}

/// provides extensions for nullable Iterable
extension NullableIterableScrewDriver<E> on Iterable<E>? {
  /// Returns true if [this] is either null or empty collection
  bool get isNullOrEmpty {
    var iterable = this;
    return iterable == null || iterable.isEmpty;
  }

  /// Returns true if [this] is neither null nor empty collection
  bool get isNotNullOrEmpty {
    var iterable = this;
    return iterable != null && iterable.isNotEmpty;
  }
}
