// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title VertexCounter
/// @notice Bounded counter.
/// @custom:kind counter
contract VertexCounter {
    uint256 public constant LIMIT = 10000;
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

    /// @notice Returns the current chain id.
    function chainId() external view returns (uint256) {
        return block.chainid;
    }

    /// @notice Returns the gas remaining for this call.
    function gasLeftNow() external view returns (uint256) {
        return gasleft();
    }
}
