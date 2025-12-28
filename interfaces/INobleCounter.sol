// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INobleCounter
/// @notice Interface for NobleCounter.
interface INobleCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
