Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373755;
	b=jgl7YlcmC/PwtDa80rA1kDCC5pw+qtW1MTPB0XsgN1qoDcnyVfb8SOU203yCDzEP0XQc
	 YPniqKUrhM5haOiPZEEz2Na4GMSC7RNqbmx0mplQy8GPzjI+kweWch/aWqifzPoRPPXRc
	 7a25Kwm79eO10IjTPH3/gQMOt4amgz7Ksg4wE8IXAz/dMPC/DxzseSAs0+LcVoWaVUVxz
	 elLnGdeIvH0d59BO9OhKc3TEwU/i5Fvf5o8u34vv6YysdG27QZ/G2m9tgUkzA3ICqrNWR
	 oCKWmPslmoXIByWzcFEeUb6AGTte1jJDs5J5HptIfpDc2fd1voEwcq8BZfnz9DkFBrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZpTyJJAfpyuCeJ3gnFQTwAMoG+sE3z7qtTotl8PHhdA=;
	b=q0OSvh/M3oTSda11oTUvPVC0NEZftILUlKw8B/bMDcFDvIkO+L/GejXqRy+9/7G6hWjy
	 V53P3ynPELaOENfPHaZNtArOZV3H9h+jObVjDBsfKoDcSRsUNA9C8bQeAfSBihWaHFgGu
	 6KXaY5suzxK/uVBbVFauPlD3UxjRvLWV6ONk20OufzpNdMPbDPEyQEdB7/p/oUkWhHWnD
	 UX3sJyhx04wLcw4xaoURHEITjc/bUN/RDplRpYNGfu4dBImTf0GyBKOmVEpz2QYqJRcOS
	 JcWdWEKl2zZ/zJo1PuFXQtzFr+3MKYBmV/xqI8LXumcd8la7TLX3p2h/QbdLjJpv7JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=vEkS0O+X;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCE2606A330
	for <io-uring@vger.kernel.org>; Sun, 22 Nov 2026 18:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCE2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=vEkS0O+X
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so1227800a12.2
        for <io-uring@vger.kernel.org>; Sun, 22 Nov 2026 10:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795373752; x=1795978552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpTyJJAfpyuCeJ3gnFQTwAMoG+sE3z7qtTotl8PHhdA=;
        b=vEkS0O+XN7YwhR5FMySXzvOszrY6LSJClneZaqdEOS3/vMT0MtISX5W8v72HsH/jVu
         +StXQQhxJcL4O1jmKcIRTHvrPzrNktNCE/MlvLE/KwBPphpoD0k5/HMwzDU5Qbsf2XWa
         vG9UJMg/nwZXJRZ10Qxhgnq2Szdvv/IOB2qRNJ+G/zmKbJHxlz5xKfJDmehGgnXzEqmY
         bauslChQukX4GvBQ72KSVa/c6nNAwkBCRWfoP8tDjpE8IPb322cmh4oR+Perm1/+b+lI
         Wyf6h6TaZ1QQSibdQbejLpEthUSIgfkHk8kZIFFzJQlt8c55lQvggkOndOOd+RxrjPXp
         Oj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373752; x=1795978552;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpTyJJAfpyuCeJ3gnFQTwAMoG+sE3z7qtTotl8PHhdA=;
        b=N337tuSDIh44fN6sifKD0NQEYf5SoFjoUdVkmZwoow6yUJKmClIslNdtP08KvC6RyV
         uJg8Zy8fxge06ScfzcrAd9OAiK0RwSxH7O5TNoBww1N2JVa1CA9/pDzb02kRbgvWiayc
         eTG/wLc+ZGTD8GATn5jy02VjF79Z3EWglwWnI1lvw3EoKKgC0o9b0v5hX9eKimIWcauA
         B/RF3/XwTXjJv8TZ8GYZPlAlRJrmlseiMYWPc2JQFRiS1BoVaQZDtpyT9cfFS7hGzmZz
         xeo5tOPC5dS3V+Zislvt3D9miJNrAX18Csw4n/jzlpD2BHzO6FxADgHRtVYPBadAEcJD
         gcAQ==
X-Gm-Message-State: APuU4Z9KUHMlL5NV5KBRwlAr9pVEM4Z0pYLKWTh8WK6CcxjzUhz+jh85
	eXblcP88ALJt+tGEgZyKLl7Zw1s8AppuTlz4LBavl/gDq4aJVBpQMXhs+x0O/D9uJJCyFNKSUVK
	u9jRq+hE=
