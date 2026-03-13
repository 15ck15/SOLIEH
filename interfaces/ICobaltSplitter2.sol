// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICobaltSplitter2
/// @notice Interface for CobaltSplitter2.
interface ICobaltSplitter2 {
    function distribute() external;
    function shareA() external view returns (uint256);
}
