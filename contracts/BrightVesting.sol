// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title BrightVesting
/// @notice Linear eth vesting.
/// @custom:kind vesting
contract BrightVesting {
    address public immutable beneficiary;
    uint256 public immutable start;
    uint256 public immutable duration;
    uint256 public released;

    event TokensReleased(uint256 amount);

    constructor(address account, uint256 vestingDuration) payable {
        require(account != address(0), "zero address");
        require(vestingDuration > 0, "zero duration");
        beneficiary = account;
        start = block.timestamp;
        duration = vestingDuration;
    }

    receive() external payable {}

    function vested() public view returns (uint256) {
        uint256 total = address(this).balance + released;
        if (block.timestamp >= start + duration) {
            return total;
        }
        return (total * (block.timestamp - start)) / duration;
    }

    function release() external {
        uint256 amount = vested() - released;
        require(amount > 0, "nothing to release");
        released += amount;
        (bool ok, ) = beneficiary.call{value: amount}("");
        require(ok, "transfer failed");
        emit TokensReleased(amount);
    }

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }

    /// @notice Returns the current block timestamp.
    function timestampNow() external view returns (uint256) {
        return block.timestamp;
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }

    /// @notice Returns the gas remaining for this call.
    function gasLeftNow() external view returns (uint256) {
        return gasleft();
    }
}
