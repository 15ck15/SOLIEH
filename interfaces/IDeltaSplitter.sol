// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IDeltaSplitter
/// @notice Interface for DeltaSplitter.
interface IDeltaSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
