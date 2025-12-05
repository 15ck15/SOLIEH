// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICobaltSplitter
/// @notice Interface for CobaltSplitter.
interface ICobaltSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
