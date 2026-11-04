Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751561;
	b=U0rjrLfu+2YsX728rnxOvPkHnOXN6l1ni1V17z35p1olU42DgE4Z6SMLSxtbrQ07Y0p8
	 nfaMA78rGW2qduHju3fmbLH77gVfDni1zwjZ8kjQ+5c5h2oSrYLGJltpXsXMySgiksKYr
	 A5ap4kydi3OlFIa6UOjPDRnc1gzqTSIyWJNJImfRdiha9l5Sa84O8rKwg7xstWzIQzFdN
	 m6KD3S5V2GSUS7LOCIDCZm3jXAt1WLNSlUExoiyTny25lJcULTLFZPYSS5ymlmZa1ta+H
	 ZQbayWttJBm+jfTHljAA9ew/fp5LOvUTjtg/yqqG12n4hmviWhIb/OaFWTYcTLn1LuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q9rahWNqn5TrjQs9MBNRTiFNXPe8F3h3uvk3o1ZjbFE=;
	b=L9yF5D8mpncIDc840NhJKtmjsDKyhglwn8D/3yvlXFpaKoNtp2cgpE2sZ2BEhbkTgL6F
	 zWNcsdiEt6WNfaV2X2ziErSOH3hcA+K7ydvGx6Zzi9OWJmvD0oFGzurO3Wz66Le+n4yGT
	 pTojJJugfw9N55W4CIomRadqlUKd92OEj8KBmflmelzrMdjHJxL3rD6Nm3psVVtZyYC6x
	 +2KCst1nHX1pbHi52zEeUA/ENX1SQ/t5m0mR3ICzih4Gdh4VJ9SSHF5Frr/Wi6nH0BOso
	 FgHuRun1qZaxJSoxL5IZiPQV20Ayjr66JTRYLzbjDSnj/41AvUZH0j9sL22XGXySnmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4bw5pwH;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50E9606A326
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 00:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A50E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4bw5pwH
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso106063f8f.2
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 16:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751559; x=1794356359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9rahWNqn5TrjQs9MBNRTiFNXPe8F3h3uvk3o1ZjbFE=;
        b=C4bw5pwHYHKdBx7XMHDV2xpsCjhmtYFZlM0xZCGGFxbTeRU/HKmGYdlrUC0OpsaE76
         sxmnko+3wk5uDyFU/+r1JLpCP/eP9ukWXMWBNJMCD40nKwguWgcqYGGYt+IE7ll7C2pf
         o7W0xco1UcZ+wNXkxSW7dwlVniMCkCs5ZEsbiySzJNn0p//HrTw9Z7VwZ18jlUf8rH/i
         FmaFm9kX1Qp6PWhIQCdFZ15FF9zROPyZ71eO7A568PBC1uAFunqbyVVs6evwu0/IB0ns
         GY+oEPG4GDDP77pRv2pubjSoD/BxAS9jl91VHj8CzE8x35vhARJmsUOExuPjse5frMXu
         2HcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751559; x=1794356359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9rahWNqn5TrjQs9MBNRTiFNXPe8F3h3uvk3o1ZjbFE=;
        b=NRlBLTww9Ctc6BjJ5AwFXieN63niK47sVyklyIG6NJF31s3VTu5yPINsjBO5QOZSdT
         hyPMWinDxtTt8+WGWGOF3kBxtwwtLkVNHzroYvtua8m06nl4A0crwGvBjTnO1SZnxkIV
         k/sK1hQVPi8ailZbHSeX9WY0XUf2zQZ9djHyjDHw0LuL2WtHpkVX+phfTL/Fn7+sphbI
         IDV85KKYB6eLKQtPAh3FLA6sqV6eH5dyAIR9oQe5vU8GeT85sZ4l4WATlL3bmi/j13y2
         FbB/s9CR9U9TvvYvT3ExbzYAW4GTgExGyniNXVTSsllxwmlnoN4d11zTC7xTMwZQCi7t
         mCrw==
X-Forwarded-Encrypted: i=1; AKwUvByPSvPU3wbPBaGqAbe0+6nHqAGlptxyoEXJ+lrJXDm2VO6drgZxr3n3sYlZgEHTblMobzuNoL7z9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+hk9G9gAtu/m92WHGNl0MUnw7bd6uNs+cwkF+NA5VRFBYU8kpN
	pDzi6+fGKZspYs10vc/jjg1Mq3nRV54smjIpj9dONRaFgFoKXdJThyAP
X-Gm-Gg: AYBFou1jrRHcteJGi/jIjSmkwUXso/6eIPTQs/QAatH6QR6IKK5DeXtNETChvDEO/z5
	nDo+lGyLhUVAIJzBl/ZvYuAJo/5Yn4dLmYOxqspZzPPkgqI2KKAroh5tbvuHhdhgQjro2S+oVl8
	0YQKkiEuG2bnLQpqRVD/Opr8EoQjvYxNdHDGw7NtLSgySJV+PIEFwa6FxhmGNJbBqzOB9vxV3U0
	fZCuAb62SLS5yu83LYwXUKgWB9jBdAfi3t+xdFlMY2YqsjOojnqU3czTrMRlrUilWsqM8magEI8
	0lyWmbjdwpUtPXihgnn6axwAQ7bq12wqfePC/vfozlMXLn30spCCg5kPNyTmvu/BYtMSu8G4BHh
	kRC0VRAxh7oxihB6T44OC1jpTmd/6L9OhWV/kN8xa8u2ni84UUoYhDfn2hKHYBF+CpSm+/Z2hLn
	yxuJRID9zNu2Ovjk3Ue0S/gK95hC2p7ikkJicGbXI5GPYsVO5+Bs17CGM2DzR6i1f3cZYqUp85a
	dGgMC3aS3dNtVJkjzpBF81wp+NAIr/ZNaRV4y7QVixf2qHUQqwDctp7EEud+NCvtbWN4dlbg7ac
	jLzsGV8qgp4zRe6Cl4LF73rfROIB7+1ov2LiHJR4lIIAfRv/mRSErpU0bQy4c5ytV8uNW2mFQOk
	BB58kuv6zacK4/COQib32eIQxnzna/YU=
X-Received: by 2002:a05:6000:2dc4:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-48e6e535ca9mr33172348f8f.56.1793751558968;
        Tue, 03 Nov 2026 16:19:18 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:17 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [PATCH 2/5] block: set dma-buf-io tag to block files
Date: Wed,  4 Nov 2026 00:18:58 +0000
Message-ID: <91697f770aa09d1be8f358378f1e11e0143ebe5d.1793751001.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1793751001.git.asml.silence@gmail.com>
References: <cover.1793751001.git.asml.silence@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to set dma-buf-io tag to be able to share contexts between
multiple files. Use gendisk pointer as a tag, this allows sharing
b/w different partitions of the same block device.

Fixes: 839231d19393 ("block: add dma-buf support for raw bdev")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 block/fops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/fops.c b/block/fops.c
index 60b9c9b1cefe..6f013780b76b 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -687,6 +687,7 @@ static int blkdev_open(struct inode *inode, struct file *filp)
 	ret = bdev_open(bdev, mode, filp->private_data, NULL, filp);
 	if (ret)
 		blkdev_put_no_open(bdev);
+	filp->f_dma_io_tag = (unsigned long)bdev->bd_disk;
 	return ret;
 }
 
-- 
2.54.0

