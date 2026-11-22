Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354257;
	b=mWg8iPW4mME0S6VNf1/lz82E0ixVWBZwWtsByEL9ybEkp9o8P80SnF7iIiHLG7ypdb5M
	 Go17VnCEfZDDm6n3WBH3DWpz+al6sf6/NNHTcH1HOfsinz72W7U0JvK+s1VAAxT+jv1xt
	 9oNjW9g/v8TYkfVtWvfkZQT5LZAsreE8/Y/JyFTpi2+fnv7+C8vt5n2IoXa/tr7GNAQ5c
	 H0wktM53CvlVyN/cjQjngjYOKhOLypZgxYK/S2jhz78Ew2hrPgVLh08M67hKgzm1W6+iU
	 F1rJI/ktnx89rwuFgtntit5QWSdqo7YpybFjfYqspb6d3N62rZK2XWtPzwPyXICIqZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354257;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=pwfWEprgNs7eFJZRq+NogeX0j/DIUuhSXKJURjsxKQw=;
	b=JxGVJsy04PYLoLfRMBhri47uwTXvCVncvZSeQWQolZn8MmlAfi4OMfi9j9CTTaF44Xub
	 cFG5NkGv4rzsqams+zpId16d+jVVY3Z57zv8Ph4pfxvQgtbKXv/rdWTaBjasCe3FZI7Ig
	 TMCzTfe4Ul5jQHS9p7aZOd+4Smk1LL6sYmySvztrjbfDsva9/dxKsz9U9kVBc+n215Q+P
	 ++9VcAEDVZO9ZP6bWL8fL9WwcumPR0yh6xaf98csIhS3S6q20qeTLeB2Mlbn0knt/wHiJ
	 PP2JF/Mb5iQK3ytIXOX/VkwRUudnkutxTueuVyy6myeT1IPzu0D3L+6eoRr61V3e8eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=shmXjwFJ;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4EB606A320
	for <io-uring@vger.kernel.org>; Sun, 22 Nov 2026 13:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4EB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=shmXjwFJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795354254; x=1795613454;
	bh=pwfWEprgNs7eFJZRq+NogeX0j/DIUuhSXKJURjsxKQw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=shmXjwFJfVbZpSy6KJ/6ai9TNnVzThkIuK60z1XMYerw4P/59FOcrLUeOOuZPPQRK
	 O61qzrBIkiMoVYoYOGxXwrwGO6d8oLQT4QnUDuRBo0po7NboKuEIS7VMXOcHNq0Evc
	 R16rSJ4h/mVRcABCVcFxItkHAVMX264GAtN/clxkw4EVIvEulu9HX6Zq44o2aBYXcU
	 ftboy2bW5rSsCVhygD597Y9BVpYHIOiUxFkOxxArReCg9c/7xQghsJ5Qn+D/XIhZk5
	 FYNBmc1x8ClJtK1qxzQSzC3KW4aFjpQfRXmv/QP3EZETC6jqdvBBDuXOEFHmaDJiip
	 LII8AwrR1P8vg==
