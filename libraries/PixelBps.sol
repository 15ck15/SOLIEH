// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title PixelBps
/// @notice Reusable helper functions.
library PixelBps {
    uint256 internal constant DENOMINATOR = 10_000;

    function mulBps(uint256 amount, uint256 bps) internal pure returns (uint256) {
        return (amount * bps) / DENOMINATOR;
    }

    function feeOf(uint256 amount, uint256 bps) internal pure returns (uint256 fee, uint256 net) {
        fee = mulBps(amount, bps);
        net = amount - fee;
    }
}
