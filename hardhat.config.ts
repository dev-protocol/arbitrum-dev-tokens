/**
 * @type import('hardhat/config').HardhatUserConfig
 */
import '@typechain/hardhat'
import '@nomiclabs/hardhat-ethers'
import '@nomiclabs/hardhat-waffle'

import { config } from 'dotenv'

const envs = config().parsed ?? {}

module.exports = {
	solidity: '0.8.7',
	networks: {
		rinkeby: {
		  url: envs.DEPLOY_NODE_URL,
		  accounts: { mnemonic: envs.DEPLOY_MNEMONIC },
		}
	}
}
