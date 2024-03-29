// SPDX-License-Identifier: MPL-2.0
pragma solidity =0.8.7;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "./interface/IArbToken.sol";

/// @title Upgradeable Arbitrum-compliant DEV Token
contract Dev is Initializable, ERC20Upgradeable, IArbToken {
	address public l2Gateway;
	address public override l1Address;

	modifier onlyGateway() {
		require(msg.sender == l2Gateway, "ONLY_l2GATEWAY");
		_;
	}

	/// Standard OZ upgradeable initializer
	function initialize(
		uint256 initialSupply,
		address _l2Gateway,
		address _l1Address
	) public initializer {
		__ERC20_init("Dev", "DEV");
		_mint(_msgSender(), initialSupply);
		l2Gateway = _l2Gateway;
		l1Address = _l1Address;
	}

	/// Mint new DEV tokens
	/// @param account is the address to send the newly minted tokens
	/// @param amount to mint
	function bridgeMint(address account, uint256 amount)
		external
		override
		onlyGateway
	{
		_mint(account, amount);
	}

	/// Burn DEV tokens
	/// @param account is the address to burn the tokens
	/// @param amount to burn
	function bridgeBurn(address account, uint256 amount)
		external
		override
		onlyGateway
	{
		_burn(account, amount);
	}
}
