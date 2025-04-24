// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IHyperSplitter
/// @notice Interface for HyperSplitter.
interface IHyperSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
