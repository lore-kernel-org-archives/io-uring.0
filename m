Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760581;
	b=TR29g6BA01LvCQdzynSkBdjtCWxY18EbaGPFaa7jxeZ/MHm4LuRbfQXsufp0T1BskYzd
	 WDbKkafMmsFwHQHbm8hq/r8uDwp0FeEKUxz1b6kegn6tNn/OlMBT5ZhMFW+o0VEI8db+w
	 7yvTtoKwe5A22FTwsVSU7IdqagBvlrTe0sk3Pw4Y4R/pvi8WoWWX9KnLKjB2DzTjNXkZi
	 wiMrV4ct00NynoCG3QoXbHNMOMU6kf/0KkIbD8pRgQ3VLA0jxYQiTOHa+PGhSxqHLCw8q
	 NBESVVhhlP0ChGuDC+jpyj//dj/luMqQMx3hzLqWsdXO2GauPmGxUzwO33KLfCU78MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DOCBhR3H24Hwl4JwVWPGj5Xz8V1vMII5NPJFlyBoNxc=;
	b=BJObTCMfXwYF3YBHTwlxBGPt/4e2zIW2rg3Ai9B+8th6UC2JbAW6EWcXT9XY3tBAaxuA
	 9+pQlyhvb85YFh+DdwFFtIpJmyqh4HguT9AhZBZp3Xpj1e9CW8qfpLphvPHp00jrUlBsF
	 t8pSpwFwr73bewrw0l83EDIyf3uCtFybIfhUL6KOm1jxtMg8GFKnjMEa3fbSL8JAqUhRl
	 6byQPMMf+ZNFP0+4BoGFebOTPtsxhcGCmJiF5zHvmnYtWdMXmTWj4q+HTJwv9l1b08pBf
	 rjaV6E68wmrYRVNvZn3MVDqlw7P9ydsbIOUvVv2i5Cy9m+0rkAlJKzOxOf+9HDqKohA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZ80BckZ;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370F7606A327
	for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 16:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370F7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZ80BckZ
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso3201542c88.1
        for <io-uring@vger.kernel.org>; Sun, 15 Nov 2026 08:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760580; x=1795365380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOCBhR3H24Hwl4JwVWPGj5Xz8V1vMII5NPJFlyBoNxc=;
        b=GZ80BckZmfwrmcMdj7bSpBMIGvsoD3Kn+Ub0cMxLIKcCi9Tw27r0AykRfGxQkW7tDK
         e9Ghja6TTMm26IVf2LEmAPmg7prXOrqOYE0cW4AGBa5B50zTwJOMKuvGVMyDXiBQpUm0
         Vpq+DpxddJnjcdy0BypQZJrQ+iuaG/8i6cMhTmaD3ejbQSE/Dl4ryRliIdndveQiNLZl
         MxtKJ/8rDP5pIWN8V/p1TTwYFfahZpYlNruLmBnI3wub/2bmcC9dNa/ZxMRLeceNfnkq
         P5Mm/SxyZYtYT224i6CMynOedIWpObed+V5KrYL55+w6Ndf7swwVuLPP6rC0Ozmf3eA5
         jMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760580; x=1795365380;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DOCBhR3H24Hwl4JwVWPGj5Xz8V1vMII5NPJFlyBoNxc=;
        b=TmxS3ri6qR8v0SZtPydKynOReI7deOgGonDqeup2gkXW5EEdpNMbr4+1HDhuSrSkk5
         bfBq5W9V2ln6mlfnwLmAnkNR9DZEGKlILnDHAIpkZLQHvdXyVcuDBE+gsowbTIQv9F0x
         yyPYukeutLNqHYcgseyZLg2AfYQcGe39ZM/wOC7nh8HJ2yn2S0q9nfNIPRBP5PU1H+/a
         e4pwzg0whzfsow8kzjmutJAHvSEa6bYt4Z9rO5oJZ8kACL6B3taY8X64qjUv12c+OF1d
         Z0ZGhzxzMjhKx+GCNI00LVZ02M5QwqZIvwDBAsZfVFpkBP560i97L0esC9a/5eTCBJIm
         IXFg==
