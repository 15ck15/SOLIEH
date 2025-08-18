// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IKrakenCounter
/// @notice Interface for KrakenCounter.
interface IKrakenCounter {
    function count() external view returns (uint256);
    function increment() external;
    function decrement() external;
}
