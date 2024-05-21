/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: snourry <snourry@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/06 19:37:55 by snourry           #+#    #+#             */
/*   Updated: 2024/05/06 19:37:55 by snourry          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include "libasm_bonus.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h> 
#include <fcntl.h>

int	main(int argc, char **argv)
{
	int		test;
	int		i1;
	int		i2;
	int		i3;
	int		i4;
	char	*s1;
	char	*s2;
	char	*s3;
	char	*s4;
	char	*s5;
	void	*buf;
	t_list	*list1;
	t_list	*list2;
	char	**tab;

	if (argc < 2)
	{
		printf("Usage: ./a.out <test> [<params>]\n");
		printf("%02i | %-15s | with word\n", 1, "strlen");
		printf("%02i | %-15s | with null for strlen\n", 2, "strlen");
		printf("%02i | %-15s | with null for ft_strlen\n", 3, "strlen");
		printf("%02i | %-15s | basic copy\n", 4, "strcpy");
		printf("%02i | %-15s | basic copy with adresse\n", 5, "strcpy");
		printf("%02i | %-15s | with null source for strcpy\n", 6, "strcpy");
		printf("%02i | %-15s | with null source for ft_strcpy\n", 7, "strcpy");
		printf("%02i | %-15s | with null copy for strcpy\n", 8, "strcpy");
		printf("%02i | %-15s | with null copy for ft_strcpy\n", 9, "strcpy");
		printf("%02i | %-15s | basic comparaison\n", 10, "strcmp");
		printf("%02i | %-15s | with null s1 for strcpy\n", 11, "strcmp");
		printf("%02i | %-15s | with null s1 for ft_strcpy\n", 12, "strcmp");
		printf("%02i | %-15s | with null s2 for strcpy\n", 13, "strcmp");
		printf("%02i | %-15s | with null s2 for ft_strcpy\n", 14, "strcmp");
		printf("%02i | %-15s | basic write\n", 15, "write");
		printf("%02i | %-15s | basic ft_write\n", 16, "write");
		printf("%02i | %-15s | basic both\n", 17, "write");
		printf("%02i | %-15s | with null on write\n", 18, "write");
		printf("%02i | %-15s | with null on ft_write\n", 19, "write");
		printf("%02i | %-15s | basic read\n", 20, "read");
		printf("%02i | %-15s | basic ft_read\n", 21, "read");
		printf("%02i | %-15s | basic strdup\n", 22, "strdup");
		printf("%02i | %-15s | basic ft_strdup\n", 23, "strdup");
		printf("%02i | %-15s | atoi base\n", 24, "atoi base");
		printf("%02i | %-15s | atoi base with null source\n", 25, "atoi base");
		printf("%02i | %-15s | atoi base with null base\n", 26, "atoi base");
		printf("%02i | %-15s | create elem\n", 27, "create elem");
		printf("%02i | %-15s | list push front\n", 28, "list push front");
		printf("%02i | %-15s | list push front with null *\n", 29, "list push front");
		printf("%02i | %-15s | list push front with null **\n", 30, "list push front");
		printf("%02i | %-15s | list size\n", 31, "list size");
		printf("%02i | %-15s | list last\n", 32, "list last");
		printf("%02i | %-15s | list last with null\n", 33, "list last");
		printf("%02i | %-15s | list push back\n", 34, "list push back");
		printf("%02i | %-15s | list push back with null *\n", 35, "list push back");
		printf("%02i | %-15s | list push back with null **\n", 36, "list push back");
		printf("%02i | %-15s | list push strs\n", 37, "list push strs");
		printf("%02i | %-15s | list clear\n", 38, "list clear");
		printf("%02i | %-15s | list at\n", 39, "list at");
		return (1);
	}
	test = atoi(argv[1]);
	if (test < 1)
	{
		printf("Use a valid test number please !\n");
		return (1);
	}
	if (test == 1)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		printf("Word used: %s\n", s1);
		printf("Size with strlen: %li\n", strlen(s1));
		printf("Size with ft_strlen: %li\n", ft_strlen(s1));
	}
	else if (test == 2)
	{
		s1 = 0;
		printf("%li", strlen(s1));
	}
	else if (test == 3)
	{
		s1 = 0;
		printf("%li", ft_strlen(s1));
	}
	else if (test == 4)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		s2 = malloc((sizeof(char) * strlen(s1)) + 1);
		s3 = malloc((sizeof(char) * strlen(s1)) + 1);
		s4 = strcpy(s2, s1);
		s5 = ft_strcpy(s3, s1);
		printf("Word used: %s\n", s1);
		printf("Copy by strcpy: %s\n", s2);
		printf("Return of strcpy: %s\n", s4);
		printf("Copy by ft_strcpy: %s\n", s3);
		printf("Return of ft_strcpy: %s\n", s5);
		free(s2);
		free(s3);
	}
	else if (test == 5)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		s2 = malloc((sizeof(char) * strlen(s1)) + 1);
		s3 = malloc((sizeof(char) * strlen(s1)) + 1);
		s4 = strcpy(s2, s1);
		s5 = ft_strcpy(s3, s1);
		printf("Word used: %p\n", s1);
		printf("Copy by strcpy: %p\n", s2);
		printf("Return of strcpy: %p\n", s4);
		printf("Copy by ft_strcpy: %p\n", s3);
		printf("Return of ft_strcpy: %p\n", s5);
		free(s2);
		free(s3);
		s2 = 0;
		s3 = 0;
	}
	else if (test == 6)
	{
		s1 = 0;
		s2 = malloc(64);
		s3 = strcpy(s2, s1);
		free(s2);
		s2 = 0;
	}
	else if (test == 7)
	{
		s1 = 0;
		s2 = malloc(64);
		s3 = ft_strcpy(s2, s1);
		free(s2);
		s2 = 0;
	}
	else if (test == 8)
	{
		s1 = "Hello";
		s2 = 0;
		s3 = strcpy(s2, s1);
	}
	else if (test == 9)
	{
		s1 = "Hello";
		s2 = 0;
		s3 = ft_strcpy(s2, s1);
	}
	else if (test == 10)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		s2 = "World";
		if (argc > 3)
			s2 = argv[3];
		printf("Word used: '%s' and '%s'\n", s1, s2);
		printf("Return with strcmp: %i\n", strcmp(s1, s2));
		printf("Return with ft_strcmp: %i\n", ft_strcmp(s1, s2));
	}
	else if (test == 11)
	{
		s1 = 0;
		s2 = "Hello";
		printf("Return with strcmp: %i\n", strcmp(s1, s2));
	}
	else if (test == 12)
	{
		s1 = 0;
		s2 = "Hello";
		printf("Return with ft_strcmp: %i\n", ft_strcmp(s1, s2));
	}
	else if (test == 13)
	{
		s1 = "Hello";
		s2 = 0;
		printf("Return with strcmp: %i\n", strcmp(s1, s2));
	}
	else if (test == 14)
	{
		s1 = "Hello";
		s2 = 0;
		printf("Return with ft_strcmp: %i\n", ft_strcmp(s1, s2));
	}
	else if (test == 15)
	{
		i1 = 1;
		if (argc > 2)
			i1 = atoi(argv[2]);
		s1 = "Hello";
		if (argc > 3)
			s1 = argv[3];
		i2 = 5;
		if (argc > 4)
			i2 = atoi(argv[4]);
		printf("write: \n");
		i3 = write(i1, s1, i2);
		printf("\nReturn with write: %i\n", i3);
		printf("Value of errno: %d\n", errno);
	}
	else if (test == 16)
	{
		i1 = 1;
		if (argc > 2)
			i1 = atoi(argv[2]);
		s1 = "Hello";
		if (argc > 3)
			s1 = argv[3];
		i2 = 5;
		if (argc > 4)
			i2 = atoi(argv[4]);
		printf("ft_write: \n");
		i4 = ft_write(i1, s1, i2);
		printf("\nReturn with ft_write: %i\n", i4);
		printf("Value of errno: %d\n", errno);
	}
	else if (test == 17)
	{
		i1 = 1;
		if (argc > 2)
			i1 = atoi(argv[2]);
		s1 = "Hello";
		if (argc > 3)
			s1 = argv[3];
		i2 = 5;
		if (argc > 4)
			i2 = atoi(argv[4]);
		printf("write: \n");
		i3 = write(i1, s1, i2);
		printf("\nReturn with write: %i", i3);
		printf("\nft_write: \n");
		i4 = ft_write(i1, s1, i2);
		printf("\nReturn with ft_write: %i\n", i4);
	}
	else if (test == 18)
	{
		i1 = 1;
		if (argc > 2)
			i1 = atoi(argv[2]);
		s1 = 0;
		printf("write: \n");
		i3 = write(i1, s1, 1);
		printf("\nReturn with write: %i\n", i3);
		printf("Value of errno: %d\n", errno);
	}
	else if (test == 19)
	{
		i1 = 1;
		if (argc > 2)
			i1 = atoi(argv[2]);
		s1 = 0;
		printf("ft_write: \n");
		i4 = ft_write(i1, s1, 1);
		printf("\nReturn with ft_write: %i\n", i4);
		printf("Value of errno: %d\n", errno);
	}
	else if (test == 20)
	{
		s1 = "main.c";
		if (argc > 2)
			s1 = argv[2];
		i1 = open(s1, O_RDWR);
		if (i1 < 0)
			return (1);
		i2 = 100;
		if (argc > 3)
			i2 = atoi(argv[3]);
		buf = malloc(i2);
		i3 = read(i1, buf, i2);
		printf("read: \n%s\n", (char *) buf);
		printf("\nReturn with read: %i\n", i3);
		printf("Value of errno: %d\n", errno);
		free(buf);
		buf = NULL;
		close(i1);
	}
	else if (test == 21)
	{
		s1 = "main.c";
		if (argc > 2)
			s1 = argv[2];
		i1 = open(s1, O_RDWR);
		if (i1 < 0)
			return (1);
		i2 = 100;
		if (argc > 3)
			i2 = atoi(argv[3]);
		buf = malloc(i2);
		i3 = ft_read(i1, buf, i2);
		printf("read: \n%s\n", (char *) buf);
		printf("\nReturn with ft_read: %i\n", i3);
		printf("Value of errno: %d\n", errno);
		free(buf);
		buf = NULL;
		close(i1);
	}
	else if (test == 22)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		s2 = strdup(s1);
		printf("source: \n%s\nadresse: %p\n", s1, s1);
		printf("strdup: \n%s\nadresse: %p\n", s2, s2);
		printf("Value of errno: %d\n", errno);
		free(s2);
		s2 = NULL;
	}
	else if (test == 23)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		s2 = ft_strdup(s1);
		printf("source: \n%s\nadresse: %p\n", s1, s1);
		printf("ft_strdup: \n%s\nadresse: %p\n", s2, s2);
		printf("Value of errno: %d\n", errno);
		free(s2);
		s2 = NULL;
	}
	else if (test == 24)
	{
		s1 = "42";
		if (argc > 2)
			s1 = argv[2];
		s2 = "0123456789";
		if (argc > 3)
			s2 = argv[3];
		printf("%i\n", ft_atoi_base(s1, s2));
	}
	else if (test == 25)
	{
		s2 = "0123456789";
		if (argc > 3)
			s2 = argv[3];
		printf("%i\n", ft_atoi_base(NULL, s2));
	}
	else if (test == 26)
	{
		s1 = "42";
		if (argc > 2)
			s1 = argv[2];
		printf("%i\n", ft_atoi_base(s1, NULL));
	}
	else if (test == 27)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		s2 = "World";
		if (argc > 3)
			s2 = argv[3];
		list1 = ft_create_elem(s1);
		list1->next = ft_create_elem(s2);
		printf("%s\n", (char *)list1->data);
		printf("%s\n", (char *)list1->next->data);
		free(list1->next);
		list1->next = NULL;
		free(list1);
		list1 = NULL;
	}
	else if (test == 28)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		s2 = "World";
		if (argc > 3)
			s2 = argv[3];
		list1 = ft_create_elem(s1);
		ft_list_push_front(&list1, s2);
		printf("%s\n", (char *)list1->data);
		printf("%s\n", (char *)list1->next->data);
		free(list1->next);
		list1->next = NULL;
		free(list1);
		list1 = NULL;
	}
	else if (test == 29)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		list1 = NULL;
		ft_list_push_front(&list1, s1);
		printf("%s\n", (char *)list1->data);
		if (list1->next == NULL)
			printf("list->next == null\n");
		free(list1);
		list1 = NULL;
	}
	else if (test == 30)
	{
		ft_list_push_front(NULL, "test");
	}
	else if (test == 31)
	{
		i1 = 3;
		if (argc > 2)
			i1 = atoi(argv[2]);
		if (i1 > 0)
		{
			list1 = ft_create_elem("Hello");
			while (i1 > 1)
			{
				ft_list_push_front(&list1, "Hello");
				i1--;
			}
		}
		else
			list1 = NULL;
		printf("%i\n", ft_list_size(list1));
		while (list1)
		{
			list2 = list1;
			list1 = list1->next;
			free(list2);
			list2 = NULL;
		}
	}
	else if (test == 32)
	{
		s1 = "Je suis au debut";
		if (argc > 2)
			s1 = argv[2];
		s2 = "Je suis au milieu";
		if (argc > 3)
			s2 = argv[3];
		s3 = "Je suis le dernier";
		if (argc > 4)
			s3 = argv[4];
		list1 = ft_create_elem(s3);
		ft_list_push_front(&list1, s2);
		ft_list_push_front(&list1, s1);
		list2 = ft_list_last(list1);
		printf("%s\n", (char *)list2->data);
		while (list1)
		{
			list2 = list1;
			list1 = list1->next;
			free(list2);
			list2 = NULL;
		}
	}
	else if (test == 33)
	{
		list1 = NULL;
		list2 = ft_list_last(list1);
	}
	else if (test == 34)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		s2 = "World";
		if (argc > 3)
			s2 = argv[3];
		list1 = ft_create_elem(s1);
		ft_list_push_back(&list1, s2);
		printf("%s\n", (char *)list1->data);
		printf("%s\n", (char *)list1->next->data);
		free(list1->next);
		list1->next = NULL;
		free(list1);
		list1 = NULL;
	}
	else if (test == 35)
	{
		s1 = "Hello";
		if (argc > 2)
			s1 = argv[2];
		list1 = NULL;
		ft_list_push_back(&list1, s1);
		printf("%s\n", (char *)list1->data);
		if (list1->next == NULL)
			printf("list->next == null\n");
		free(list1);
		list1 = NULL;
	}
	else if (test == 36)
	{
		ft_list_push_back(NULL, "test");
	}
	else if (test == 37)
	{
		tab = (char *[]){"Hello", "world", "!", NULL};
		list1 = ft_list_push_strs(3, tab);
		while (list1)
		{
			printf("%s\n", (char *)list1->data);
			list2 = list1;
			list1 = list1->next;
			free(list2);
			list2 = NULL;
		}
	}
	else if (test == 38)
	{
		list1 = NULL;
		ft_list_push_back(&list1, ft_strdup("Hello"));
		ft_list_push_back(&list1, ft_strdup("World"));
		ft_list_push_back(&list1, ft_strdup("!"));
		ft_list_clear(list1, &free);
	}
	else if (test == 39)
	{
		tab = (char *[]){"5", "4", "3", "2", "1", NULL};
		list1 = ft_list_push_strs(5, tab);
		i1 = 1;
		if (argc > 2)
			i1 = atoi(argv[2]);
		list2 = ft_list_at(list1, i1);
		if (list2 != NULL)
			printf("%s\n", (char *)list2->data);
		else
			printf("null\n");
		while (list1)
		{
			list2 = list1;
			list1 = list1->next;
			free(list2);
			list2 = NULL;
		}
	}
	else if (test == 40)
	{
		i1 = 5;
		if (argc > 2)
			i1 = atoi(argv[2]);
		tab = (char *[]){"1", "2", "3", "4", "5", NULL};
		list1 = ft_list_push_strs(i1, tab);
		list2 = list1;
		printf("List before:\n");
		while (list1)
		{
			printf("%s\n", (char *)list1->data);
			list1 = list1->next;
		}
		list1 = list2;
		ft_list_reverse(&list1);
		printf("List after:\n");
		while (list1)
		{
			printf("%s\n", (char *)list1->data);
			list2 = list1;
			list1 = list1->next;
			free(list2);
			list2 = NULL;
		}
	}
	return (0);
}
