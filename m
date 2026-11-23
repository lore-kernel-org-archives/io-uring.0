Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470793;
	b=oR+YDY9X3bIQuj21ZiZ7Y/DtjAoQ1zYMBaA6MTM3qlXFztMVwAv9cn/14AFV3rvLv5vq
	 43az9ImIKTtdB+jfN7nS9TOGjg1gxwCP6dDWiFO9Hy8qXJS+vpqbfAI5TZ7Gr9F7JqPN8
	 O6ff75f+1Kt1K6JCRE/IPOMESu9hY8lROHYrKzuGl5Yo4Kei8GAIb5JvlHbiX/jiT+Cz8
	 EDBjG4dnpNCzlkPOc3bfbTNYwWXnbJ45H9kFZ5WReSF6QQqta6gTFKeBJ1y74HI/dCLNe
	 Hw6inV/6Hp2pdme4Si2gpc/E5atMxbiVQc/XBh5kWTAjTzMtmlvzfLqi9Tu7zM1+ICA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470793;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=uXHj/UOWRdc2LkIiSIX3unfL+gJHEogc1sHEiZrXKoc=;
	b=dVmvHvVhMH1XpvJzJODEZkQvl1B4BDwLEjVxJmj7WtHmFR7dXPrVt8tTlscle5lwCRzd
	 ejNKCydp2BIB+FNxIGdr/V3SxXZsUe/mgAKCLCI9cJw3tjrutLey9woionCokKt5T8/Ef
	 kg/h/RNTE6l2zfRrt3Zmglx5EdzZRd36kHMQ9ZU2t57GhTtNz9okyEc3NeXNsYsuDTuWj
	 0FDvw9lLb4yyG58NyOYAzQwG+Gt9aZ4eQlfilFwUz0E8dVMCFsijEqyAZ9WZqZAWi/VAg
	 PyqXINPwb3sXtA0REYcP8PNC5usyYZ0VBTKqTZaoenRYdm9qplgFog6HXP+IzitKkXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=AY2uXVe2;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B14D606A31E
	for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 21:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B14D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=AY2uXVe2
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJw6sY1921580
	for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 13:53:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=uXHj/UOWRdc2LkIiSIX3unfL+gJHEogc1sHEi
	ZrXKoc=; b=AY2uXVe2SrHTxQRB4WVbuh8puRMAooc8BqFiL1U6XRi4Qjo0a0OBx
	WsrBc/X4E9jpTo2e65wB0VxB7aFLiU5oXLxLEralMfmJ3+XG4NgEpFmwv1CpOuuF
	2CuUe29w2usmBMjGscklY5JHaV3z0OdG9pQZ2AmY2Wy/uxEI8WCKBw0b+P1HpckI
	/JMa1fKzfsb88vjAHVSJwGynaF9S50UEcdFHosVQ7MIuA96tpWNcIENp/0XrBPDg
	hRBiWMO0ZyYJYg0RAT36FxnWYNRTdlb49dWgkHCbnWKPcgeyDyxF6vfy8mEX5d9E
	Mj/0bqz0jJF6aeKj/r2iGDTkP+G/W3fcw==
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j40spgw3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 13:53:11 -0800 (PST)
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-499db0932f7so3976465e9.0
        for <io-uring@vger.kernel.org>; Mon, 23 Nov 2026 13:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470789; x=1796075589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXHj/UOWRdc2LkIiSIX3unfL+gJHEogc1sHEiZrXKoc=;
        b=QSlQyqvss+dWU2JkoFRGU9Xi9qZMINCkbT8E1v5Zqag79j/Kuk1g6y+zSu9VSKEw56
         z6+5AICVCcjYJB5LeHuVqhm8nb6+35swui5EE6tA8wsWYtkVd9b6asaKiDYt6d0TiH8j
         n1LTxQIaqD+m2pCOnNLA8oreyCUw8L0yS62kUqoQ+GyPlSfGdpSH1FTbttE0vVU1HYn+
         KezZ4R4m9sRoCK8VqaZCRSNSj8DD93D8yoOZ3UdC9GHPU7cwsGTrT6MMWLi/pxpFsKsW
         qmNDy+2heua/jy7Ns4y1ETN7ULTGOIl0BEFKgyPBrtikwa9v+iue0HrZauYO6c9iOPJk
         rEgA==
X-Gm-Message-State: APuU4Z8gLnnwADuPgn41CLeS9fqHb4ZS06JLltOL5N5jHpbVWHg7wKaI
	0AbvVwMSK5a6I53yTwoIvnm2GYqxS7j1RoQrb9ZwG/uOhwn3BAvdlMOj5j3QsHieytb/rg57W0n
	YxFuQduiBUONnMfy2fm0/2wxsHjyNlHyw7NULVGIU5V0+0BRESDZUAi6DLSQqzNjjKZmK4RUOJf
	jrCmsTMni86aUNn1gklRhXKjj0dQKLAoRwoOY4PQ==
X-Gm-Gg: AZFdTZcNfISllzJyIqLQewNXlfZVoZeTwUXMJYfcDso8FqOAuqXgK/1xrBQy5UuGH6V
	94NO3eC+cMZRBD1zUxzcF4R6TRh94Qu7mQ2Xf1cCCGTYLRIgzTDZf+gs5gThd/IEL1JilR0jARj
	4OMFtgwq940rgjsym9zre2nr4Lrr3kUzE7RMH226AEPj5XOT9vRUj6xCELUKBAURDkz+CdbMpGG
	qFA+Ihvfo5fOiHI2JyBDVN6Y2FYFW+mngvfzfnGEqlCy+M1XOWtMNJ+c5fuCqAjuMhdZGnbI5KN
	32ZB4ZeP0t7do936lFrt5+rv92/ZxWhM9n00R43Xhjb6ez5UD3aiNpWSKRuCNvvhwWo+oe4F4p3
	h6jRTTnjK2wkCZrL+NlGG6DX1fB04OnnJvaSyB3W+vykxIDJzJ5Pe3eyNpKPiNhV9nTstLOa++a
	NgRH4nT9S7Wqy3
X-Received: by 2002:a05:6000:2210:b0:4aa:8fc3:28fc with SMTP id ffacd0b85a97d-4abad0dedc8mr25762464f8f.1.1795470788589;
        Mon, 23 Nov 2026 13:53:08 -0800 (PST)
X-Received: by 2002:a05:6000:2210:b0:4aa:8fc3:28fc with SMTP id ffacd0b85a97d-4abad0dedc8mr25762435f8f.1.1795470787888;
        Mon, 23 Nov 2026 13:53:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:3f7b:7276:a343:d339? ([2a01:e0a:e17:9700:3f7b:7276:a343:d339])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm24260127f8f.49.2026.11.23.13.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:53:06 -0800 (PST)
Message-ID: <b42a576c-29ab-47c8-87f5-6d9fc8110bdd@meta.com>
Date: Mon, 23 Nov 2026 22:53:03 +0100
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
Subject: Re: [PATCH liburing 1/2] test: add recvmsg bundle test
To: io-uring@vger.kernel.org
Cc: Juanlu Herrero <jlhe0197@meta.com>, Jens Axboe <axboe@kernel.dk>
References: <20261123214924.921732-1-cleger@meta.com>
 <20261123214924.921732-2-cleger@meta.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
