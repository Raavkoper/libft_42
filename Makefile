NAME = libft.a

HEADER = libft.h

RM = rm -f

OBJS_DIR = objs

COMPLETED_MES = @echo "Compiling sourcefiles..."

CFLAGS = -Wall -Werror -Wextra


C_FILES = src/ft_atoi.c src/ft_bzero.c src/ft_calloc.c src/ft_isalnum.c src/ft_isalpha.c src/ft_isascii.c \
		src/ft_isdigit.c src/ft_isprint.c src/ft_itoa.c src/ft_memchr.c src/ft_memcmp.c src/ft_memcpy.c \
		src/ft_memmove.c src/ft_memset.c src/ft_putchar_fd.c src/ft_putendl_fd.c src/ft_putnbr_fd.c \
		src/ft_putstr_fd.c src/ft_split.c src/ft_strchr.c src/ft_strdup.c src/ft_striteri.c src/ft_strjoin.c \
		src/ft_strlcpy.c src/ft_strlcat.c src/ft_strlen.c src/ft_strmapi.c src/ft_strncmp.c src/ft_strnstr.c \
		src/ft_strrchr.c src/ft_strtrim.c src/ft_substr.c src/ft_tolower.c src/ft_toupper.c \
		src/get_next_line.c src/get_next_line_utils.c src/ft_printf.c src/ft_printf_utils.c \
		src/ft_dputils.c

B_C_FILES = src/ft_lstnew.c src/ft_lstadd_front.c src/ft_lstsize.c src/ft_lstlast.c src/ft_lstadd_back.c \
		src/ft_lstdelone.c src/ft_lstclear.c src/ft_lstiter.c src/ft_lstmap.c

ifdef WITH_BONUS
OBJS = $(C_FILES:%.c=%.o) $(B_C_FILES:%.c=%.o)
else
OBJS = $(C_FILES:%.c=%.o)
endif

all: $(NAME)

%.o: %.c $(HEADER)
	@$(CC) -c $(CFLAGS) -o $@ $<

$(NAME): $(OBJS)
	@ar -ruc $(NAME) $^
	@echo "\033[92mMade libft.a\033[0m"

bonus:
	@$(MAKE) WITH_BONUS=1

clean:
	@$(RM) src/$(OBJS)

fclean: clean
	@$(RM) $(NAME)
	@echo "\033[0;31mDeleted libft.a\033[0m"


re:	fclean all

.PHONY: all clean fclean re bonus