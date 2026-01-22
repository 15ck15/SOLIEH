// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IKrakenSplitter
/// @notice Interface for KrakenSplitter.
interface IKrakenSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
