#!/usr/bin/env bash
gh release download -R foundry-rs/foundry nightly -p foundry_nightly_linux_amd64.tar.gz
tar -xf foundry_nightly_linux_amd64.tar.gz
rm anvil cast