X-Gm-Message-State: APuU4Z8pu64PiKTpkDgaqN4SDdnupWipXJXpno21cIpleN1Y1GciAMAE
	XT/qcG7JirkPfw3+Bz/kvoSb/n8WGwqtPyV8rDFuRd/qLDJSdYfksRHo
X-Gm-Gg: AYBFou0j7aCL4z2n3ulHwpHirMWu9LVKwAH8oxnESJcFS3He2tt32fRMhwGhA9iBHgM
	3OFpjnZ0IQBsZGyfZnMqUFohIGNbLMXQuv9r5oA/cECQEyIayspkGB8+J/LXeTJDbqFaiAMbHRr
	swKLm9GBFgUu6PM8eUZSCKg+rxgUjAZI8s3JtBfYyZMzMzyaHI0F44gNpXcWonWxmY3soys5xY/
	oEroK6DZJVKWwZaqkKCLIP65fxTU6L2fiLqHXhjjt8RZ0tiRcKnB++zHT4isxZEIv472eyqXc4V
	JtEkxuk4EIJ9f774pbH1dqUlsY/Qljr/M8v78IaHwG3nFLqR3rPk5I/t/S0WUMQz5jRFt7nCxM6
	NswUIOXos8MoMwot5nu1DJaQGhmtilYF+E9+eAkWrKuUv6wcDAaT1VTrp1srFViYezdsX60jcqe
	WLovNziCOPUi+wy5y5il0+xuyPjFGGoJDTqyotaOz28PWoi1NsgiQ3d8roYO7k9Jy0wMwhEG8Z8
	qLzyWmAz4t97v4ceDjKLJ7Pvg9UzhjvLFQfZBY+gh0ydX6AeRCFrP3eyCtMtfnePYmTviFwbkOX
	P9wctHvzAZdaP0JiJ9DM+VJQlint+luyhpLk+30ifZ9TjdyqNyYFB0AAK+/AokKdzAUP
X-Received: by 2002:a05:7022:f211:b0:195:9228:50a0 with SMTP id a92af1059eb24-1b5030f2c79mr8305725c88.42.1794760579925;
        Sun, 15 Nov 2026 08:36:19 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm24135548c88.2.2026.11.15.08.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:36:19 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] io_uring/rsrc: failed file update still removes the old file
Date: Sun, 15 Nov 2026 08:36:12 -0800
Message-Id: <20261115163612.225619-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jens,

This is a small error-path issue. It only happens when a fixed file
update fails, for example because userspace passes a closed fd, so it
may not matter much in practice.

__io_sqe_files_update() removes the old file from the slot before it
calls fget() on the new fd. If fget() fails, or the fd is an io_uring
fd, or the node allocation fails, the update stops there and reports
that entry as not done (an error, or a short count in a batch), but
the slot is already empty. The old file is gone, and if it was
registered with a tag, its tag CQE is posted as if it had been removed
on purpose. io_install_fixed_file() does it the other way round: it
checks the file and allocates the node before it resets the slot.

On v7.3, updating slot 0 with a closed fd returned -EBADF, posted the
old file's tag CQE, and a later fixed-file NOP on slot 0 got -EBADF.

Moving the removal after the new file and node are ready keeps the old
file on failure:

  -		if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i))
  -			io_file_bitmap_clear(&ctx->file_table, i);
   		if (fd != -1) {
   			...
  +			if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i))
  +				io_file_bitmap_clear(&ctx->file_table, i);
   			ctx->file_table.data.nodes[i] = node;
   			...
  +		} else if (io_reset_rsrc_node(ctx, &ctx->file_table.data, i)) {
  +			io_file_bitmap_clear(&ctx->file_table, i);
   		}

With this change the update still returns -EBADF, but slot 0 keeps
working and no tag CQE is posted. Replacement, removal with fd -1 and
SKIP behave as before, and in a partial update the entries before the
failing one are still applied. In next-20261113 the removal still
comes before fget(). I can send a patch if you want one.

Thanks,
Cheng Yongkang
