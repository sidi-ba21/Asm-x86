##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## Makefile
##

SRC			=		src/strlen.asm				\
					src/strchr.asm				\
					src/strrchr.asm				\
					src/memcpy.asm				\
					src/memset.asm				\
					src/strcasecmp.asm			\
					src/strcmp.asm				\
					src/strncmp.asm				\
					src/memmove.asm				\
					src/strstr.asm				\
					src/strpbrk.asm				\
					src/strcspn.asm				\
					src/strspn.asm				\
					src/strcpy.asm				\
					src/index.asm				\
					src/rindex.asm				\
					src/read.asm				\
					src/write.asm				\

#SRC-CRIT	=	$(wildcard $(addprefix tests/, *).c)

#OBJ-CRIT	=       $(SRC-CRIT:.c=.o)

OBJ			=		$(SRC:.asm=.o)

CRITFLAGS	=	-lcriterion --coverage

CFLAGS		+=	-I ./include -fno-builtin

CPPFLAGS	+=	-Wall -Wextra -fPIC

NAME		=		libasm.so

%.o: %.asm
		nasm -f elf64 $<

#%.o: %.c
#	gcc $(CFLAGS) $(CPPFLAGS) -c -o $@ $<

all: $(OBJ)
		ld -fPIC -shared $(OBJ) -o $(NAME)

#test_run:	all $(OBJ-CRIT)
#	gcc $(CFLAGS) $(CRITFLAGS) $(OBJ-CRIT) -ldl

clean:
		rm -f $(OBJ)

fclean: clean
		rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/sasuke_uchiwa/delivery/Tek2/Assembly/B-ASM-400-PAR-4-1-asmminilibc-sidi1.ba/libasm.so