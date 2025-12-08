// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IFalconSplitter
/// @notice Interface for FalconSplitter.
interface IFalconSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
