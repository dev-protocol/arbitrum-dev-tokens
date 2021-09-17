// SPDX-License-Identifier: MPL-2.0
pragma solidity =0.8.7;

interface IArbToken {
	/**
	 * @notice should increase token supply by amount, and should (probably) only be callable by the L1 bridge.
	 */
	function bridgeMint(address account, uint256 amount) external;

	/**
	 * @notice should decrease token supply by amount, and should (probably) only be callable by the L1 bridge.
	 */
	function bridgeBurn(address account, uint256 amount) external;

	/**
	 * @return address of layer 1 token
	 */
	function l1Address() external view returns (address);
}
