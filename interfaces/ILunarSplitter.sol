// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ILunarSplitter
/// @notice Interface for LunarSplitter.
interface ILunarSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
