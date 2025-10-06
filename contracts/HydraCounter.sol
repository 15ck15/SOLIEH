// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title HydraCounter
/// @notice Bounded counter.
/// @custom:kind counter
contract HydraCounter {
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

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }

    /// @notice Returns the maximum uint256 value.
    function maxUint() external pure returns (uint256) {
        return type(uint256).max;
    }

    /// @notice Returns the gas remaining for this call.
    function gasLeftNow() external view returns (uint256) {
        return gasleft();
    }
}
