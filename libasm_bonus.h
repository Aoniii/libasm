/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm_bonus.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: snourry <snourry@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/05/10 23:03:23 by snourry           #+#    #+#             */
/*   Updated: 2024/05/10 23:03:23 by snourry          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_BONUS_H
# define LIBASM_BONUS_H

# include <stdio.h>

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

int		ft_atoi_base(char *str, char *base);
t_list	*ft_create_elem(void *data);
void	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);
t_list	*ft_list_last(t_list *begin_list);
void	ft_list_push_back(t_list **begin_list, void *data);
t_list	*ft_list_push_strs(int size, char **strs);
void	ft_list_clear(t_list *begin_list, void (*free_fct)(void *));
t_list	*ft_list_at(t_list *begin_list, unsigned int nbr);
void	ft_list_reverse(t_list **begin_list);
void	ft_list_foreach(t_list *begin_list, void (*f)(void *));
void	ft_list_foreach_if(t_list *begin_list, void (*f)(void *), void *data_ref, int (*cmp)());
t_list	*ft_list_find(t_list *begin_list, void *data_ref, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

#endif
