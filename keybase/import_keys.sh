#!/bin/bash
keybase login
for user in $(keybase list-following)
do
	keybase pgp pull $user
done

