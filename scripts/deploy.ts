import { ethers, upgrades } from 'hardhat'

async function main() {
	// !please check!!!!!!!!!
	const decimals = ethers.BigNumber.from(10).pow(18)
	const initialSupply = ethers.BigNumber.from(10).pow(6).mul(decimals) // 10 mil DEV
	const l2gateway = ''
	const l1Address = ''
	// !!!!!!!!!!!!!!!!!!!!!!

	const [deployer] = await ethers.getSigners()
	console.log('Deploying contracts with the account:', deployer.address)
	console.log('Account balance:', (await deployer.getBalance()).toString())

	// We get the contract to deploy
	const Dev = await ethers.getContractFactory('Dev')
	const dev = await upgrades.deployProxy(Dev, [
		initialSupply,
		l2gateway,
		l1Address,
	])

	await dev.deployed()

	console.log('Dev deployed to:', dev.address)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.error(error)
		process.exit(1)
	})