Date: Sun, 22 Nov 2026 13:30:50 +0000
To: Greg KH <gregkh@linuxfoundation.org>
From: Charles <srijaan@proton.me>
Cc: Jens Axboe <axboe@kernel.dk>, "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
Subject: Re: [BUG + PATCH] io_uring/rsrc: Page-level UAF via IORING_REGISTER_CLONE_BUFFERS on IO_REGBUF_F_KBUF buffers (+ vringh slow_copy OOB)
Message-ID: <EId43tY1y-P05sLvdH6roKq8lEP4Vi7UgmXvVUKIHkGCv3zAD2wMqLoJcTiFMGU0txHfJiAj3Ra1MQ6n8VddmgBZ7FYPwsoWQubLzKIOg1w=@proton.me>
In-Reply-To: <_fCYwLrqH3eCrdhdnhG_jWbqQCM98WLDAPjSUDvybghN1Zt9rVJY4Qq-sdJ3Gv-nwZ7E38Cp4GAfE6SQkqHEdIyi3IWrU6ulDban0e6JPqM=@proton.me>
References: <YM-SVvJpDZxNYESMMdnz-t8A2OWKzXnPtdbgqEfG0GVzAHaD9vN5nID1N35dyZGga5yc8LUdNHh_kNJmq5IxnSMeJhpa07ZNGKjwbW0JfvY=@proton.me> <2026112255-mooned-scotch-45b8@gregkh> <UAv5iL7TzydEOne6fkMoGjDD9QKLzmvtx6AA13trfoiYHFUvolV_EYYMFyswW641KRNlMGcv1WxmMklsV0MSADeGmREnZjLQsHte1vDdQCk=@proton.me> <2026112210-most-ripple-f0f2@gregkh> <_fCYwLrqH3eCrdhdnhG_jWbqQCM98WLDAPjSUDvybghN1Zt9rVJY4Qq-sdJ3Gv-nwZ7E38Cp4GAfE6SQkqHEdIyi3IWrU6ulDban0e6JPqM=@proton.me>
Feedback-ID: 193887875:user:proton
X-Pm-Message-ID: a15de02e8ee78b77c27a76d381db3343a4fcbde0
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Greg,

    My apologies for the oversight on maintainer routing and the incomplete=
 DCO identity.

    My full legal name is Srijan Mandal, and the updated Signed-off-by line=
 for this patch series is:
    Signed-off-by: Srijan Mandal <srijan@proton.me>

    I have CC'd Jens Axboe and the io-uring mailing list on this thread for=
 the io_uring/rsrc patch.

    Below is the standalone io_uring fix with the corrected DCO. The second=
 patch (vringh/vhost bounds check) is an independent issue in drivers/vhost=
; if preferred, I can break that out into a separate thread directed to Mic=
hael S. Tsirkin and virtualization@lists.linux.dev to keep subsystem thread=
s clean.

    ---
    From: Srijan Mandal <srijan@proton.me>
    Subject: [PATCH] io_uring/rsrc: reject IO_REGBUF_F_KBUF buffers in io_c=
lone_buffers()

    Kernel-registered request buffers initialized via io_kernel_buffer_init=
()
    carry the IO_REGBUF_F_KBUF flag and borrow struct page pointers tied to
    the lifetime of an in-flight kernel request (such as ublk zero-copy I/O=
).
    When the request finishes, io_buffer_unregister() removes the buffer fr=
om
    the owning ring and decrements imu->refs.

    Currently, io_clone_buffers() (IORING_REGISTER_CLONE_BUFFERS) does not
    reject IO_REGBUF_F_KBUF buffers. If user space clones an active
    IO_REGBUF_F_KBUF buffer into a second io_ring_ctx, imu->refs is
    incremented to 2. When io_buffer_unregister() subsequently runs on the
    source ring, refcount_dec_and_test(&imu->refs) drops the refcount from
    2 to 1, skips imu->release(), and returns 0 while the destination ring
    retains arbitrary read/write fixed-buffer access to the freed bio pages=
.

    Explicitly reject IO_REGBUF_F_KBUF in io_clone_buffers() with -EOPNOTSU=
PP.

    Fixes: 7cc2a6eadcd7 ("io_uring/rsrc: support cloning registered buffers=
")
    Signed-off-by: Srijan Mandal <srijan@proton.me>
    ---
     io_uring/rsrc.c | 4 ++++
     1 file changed, 4 insertions(+)

    diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
    index 1a2b3c4d5e6f..6f5e4d3c2b1a 100644
    --- a/io_uring/rsrc.c
    +++ b/io_uring/rsrc.c
    @@ -1521,6 +1521,10 @@ int io_clone_buffers(struct io_ring_ctx *ctx, vo=
id __user *argp)
             if (!src_node) {
                 dst_node =3D NULL;
             } else {
    +            if (src_node->buf->flags & IO_REGBUF_F_KBUF) {
    +                io_rsrc_data_free(ctx, &data);
    +                return -EOPNOTSUPP;
    +            }
                 /* we don't allow IOPOLL rw with dma-buf for now */
                 if ((src_node->buf->flags & IO_REGBUF_F_DMABUF) &&
                     (ctx->flags & IORING_SETUP_IOPOLL)) {
    --
    2.47.0

    Best regards,
    Srijan Mandal
