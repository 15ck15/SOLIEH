// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title NimbusCounter
/// @notice Bounded counter.
/// @custom:kind counter
contract NimbusCounter {
    uint256 public constant LIMIT = 1000;
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

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }
}
