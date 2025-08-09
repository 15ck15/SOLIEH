// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SwiftCounter
/// @notice Bounded counter.
/// @custom:kind counter
contract SwiftCounter {
    uint256 public constant LIMIT = 100;
    uint256 public count;

    event CountChanged(uint256 newCount);

    function increment() external {
        require(count < LIMIT, "limit reached");
        count += 1;
        emit CountChanged(count);
    }

    function decrement() external {
        require(count > 0, "already zero");
        count -= 1;
        emit CountChanged(count);
    }

    /// @notice Returns the current block timestamp.
    function timestampNow() external view returns (uint256) {
        return block.timestamp;
    }

    /// @notice Returns the maximum uint256 value.
    function maxUint() external pure returns (uint256) {
        return type(uint256).max;
    }
}
