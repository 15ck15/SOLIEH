// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IAtlasSplitter
/// @notice Interface for AtlasSplitter.
interface IAtlasSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
