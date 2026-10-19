Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443741;
	b=RlhA6WOR1xkemgLOwR3jVuaHuMkr7eNXbzxEFUNwBwh4SeS+DqI9XBIe9BSoCPIW84AE
	 ElqXZ/hWPco6SNyXwFdVSpjhUkr8HS6mTJLsPWu8dSqxFsI3ZBqkzfVISoB2tsCm+Sgrb
	 f9XkUEvxdmnA6V/59xHdBEJqVKGiUOkfI48k4nB6k9aa7f3/pzzDl0LZoU+BJojwVLN4V
	 ogpap/BP4FI0IaQ4yRjTKVkKaRdqVmK/CgTwDYGf5iM5KhujEYdvEQRL6jQYkx346pwmz
	 hrIZB95Pz1LB9iqtkiPuGZ/o+NkKxXbPDn74dXZv0RqVfGgPCV1JTZzfJEDGTPXhSsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=X2154pYa/nGznymeL1dNEVNOLzCWTpusHheeHuDCF6w=;
	b=0F5c+GAn3ygh6mqrWfQZSTuBY0j2F3kbywJuroo/+db1Njcresu7XXKxmSwQkv111FWD
	 7EbCUE07a74Rg5Jz9rkGwxGbVbuDmZaelRA2PpkO7sFE/3AYIVfBWfOrVX+OcTf9FZNe+
	 CSXnw42Jqa0ujrTBFYYLkmldNFNlTeV0/4T7KwVOC0KvCpzvDV/bEnO31VUoXkduvij7k
	 2nIK6a5PVoo/xbZsRw1A4Rizge5ClI9Aj8HGewhaPcGTKlI7XD0+W2FEkPhUq1BmrzdXQ
	 RVfL1vVpy44o5wgjuL2GOA2IVXZc4gdO0+B8g9edOD0QhkD6vtnVnWxMNgPcLz40K9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kzCE3cRC;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8883606A31A
	for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 21:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8883606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kzCE3cRC
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f84a55e31aso1498313a34.2
        for <io-uring@vger.kernel.org>; Mon, 19 Oct 2026 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792443740; x=1793048540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2154pYa/nGznymeL1dNEVNOLzCWTpusHheeHuDCF6w=;
        b=kzCE3cRCAcbtIW4yRA5A/bXkTE6gZIcNvunsk0rodQ8EVufDf6aBlmy8FRNDW6GEYw
         R6HnTKj6v3hlY8F1mD6C2NRdfBXeRhPcmRRCKUtmb5wYIeknOUoGGa8Bdk/p2rm/i47+
         1uCIBbzY6eV5wppGndMmT6jy5N6v/saHL9pK0Hgvk1TFlKC/2cjW3IQAN7gxIociXuVJ
         Nwp+a1o3C8nFsGj6GxRkRkr1DTg/MwdGnFUZIECzXondNRQKK5jtUTp2qsjG3pqOeF+q
         dqNYJU7f/Sv58iQn6iN+88e+JR0SninqSkvaE/FclJq/UvP/QNRy8dzOUyKQF1VP68z7
         sIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443740; x=1793048540;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2154pYa/nGznymeL1dNEVNOLzCWTpusHheeHuDCF6w=;
        b=kM+39qBilnK32O+QYwyVaxRaJt9ez7bhHF4hdOz0X7qVhYjk29bnhoSN6pwbbEq3Z1
         tQEfq70pwXrUxIuRLDVJ7QPWWxYTkjgQU+PQCUNYoEOACyAADSME7DmBJzpcgdyx2AB/
         pFIdzpYYoCd7PyqYA9SItjdEUgwTkb02guxAVnuQfajXu/vW8mt+lrrAE92Sr+oVm/xe
         54cQy1K/h1BlRwXePvqLFXWRS+IswdX8otVMvZ27nPQnFeCSFRkod36+A/i2HlCWSPWJ
         NhRzr3+DJ4Q4fL6bxSYXmxxiY56/nSVp5Z5bDBIEfRZuxmZ5tgtXp7PjoyBzqLuU/Tg/
         Alhg==
X-Forwarded-Encrypted: i=1; AKwUvBzGLlO6l17WKocDqjoYYy6AassAVG3ZzkUwOQpo0sMFpJ/RVUBP9MjUgsDkPfV8rnX3ZZXl/PZ9Kw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKC3Rrz7w5JnWpmEhojVDn/uNhPPZuFo+R8RefyzuQvWPQz48Hz
	b4glJy7QFU5LTs/3qfo/U3V4uU2gwUgUW/XJyvo18k7asp6TWJ7SzdhPTJSdb0lBrPs=
X-Gm-Gg: AYBFou2V0TIaCS/7DrdQ+IVQNSZPPTZMDJ1wbnDULzbooPw+fCWxRsgxKqtlxRzlAoA
	4H/F1CjxxneA5VKV8YoQnDD6rrGxQ/mVYZ1E6w9NH/+1NJYNnAQMulZjLqcAwKFye/SJL+SW6sS
	v4z04EtGKG7sJYl89VanBrnZlOdqkFyjaIUtVXd3GGwKZIyhksrIaoJ+kpO/Lr1/EdDfJy9bgG/
	0S0pRSKVdwzDQAVydhChkg7n5pdUkYl5WLyZJVmJByGeiJu6lR+oWi5l9msb7V+5xiS9TFRk83H
	RJGdPF6mehj96OD06qF/QZWzGmPpPi/Zc+tEHLlISjsGBNLX6o1z25WmLTVTqvsqIsaKco7+hfu
	+XnBPUlZxxgsxSg5RDA/q2g1Q2CWaTKhJnbd1yp9YcIka6A94BMsT3zpkzDrta7kAIRam1jmW8u
	h0NqHbqIy+fTHdiPNYNsGmzblqhRK8hCkQHTqH3LNEQLh5nsNB+MSXI2Zf1kB2VygxWOE2vZRHl
	FVlfMnzphkguBRlFNLX+0RdtSVsjr7BUeKl+MBJETIgxtpAr7QPhp+i
X-Received: by 2002:a05:6830:6aab:b0:829:2af1:a07d with SMTP id 46e09a7af769-84500787b5cmr8125774a34.5.1792443739705;
        Mon, 19 Oct 2026 14:02:19 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a4a00f15sm9832413a34.8.2026.10.19.14.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:02:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Christian Brauner <brauner@kernel.org>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261018025824.799245-1-nickolai@csail.mit.edu>
References: <20261018025824.799245-1-nickolai@csail.mit.edu>
Subject: Re: [PATCH v1] io_uring/waitid: return -EAGAIN for a non-blocking
 pidfd
Message-Id: <179244373775.3230223.14647393317404465560.b4-ty@b4>
Date: Mon, 19 Oct 2026 15:02:17 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 17 Oct 2026 22:58:24 -0400, Nickolai Zeldovich wrote:
> IORING_OP_WAITID on a pidfd opened with PIDFD_NONBLOCK completes at
> once with res 0 and an all-zero siginfo when the child has not changed
> state, although WNOHANG was not requested. waitid(2) with the same
> arguments fails with -EAGAIN. An application that submits the same
> request it would pass to waitid(2) and treats res 0 as "the child
> changed state" sees si_signo 0 and si_pid 0 instead.
> 
> [...]

Applied, thanks!

[1/1] io_uring/waitid: return -EAGAIN for a non-blocking pidfd
      commit: c82621eb2c9a00b514a459951609e04843d467bb

Best regards,
-- 
Jens Axboe



