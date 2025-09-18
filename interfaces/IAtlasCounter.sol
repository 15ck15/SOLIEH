// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IAtlasCounter
/// @notice Interface for AtlasCounter.
interface IAtlasCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
