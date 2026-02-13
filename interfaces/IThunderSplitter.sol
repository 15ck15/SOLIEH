// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IThunderSplitter
/// @notice Interface for ThunderSplitter.
interface IThunderSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
