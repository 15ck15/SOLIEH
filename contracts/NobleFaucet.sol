// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title NobleFaucet
/// @notice Testnet faucet with cooldown.
/// @custom:kind faucet
contract NobleFaucet {
    address public owner;
    uint256 public dripAmount;
    uint256 public cooldown;
    mapping(address => uint256) public lastDrip;

    event Dripped(address indexed to, uint256 amount);
    event Funded(address indexed from, uint256 amount);

    constructor(uint256 amount, uint256 waitTime) {
        owner = msg.sender;
        dripAmount = amount;
        cooldown = waitTime;
    }

    receive() external payable {
        emit Funded(msg.sender, msg.value);
    }

    function drip() external {
        require(
            lastDrip[msg.sender] == 0 || block.timestamp >= lastDrip[msg.sender] + cooldown,
            "cooldown active"
        );
        require(address(this).balance >= dripAmount, "faucet empty");
        lastDrip[msg.sender] = block.timestamp;
        (bool ok, ) = msg.sender.call{value: dripAmount}("");
        require(ok, "transfer failed");
        emit Dripped(msg.sender, dripAmount);
    }

    function setDripAmount(uint256 amount) external {
        require(msg.sender == owner, "not owner");
        dripAmount = amount;
    }

    /// @notice Returns the smaller of two values.
    function minOf(uint256 a, uint256 b) external pure returns (uint256) {
        return a < b ? a : b;
    }

    /// @notice Returns the current chain id.
    function chainId() external view returns (uint256) {
        return block.chainid;
    }

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }

    /// @notice Returns the maximum uint256 value.
    function maxUint() external pure returns (uint256) {
        return type(uint256).max;
    }

    /// @notice Hashes a text label with keccak256.
    function hashLabel(string calldata label) external pure returns (bytes32) {
        return keccak256(bytes(label));
    }

    /// @notice Returns the contract name.
    function contractName() external pure returns (string memory) {
        return "NobleFaucet";
    }

    /// @notice Returns the gas remaining for this call.
    function gasLeftNow() external view returns (uint256) {
        return gasleft();
    }
}
