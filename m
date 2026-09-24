Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC7414408
	for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278058; cv=pass; b=kvsvhfVxxW8PjJONM8F6ABTMzgVwPkLJ6tV5b/GQLjZRNWbsmMQbrF2dzm3LgYqLSTdpFCK6Qj1WI3M9pR4wKUxo33CUTUz4rUr7uvTq3E+tISicNJxrjELaVgMSgwM8B/9+xiggw47csDmrfdLJqd0sCN4umAGcmmojLPHOAzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278058; c=relaxed/simple;
	bh=XzaotBswcrX8sFozvp5HNW1/R5oEcukjCEzRK1xHEVk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KAiVrp/s+AGJGQ2zzJq6/v8cypNka6jTJZTMLz2DtHhMp9+MaAnoVRZ4faS7AJ3XEPeOHnU38d8gvGCWosjN7Ih6nLnD8tjMaXA8Gaud+k/sbvYPUDMzn3xgTuba6exF8iUYQpZsDGwvS4Kg0Cw0xE4JNJm6NAwYMi174TcxZzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kTK2mJ6q; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kTK2mJ6q"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db33db4de9so16615ad.0
        for <io-uring@vger.kernel.org>; Thu, 24 Sep 2026 12:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278043; cv=none;
        d=google.com; s=arc-20260327;
        b=QFEnoZmdxdxHI0TGYqcF40uKwrDnpSfnDu4ov3ERs3Ez6OpeYh9cybTxJ/2BM51Kgg
         rANG3RypMlGVq7YQ/LT4Ym2opq6ZkIbtnQKV8jTP5+rCbjB/YjU5pq6BLD7hKo6HXZYW
         +AH+JnJ3yVSNLkwA69E2vMVp5ajQjVagJ6vgNamrNcso3iNlZNXYDCKJWCWY/378IZ9Q
         cNbYDgNya0MiUVzFLR6hV7uk0nKfZ5Qgrzz2F+U5bw23chRMa1jU6Oi5d7zoBZjttjlA
         X4iaBDr091odh3P6JjaGGEIJMdDP/rT6e0Wyq8MGOlCq8RWRCErVGCs2ijv/9eeY8HYp
         TKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=b7syVeMfJ9AcnQQKiGhRjYLG5AfC5dhJCOJySerDhhY=;
        fh=yv7d4PmbaMW/njjrW71JqoRpR6Nl7x1ZEe2AjQhXVl8=;
        b=gMYoYCBCIykxd4EbF1VbGxeYby2pAgOhm7C7+EWIdhDMzq56BzwxbedJyMZft463oY
         qaqQ+JGuP5SmymK1xVdWLy93n5GWY2j/iwDym8eVc1oMKyHRXKXxgM9c4NrHKvpokV/i
         YeBUFVATSi60NDyv4dgJczgsyykbA5u39ld0sQ1y3up2/3I+RAfMIQ6ncq4RlNes5bon
         p25IYuZcHUqw/aBDU/fpZD1/2FKNjEjr28Jj4MeXpRlXqoBFOky4suOyoNlpaAtuJSCK
         PvD069rlVBoDl/CfEB3JP/e7l4Cd7chclFZWX6ffwqJCiqwPby5WXQRKD6J0+hzIDC6c
         MtJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790278043; x=1790882843; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7syVeMfJ9AcnQQKiGhRjYLG5AfC5dhJCOJySerDhhY=;
        b=kTK2mJ6q/2TJp3eRI8MshYQvDQUXUuhsGfyZRQgB1r3RuLUJfglJ7aowREoaFMFSL7
         Z6PVImz2h3NylqQIj1g5BV4RSQzvOBQ4EXUetphXiyu8sBjag6bFheg0xprOwj6D/+j3
         s/yP/lhzJPM6f/Y2z5rlb7rcwgAzu5NnuDVlI32WsjJc5ygonKQPEqhyy2z71kKbzSBo
         lqX4+DnxffuROctniIZiRcWvc6YpJzbKPvU/HgRTrP57OiqM/JU7WorTWk8/xpZV2k0Y
         96IoZSakLgeyRUskOS48pLtDgehFHQw/xJN61XZIsM9qqxHXdi6c6WUq4cp/zgtPKNNh
         qbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278043; x=1790882843;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b7syVeMfJ9AcnQQKiGhRjYLG5AfC5dhJCOJySerDhhY=;
        b=dnBSB2NMFdch+YMhKJcOfOFeX9TLk0Nkv+v4x31/Po/BWZ8eLt7mQQLfp8bRg5UIZw
         7Hy4weTHpIwYKOMHGgTdS/KbKeX0blY7/D0z6LQzdOyULaRtUkFuR5Mlcw7ID6leiIY/
         xKCskcj2VjnsRRgRvX9dya9Ex/64UQL1SB2seTUWPp+xd0vFfYs+9EHDwXm+0W4hPylm
         8fq/827onG1g/rf7zNC06zV+wu/LqRHsIU6L7dWgKZfZRKrUHippZe+ImZZrtNnS57KH
         nJ7hBCPD3mlMnAeOpYyX4du0e/5jf5pm1T9248PP0JLqsM/K+zUDlQubvNe/iJjF7zuv
         DdHw==
