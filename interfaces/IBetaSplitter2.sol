// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IBetaSplitter2
/// @notice Interface for BetaSplitter2.
interface IBetaSplitter2 {
    function distribute() external;
    function shareA() external view returns (uint256);
}
