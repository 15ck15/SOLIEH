// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IMetaCounter
/// @notice Interface for MetaCounter.
interface IMetaCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