X-Gm-Gg: AZFdTZeNrLxNc03+v/5EDnc2Lp26qEbhljpz3Wls0rQKFI+hT0qZy1z2pgjumPs8PWp
	hvbu+WoC2A22TX4DBIHEcVyYRxFZtcb9ikx21TEOp1eObnP4JX7hIzuAAezoxQvKjYK+qtQCE7Q
	v3X58AtPf/fDSXN36LejxLxRLmmyGRNIN1uNTn/75n6zLw0FWvQRv0K5etWs+isjIBcDjA+lgA8
	dgPwe5YxHNfv4aiS08UXAW1KGHRl338R/UxOcw7XfDQsutFqFWyt7rGAeyXEvN+gNIGnwZuyDVj
	BDhmq50e5W6+GIqmjc1SteMDdklnNcUolhI1rA+RLnKPmaKsWSKOtNIkEu7nBKBKRsb8SMsqFdH
	jafX9IELQ+ZA6h6XTN65jvb5ehJshko9IFQcMynM6sJ6GrK2DpsvOTAwTUURXY5u2wfFRM5bLfA
	m3FbpJk4yri4fXnsVfkK8ldJ5fJrCspndRJbdTWS6w/ESXrq/1pNiYJjkA+RQm7zLTrQWkCoJR1
	kUqYSdKBne4GU/Bjz+U+oC39vsWXLNUGwS/l0dqcnzoRtj51E46aLCOQQK+8yvuGla3N+LyJ6rj
	5oD9F5yDv9jt99vLiSY7b+pJGQlbJnCMiAcmjVk37NL6vrNPDeTWBAWmwZ1l+U7fwz0StMMCkRX
	OzAteRqJl6OXHJlAlTo0BVxJxJ5StbIrGTietQwa+b9N3kkaSavwvJa9wd6NJnyydQS0hug==
X-Received: by 2002:a17:90b:3f0e:b0:3b3:b6c3:ff5b with SMTP id 98e67ed59e1d1-3b41c9059e1mr8248411a91.36.1795373752564;
        Sun, 22 Nov 2026 10:55:52 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm14113248a91.9.2026.11.22.10.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 10:55:51 -0800 (PST)
Message-ID: <df3337e1-58f6-4a5f-82e5-d9f4fc1ff7c8@kernel.dk>
Date: Sun, 22 Nov 2026 11:55:51 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG + PATCH] io_uring/rsrc: Page-level UAF via
 IORING_REGISTER_CLONE_BUFFERS on IO_REGBUF_F_KBUF buffers (+ vringh slow_copy
 OOB)
To: Charles <srijaan@proton.me>, Greg KH <gregkh@linuxfoundation.org>
Cc: "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
References: <YM-SVvJpDZxNYESMMdnz-t8A2OWKzXnPtdbgqEfG0GVzAHaD9vN5nID1N35dyZGga5yc8LUdNHh_kNJmq5IxnSMeJhpa07ZNGKjwbW0JfvY=@proton.me>
 <2026112255-mooned-scotch-45b8@gregkh>
 <UAv5iL7TzydEOne6fkMoGjDD9QKLzmvtx6AA13trfoiYHFUvolV_EYYMFyswW641KRNlMGcv1WxmMklsV0MSADeGmREnZjLQsHte1vDdQCk=@proton.me>
 <2026112210-most-ripple-f0f2@gregkh>
 <_fCYwLrqH3eCrdhdnhG_jWbqQCM98WLDAPjSUDvybghN1Zt9rVJY4Qq-sdJ3Gv-nwZ7E38Cp4GAfE6SQkqHEdIyi3IWrU6ulDban0e6JPqM=@proton.me>
 <EId43tY1y-P05sLvdH6roKq8lEP4Vi7UgmXvVUKIHkGCv3zAD2wMqLoJcTiFMGU0txHfJiAj3Ra1MQ6n8VddmgBZ7FYPwsoWQubLzKIOg1w=@proton.me>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <EId43tY1y-P05sLvdH6roKq8lEP4Vi7UgmXvVUKIHkGCv3zAD2wMqLoJcTiFMGU0txHfJiAj3Ra1MQ6n8VddmgBZ7FYPwsoWQubLzKIOg1w=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/22/26 6:30 AM, Charles wrote:
