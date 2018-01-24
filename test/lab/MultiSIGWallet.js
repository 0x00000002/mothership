const MiniMeTokenFactory = artifacts.require("MiniMeTokenFactory");
const MSP = artifacts.require("MSP");
const MultiSigWallet = artifacts.require('MultiSigWallet');

let miniMeTokenFactory, msp, msig;
let owners;
let amount = 50000000000000000000;

const assertFail = require('./../helpers/assertFail');

contract("MultiSig Wallet ", function(accounts) {

    const addressMothership = accounts[0];
    const addressOwner1 = accounts[1];
    const addressOwner2 = accounts[2];

    beforeEach(async () => {
        miniMeTokenFactory = await MiniMeTokenFactory.new({ from: addressMothership });
        msp = await MSP.new(miniMeTokenFactory.address, { from: addressMothership });
        msig = await MultiSigWallet.new([addressMothership], 1, { from: addressMothership });
    });

    it("should accept tokens through fallback", async() => {
        msig.sendTransaction({value: amount, from: addressMothership});                                                      //TODO: fallback test
        contractBalance =  (await msp.balanceOf.call(msig.address)).toNumber();
        assert.equal(contractBalance,amount);
    });

    it("should get owners", async() => {
        owners = await msig.getOwners();
        assert.equal(owners.length, 1);
        assert.equal(owners[0], addressMothership);
    });

    // it("should add owner", async() => {
    //     console.log("msig address: " + msig.address);
    //     console.log("msig controller: " + this.address);
    //     await msig.addOwner(addressOwner1, {from: msig.address});   // TODO:  addOwner
    //     owners = await msig.getOwners();
    //     console.log("Owners: " + owners.length);
    //     console.log("Owner 0: " + owners[0]);
    //     // assert.equal(owners.length, 2);
    //     // assert.equal(owners[1], addressMothership);
    // });

    it("Should THROW on addOwner()", async () => {
        await assertFail(async () => {
            await msig.contract.addOwner(addressOwner1, {from: addressMothership});
        });
    });

    it("Should THROW on addOwner() which already exist", async () => {
        await assertFail(async () => {
            await msig.contract.addOwner(addressMothership);
        });
    });

    it("Should THROW on removeOwner()", async () => {
        await assertFail(async () => {
            await msig.contract.removeOwner(addressOwner1);
        });
    });

    it("Should THROW on replaceOwner()", async () => {
        await assertFail(async () => {
            await msig.contract.replaceOwner(addressOwner1, addressOwner2);
        });
    });

    it("Should THROW on changeRequirement()", async () => {
        await assertFail(async () => {
            await msig.contract.changeRequirement(0);
        });
    });

});