X-Forwarded-Encrypted: i=1; AKwUvByoROHn0CtANR+rg2NYgZ6z4PZK4HcZFHX1kdJb55Hj+EKTanJirvR5YIUCCEcmHm4y9WZMBHLazQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lIXS2LtAKc4Tzc9M4TCIIK9q5MsuxQDLkEqNOdaPpDxH0wTGhR
	+APNlIBnNemCoIWuBFr5fJE7by7U9o5sneTVMSDldguevkpoWpIx6gLeM/CAFcGOSrF5X4EgqPb
	9rOkyu9yZf/MCQdaQ1WKqw5jMlIP6Rrenma6xHTIs
X-Gm-Gg: AYBFou3t7MVZbOs0a7K/XKD3VagwVAOkARuRdoOk4sPVON3dWktl+VMshyJivohtyrr
	NnCaR4bzHMtu3cTUOUqt9s4nCpLJBqhvXwsWsvvCuOl8fsUwlyl4gpHhyj6OjsOdVGZ+4rICYcM
	svfv+LGQH/N5EqBo+HoCQru7Jqwk8FywE8oFmHYvnEVgkJwFqXn599H2pLsUOEve4/KetQ3w8WL
	h3yaH/Hb+tjjM3dxKzxyqLSP8OT3IpMq5oiF3drZQobDcUhNWhKITxsAomd9U/8pikCuoo0S6Z1
	UCJWsHOfGj8kFbZ9uHTH920CiprUPGvT6/ppaLE3dU5N01HGNPlMvFY5z6B+TdiDa6d675wjek+
	62SX2oBdBCjGDzuCjUcWLb5+vOMqdQyMhat5pCMRFrQ==
X-Received: by 2002:a17:903:228e:b0:2bd:3bfd:74f1 with SMTP id
 d9443c01a7336-2df90b58a30mr898895ad.2.1790278042137; Thu, 24 Sep 2026
 12:27:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
Date: Thu, 24 Sep 2026 21:26:45 +0200
X-Gm-Features: AclHuK_GDeqK8fl4Xv9_5FEMKUxs6zVvHX2H13Sb5AiawRoadHDeJqJS40KU1CQ
Message-ID: <CAG48ez0dLBpc3QtbAhMMVNHwHL94iHh2G+h-=BVFR4dDuzZr1g@mail.gmail.com>
Subject: [BUG] FUT_OFF_MMSHARED futex waiters can outlive mm_struct (because
 of futex_requeue() and maybe io_uring)
To: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: kernel list <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	io-uring <io-uring@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

== Summary ==
FUT_OFF_MMSHARED futex waiters can outlive the mm_struct that the
futex_key refers to because of futex_requeue() [tested] and probably
also via io_uring [untested].

This doesn't have much practical impact, I think at most it could:
1. cause missed wakeups for non-private futexes in anonymous memory
2. allow unrelated processes to guess addresses of FUT_OFF_MMSHARED futexes.

I propose we handle FUT_OFF_MMSHARED like FUT_OFF_INODE and put a
unique 64-bit ID into struct futex_mm_data, which can be used in futex
keys. That should address both futex_requeue() and io_uring. If that
sounds good, I'd be happy to write a patch.

== Detailed description ==
Commit 222993395ed3 ("futex: Remove pointless mmgrap() + mmdrop()") claims:

"We always set 'key->private.mm' to 'current->mm', getting an extra
reference on 'current->mm' is quite pointless, because as long as the
task is blocked it isn't going to go away."

This assumes that a FUT_OFF_MMSHARED futex waiter is always waiting on
its own mm_struct. That assumption does not hold in the following
scenario:

1. process A starts waiting on a FUT_OFF_INODE key with
futex_wait(shm_addr, ...)
2. process B uses futex_requeue({{.uaddr=shm_addr},
{.uaddr=anon_addr}}, ...) to move the waiter to a FUT_OFF_MMSHARED
futex associated with the mm_struct of process B
3. process B exits and its mm_struct goes away
4. process C is created, with its mm_struct allocated at the same
kernel address where process B's used to be
5. process C calls futex_wake(anon_addr, ..., nr=1, ...), which
wrongly wakes process A (and won't wake other legitimate wakers
because of nr=1)

== io_uring interaction ==
io_uring permits asynchronous waiting on futexes; io_futex_wait_prep()
can use io_req_track_inflight() to ensure that the futex waiter will
be destroyed before the calling task goes through exit or exec, but
only does so for private futexes, not for FUT_OFF_MMSHARED waiters. I
think io_uring FUT_OFF_MMSHARED waiters could probably survive process
exit and outlive the mm_struct; but I haven't tested this.

