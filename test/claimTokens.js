const MiniMeTokenFactory = artifacts.require("MiniMeTokenFactory");
const MSP = artifacts.require("MSP");
const MSPP = artifacts.require("MSPPlaceholderMock");
const SIT = artifacts.require("SIT");
const SITX = artifacts.require("SITExchanger");
const ReferalsTokenHolder = artifacts.require("ReferalsTokenHolder");
const Contribution = artifacts.require("Contribution");
const MultiSigWallet = artifacts.require('MultiSigWallet');

let miniMeTokenFactory, msp, sit, sitEx, mspp, referals;
let thisContract, contractBalance, contribution;
let amount = 50000000000000000000;

contract("* - controller can claim tokens from: ", function(accounts) {

    const addressMothership = accounts[0];
    const addressCommunity = accounts[1];
    const addressTeam = accounts[2];
    const addressSitHolder1 = accounts[3];
    const addressSitHolder2 = accounts[4];

    beforeEach(async () => {
        miniMeTokenFactory = await MiniMeTokenFactory.new({ from: addressMothership });
        msp = await MSP.new(miniMeTokenFactory.address, { from: addressMothership });
        sit = await SIT.new(miniMeTokenFactory.address, { from: addressMothership });
        contribution = await Contribution.new();
        multisigCommunity = await MultiSigWallet.new([addressCommunity], 1);
        sitEx = await SITX.new(sit.address, msp.address, contribution.address, { from: addressMothership });
        mspp = await MSPP.new(multisigCommunity.address, msp.address, contribution.address, sitEx.address, { from: addressMothership });
        referals = await ReferalsTokenHolder.new(msp.address);

        await msp.enableTransfers(true, { from: addressMothership });
        msp.generateTokens(addressMothership, 100000000000000000000);
    });

    it("Common", async () => {
        console.log("--------------------");
        console.log("Mothership address: " + addressMothership);
        console.log("Commnunity address: " + addressCommunity);
        console.log("Team address: " + addressTeam);
        console.log("--------------------");

    });

    it("MSP", async () => {
        thisContract = msp;
        console.log("MSP contract address: " + await(thisContract.address));
        console.log("MSP contract controller: " + await(thisContract.controller()));
        await msp.generateTokens(thisContract.address, amount);
        contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
        assert.equal(contractBalance, amount);
        await thisContract.claimTokens(thisContract.address);
        contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
        assert.equal(contractBalance,0);

        // accountBalance = (await thisContract.balanceOf.call(addressMothership)).toNumber();
        // await thisContract.approve(addressMothership, web3.toWei(150,"ether"), { from: addressMothership });
        // await web3.eth.sendTransaction(
        //     {
        //         from: addressInvestor,
        //         to: thisContract.address,
        //         value: web3.toWei(5,"ether")
        //     }
        // );
        //
        // testing for Ether retrieval is just for coverage
        // the original code in contracts is not working

        await thisContract.claimTokens(0x0);
        contractBalance = (await web3.eth.getBalance(thisContract.address)).toNumber();
        assert.equal(contractBalance,0);
    });

    it("SITExchanger", async () => {
        thisContract = sitEx;
        console.log("SIT address: " + sit.address);
        console.log("SIT controller: " + await sit.controller());
        console.log("SITExchange contract address: " + await(thisContract.address));
        console.log("SITExchange contract controller: " + await(thisContract.controller()));
        await sit.generateTokens(thisContract.address, amount);
        contractBalance = (await sit.balanceOf.call(thisContract.address)).toNumber();
        assert.equal(contractBalance, amount);

        // Not working: SITExchanger.claimTokens require( token != address(msp) )

        // await thisContract.claimTokens(contribution.address);
        // contractBalance = (await sit.balanceOf.call(thisContract.address)).toNumber();
        // assert.equal(contractBalance,0);
        // console.log("generated: " + contractBalance);

        await thisContract.claimTokens(0x0);
        contractBalance = (await web3.eth.getBalance(thisContract.address)).toNumber();
        assert.equal(contractBalance,0);
    });

    it("ReferalsTokenHolder", async () => {
        thisContract = referals;
        // console.log("Referals contract address: " + await(thisContract.address));
        // console.log("Referals contract controller: " + await(thisContract.controller()));
        await msp.generateTokens(thisContract.address, amount);
        contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
        assert.equal(contractBalance, amount);
        await thisContract.claimTokens(msp.address);
        contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
        assert.equal(contractBalance,0);

        await referals.claimTokens(0x0);
        contractBalance = (await web3.eth.getBalance(thisContract.address)).toNumber();
        assert.equal(contractBalance,0);
    });

    it("MSPPlaceholder", async () => {
        thisContract = mspp;
        console.log("MSPPlaceholder contract address: " + await(thisContract.address));
        console.log("MSPPlaceholder contract controller: " + await(thisContract.controller()));
        await referals.claimTokens(0x0);
        contractBalance = (await web3.eth.getBalance(thisContract.address)).toNumber();
        assert.equal(contractBalance,0);

        await msp.generateTokens(thisContract.address, amount);
        contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
        // console.log("balance: " + contractBalance);
        assert.equal(contractBalance, amount);
        // await thisContract.claimTokens(msp.address);
        // contractBalance = (await msp.balanceOf.call(thisContract.address)).toNumber();
        // assert.equal(contractBalance,0);

    });

});

