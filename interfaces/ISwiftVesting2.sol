// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISwiftVesting2
/// @notice Interface for SwiftVesting2.
interface ISwiftVesting2 {
    function vested() external view returns (uint256);
    function release() external;
    function released() external view returns (uint256);
}
