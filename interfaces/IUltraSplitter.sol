// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IUltraSplitter
/// @notice Interface for UltraSplitter.
interface IUltraSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
