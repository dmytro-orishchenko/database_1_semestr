PGDMP     6    *            	    y           lab1    12.8    12.8     '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    16393    lab1    DATABASE     �   CREATE DATABASE lab1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE lab1;
                postgres    false            �            1259    16451    authors    TABLE     X   CREATE TABLE public.authors (
    author_id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.authors;
       public         heap    postgres    false            �            1259    16464    authors_author_id_seq    SEQUENCE     �   ALTER TABLE public.authors ALTER COLUMN author_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.authors_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    208            �            1259    16394    books    TABLE     �   CREATE TABLE public.books (
    book_id integer NOT NULL,
    author_id integer NOT NULL,
    name text NOT NULL,
    year date,
    ticket_id integer
);
    DROP TABLE public.books;
       public         heap    postgres    false            �            1259    16425    books_book_id_seq    SEQUENCE     �   ALTER TABLE public.books ALTER COLUMN book_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202            �            1259    16410    tickets    TABLE        CREATE TABLE public.tickets (
    ticket_id integer NOT NULL,
    user_id integer NOT NULL,
    expiring_date date NOT NULL
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    16427    tickets_ticket_id_seq    SEQUENCE     �   ALTER TABLE public.tickets ALTER COLUMN ticket_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tickets_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203            �            1259    16415    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    name text NOT NULL,
    birth_date date NOT NULL,
    phone_number integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16429    users_user_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204            #          0    16451    authors 
   TABLE DATA           2   COPY public.authors (author_id, name) FROM stdin;
    public          postgres    false    208   �                 0    16394    books 
   TABLE DATA           J   COPY public.books (book_id, author_id, name, year, ticket_id) FROM stdin;
    public          postgres    false    202                    0    16410    tickets 
   TABLE DATA           D   COPY public.tickets (ticket_id, user_id, expiring_date) FROM stdin;
    public          postgres    false    203                     0    16415    users 
   TABLE DATA           H   COPY public.users (user_id, name, birth_date, phone_number) FROM stdin;
    public          postgres    false    204   =       +           0    0    authors_author_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.authors_author_id_seq', 1, false);
          public          postgres    false    209            ,           0    0    books_book_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.books_book_id_seq', 1, true);
          public          postgres    false    205            -           0    0    tickets_ticket_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tickets_ticket_id_seq', 1, false);
          public          postgres    false    206            .           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);
          public          postgres    false    207            �
           2606    16458    authors authors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    208            �
           2606    16401    books books_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    202            �
           2606    16414    tickets tickets_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    203            �
           2606    16422    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    204            �
           2606    16459    books fk_author_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES public.authors(author_id) NOT VALID;
 <   ALTER TABLE ONLY public.books DROP CONSTRAINT fk_author_id;
       public          postgres    false    202    208    2715            �
           2606    16441    books fk_ticket_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_ticket_id FOREIGN KEY (book_id) REFERENCES public.tickets(ticket_id) NOT VALID;
 <   ALTER TABLE ONLY public.books DROP CONSTRAINT fk_ticket_id;
       public          postgres    false    2711    202    203            �
           2606    16431    tickets user_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT user_id_fk FOREIGN KEY (ticket_id) REFERENCES public.users(user_id) NOT VALID;
 <   ALTER TABLE ONLY public.tickets DROP CONSTRAINT user_id_fk;
       public          postgres    false    204    203    2713            #      x������ � �            x������ � �            x������ � �            x������ � �     