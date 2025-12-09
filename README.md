# EIP-7702 Library for flutter apps

## Usage - the happy path

```dart
final client = await Eip7702Client.create(
  rpcUrl: 'https://rpc.mychain.lfg/apikey=secretish...',
  delegateAddress: mySmartAccountImpl,
);

final signer = Signer.raw(myPrivateKeyBytes);

final txHash = await client.delegateAndCall(
  signer: signer,
  to: someDappContract,
  data: myCalldata,
);
```
