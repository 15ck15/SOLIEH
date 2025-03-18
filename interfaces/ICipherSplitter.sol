// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICipherSplitter
/// @notice Interface for CipherSplitter.
interface ICipherSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