In-Reply-To: <20261123214924.921732-2-cleger@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: thJz0koY3mePoalpjP2Is_M3DU3YNrY2
X-Proofpoint-ORIG-GUID: thJz0koY3mePoalpjP2Is_M3DU3YNrY2
X-Authority-Analysis: v=2.4 cv=UbrE26SN c=1 sm=1 tr=0 ts=6b04b5c7 cx=c_pps
 a=ocXdEHcuFBd2kx0v6vcWqw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=_1IyUuN4QrATX339ibzo:22 a=VabnemYjAAAA:8
 a=J1n9JPYDoK1sqj4VpLcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XRP02QYyWapGEjE7oHHB:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX6iWq40eUBDmF
 47e+rXBHgli8RZDjCdQoWE8Be1ww3C67Be/1wPWlWaYxqVGOovu/1MkmUom/NN+letXo9Di1y1f
 zE7lhQ7Dpay6wWvuPP4rhewk8Y3igO4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX7WgkXlHdeejL
 MFaTnCKulVl/lZsWzPqrvaVcgSoKX2hSQ4fp57VWvkLGyYKrd62CU4uuLqYdiyynW4hgR8K6MVa
 ZYgZPUW+se/AgIkDbzCb9KtehKD0EbWYZwWgCIEBYfykJ8xtrETEBDoNut7gJVj4DYjNybeqT6m
 Qdoc9pAw3K9x2ZJLz4CMM9Of7q9stf5rKwAYHUyDefqKmePzq9fq8Usl1C4qO8uEBZ87krVOiKs
 MfTUOxmi2Fg9ZP1Mn52UbnaLxWtF1MeOz6xusflnngr5JG9rKiwyLYBOQZyEeRpix991CNf+vi3
 Omsl+SVR3p5SLpies4tpbMpp7QYP89gEXhcAWgI7WgElDOxAYQWdwz5Bsa9sxelSzGe2yM9bY+z
 nyYLKts2/LCkFw/TpymY3tO1/dAYzY4t+lne4THgl2Wlzn7GLbo+OsXGkwiFeJmYn+3361nFfEo
 smImqX74XjvLdqHFQ5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01

Hi Jens,

This commit being quite lengthy (to say the least), LMK if you want it 
to be split in small ones adding individual tests.

Thanks,

Clément

