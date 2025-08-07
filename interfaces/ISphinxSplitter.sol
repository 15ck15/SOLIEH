// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISphinxSplitter
/// @notice Interface for SphinxSplitter.
interface ISphinxSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
