// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IIronSplitter
/// @notice Interface for IronSplitter.
interface IIronSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
