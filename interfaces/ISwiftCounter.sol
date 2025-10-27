// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISwiftCounter
/// @notice Interface for SwiftCounter.
interface ISwiftCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
