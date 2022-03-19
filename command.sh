Windows PowerShell
版权所有 (C) Microsoft Corporation。保留所有权利。

尝试新的跨平台 PowerShell https://aka.ms/pscore6

PS C:\WINDOWS\system32> .\OpenSSH\ssh.exe -p 22 root@192.168.198.129
The authenticity of host '192.168.198.129 (192.168.198.129)' can't be established.
ECDSA key fingerprint is SHA256:cbysHRjpskrKAxw5c+5plB9y7Qxpz1rq2pO4xih7pJs.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.198.129' (ECDSA) to the list of known hosts.
root@192.168.198.129's password:
Last login: Sun Mar 20 00:30:52 2022 from 192.168.198.1
[root@localhost ~]# uname -a
Linux localhost.localdomain 3.10.0-957.el7.x86_64 #1 SMP Thu Nov 8 23:39:32 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
[root@localhost ~]# uname -r
3.10.0-957.el7.x86_64
[root@localhost ~]# cat /etc/redhat-release
CentOS Linux release 7.6.1810 (Core)
[root@localhost ~]# uptime
 04:50:27 up  4:24,  2 users,  load average: 0.00, 0.01, 0.05
[root@localhost ~]# hostname
localhost.localdomain
[root@localhost ~]# hostname -l
hostname: invalid option -- 'l'
Usage: hostname [-b] {hostname|-F file}         set host name (from file)
       hostname [-a|-A|-d|-f|-i|-I|-s|-y]       display formatted name
       hostname                                 display host name

       {yp,nis,}domainname {nisdomain|-F file}  set NIS domain name (from file)
       {yp,nis,}domainname                      display NIS domain name

       dnsdomainname                            display dns domain name

       hostname -V|--version|-h|--help          print info and exit

Program name:
       {yp,nis,}domainname=hostname -y
       dnsdomainname=hostname -d

Program options:
    -a, --alias            alias names
    -A, --all-fqdns        all long host names (FQDNs)
    -b, --boot             set default hostname if none available
    -d, --domain           DNS domain name
    -f, --fqdn, --long     long host name (FQDN)
    -F, --file             read host name or NIS domain name from given file
    -i, --ip-address       addresses for the host name
    -I, --all-ip-addresses all addresses for the host
    -s, --short            short host name
    -y, --yp, --nis        NIS/YP domain name

Description:
   This command can get or set the host name or the NIS domain name. You can
   also get the DNS domain or the FQDN (fully qualified domain name).
   Unless you are using bind or NIS for host lookups you can change the
   FQDN (Fully Qualified Domain Name) and the DNS domain name (which is
   part of the FQDN) in the /etc/hosts file.
[root@localhost ~]# last reboot
reboot   system boot  3.10.0-957.el7.x Sun Mar 20 00:26 - 04:52  (04:26)
reboot   system boot  3.10.0-957.el7.x Tue Mar 15 23:10 - 04:52 (4+05:42)
reboot   system boot  3.10.0-957.el7.x Tue Mar 15 22:58 - 23:10  (00:11)

wtmp begins Tue Mar 15 22:58:16 2022
[root@localhost ~]# date
Sun Mar 20 04:54:02 CST 2022
[root@localhost ~]# cal
     March 2022
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31

[root@localhost ~]# w
 04:54:12 up  4:27,  2 users,  load average: 0.00, 0.01, 0.05
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/0    192.168.198.1    00:30    7:56   0.18s  0.18s -bash
root     pts/1    192.168.198.1    04:46    4.00s  0.04s  0.02s w
[root@localhost ~]# whoami
root
[root@localhost ~]#

[system information]

--------------------------------------------------------------------------------
[root@localhost ~]# id
uid=0(root) gid=0(root) groups=0(root) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
[root@localhost ~]# last
root     pts/1        192.168.198.1    Sun Mar 20 04:46   still logged in
root     pts/0        192.168.198.1    Sun Mar 20 00:30   still logged in
reboot   system boot  3.10.0-957.el7.x Sun Mar 20 00:26 - 05:03  (04:37)
root     pts/0        192.168.198.1    Tue Mar 15 23:11 - crash (4+01:15)
root     tty1                          Tue Mar 15 23:10 - crash (4+01:15)
reboot   system boot  3.10.0-957.el7.x Tue Mar 15 23:10 - 05:03 (4+05:53)
root     pts/0        192.168.198.1    Tue Mar 15 23:08 - down   (00:01)
root     tty1                          Tue Mar 15 23:00 - 23:10  (00:09)
reboot   system boot  3.10.0-957.el7.x Tue Mar 15 22:58 - 23:10  (00:11)

