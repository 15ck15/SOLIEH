// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INovaSplitter
/// @notice Interface for NovaSplitter.
interface INovaSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
