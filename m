Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883763;
	b=27BHOb6F/qioPaeQxhq0iawPkTbo5lBeVWRYEpqa7K28npy/Jlbzl6lVfEU/O07cGCmR
	 B85Rlr/c08AKy9JtJ87bISSmT/FUwe61QCHAj4mabUUqxjKs9lzLiT8Tf0/K96QEya98l
	 AfG8IvU80X8VlogXy4TWbqIGUr/oqTXsiMvPcYmnHIzEPFSbJldqwmdSl9XCAfHtvPXMb
	 8sKL29pIvBjQCnCbpZJ9M12UxEY2vA5ZJfYEFussbUpAm5Wr8eCt9kryy5wSJYjeJRlcQ
	 02kcrxnJEDDttqHQr8Alkq4oXuOOnIAZlEm7PMzCbb6muH1+zuRydnwgry/n9A4eeAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Shk8KMb8WR/O+11ZzxwMDxGBuHI4bP7TZoQ05okSDEA=;
	b=jv/xHYrXPcjLGYWr1nxbVl0BQ344KoBqQyNLSp+M4GiohtL4Sn5OhZG075yWVy56IIe1
	 i7AuGgQKVpFTiUFwwqzJNYeNb5FseYqRdikhL54kNbzBdDdWAVdrMLR3JL1t/fC4zRdKm
	 LqaAmTVjsrABggrPKbvn467Ay/710mq7QA3WS1IZMrz0L2mD8RZE6XkB4WJyoMIhsYYTQ
	 MuoZDAq9dOxcrpqREceQjkLxIFKZceHWcSTi63TRt6O5BphkfEsWzUyp/ck+ucnyGojsA
	 8iBTQA2WUecC1h/03+8bjhYJjD4nGYXHwJrm4V2Cej2abwSGEByIhPnhO5zvO+rT6fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="B/dTjZ76";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E41606A31C
	for <io-uring@vger.kernel.org>; Tue, 17 Nov 2026 02:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E41606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B/dTjZ76
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so5263347c88.1
        for <io-uring@vger.kernel.org>; Mon, 16 Nov 2026 18:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883762; x=1795488562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Shk8KMb8WR/O+11ZzxwMDxGBuHI4bP7TZoQ05okSDEA=;
        b=B/dTjZ76ejqqvMugSHmsgpYfWZfjQN20kjfMiNiHFQpPSixBPshTAEMYvUDZxT27IL
         2G9W1lxIX9K2rftDzlHXyyJweurjhf7Ms3wxSQZ1DochecFYYmvhLQLGjvDahBgCzYw/
         Hi9haU1rr2Yvl9w3UzEwvpP7CqcjnCeHsfsyGmKIv5SVyL5kO9Jn7CA/AIjW2hyVuOw/
         nc2bg/khUXXaXiplLJAMZxs4f8/M+E6t5i/8BgbpiPSVPc9vBk0CamGvOdVUv0FPTgQg
         du/3sEzvrekCWqaKHmw6sNKHCWUCkIH/PcI/wkfdPczgi1op23nYxBkW+jTyfrI3wZVb
         xgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883762; x=1795488562;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Shk8KMb8WR/O+11ZzxwMDxGBuHI4bP7TZoQ05okSDEA=;
        b=2z1HJexh95HQUYAzzwEhn6XeHOP0V4XIVf7wjb+Ds5019XmQ3HoxFmMaRzVxHyp/+g
         CvB4IBafO6R5BECchiTWKe0r0rT9zqZp7z+f3cIiCi9fVFxerRTk1Ulg4hkM06AYoA6F
         sLeKvOovWY0TXbm36gaFI3p7M6MthzU3hUX3KxnRAaAdvyDUWEddnNjK/PmXGKFP/nrC
         Mt8oEiHO5S5Yd7NAPxfJZCDZLJLCoRsdeaJACUPCOE5tNLqOqIpPvy+0et7L8fHjK0wQ
         i2uVY5pZL0o61PAisVl2rS18kGNP73sd0ri1iG6OBRCudEdOZTG12Upxk+18tb3QWBj2
         h62A==
X-Forwarded-Encrypted: i=1; AL+hErG7im/jRHL2B/sANlt9o/MzJgb13InOEkLQLvBdCSkdRE/73xc3N3PwJwggdzHQHAqStC9vAnBnEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z95MPNysTULYWEdRhBwPG5NeP57idbaCgltJMNQ7cWy8BuCTtA2
	uUYw5YWOA7gIoJgOMXh2b8fSaV7xbsZTZAEJJ1piLI73V46LSLuBDoK15BDqSVYGJvU=
X-Gm-Gg: AYBFou0Zvh7FQygqEn6RtdxZ4j0CuPQi0X1RWPNZ40r+7FJBU+H648JKPwoWXlUc+ax
	Uft4T/o7L2npamRxv736I+cgKrBbq5FkRCyv3htihZu6/JQXlm7t46tqODhYttMk3q0HnljgAWT
	1nLDOB2RdEm1I2Y6fXMx8G90Zqu1au60e1WeRP2VOIGD30N5ytovKhm1SwHP9XRP0hi/oqvS8Y6
	sw01NNo0aIWpTWs0eDBwLXR5aNlkfQjl5X0OA+p5p8vd7MtRc19+FORMSbPa/xtyl7EOvkiGg9/
	YsKeVAaLkv1Aid6snUivHALy06McXLgpvKubGr3//jkTkl0PmubSDEN/HbbLl60TSsIwEsLJp7h
	h4kXrGBTIClpGX0HeBd7TGk0dO8EhllhqLDoZahCEpZzJarkpb7cuhNoRwGz2+NF4zTqPFPRQEj
	IZT682ZsK+CZDFOYis4ISUW1jc/+I0cEvs2JyHP0xbxyLfduFggQSBSDx5/rK8JZyLDuRRQe2xi
	knG5BghrHQugGSQLiAm2UXluQc6QVcCiqlQRQODPbWewjb508r+H0gsj8i9G0y6h4RC8csTKVpc
	liosyElhXCJ2kdmyZEJbaNFW4nk5AKJTN/a0ZJfLGLyogTL0QGil0qzLFHDeBgGbJz0uF6JdSxG
	XMpuK0eQ1P1QUel5ANubQG6IirsqH9Zjd+Q==
X-Received: by 2002:a05:7022:d8b:b0:15d:fb47:4268 with SMTP id a92af1059eb24-1b503106297mr11912874c88.21.1794883761776;
        Mon, 16 Nov 2026 18:49:21 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm31493244c88.1.2026.11.16.18.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:49:21 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: David Wei <davidhwei@meta.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116044519.281756-1-teel4res@gmail.com>
References: <20261116044519.281756-1-teel4res@gmail.com>
Subject: Re: [PATCH] io_uring/timeout: don't rearm a multishot timeout on
 cancel
Message-Id: <179488376079.22588.10998515587766379982.b4-ty@b4>
Date: Mon, 16 Nov 2026 19:49:20 -0700
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


On Sun, 15 Nov 2026 20:45:19 -0800, Cheng Yongkang wrote:
> io_timeout_complete() does not check tw.cancel. When it runs from
> io_cancel_local_task_work(), a multishot timeout that has not reached
> its count still posts an IORING_CQE_F_MORE completion and rearms its
> timer. With a zero interval the timer expires again right away and
> queues new task work, so the drain keeps running it until posting a
> CQE fails.
> 
> [...]

Applied, thanks!

[1/1] io_uring/timeout: don't rearm a multishot timeout on cancel
      (no commit info)

Best regards,
-- 
Jens Axboe



