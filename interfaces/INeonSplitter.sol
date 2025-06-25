// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INeonSplitter
/// @notice Interface for NeonSplitter.
interface INeonSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
