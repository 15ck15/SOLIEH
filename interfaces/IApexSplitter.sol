// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IApexSplitter
/// @notice Interface for ApexSplitter.
interface IApexSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
