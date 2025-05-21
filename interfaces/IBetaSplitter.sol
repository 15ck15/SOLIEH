// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IBetaSplitter
/// @notice Interface for BetaSplitter.
interface IBetaSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
