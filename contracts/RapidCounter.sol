// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title RapidCounter
/// @notice Bounded counter.
/// @custom:kind counter
contract RapidCounter {
    uint256 public constant LIMIT = 5000;
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

    /// @notice Returns the smaller of two values.
    function minOf(uint256 a, uint256 b) external pure returns (uint256) {
        return a < b ? a : b;
    }

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }
}
