import 'dart:typed_data';

import 'package:eip7702/eip7702.dart';
import 'package:wallet/wallet.dart';
import 'package:web3dart/web3dart.dart';

// STEPS:
// cd example
// export PRIV_KEY = "0x-privatekey-with-some-testnet-eth"
// dart --define=PRIV_KEY=$PRIV_KEY example.dart --chain-stack-traces

void main() async {
  final rpcUrl = "https://0xrpc.io/sep";
  final privateKeyHex = String.fromEnvironment('PRIV_KEY');
  final implContract = EthereumAddress.fromHex(
    "0x0eacC2307f0113F26840dD1dAc8DC586259994Dd", // BatchExecutor
  );

  final privateKey = EthPrivateKey.fromHex(privateKeyHex);
  final authSigner = Signer.eth(privateKey);

  final eip7702Client = await Eip7702Client.create(
    rpcUrl: rpcUrl,
    delegateAddress: implContract,
  );

  final txHash = await eip7702Client.delegateAndCall(
    signer: authSigner,
    to: EthereumAddress(Uint8List(20)), // zero address
  );

  print(txHash);
}