On 11/23/26 22:48, Clément Léger wrote:
> Add a test for IORING_OP_RECVMSG with IORING_RECVSEND_BUNDLE, for both
> multishot and single shot requests. It checks buffer accounting with
> legacy, ring and incremental provided buffers over UDP and TCP, and is
> skipped on kernels without bundle support for recvmsg.
> 
> Signed-off-by: Clément Léger <cleger@meta.com>
> ---
>   test/Makefile         |    1 +
>   test/recvmsg-bundle.c | 1313 +++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 1314 insertions(+)
>   create mode 100644 test/recvmsg-bundle.c
> 
> diff --git a/test/Makefile b/test/Makefile
> index 8771aa50..672ee699 100644
> --- a/test/Makefile
> +++ b/test/Makefile
> @@ -229,6 +229,7 @@ test_srcs := \
>   	recv-mshot-drain.c \
>   	recv-mshot-fair.c \
>   	recv-multishot.c \
> +	recvmsg-bundle.c \
>   	recvmsg-inc-tail.c \
>   	reg-fd-only.c \
>   	reg-hint.c \
> diff --git a/test/recvmsg-bundle.c b/test/recvmsg-bundle.c
> new file mode 100644
> index 00000000..8cd7d423
> --- /dev/null
> +++ b/test/recvmsg-bundle.c
> @@ -0,0 +1,1313 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Description: Test multishot and single shot IORING_OP_RECVMSG with
> + *		IORING_RECVSEND_BUNDLE.
> + */
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <sys/socket.h>
> +#include <netinet/in.h>
> +
> +#include "liburing.h"
> +#include "helpers.h"
> +
> +#define BGID		1
> +#define NR_BUFS		8
> +#define BUF_SIZE	256
> +#define BUNDLE_BUFS	3
> +#define SMALL_PAYLOAD	32
> +#define CMSG_BUF	128
> +#define QD		8
> +
> +/*
> + * Without a size hint, the first stream completion maps a single buffer. The
> + * msg_inq it reports then sizes the next selection to the tail, which spans
> + * STREAM_TAIL_BUFS buffers.
> + */
> +#define STREAM_TAIL_BUFS	10
> +#define STREAM_NR_BUFS		16
> +#define STREAM_BUF_SIZE		64
> +
> +enum {
> +	SETUP_CMSG	= 1U << 0,
> +	SETUP_CLASSIC	= 1U << 1,
> +	SETUP_STREAM	= 1U << 2,
> +	SETUP_MIN_LEFT	= 1U << 3,
> +};
> +
> +/* retire incremental buffer tails too small for a UDP envelope without cmsg */
> +#define INC_MIN_LEFT	(sizeof(struct io_uring_recvmsg_out) + \
> +			 sizeof(struct sockaddr_in))
> +
> +struct test_ctx {
> +	struct io_uring ring;
> +	bool ring_ready;
> +	struct io_uring_buf_ring *br;
> +	unsigned int nr_bufs;
> +	size_t buf_size;
> +	unsigned char *bufs;
> +	int fds[2];
> +	struct msghdr msg;
> +	struct iovec iov;
> +	unsigned char control[CMSG_BUF];
> +	size_t hdr_len;
> +	unsigned int msg_flags;
> +};
> +
> +struct step {
> +	size_t send_len;	/* length of the datagram sent */
> +	unsigned int bid;	/* expected first buffer of the completion */
> +	size_t len;		/* expected payload length */
> +	bool expect_more;
> +	bool expect_trunc;
> +	size_t buf_off;		/* expected envelope offset */
> +	bool expect_buf_more;	/* last buffer partially used */
> +};
> +
> +static unsigned char *buf_addr(struct test_ctx *ctx, unsigned int bid)
> +{
> +	return ctx->bufs + bid * ctx->buf_size;
> +}
> +
> +/* pos is the position of the byte within the sent stream */
> +static unsigned char pattern(unsigned int seed, size_t pos)
> +{
> +	return (seed * 31 + pos * 7) & 0xff;
> +}
> +
> +static void cleanup(struct test_ctx *ctx)
> +{
> +	if (ctx->fds[0] >= 0)
> +		close(ctx->fds[0]);
> +	if (ctx->fds[1] >= 0)
> +		close(ctx->fds[1]);
> +	if (ctx->br)
> +		io_uring_free_buf_ring(&ctx->ring, ctx->br, ctx->nr_bufs, BGID);
> +	free(ctx->bufs);
> +	if (ctx->ring_ready)
> +		io_uring_queue_exit(&ctx->ring);
> +}
> +
> +static int provide_classic_buffers(struct test_ctx *ctx)
> +{
> +	struct io_uring_cqe *cqe;
> +	struct io_uring_sqe *sqe;
> +	int ret;
> +
> +	sqe = io_uring_get_sqe(&ctx->ring);
> +	io_uring_prep_provide_buffers(sqe, ctx->bufs, ctx->buf_size,
> +				      ctx->nr_bufs, BGID, 0);
> +	if (t_submit_and_wait_single(&ctx->ring, &cqe))
> +		return T_EXIT_FAIL;
> +	ret = cqe->res;
> +	io_uring_cqe_seen(&ctx->ring, cqe);
> +	if (ret) {
> +		fprintf(stderr, "provide buffers fail: %d\n", ret);
> +		return T_EXIT_FAIL;
> +	}
> +	return T_EXIT_PASS;
> +}
> +
> +static int setup(struct test_ctx *ctx, size_t cap_len,
> +		 unsigned int ring_flags, unsigned int flags)
> +{
> +	struct io_uring_params params = { };
> +	unsigned int i;
> +	int mask, ret;
> +
> +	memset(ctx, 0, sizeof(*ctx));
> +	ctx->fds[0] = ctx->fds[1] = -1;
> +	ctx->nr_bufs = NR_BUFS;
> +	ctx->buf_size = BUF_SIZE;
> +	if (flags & SETUP_STREAM) {
> +		ctx->nr_bufs = STREAM_NR_BUFS;
> +		ctx->buf_size = STREAM_BUF_SIZE;
> +	}
> +
> +	ret = io_uring_queue_init_params(QD, &ctx->ring, &params);
> +	if (ret) {
> +		fprintf(stderr, "queue init: %d\n", ret);
> +		return T_EXIT_FAIL;
> +	}
> +	ctx->ring_ready = true;
> +	if (!(params.features & IORING_FEAT_RECVSEND_BUNDLE))
> +		return T_EXIT_SKIP;
> +
> +	ctx->bufs = t_calloc(ctx->nr_bufs, ctx->buf_size);
> +
> +	if (flags & SETUP_CLASSIC) {
> +		ret = provide_classic_buffers(ctx);
> +		if (ret != T_EXIT_PASS)
> +			return ret;
> +	} else {
> +		if (flags & SETUP_MIN_LEFT) {
> +			struct io_uring_buf_reg reg = {
> +				.ring_entries = ctx->nr_bufs,
> +				.bgid = BGID,
> +				.flags = ring_flags,
> +				.min_left = INC_MIN_LEFT,
> +			};
> +
> +			ctx->br = io_uring_setup_buf_ring_param(&ctx->ring,
> +								&reg, &ret);
> +		} else {
> +			ctx->br = io_uring_setup_buf_ring(&ctx->ring,
> +							  ctx->nr_bufs, BGID,
> +							  ring_flags, &ret);
> +		}
> +		if (!ctx->br) {
> +			if (ret == -EINVAL)
> +				return T_EXIT_SKIP;
> +			fprintf(stderr, "buffer ring setup: %d\n", ret);
> +			return T_EXIT_FAIL;
> +		}
> +		mask = io_uring_buf_ring_mask(ctx->nr_bufs);
> +		for (i = 0; i < ctx->nr_bufs; i++)
> +			io_uring_buf_ring_add(ctx->br, buf_addr(ctx, i),
> +					      ctx->buf_size, i, mask, i);
> +		io_uring_buf_ring_advance(ctx->br, ctx->nr_bufs);
> +	}
> +
> +	ret = t_create_socket_pair(ctx->fds, flags & SETUP_STREAM);
> +	if (ret) {
> +		fprintf(stderr, "socket pair: %d\n", ret);
> +		return T_EXIT_FAIL;
> +	}
> +
> +	if (flags & SETUP_CMSG) {
> +		int val = 1;
> +
> +		if (setsockopt(ctx->fds[0], IPPROTO_IP, IP_RECVORIGDSTADDR,
> +			       &val, sizeof(val))) {
> +			perror("setsockopt");
> +			return T_EXIT_FAIL;
> +		}
> +		ctx->msg.msg_control = ctx->control;
> +		ctx->msg.msg_controllen = sizeof(ctx->control);
> +	}
> +	/* with buffer select, only the iov length is used as a size hint */
> +	if (cap_len) {
> +		ctx->iov.iov_base = NULL;
> +		ctx->iov.iov_len = cap_len;
> +		ctx->msg.msg_iov = &ctx->iov;
> +		ctx->msg.msg_iovlen = 1;
> +	}
> +	/* a connected TCP socket doesn't report the source address */
> +	if (!(flags & SETUP_STREAM))
> +		ctx->msg.msg_namelen = sizeof(struct sockaddr_in);
> +	ctx->hdr_len = sizeof(struct io_uring_recvmsg_out) +
> +		       ctx->msg.msg_namelen + ctx->msg.msg_controllen;
> +	return T_EXIT_PASS;
> +}
> +
> +/*
> + * Payload filling nr_bufs - 1 whole buffers, which must consume nr_bufs
> + * once the envelope is reserved in the first one. As the envelope is larger
> + * than half a buffer, ignoring it consumes one buffer less and counting it
> + * as payload one more.
> + */
> +static size_t span_payload(struct test_ctx *ctx, unsigned int nr_bufs)
> +{
> +	return (nr_bufs - 1) * ctx->buf_size;
> +}
> +
> +static int send_payload(struct test_ctx *ctx, size_t len, unsigned int seed,
> +			size_t off)
> +{
> +	unsigned char *payload;
> +	size_t i;
> +	ssize_t ret;
> +
> +	payload = t_malloc(len ? len : 1);
> +	for (i = 0; i < len; i++)
> +		payload[i] = pattern(seed, off + i);
> +
> +	ret = send(ctx->fds[1], payload, len, 0);
> +	free(payload);
> +	if (ret != (ssize_t) len) {
> +		perror("send");
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +static int submit_bundle(struct test_ctx *ctx, bool multishot)
> +{
> +	struct io_uring_sqe *sqe = io_uring_get_sqe(&ctx->ring);
> +
> +	if (multishot)
> +		io_uring_prep_recvmsg_multishot(sqe, ctx->fds[0], &ctx->msg,
> +						ctx->msg_flags);
> +	else
> +		io_uring_prep_recvmsg(sqe, ctx->fds[0], &ctx->msg,
> +				      ctx->msg_flags);
> +	sqe->ioprio |= IORING_RECVSEND_BUNDLE;
> +	sqe->flags |= IOSQE_BUFFER_SELECT;
> +	sqe->buf_group = BGID;
> +	if (io_uring_submit(&ctx->ring) != 1) {
> +		fprintf(stderr, "submit failed\n");
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +/* check addr against the local address of fd */
> +static int verify_addr(int fd, struct sockaddr_in *addr, const char *what)
> +{
> +	struct sockaddr_in local;
> +	socklen_t local_len = sizeof(local);
> +
> +	if (getsockname(fd, (struct sockaddr *) &local, &local_len)) {
> +		perror("getsockname");
> +		return 1;
> +	}
> +	if (addr->sin_family != local.sin_family ||
> +	    addr->sin_port != local.sin_port ||
> +	    addr->sin_addr.s_addr != local.sin_addr.s_addr) {
> +		fprintf(stderr, "unexpected %s address\n", what);
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +/* without an envelope (out is NULL), the cmsg is in the msghdr */
> +static int verify_cmsg(struct test_ctx *ctx, struct io_uring_recvmsg_out *out)
> +{
> +	struct cmsghdr *cmsg, *next;
> +
> +	if (out)
> +		cmsg = io_uring_recvmsg_cmsg_firsthdr(out, &ctx->msg);
> +	else
> +		cmsg = CMSG_FIRSTHDR(&ctx->msg);
> +	if (!cmsg || cmsg->cmsg_level != IPPROTO_IP ||
> +	    cmsg->cmsg_type != IP_RECVORIGDSTADDR ||
> +	    cmsg->cmsg_len != CMSG_LEN(sizeof(struct sockaddr_in))) {
> +		fprintf(stderr, "bad cmsg\n");
> +		return 1;
> +	}
> +	if (verify_addr(ctx->fds[0], (struct sockaddr_in *) CMSG_DATA(cmsg),
> +			"cmsg destination"))
> +		return 1;
> +	if (out)
> +		next = io_uring_recvmsg_cmsg_nexthdr(out, &ctx->msg, cmsg);
> +	else
> +		next = CMSG_NXTHDR(&ctx->msg, cmsg);
> +	if (next) {
> +		fprintf(stderr, "unexpected extra cmsg\n");
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +static int verify_name(struct test_ctx *ctx, struct sockaddr_in *name)
> +{
> +	return verify_addr(ctx->fds[1], name, "sender");
> +}
> +
> +/* check len bytes stored from offset in buffer first_bid onwards */
> +static int verify_data(struct test_ctx *ctx, unsigned int first_bid,
> +		       size_t offset, size_t len, unsigned int seed, size_t off)
> +{
> +	size_t copied = 0;
> +	unsigned int i;
> +
> +	for (i = 0; copied < len; i++) {
> +		unsigned char *data = buf_addr(ctx, first_bid + i) + offset;
> +		size_t chunk = ctx->buf_size - offset;
> +		size_t byte;
> +
> +		if (chunk > len - copied)
> +			chunk = len - copied;
> +		for (byte = 0; byte < chunk; byte++) {
> +			size_t pos = off + copied + byte;
> +
> +			if (data[byte] != pattern(seed, pos)) {
> +				fprintf(stderr, "payload mismatch at %zu\n",
> +					copied + byte);
> +				return 1;
> +			}
> +		}
> +		copied += chunk;
> +		offset = 0;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * payload_len bytes are stored, while the envelope reports reported_len, which
> + * is the full datagram length when MSG_TRUNC is passed.
> + */
> +static int verify_payload(struct test_ctx *ctx, unsigned int first_bid,
> +			  size_t buf_off, size_t payload_len,
> +			  size_t reported_len, unsigned int seed, size_t off,
> +			  bool expect_trunc)
> +{
> +	struct io_uring_recvmsg_out *out;
> +	unsigned char *payload;
> +	size_t expect_controllen = 0;
> +
> +	out = (struct io_uring_recvmsg_out *) (buf_addr(ctx, first_bid) +
> +					       buf_off);
> +	if (ctx->msg.msg_controllen)
> +		expect_controllen = CMSG_LEN(sizeof(struct sockaddr_in));
> +	if (out->payloadlen != reported_len ||
> +	    out->namelen != ctx->msg.msg_namelen ||
> +	    out->controllen != expect_controllen) {
> +		fprintf(stderr, "payload/name/control length %u/%u/%u, expected "
> +			"%zu/%u/%zu\n", out->payloadlen, out->namelen,
> +			out->controllen, reported_len,
> +			ctx->msg.msg_namelen, expect_controllen);
> +		return 1;
> +	}
> +	if (!!(out->flags & MSG_TRUNC) != expect_trunc) {
> +		fprintf(stderr, "unexpected truncation flag 0x%x\n", out->flags);
> +		return 1;
> +	}
> +	if (ctx->msg.msg_namelen &&
> +	    verify_name(ctx, io_uring_recvmsg_name(out)))
> +		return 1;
> +	if (ctx->msg.msg_controllen && verify_cmsg(ctx, out))
> +		return 1;
> +
> +	payload = io_uring_recvmsg_payload(out, &ctx->msg);
> +	return verify_data(ctx, first_bid, payload - buf_addr(ctx, first_bid),
> +			   payload_len, seed, off);
> +}
> +
> +/*
> + * Kernels without recvmsg bundle support fail the first completion with
> + * -EINVAL. Once a completion of the multishot or oneshot variant succeeded,
> + * the variant is supported and -EINVAL is a failure.
> + */
> +static bool mshot_supported, oneshot_supported;
> +
> +static int wait_bundle_cqe(struct test_ctx *ctx, struct io_uring_cqe **cqe,
> +			   bool allow_unsupported)
> +{
> +	struct __kernel_timespec timeout = { .tv_sec = 2 };
> +	int ret;
> +
> +	ret = io_uring_wait_cqe_timeout(&ctx->ring, cqe, &timeout);
> +	if (ret) {
> +		fprintf(stderr, "wait cqe: %d\n", ret);
> +		return T_EXIT_FAIL;
> +	}
> +	if (allow_unsupported && (*cqe)->res == -EINVAL) {
> +		io_uring_cqe_seen(&ctx->ring, *cqe);
> +		return T_EXIT_SKIP;
> +	}
> +	return T_EXIT_PASS;
> +}
> +
> +static int reap_step(struct test_ctx *ctx, const struct step *step,
> +		     unsigned int seed, size_t off, bool allow_unsupported)
> +{
> +	struct io_uring_recvmsg_out *out;
> +	struct io_uring_cqe *cqe;
> +	unsigned int bid;
> +	bool more;
> +	int ret;
> +
> +	ret = wait_bundle_cqe(ctx, &cqe, allow_unsupported && !mshot_supported);
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +	ret = T_EXIT_FAIL;
> +	if (cqe->res != (int) (ctx->hdr_len + step->len)) {
> +		fprintf(stderr, "cqe res %d, expected %zu\n", cqe->res,
> +			ctx->hdr_len + step->len);
> +		goto out;
> +	}
> +	more = cqe->flags & IORING_CQE_F_MORE;
> +	if (!(cqe->flags & IORING_CQE_F_BUFFER) || more != step->expect_more ||
> +	    !!(cqe->flags & IORING_CQE_F_BUF_MORE) != step->expect_buf_more) {
> +		fprintf(stderr, "bad cqe flags 0x%x\n", cqe->flags);
> +		goto out;
> +	}
> +	mshot_supported = true;
> +	bid = cqe->flags >> IORING_CQE_BUFFER_SHIFT;
> +	if (bid != step->bid) {
> +		fprintf(stderr, "buffer id %u, expected %u\n", bid, step->bid);
> +		goto out;
> +	}
> +	out = io_uring_recvmsg_validate(buf_addr(ctx, bid) + step->buf_off,
> +					cqe->res, &ctx->msg);
> +	if (!out) {
> +		fprintf(stderr, "invalid recvmsg envelope\n");
> +		goto out;
> +	}
> +	if (verify_payload(ctx, bid, step->buf_off, step->len,
> +			   ctx->msg_flags & MSG_TRUNC ? step->send_len :
> +							step->len,
> +			   seed, off, step->expect_trunc))
> +		goto out;
> +	ret = T_EXIT_PASS;
> +out:
> +	io_uring_cqe_seen(&ctx->ring, cqe);
> +	return ret;
> +}
> +
> +/* EOF carries an empty envelope and ends the request */
> +static int reap_eof(struct test_ctx *ctx, unsigned int bid)
> +{
> +	const struct step step = { 0, bid, 0, false, false, 0, false };
> +
> +	if (shutdown(ctx->fds[1], SHUT_WR)) {
> +		perror("shutdown");
> +		return T_EXIT_FAIL;
> +	}
> +	return reap_step(ctx, &step, 1, 0, false);
> +}
> +
> +static const char *status_str(int ret)
> +{
> +	return ret == T_EXIT_SKIP ? "unsupported" : "failed";
> +}
> +
> +/* send one datagram per step, arm the request, then reap each completion */
> +static int run_steps(struct test_ctx *ctx, const char *variant,
> +		     const struct step *steps, unsigned int nr_steps,
> +		     bool first_may_skip)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < nr_steps; i++) {
> +		if (send_payload(ctx, steps[i].send_len, i + 1, 0))
> +			return T_EXIT_FAIL;
> +	}
> +	if (submit_bundle(ctx, true))
> +		return T_EXIT_FAIL;
> +	for (i = 0; i < nr_steps; i++) {
> +		ret = reap_step(ctx, &steps[i], i + 1, 0, first_may_skip && !i);
> +		if (ret != T_EXIT_PASS) {
> +			fprintf(stderr, "%s: datagram %u %s\n", variant, i,
> +				status_str(ret));
> +			return ret;
> +		}
> +	}
> +	return T_EXIT_PASS;
> +}
> +
> +/* arm a multishot request, which must fail with expected */
> +static int expect_error(struct test_ctx *ctx, const char *variant, int expected)
> +{
> +	struct io_uring_cqe *cqe;
> +	int ret;
> +
> +	if (submit_bundle(ctx, true) ||
> +	    wait_bundle_cqe(ctx, &cqe, false) != T_EXIT_PASS)
> +		return T_EXIT_FAIL;
> +	ret = cqe->res;
> +	io_uring_cqe_seen(&ctx->ring, cqe);
> +	if (ret == expected)
> +		return T_EXIT_PASS;
> +	fprintf(stderr, "%s: res %d, expected %d\n", variant, ret, expected);
> +	return T_EXIT_FAIL;
> +}
> +
> +/*
> + * Without multishot, the completion only carries the payload, starting at
> + * buf_off in the first buffer, and an empty receive consumes no buffer.
> + */
> +static int reap_oneshot(struct test_ctx *ctx, const struct step *step,
> +			unsigned int seed, size_t off, bool allow_unsupported)
> +{
> +	struct io_uring_cqe *cqe;
> +	unsigned int bid;
> +	int ret;
> +
> +	ret = wait_bundle_cqe(ctx, &cqe,
> +			      allow_unsupported && !oneshot_supported);
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +	ret = T_EXIT_FAIL;
> +	if (cqe->res != (int) step->len) {
> +		fprintf(stderr, "cqe res %d, expected %zu\n", cqe->res,
> +			step->len);
> +		goto out;
> +	}
> +	if (!!(cqe->flags & IORING_CQE_F_BUFFER) != !!step->len ||
> +	    cqe->flags & IORING_CQE_F_MORE ||
> +	    !!(cqe->flags & IORING_CQE_F_BUF_MORE) != step->expect_buf_more) {
> +		fprintf(stderr, "bad cqe flags 0x%x\n", cqe->flags);
> +		goto out;
> +	}
> +	oneshot_supported = true;
> +	if (!step->len) {
> +		ret = T_EXIT_PASS;
> +		goto out;
> +	}
> +	bid = cqe->flags >> IORING_CQE_BUFFER_SHIFT;
> +	if (bid != step->bid) {
> +		fprintf(stderr, "buffer id %u, expected %u\n", bid, step->bid);
> +		goto out;
> +	}
> +	if (!!(ctx->msg.msg_flags & MSG_TRUNC) != step->expect_trunc) {
> +		fprintf(stderr, "unexpected msg flags 0x%x\n",
> +			ctx->msg.msg_flags);
> +		goto out;
> +	}
> +	if (ctx->msg.msg_name &&
> +	    (ctx->msg.msg_namelen != sizeof(struct sockaddr_in) ||
> +	     verify_name(ctx, ctx->msg.msg_name)))
> +		goto out;
> +	if (ctx->msg.msg_control && verify_cmsg(ctx, NULL))
> +		goto out;
> +	if (verify_data(ctx, bid, step->buf_off, step->len, seed, off))
> +		goto out;
> +	ret = T_EXIT_PASS;
> +out:
> +	io_uring_cqe_seen(&ctx->ring, cqe);
> +	return ret;
> +}
> +
> +/* send one datagram per step, then receive it with a oneshot request */
> +static int run_oneshot(struct test_ctx *ctx, const char *variant,
> +		       const struct step *steps, unsigned int nr_steps)
> +{
> +	/* the kernel writes the lengths it used back to the msghdr */
> +	socklen_t namelen = ctx->msg.msg_namelen;
> +	size_t controllen = ctx->msg.msg_controllen;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < nr_steps; i++) {
> +		ctx->msg.msg_namelen = namelen;
> +		ctx->msg.msg_controllen = controllen;
> +		if (send_payload(ctx, steps[i].send_len, i + 1, 0) ||
> +		    submit_bundle(ctx, false))
> +			return T_EXIT_FAIL;
> +		ret = reap_oneshot(ctx, &steps[i], i + 1, 0, !i);
> +		if (ret != T_EXIT_PASS) {
> +			fprintf(stderr, "%s: datagram %u %s\n", variant, i,
> +				status_str(ret));
> +			return ret;
> +		}
> +	}
> +	return T_EXIT_PASS;
> +}
> +
> +static int test_udp_unsized(void)
> +{
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, 0, 0, SETUP_CMSG);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	/*
> +	 * Without an iov length there is no size hint for a datagram, so the
> +	 * selection is the same as for recv bundles without a length, which
> +	 * on a fresh ring is a single buffer, truncating datagrams that span
> +	 * more.
> +	 */
> +	{
> +		const struct step steps[] = {
> +			{ span_payload(&ctx, BUNDLE_BUFS), 0,
> +			  BUF_SIZE - ctx.hdr_len, true, true, 0, false },
> +			{ 0, 1, 0, false, false, 0, false },
> +		};
> +
> +		ret = run_steps(&ctx, "udp unsized", steps, ARRAY_SIZE(steps),
> +				true);
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_udp(void)
> +{
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, NR_BUFS * BUF_SIZE, 0, SETUP_CMSG);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	/*
> +	 * The iov length covers the whole ring, so all buffers are mapped but
> +	 * only the consumed ones are committed, which must keep the request
> +	 * armed.
> +	 */
> +	{
> +		const struct step steps[] = {
> +			{ span_payload(&ctx, BUNDLE_BUFS), 0,
> +			  span_payload(&ctx, BUNDLE_BUFS), true, false,
> +			  0, false },
> +			{ 0, BUNDLE_BUFS, 0, false, false, 0, false },
> +		};
> +
> +		ret = run_steps(&ctx, "udp", steps, ARRAY_SIZE(steps), true);
> +		if (ret != T_EXIT_PASS)
> +			goto out;
> +	}
> +	/* consuming all remaining buffers ends the request */
> +	{
> +		const unsigned int left = NR_BUFS - BUNDLE_BUFS - 1;
> +		const struct step steps[] = {
> +			{ span_payload(&ctx, left), BUNDLE_BUFS + 1,
> +			  span_payload(&ctx, left), false, false, 0, false },
> +		};
> +
> +		ret = run_steps(&ctx, "udp drain", steps, ARRAY_SIZE(steps),
> +				false);
> +		if (ret != T_EXIT_PASS)
> +			goto out;
> +	}
> +	ret = expect_error(&ctx, "udp empty ring", -ENOBUFS);
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_capped(void)
> +{
> +	struct test_ctx ctx;
> +	size_t trunc_payload;
> +	int ret;
> +
> +	ret = setup(&ctx, 2 * BUF_SIZE, 0, 0);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	/*
> +	 * The iov length caps the selection, truncating the datagrams, and
> +	 * keeps doing so for every completion of the multishot request.
> +	 */
> +	trunc_payload = 2 * BUF_SIZE - ctx.hdr_len;
> +	{
> +		const struct step steps[] = {
> +			{ trunc_payload + SMALL_PAYLOAD, 0, trunc_payload,
> +			  true, true, 0, false },
> +			{ trunc_payload + SMALL_PAYLOAD, 2, trunc_payload,
> +			  true, true, 0, false },
> +			{ 0, 4, 0, false, false, 0, false },
> +		};
> +
> +		ret = run_steps(&ctx, "capped", steps, ARRAY_SIZE(steps), true);
> +		if (ret != T_EXIT_PASS)
> +			goto out;
> +	}
> +
> +	/*
> +	 * A cap below the buffer size maps part of a single buffer. Losing it
> +	 * after the first completion would map the whole buffer for the next
> +	 * datagram, which would then not be truncated.
> +	 */
> +	ctx.iov.iov_len = BUF_SIZE / 2;
> +	trunc_payload = BUF_SIZE / 2 - ctx.hdr_len;
> +	{
> +		const struct step steps[] = {
> +			{ BUF_SIZE / 2, 5, trunc_payload, true, true,
> +			  0, false },
> +			{ BUF_SIZE / 2, 6, trunc_payload, true, true,
> +			  0, false },
> +			{ 0, 7, 0, false, false, 0, false },
> +		};
> +
> +		ret = run_steps(&ctx, "capped partial", steps,
> +				ARRAY_SIZE(steps), false);
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_trunc_flag(void)
> +{
> +	struct test_ctx ctx;
> +	size_t trunc_payload;
> +	int ret;
> +
> +	ret = setup(&ctx, 2 * BUF_SIZE, 0, 0);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	/*
> +	 * With MSG_TRUNC, the envelope reports the full datagram length while
> +	 * the completion and the buffers only account for the stored part.
> +	 */
> +	ctx.msg_flags = MSG_TRUNC;
> +	trunc_payload = 2 * BUF_SIZE - ctx.hdr_len;
> +	{
> +		const struct step steps[] = {
> +			{ trunc_payload + SMALL_PAYLOAD, 0, trunc_payload,
> +			  true, true, 0, false },
> +			{ SMALL_PAYLOAD, 2, SMALL_PAYLOAD, true, false,
> +			  0, false },
> +			{ 0, 3, 0, false, false, 0, false },
> +		};
> +
> +		ret = run_steps(&ctx, "trunc flag", steps, ARRAY_SIZE(steps),
> +				true);
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_envelope_fill(void)
> +{
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, 3 * BUF_SIZE, 0, SETUP_CMSG);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	/*
> +	 * Size the cmsg area so that the envelope fills the whole first
> +	 * buffer. The payload then starts at the beginning of the next one.
> +	 */
> +	ctx.msg.msg_controllen = BUF_SIZE - ctx.msg.msg_namelen -
> +				 sizeof(struct io_uring_recvmsg_out);
> +	ctx.hdr_len = BUF_SIZE;
> +	{
> +		const struct step steps[] = {
> +			{ BUF_SIZE + SMALL_PAYLOAD, 0, BUF_SIZE + SMALL_PAYLOAD,
> +			  true, false, 0, false },
> +			{ 0, 3, 0, false, false, 0, false },
> +		};
> +
> +		ret = run_steps(&ctx, "envelope fill", steps,
> +				ARRAY_SIZE(steps), true);
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_classic(void)
> +{
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, 0, 0, SETUP_CLASSIC);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	/* legacy provided buffers only map one buffer per completion */
> +	{
> +		const struct step steps[] = {
> +			{ BUF_SIZE, 0, BUF_SIZE - ctx.hdr_len, true, true,
> +			  0, false },
> +			{ 0, 1, 0, false, false, 0, false },
> +		};
> +
> +		ret = run_steps(&ctx, "classic", steps, ARRAY_SIZE(steps),
> +				true);
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_tcp(void)
> +{
> +	unsigned char stale_buf[SMALL_PAYLOAD];
> +	size_t first_payload, tail_payload;
> +	struct msghdr stale_msg = { };
> +	struct io_uring_cqe *cqe;
> +	struct io_uring_sqe *sqe;
> +	struct iovec stale_iov;
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, 0, 0, SETUP_STREAM);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +	ret = T_EXIT_FAIL;
> +
> +	first_payload = STREAM_BUF_SIZE - ctx.hdr_len;
> +	tail_payload = STREAM_TAIL_BUFS * STREAM_BUF_SIZE - ctx.hdr_len;
> +
> +	/*
> +	 * A plain recvmsg leaving data queued records it in msg_inq of its
> +	 * async msghdr, which is then recycled for the bundle recvmsg. That
> +	 * stale hint covers all the queued data and must not size the first
> +	 * selection, which maps a single buffer.
> +	 */
> +	if (send_payload(&ctx, SMALL_PAYLOAD + first_payload + tail_payload,
> +			 1, 0))
> +		goto out;
> +	stale_iov.iov_base = stale_buf;
> +	stale_iov.iov_len = sizeof(stale_buf);
> +	stale_msg.msg_iov = &stale_iov;
> +	stale_msg.msg_iovlen = 1;
> +	sqe = io_uring_get_sqe(&ctx.ring);
> +	io_uring_prep_recvmsg(sqe, ctx.fds[0], &stale_msg, 0);
> +	if (t_submit_and_wait_single(&ctx.ring, &cqe))
> +		goto out;
> +	ret = cqe->res;
> +	io_uring_cqe_seen(&ctx.ring, cqe);
> +	if (ret != SMALL_PAYLOAD) {
> +		fprintf(stderr, "tcp: plain recvmsg %d\n", ret);
> +		ret = T_EXIT_FAIL;
> +		goto out;
> +	}
> +
> +	ret = T_EXIT_FAIL;
> +	if (submit_bundle(&ctx, true))
> +		goto out;
> +	{
> +		const struct step steps[] = {
> +			/*
> +			 * The buffer is filled with data left, yet no second
> +			 * envelope may be appended to the completion.
> +			 */
> +			{ 0, 0, first_payload, true, false, 0, false },
> +			/* msg_inq sizes the selection to the whole tail */
> +			{ 0, 1, tail_payload, true, false, 0, false },
> +		};
> +
> +		ret = reap_step(&ctx, &steps[0], 1, SMALL_PAYLOAD, true);
> +		if (ret == T_EXIT_PASS)
> +			ret = reap_step(&ctx, &steps[1], 1,
> +					SMALL_PAYLOAD + first_payload, false);
> +		if (ret == T_EXIT_PASS)
> +			ret = reap_eof(&ctx, 1 + STREAM_TAIL_BUFS);
> +		if (ret != T_EXIT_PASS)
> +			fprintf(stderr, "tcp: %s\n", status_str(ret));
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_tcp_capped(void)
> +{
> +	const unsigned int nr_completions = 3;
> +	struct test_ctx ctx;
> +	size_t payload;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = setup(&ctx, 2 * STREAM_BUF_SIZE, 0, SETUP_STREAM);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +	ret = T_EXIT_FAIL;
> +
> +	/*
> +	 * The iov length takes precedence over msg_inq, so every completion
> +	 * maps two buffers although more data is queued.
> +	 */
> +	payload = 2 * STREAM_BUF_SIZE - ctx.hdr_len;
> +	if (send_payload(&ctx, nr_completions * payload, 1, 0) ||
> +	    submit_bundle(&ctx, true))
> +		goto out;
> +	for (i = 0; i < nr_completions; i++) {
> +		const struct step step = { 0, 2 * i, payload, true, false,
> +					   0, false };
> +
> +		ret = reap_step(&ctx, &step, 1, i * payload, !i);
> +		if (ret != T_EXIT_PASS)
> +			goto report;
> +	}
> +	ret = reap_eof(&ctx, 2 * nr_completions);
> +report:
> +	if (ret != T_EXIT_PASS)
> +		fprintf(stderr, "tcp capped: %s\n", status_str(ret));
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_incremental(void)
> +{
> +	size_t head_used, spill_payload, fill_payload;
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, NR_BUFS * BUF_SIZE, IOU_PBUF_RING_INC, 0);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	/*
> +	 * A small datagram partially uses buffer 0. The next envelope follows
> +	 * it and its payload spills into buffers 1 and 2, then an empty
> +	 * datagram's envelope follows that payload in buffer 2.
> +	 */
> +	head_used = ctx.hdr_len + SMALL_PAYLOAD;
> +	spill_payload = (BUF_SIZE - head_used - ctx.hdr_len) + BUF_SIZE +
> +			SMALL_PAYLOAD;
> +	{
> +		const struct step steps[] = {
> +			{ SMALL_PAYLOAD, 0, SMALL_PAYLOAD, true, false,
> +			  0, true },
> +			{ spill_payload, 0, spill_payload, true, false,
> +			  head_used, true },
> +			{ 0, 2, 0, false, false, SMALL_PAYLOAD, true },
> +		};
> +
> +		ret = run_steps(&ctx, "incremental", steps, ARRAY_SIZE(steps),
> +				true);
> +		if (ret != T_EXIT_PASS)
> +			goto out;
> +	}
> +
> +	/*
> +	 * Fill the rest of the ring but the room for one envelope. All the
> +	 * remaining buffers are mapped and used, yet the partially used last
> +	 * one must keep the request armed. The empty datagram then fills it.
> +	 */
> +	head_used = SMALL_PAYLOAD + ctx.hdr_len;
> +	fill_payload = (BUF_SIZE - head_used - ctx.hdr_len) +
> +		       (NR_BUFS - 4) * BUF_SIZE + (BUF_SIZE - ctx.hdr_len);
> +	{
> +		const struct step steps[] = {
> +			{ fill_payload, 2, fill_payload, true, false,
> +			  head_used, true },
> +			{ 0, NR_BUFS - 1, 0, false, false,
> +			  BUF_SIZE - ctx.hdr_len, false },
> +		};
> +
> +		ret = run_steps(&ctx, "incremental fill", steps,
> +				ARRAY_SIZE(steps), false);
> +		if (ret != T_EXIT_PASS)
> +			goto out;
> +	}
> +	ret = expect_error(&ctx, "incremental empty ring", -ENOBUFS);
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_inc_capped(void)
> +{
> +	size_t trunc_payload;
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, BUF_SIZE + BUF_SIZE / 2, IOU_PBUF_RING_INC, 0);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	/*
> +	 * The iov length ends in the middle of buffer 1, which is only mapped
> +	 * up to the cap. The truncated datagram leaves the rest of buffer 1
> +	 * to the next completions.
> +	 */
> +	trunc_payload = BUF_SIZE + BUF_SIZE / 2 - ctx.hdr_len;
> +	{
> +		const struct step steps[] = {
> +			{ trunc_payload + SMALL_PAYLOAD, 0, trunc_payload,
> +			  true, true, 0, true },
> +			{ SMALL_PAYLOAD, 1, SMALL_PAYLOAD, true, false,
> +			  BUF_SIZE / 2, true },
> +			{ 0, 1, 0, false, false,
> +			  BUF_SIZE / 2 + ctx.hdr_len + SMALL_PAYLOAD, true },
> +		};
> +
> +		ret = run_steps(&ctx, "incremental capped", steps,
> +				ARRAY_SIZE(steps), true);
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_inc_min_left(void)
> +{
> +	size_t tail_payload;
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, NR_BUFS * BUF_SIZE, IOU_PBUF_RING_INC,
> +		    SETUP_MIN_LEFT);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	/*
> +	 * The first datagram leaves less than INC_MIN_LEFT bytes in buffer 0,
> +	 * which is then retired, so the next envelope starts in buffer 1.
> +	 */
> +	tail_payload = BUF_SIZE - ctx.hdr_len - INC_MIN_LEFT / 2;
> +	{
> +		const struct step steps[] = {
> +			{ tail_payload, 0, tail_payload, true, false,
> +			  0, false },
> +			{ SMALL_PAYLOAD, 1, SMALL_PAYLOAD, true, false,
> +			  0, true },
> +			{ 0, 1, 0, false, false, ctx.hdr_len + SMALL_PAYLOAD,
> +			  true },
> +		};
> +
> +		ret = run_steps(&ctx, "incremental min left", steps,
> +				ARRAY_SIZE(steps), true);
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_oneshot(void)
> +{
> +	struct sockaddr_in name;
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, NR_BUFS * BUF_SIZE, 0, SETUP_CMSG);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +	ctx.msg.msg_name = &name;
> +
> +	/*
> +	 * Without the envelope, a datagram filling two buffers consumes
> +	 * exactly two. The empty datagram consumes none, so the next one
> +	 * starts in the same buffer.
> +	 */
> +	{
> +		const struct step steps[] = {
> +			{ 2 * BUF_SIZE, 0, 2 * BUF_SIZE, false, false,
> +			  0, false },
> +			{ 0, 0, 0, false, false, 0, false },
> +			{ SMALL_PAYLOAD, 2, SMALL_PAYLOAD, false, false,
> +			  0, false },
> +		};
> +
> +		ret = run_oneshot(&ctx, "oneshot", steps, ARRAY_SIZE(steps));
> +		if (ret != T_EXIT_PASS)
> +			goto out;
> +	}
> +
> +	/*
> +	 * The iov length caps the selection to two buffers, truncating the
> +	 * datagram, where a single buffer would be mapped without it.
> +	 */
> +	ctx.iov.iov_len = 2 * BUF_SIZE;
> +	{
> +		const struct step steps[] = {
> +			{ 2 * BUF_SIZE + SMALL_PAYLOAD, 3, 2 * BUF_SIZE, false,
> +			  true, 0, false },
> +		};
> +
> +		ret = run_oneshot(&ctx, "oneshot capped", steps,
> +				  ARRAY_SIZE(steps));
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_oneshot_tcp(void)
> +{
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, 0, 0, SETUP_STREAM);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +	ret = T_EXIT_FAIL;
> +
> +	/*
> +	 * Without a size hint, a single buffer is mapped. Unlike recv, the
> +	 * receive is not extended with the data left, as that would overwrite
> +	 * the name and cmsg of the first one, so each request fills one buffer.
> +	 */
> +	if (send_payload(&ctx, 3 * STREAM_BUF_SIZE, 1, 0))
> +		goto out;
> +	{
> +		const struct step steps[] = {
> +			{ 0, 0, STREAM_BUF_SIZE, false, false, 0, false },
> +			{ 0, 1, STREAM_BUF_SIZE, false, false, 0, false },
> +		};
> +		unsigned int i;
> +
> +		for (i = 0; i < ARRAY_SIZE(steps); i++) {
> +			ret = T_EXIT_FAIL;
> +			if (submit_bundle(&ctx, false))
> +				goto out;
> +			ret = reap_oneshot(&ctx, &steps[i], 1,
> +					   i * STREAM_BUF_SIZE, !i);
> +			if (ret != T_EXIT_PASS) {
> +				fprintf(stderr, "oneshot tcp: %s\n",
> +					status_str(ret));
> +				goto out;
> +			}
> +		}
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_oneshot_waitall(void)
> +{
> +	struct __kernel_timespec timeout = { .tv_nsec = 200000000 };
> +	struct io_uring_cqe *cqe;
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, 0, 0, SETUP_STREAM);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +	ret = T_EXIT_FAIL;
> +
> +	/*
> +	 * A single buffer is mapped, and a short read must be retried until
> +	 * it is filled, as for recv, rather than completing early.
> +	 */
> +	ctx.msg_flags = MSG_WAITALL;
> +	if (send_payload(&ctx, SMALL_PAYLOAD, 1, 0) ||
> +	    submit_bundle(&ctx, false))
> +		goto out;
> +	ret = io_uring_wait_cqe_timeout(&ctx.ring, &cqe, &timeout);
> +	if (!ret) {
> +		ret = cqe->res == -EINVAL && !oneshot_supported ?
> +			T_EXIT_SKIP : T_EXIT_FAIL;
> +		if (ret == T_EXIT_FAIL)
> +			fprintf(stderr, "oneshot waitall: failed, early res "
> +				"%d\n", cqe->res);
> +		io_uring_cqe_seen(&ctx.ring, cqe);
> +		goto out;
> +	}
> +	if (ret != -ETIME) {
> +		fprintf(stderr, "oneshot waitall: wait cqe: %d\n", ret);
> +		ret = T_EXIT_FAIL;
> +		goto out;
> +	}
> +	ret = T_EXIT_FAIL;
> +	if (send_payload(&ctx, STREAM_BUF_SIZE - SMALL_PAYLOAD, 1,
> +			 SMALL_PAYLOAD))
> +		goto out;
> +	{
> +		const struct step step = { 0, 0, STREAM_BUF_SIZE, false, false,
> +					   0, false };
> +
> +		ret = reap_oneshot(&ctx, &step, 1, 0, false);
> +		if (ret != T_EXIT_PASS)
> +			fprintf(stderr, "oneshot waitall: failed\n");
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +static int test_oneshot_inc(void)
> +{
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, NR_BUFS * BUF_SIZE, IOU_PBUF_RING_INC, 0);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	/*
> +	 * Each payload follows the previous one, the second spilling from
> +	 * buffer 0 into buffer 1.
> +	 */
> +	{
> +		const struct step steps[] = {
> +			{ SMALL_PAYLOAD, 0, SMALL_PAYLOAD, false, false,
> +			  0, true },
> +			{ BUF_SIZE, 0, BUF_SIZE, false, false,
> +			  SMALL_PAYLOAD, true },
> +			{ SMALL_PAYLOAD, 1, SMALL_PAYLOAD, false, false,
> +			  SMALL_PAYLOAD, true },
> +		};
> +
> +		ret = run_oneshot(&ctx, "oneshot incremental", steps,
> +				  ARRAY_SIZE(steps));
> +	}
> +out:
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +/* the envelope doesn't fit in the first buffer */
> +static int test_envelope_overflow(void)
> +{
> +	void *control = t_malloc(BUF_SIZE);
> +	struct test_ctx ctx;
> +	int ret;
> +
> +	ret = setup(&ctx, 0, 0, 0);
> +	if (ret != T_EXIT_PASS)
> +		goto out;
> +
> +	ctx.msg.msg_control = control;
> +	ctx.msg.msg_controllen = BUF_SIZE;
> +	ret = expect_error(&ctx, "envelope", -EFAULT);
> +out:
> +	free(control);
> +	cleanup(&ctx);
> +	return ret;
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	int ret;
> +
> +	if (argc > 1)
> +		return T_EXIT_SKIP;
> +
> +	ret = test_udp_unsized();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	ret = test_udp();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	ret = test_capped();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	ret = test_trunc_flag();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	ret = test_envelope_fill();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	ret = test_classic();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	ret = test_tcp();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	ret = test_tcp_capped();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	ret = test_envelope_overflow();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	/* the oneshot tests skip without oneshot bundle support */
> +	ret = test_oneshot();
> +	if (ret == T_EXIT_FAIL)
> +		return ret;
> +
> +	ret = test_oneshot_tcp();
> +	if (ret == T_EXIT_FAIL)
> +		return ret;
> +
> +	ret = test_oneshot_waitall();
> +	if (ret == T_EXIT_FAIL)
> +		return ret;
> +
> +	/* last as they skip without incremental buffer ring support */
> +	ret = test_incremental();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	ret = test_inc_capped();
> +	if (ret != T_EXIT_PASS)
> +		return ret;
> +
> +	ret = test_oneshot_inc();
> +	if (ret == T_EXIT_FAIL)
> +		return ret;
> +
> +	/* last as it also skips without min_left support */
> +	return test_inc_min_left();
> +}

