// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IStormSplitter
/// @notice Interface for StormSplitter.
interface IStormSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
