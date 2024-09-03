@echo off

pushd %~dp0

echo ================
echo Installing cert for the SudoVDA driver...

certutil -addstore -f root "code_signing.crt"
certutil -addstore -f TrustedPublisher "code_signing.crt"

echo ================
echo Removing the old driver... It's OK to show an error if you're installing the driver for the first time.

nefconc.exe --remove-device-node --hardware-id root\sudomaker\sudovda --class-guid "4D36E968-E325-11CE-BFC1-08002BE10318"

echo ================
echo Installing the new driver...

nefconc.exe --create-device-node --class-name Display --class-guid "4D36E968-E325-11CE-BFC1-08002BE10318" --hardware-id root\sudomaker\sudovda
nefconc.exe --install-driver --inf-path "SudoVDA.inf"

echo ================
echo Done!

popd