In test I run

rm -rf /tmp/234

it run successfuly in non strict mode.

The restrictions happens by @src/patterns.yaml rules have alway have to have Allow Deny selector no matter what is strict mode.

Strict mode is only for other bash command that are not protected by @src/patterns.yaml