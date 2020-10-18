#!/bin/bash
flex test.l
cc lex.yy.c
./a.out