> Hi Greg,
> 
>     My apologies for the oversight on maintainer routing and the incomplete DCO identity.
> 
>     My full legal name is Srijan Mandal, and the updated Signed-off-by line for this patch series is:
>     Signed-off-by: Srijan Mandal <srijan@proton.me>
> 
>     I have CC'd Jens Axboe and the io-uring mailing list on this thread for the io_uring/rsrc patch.
> 
>     Below is the standalone io_uring fix with the corrected DCO. The second patch (vringh/vhost bounds check) is an independent issue in drivers/vhost; if preferred, I can break that out into a separate thread directed to Michael S. Tsirkin and virtualization@lists.linux.dev to keep subsystem threads clean.
> 
>     ---
>     From: Srijan Mandal <srijan@proton.me>
>     Subject: [PATCH] io_uring/rsrc: reject IO_REGBUF_F_KBUF buffers in io_clone_buffers()
> 
>     Kernel-registered request buffers initialized via io_kernel_buffer_init()
>     carry the IO_REGBUF_F_KBUF flag and borrow struct page pointers tied to
>     the lifetime of an in-flight kernel request (such as ublk zero-copy I/O).
>     When the request finishes, io_buffer_unregister() removes the buffer from
>     the owning ring and decrements imu->refs.
> 
>     Currently, io_clone_buffers() (IORING_REGISTER_CLONE_BUFFERS) does not
>     reject IO_REGBUF_F_KBUF buffers. If user space clones an active
>     IO_REGBUF_F_KBUF buffer into a second io_ring_ctx, imu->refs is
>     incremented to 2. When io_buffer_unregister() subsequently runs on the
>     source ring, refcount_dec_and_test(&imu->refs) drops the refcount from
>     2 to 1, skips imu->release(), and returns 0 while the destination ring
>     retains arbitrary read/write fixed-buffer access to the freed bio pages.
> 
>     Explicitly reject IO_REGBUF_F_KBUF in io_clone_buffers() with -EOPNOTSUPP.
> 
>     Fixes: 7cc2a6eadcd7 ("io_uring/rsrc: support cloning registered buffers")
>     Signed-off-by: Srijan Mandal <srijan@proton.me>
>     ---
>      io_uring/rsrc.c | 4 ++++
>      1 file changed, 4 insertions(+)
> 
>     diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>     index 1a2b3c4d5e6f..6f5e4d3c2b1a 100644
>     --- a/io_uring/rsrc.c
>     +++ b/io_uring/rsrc.c
>     @@ -1521,6 +1521,10 @@ int io_clone_buffers(struct io_ring_ctx *ctx, void __user *argp)
>              if (!src_node) {
>                  dst_node = NULL;
>              } else {
>     +            if (src_node->buf->flags & IO_REGBUF_F_KBUF) {
>     +                io_rsrc_data_free(ctx, &data);
>     +                return -EOPNOTSUPP;
>     +            }
>                  /* we don't allow IOPOLL rw with dma-buf for now */
>                  if ((src_node->buf->flags & IO_REGBUF_F_DMABUF) &&
>                      (ctx->flags & IORING_SETUP_IOPOLL)) {
>     --
>     2.47.0


I looked at this, and ran it. The commit message is wrong, the
patch isn't usable as posted, but there is a bug there.

However, it's not a use-after-free. imu->release() isn't what frees the
pages, it's what drops the ublk request referenced. With a clone holding
imu->refs the release is deferred, the request isn't completed, and the
pages stay pinned. If you have a KASAN splat or a reproducer showing
stale access, send it. If not, I'm assuming this is just LLM
hallucinations with zero extra thought or testing being done by the
reporter.

What does happen: clone a KBUF buffer, and the request never
completes. In my test the partition scan read hangs holding the
disk open_mutex, and killing the ublk server leaves it spinning in
io_uring_cancel_generic() at 100% CPU, as it also holds the dst
ring. That is a bug of course, but not a UAF. And since setting up a
ublk instance is a privileged operation, not anything particularly
exciting. Still wants fixing, of course.

Other things:

- Fixes tag is wrong. 7cc2a6eadcd7 is the original clone commit and
  its subject isn't what you quoted. KBUF came with 27cb27b6d5ea.
- The patch doesn't apply: io_clone_buffers() is static and has a
  different signature, the index line is bogus and the whitespace
  is mangled. In other words, this too looks LLM hallucinated and you
  didn't bother to do any checking or work on your own.
- From is srijaan@proton.me, Signed-off-by is srijan@proton.me.
  That's still wrong, they must be the same.

IOW, lots of things for you to fix, please do so and send a v2.

-- 
Jens Axboe
