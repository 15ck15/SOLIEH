// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISableSplitter
/// @notice Interface for SableSplitter.
interface ISableSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