== Fixing it ==
I see two approaches to fixing this:

1. Put a unique 64-bit ID into struct futex_mm_data, which can be used
in futex keys, similar to how FUT_OFF_INODE is already handled with
get_inode_sequence_number(). That should address both futex_requeue()
and io_uring.
2. Ensure that FUT_OFF_MMSHARED waiters can't wait on another
mm_struct by blocking attempts to requeue FUT_OFF_INODE waiters onto a
FUT_OFF_MMSHARED key. For io_uring, make io_req_track_inflight()
unconditional.

I like option 1 because it also avoids feeding a kernel pointer into a
hash function together with user input, which probably creates a
timing side channel leak of mm_struct pointers.

== Reproducer ==
Here is a reproducer that demonstrates receiving a futex wakeup from
futex_wake() on anonymous memory in an unrelated process:

#include <pthread.h>
#include <err.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <sys/wait.h>
#include <linux/futex.h>

#define FLAGS_SIZE_32   0x0002

#define SYSCHK(x) ({          \
  typeof(x) __res = (x);      \
  if (__res == (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

int futex_wait_until_nonzero(void *uaddr) {
  return syscall(__NR_futex_wait, uaddr, /*val=*/0, /*mask=*/0x1,
/*flags=*/FLAGS_SIZE_32, NULL, 0);
}

int futex_wake(void *uaddr) {
  return syscall(__NR_futex_wake, uaddr, /*mask=*/0x1, /*nr=*/100,
/*flags=*/FLAGS_SIZE_32);
}

int futex_requeue(void *src, void *dst) {
  struct futex_waitv waiters[2] = {
    {.val = 0, .uaddr = (unsigned long)src, .flags = FLAGS_SIZE_32},
    {.val = 0, .uaddr = (unsigned long)dst, .flags = FLAGS_SIZE_32},
  };
  return syscall(__NR_futex_requeue, waiters, 0, /*nr_wake=*/0,
/*nr_requeue=*/100);
}

static char *shm;

static void *waiter_thread_fn(void *dummy) {
  printf("[waiter_thread] futex_wait_until_nonzero(shm) = %d\n",
futex_wait_until_nonzero(shm));
  return NULL;
}

int main(void) {
  setbuf(stdout, NULL);
  shm = SYSCHK(mmap(NULL, 0x1000, PROT_READ|PROT_WRITE,
MAP_SHARED|MAP_ANONYMOUS, -1, 0));
  *shm = 0;

  pthread_t waiter_thread;
  pthread_create(&waiter_thread, NULL, waiter_thread_fn, NULL);

  pid_t child1 = SYSCHK(fork());
  if (child1 == 0) {
    usleep(10000);
    char *priv = SYSCHK(mmap((void*)0x10000, 0x1000,
PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,
-1, 0));
    printf("[child1] futex_requeue(shm, priv) = %d\n",
futex_requeue(shm, priv));
    exit(0);
  }
  int wstatus;
  SYSCHK(waitpid(child1, &wstatus, 0));

  for (int i=0; i<10000; i++) {
    pid_t child2 = SYSCHK(fork());
    if (child2 == 0) {
      char *priv = SYSCHK(mmap((void*)0x10000, 0x1000,
PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,
-1, 0));
      int wake_res = futex_wake(priv);
      if (wake_res)
        printf("[child2, iteration %d] futex_wake(priv) = %d\n", i, wake_res);
      exit(0);
    }
    SYSCHK(waitpid(child2, &wstatus, 0));
  }
  exit(0);
}

Testing on current mainline (fe2ec83746e5), built without KASAN, I get
output like:

sh-5.3# /host/h/test/futex-requeue-inode-to-mm/futex-requeue-inode-to-mm
[child1] futex_requeue(shm, priv) = 1
[child2, iteration 20] futex_wake(priv) = 1
[waiter_thread] futex_wait_until_nonzero(shm) = 0
sh-5.3# /host/h/test/futex-requeue-inode-to-mm/futex-requeue-inode-to-mm
[child1] futex_requeue(shm, priv) = 1
[child2, iteration 261] futex_wake(priv) = 1
[waiter_thread] futex_wait_until_nonzero(shm) = 0
sh-5.3# /host/h/test/futex-requeue-inode-to-mm/futex-requeue-inode-to-mm
[child1] futex_requeue(shm, priv) = 1
[child2, iteration 6] futex_wake(priv) = 1
[waiter_thread] futex_wait_until_nonzero(shm) = 0
sh-5.3# /host/h/test/futex-requeue-inode-to-mm/futex-requeue-inode-to-mm
[child1] futex_requeue(shm, priv) = 1
[child2, iteration 31] futex_wake(priv) = 1
[waiter_thread] futex_wait_until_nonzero(shm) = 0
sh-5.3#
