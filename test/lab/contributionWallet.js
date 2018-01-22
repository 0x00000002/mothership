const MiniMeTokenFactory = artifacts.require("MiniMeTokenFactory");
const MSP = artifacts.require("MSP");
const Contribution = artifacts.require("Contribution");
const MultiSigWallet = artifacts.require('MultiSigWallet');
const ContributionWallet = artifacts.require('ContributionWallet');

let miniMeTokenFactory, msp, msig, contribution, cWallet;
let amount = 50000000000000000000;

contract("Contribution Wallet", function(accounts) {

    const addressMothership = accounts[0];
    const addressCommunity = accounts[1];

    beforeEach(async () => {
        const endBlock = 1040000;
        miniMeTokenFactory = await MiniMeTokenFactory.new({ from: addressMothership });
        msp = await MSP.new(miniMeTokenFactory.address, { from: addressMothership });
        contribution = await Contribution.new();
        msig = await MultiSigWallet.new([addressMothership], 1);
        cWallet = await ContributionWallet.new(msig.address, endBlock, contribution.address);
    });

    it("Withdraw", async () => {
        thisContract = cWallet;
        await msp.generateTokens(thisContract.address, amount);
        contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
        assert.equal(contractBalance, amount);

        await thisContract.withdraw({from: msig.address});  // TODO: how to unlock account?
    });

});

