NAME = libasm.a

SRCS	= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
SRCS_B	= ft_atoi_base_bonus.s

OBJS		= $(SRCS:.s=.o)
OBJS_B		= $(SRCS_B:.s=.o)
OBJS_DIR 	= objects
OBJS_PATH	= $(addprefix $(OBJS_DIR)/, $(OBJS))
OBJS_PATH_B	= $(addprefix $(OBJS_DIR)/, $(OBJS_B))

$(OBJS_DIR)/%.o: %.s
	mkdir -p $(@D)
	nasm -f elf64 $< -o $@

$(NAME): $(OBJS_PATH)
	ar rcs $(NAME) $(OBJS_PATH)

all: $(NAME)

bonus: $(OBJS_PATH) $(OBJS_PATH_B)
	ar rcs $(NAME) $(OBJS_PATH) $(OBJS_PATH_B)

build: bonus
	clang -g -Wall -Wextra -Werror main.c -L. -lasm

clean:
	rm -f $(OBJS)
	rm -f $(OBJS_B)
	rm -rf $(OBJS_DIR)

fclean: clean
	rm -f $(NAME)
	rm -f ./a.out

re: fclean all

.PHONY: all bonus build clean fclean re