##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## Makefile
##

SRC			=		src/strlen.asm				\
					src/strchr.asm				\
					src/strrchr.asm				\


OBJ			=		$(SRC:.asm=.o)

NAME		=		libasm.so

%.o: %.asm
		nasm -f elf64 $<

all: $(OBJ)
		ld -fPIC -shared $(OBJ) -o $(NAME)

clean:
		rm -f $(OBJ)

fclean: clean
		rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/sasuke_uchiwa/delivery/Tek2/Assembly/B-ASM-400-PAR-4-1-asmminilibc-sidi1.ba/libasm.so