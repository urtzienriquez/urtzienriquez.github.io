---
title: "A brief history of C"
author: Urtzi Enriquez-Urzelai
date: 2026-11-10
series: ["C Tutorials"]
series_order: 1
showPagination: false
summary: "Where C comes from, how it became the language underneath almost everything, and why it is still worth learning."
categories: ["Programming"]
tags: ["C", "history"]
---

Before writing any C code, I thought it would be nice to start this series with a bit of history. C is more than 50 years old, and yet it is still everywhere, so it is worth knowing where it comes from.

## From BCPL to B to C

The story starts in the late 1960s. In 1967, Martin Richards designed **BCPL**, a simple language for writing compilers. At Bell Labs, Ken Thompson took BCPL and stripped it down into an even smaller language, **B** (1969), which fitted in the tiny memory of the computers he was working on.

B had a problem, though: it had no data types. Everything was a machine "word", which worked fine on older machines but not on the new PDP-11, which could address individual bytes. Between 1971 and 1973, Dennis Ritchie extended B with types (`char`, `int`, and later structures) and a proper compiler. The result was first called "New B", and then simply **C**.

## Unix rewritten in C

C was not created in a vacuum: it was created to write **Unix**. Thompson and Ritchie had written the first versions of Unix in assembly, which meant the system was tied to one specific machine. In 1973, they rewrote most of the Unix kernel in C. This was quite radical at the time, since operating systems were expected to be written in assembly for speed.

It turned out to be a great decision. Because Unix was now written in a relatively high-level language, it could be ported to new machines by writing a C compiler for them and recompiling. Unix and C spread together through universities and companies during the 1970s, and each one helped the other become popular.

## K&R and "hello, world"

In 1978, Brian Kernighan and Dennis Ritchie published *The C Programming Language*, a short and clear book known simply as **K&R**. For more than a decade, this book was the de facto definition of the language. It also popularised the tradition of making your first program print "hello, world":

```c
main()
{
    printf("hello, world\n");
}
```

A modern compiler would ask you to add `#include <stdio.h>` at the top and write `int main(void)`, but it is still recognisable C after almost 50 years!

## Standardisation

As C spread, every compiler started adding its own extensions, and code written for one compiler did not always work on another. To fix this, the American National Standards Institute (ANSI) published a standard in 1989 (**C89**), adopted by ISO the following year (**C90**). Since then, the language has evolved slowly and carefully through new standards: **C99**, **C11**, **C17** and, most recently, **C23**. Each version adds useful things (e.g. `//` comments, new integer types, better support for multithreading) while keeping old code working.

## Legacy

It is hard to overstate how influential C has been. Its syntax (curly braces, `for` loops, `++`, and so on) was borrowed by C++, Objective-C, Java, C#, JavaScript and Go, among many others. Thompson and Ritchie received the Turing Award in 1983 for their work on Unix.

C is also the foundation of most of the software we use every day. The Linux kernel is written in C, and so are the reference implementation of Python (CPython), most of the R interpreter, and a large part of Julia's runtime.

## Why learn C today?

For scientists who mainly use R or Julia, C may seem unnecessary. But learning it teaches you how memory, data types and compilation actually work, which helps you write faster code in any language. And when R or Julia are not fast enough, you can write the slow part in C and call it from R (with `.Call`) or from Julia (with `ccall`).

That is where this series is heading. In the next posts, we will start writing, compiling and running some C code. Stay tuned!
