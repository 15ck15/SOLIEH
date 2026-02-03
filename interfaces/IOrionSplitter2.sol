// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IOrionSplitter2
/// @notice Interface for OrionSplitter2.
interface IOrionSplitter2 {
    function distribute() external;
    function shareA() external view returns (uint256);
}
