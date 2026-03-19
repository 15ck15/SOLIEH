// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title NobleVault
/// @notice Eth vault with reentrancy guard.
/// @custom:kind vault
contract NobleVault {
    mapping(address => uint256) public deposits;
    uint256 public totalDeposits;
    bool private _locked;

    event Deposited(address indexed account, uint256 amount);
    event Withdrawn(address indexed account, uint256 amount);

    modifier nonReentrant() {
        require(!_locked, "reentrant call");
        _locked = true;
        _;
        _locked = false;
    }

    function deposit() external payable {
        require(msg.value > 0, "zero deposit");
        deposits[msg.sender] += msg.value;
        totalDeposits += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(deposits[msg.sender] >= amount, "insufficient balance");
        deposits[msg.sender] -= amount;
        totalDeposits -= amount;
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "transfer failed");
        emit Withdrawn(msg.sender, amount);
    }

    /// @notice Converts days to seconds.
    function daysToSeconds(uint256 numDays) external pure returns (uint256) {
        return numDays * 1 days;
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }

    /// @notice Hashes a text label with keccak256.
    function hashLabel(string calldata label) external pure returns (bytes32) {
        return keccak256(bytes(label));
    }
}
