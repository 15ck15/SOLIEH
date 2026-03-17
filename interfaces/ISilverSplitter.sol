// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISilverSplitter
/// @notice Interface for SilverSplitter.
interface ISilverSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