wtmp begins Tue Mar 15 22:58:16 2022
[root@localhost ~]# who
root     pts/0        2022-03-20 00:30 (192.168.198.1)
root     pts/1        2022-03-20 04:46 (192.168.198.1)

[users information and management]

--------------------------------------------------------------------------------

Unix - Shell Basic Operators

There are various operators supported by each shell.
Our tutorial is based on default shell (Bourne) so we are going to cover all the important Bourne Shell operators in the tutorial.

There are following operators which we are going to discuss −

Arithmetic Operators.

Relational Operators.

Boolean Operators.

String Operators.

File Test Operators.

The Bourne shell didn't originally have any mechanism to perform simple arithmetic but it uses external programs,
either awk or the must simpler program expr.

Here is simple example to add two numbers −

#!/bin/sh
val=`expr 2 + 2`
echo "Total value : $val"

This would produce following result −

Total value : 4

There are following points to note down −

There must be spaces between operators and expressions for example 2+2 is not correct,
where as it should be written as 2 + 2.

Complete expression should be enclosed between ``, called inverted commas.

Arithmetic Operators

There are following arithmetic operators supported by Bourne Shell.

Assume variable a holds 10 and variable b holds 20 then −

Operator    Description                                                                         Example
+           Addition - Adds values on either side of the operator                               `expr $a + $b` will give 30
-           Subtraction - Subtracts right hand operand from left hand operand                   `expr $a - $b` will give -10
*           Multiplication - Multiplies values on either side of the operator                   `expr $a \* $b` will give 200
/           Division - Divides left hand operand by right hand operand                          `expr $b / $a` will give 2
%           Modulus - Divides left hand operand by right hand operand and returns remainder     `expr $b % $a` will give 0
=           Assignment - Assign right operand in left operand                                   a=$b would assign value of b into a
==          Equality - Compares two numbers, if both are same then returns true.                [ $a == $b ] would return false.
!=          Not Equality - Compares two numbers, if both are different then returns true.       [ $a != $b ] would return true.

It is very important to note here that all the conditional expressions would be put inside square braces with one spaces around them,
for example [ $a == $b ] is correct where as [$a==$b] is incorrect.

All the arithmetical calculations are done using long integers.

Relational Operators:

Bourne Shell supports following relational operators which are specific to numeric values.
These operators would not work for string values unless their value is numeric.

For example, following operators would work to check a relation between 10 and 20 as well as in between "10" and "20" but not in between "ten" and "twenty".

Assume variable a holds 10 and variable b holds 20 then −

Operator    Description                                                                                                                           Example
-eq         Checks if the value of two operands are equal or not, if yes then condition becomes true.                                             [ $a -eq $b ] is not true.
-ne         Checks if the value of two operands are equal or not, if values are not equal then condition becomes true.                            [ $a -ne $b ] is true.
-gt         Checks if the value of left operand is greater than the value of right operand, if yes then condition becomes true.                   [ $a -gt $b ] is not true.
-lt         Checks if the value of left operand is less than the value of right operand, if yes then condition becomes true.                      [ $a -lt $b ] is true.
-ge         Checks if the value of left operand is greater than or equal to the value of right operand, if yes then condition becomes true.       [ $a -ge $b ] is not true.
-le         Checks if the value of left operand is less than or equal to the value of right operand, if yes then condition becomes true.          [ $a -le $b ] is true.

It is very important to note here that all the conditional expressions would be put inside square braces with one spaces around them,
for example [ $a <= $b ] is correct where as [$a <= $b] is incorrect.

Boolean Operators

There are following boolean operators supported by Bourne Shell.

Assume variable a holds 10 and variable b holds 20 then −

Operator    Description                                                                                                       Example
!           This is logical negation. This inverts a true condition into false and vice versa.                                [ ! false ] is true.
-o          This is logical OR. If one of the operands is true then condition would be true.                                  [ $a -lt 20 -o $b -gt 100 ] is true.
-a          This is logical AND. If both the operands are true then condition would be true otherwise it would be false.      [ $a -lt 20 -a $b -gt 100 ] is false.

String Operators

There are following string operators supported by Bourne Shell.

Assume variable a holds "abc" and variable b holds "efg" then −

Operator    Description                                                                                                      Example
=           Checks if the value of two operands are equal or not, if yes then condition becomes true.                        [ $a = $b ] is not true.
!=          Checks if the value of two operands are equal or not, if values are not equal then condition becomes true.       [ $a != $b ] is true.
-z          Checks if the given string operand size is zero. If it is zero length then it returns true.                      [ -z $a ] is not true.
-n          Checks if the given string operand size is non-zero. If it is non-zero length then it returns true.              [ -n $a ] is not false.
str         Check if str is not the empty string. If it is empty then it returns false.                                      [ $a ] is not false.

File Test Operators

There are following operators to test various properties associated with a Unix file.

Assume a variable file holds an existing file name "test" whose size is 100 bytes and has read, write and execute permission on −

Operator    Description                                                                                                      Example
-b file     Checks if file is a block special file if yes then condition becomes true.                                       [ -b $file ] is false.
-c file     Checks if file is a character special file if yes then condition becomes true.                                   [ -c $file ] is false.
-d file     Check if file is a directory if yes then condition becomes true.                                                 [ -d $file ] is not true.
-f file     Check if file is an ordinary file as opposed to a directory or special file if yes then condition becomes true.  [ -f $file ] is true.
-g file     Checks if file has its set group ID (SGID) bit set if yes then condition becomes true.                           [ -g $file ] is false.
-k file     Checks if file has its sticky bit set if yes then condition becomes true.                                        [ -k $file ] is false.
-p file     Checks if file is a named pipe if yes then condition becomes true.                                               [ -p $file ] is false.
-t file     Checks if file descriptor is open and associated with a terminal if yes then condition becomes true.             [ -t $file ] is false.
-u file     Checks if file has its set user id (SUID) bit set if yes then condition becomes true.                            [ -u $file ] is false.
-r file     Checks if file is readable if yes then condition becomes true.                                                   [ -r $file ] is true.
-w file     Check if file is writable if yes then condition becomes true.                                                    [ -w $file ] is true.
-x file     Check if file is execute if yes then condition becomes true.                                                     [ -x $file ] is true.
-s file     Check if file has size greater than 0 if yes then condition becomes true.                                        [ -s $file ] is true.
-e file     Check if file exists. Is true even if file is a directory but exists.                                            [ -e $file ] is true.

C Shell Operators

Operators are listed in order of decreasing precedence −

Arithmatic and Logical Operators

Operator    Description
( )         Change precedence
~           1's complement
!           Logical negation
*           Multiply
/           Divide
%           Modulo
+           Add
-           Subtract
<<          Left shift
>>          Right shift
==          String comparison for equality
!=          String comparison for non equality
=~          Pattern matching
&           Bitwise "and"
^           Bitwise "exclusive or"
|           Bitwise "inclusive or"
&&          Logical "and"
||          Logical "or"
++          Increment
--          Decrement
=           Assignment
*=          Multiply left side by right side and update left side
/=          Divide left side by right side and update left side
+=          Add left side to right side and update left side
-=          Subtract left side from right side and update left side
^=          "Exclusive or" left side to right side and update left side
%=          Divide left by right side and update left side with remainder

File Test Operators

There are following operators to test various properties associated with a Unix file.

Operator    Description
-r file     Checks if file is readable if yes then condition becomes true.
-w file     Check if file is writable if yes then condition becomes true.
-x file     Check if file is execute if yes then condition becomes true.
-f file     Check if file is an ordinary file as opposed to a directory or special file if yes then condition becomes true.
-z file     Check if file has size greater than 0 if yes then condition becomes true.
-d file     Check if file is a directory if yes then condition becomes true.
-e file     Check if file exists. Is true even if file is a directory but exists.
-o file     Check if user owns the file. It returns true if user is the owner of the file.

Korn Shell Operators

Operators are listed in order of decreasing precedence −

Arithmatic and Logical Operators

Operator    Description
+           Unary plus
-           Unary minus
!~          Logical negation; binary inversion (one's complement)
*           Multiply
/           Divide
%           Modulo
+           Add-Subtract
<<          Left shift
>>          Right shift
==          String comparison for equality
!=          String comparison for non equality
=~          Pattern matching
&           Bitwise "and"
^           Bitwise "exclusive or"
|           Bitwise "inclusive or"
&&          Logical "and"
||          Logical "or"
++          Increment
--          Decrement
=           Assignment

File Test Operators

There are following operators to test various properties associated with a Unix file.

Operator    Description
-r file     Checks if file is readable if yes then condition becomes true.
-w file     Check if file is writable if yes then condition becomes true.
-x file     Check if file is execute if yes then condition becomes true.
-f file     Check if file is an ordinary file as opposed to a directory or special file if yes then condition becomes true.
-s file     Check if file has size greater than 0 if yes then condition becomes true.
-d file     Check if file is a directory if yes then condition becomes true.
-e file     Check if file exists. Is true even if file is a directory but exists.
